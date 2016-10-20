SET DEFINE OFF;
create or replace package body afw_25_publc_noyau_pkg
is
  function obten_travl_courn (pbo_imedt        in boolean default true
                             ,pnu_type_travl   in number default null
                             ,pbo_mesgr        in boolean default false
                             ,pnu_domn         in number default afw_12_domn_pkg.obten_domn_sesn
                             ,pnu_utils        in number default afw_12_utils_pkg.obten_usagr_conct)
    return number
  is
    vnu_stat_initl   number (10)
                       default afw_12_stat_pkg.obten_stat_initl_struc_aplic ('TRAVL'
                                                                            ,'AFW');
    vnu_travl        number (10);
    vva_imedt        varchar2 (1);
    vnu_type_travl   number (10);
  begin
    if not pbo_mesgr
    then
      if pbo_imedt
      then
        vva_imedt   := 'O';
      else
        vva_imedt   := 'N';
      end if;

      if pnu_type_travl is null
      then
        select seqnc
          into vnu_type_travl
          from vd_afw_25_type_travl
         where seqnc = afw_12_domn_pkg.obten_type_travl_deft (pnu_domn);
      else
        vnu_type_travl   := pnu_type_travl;
      end if;

      select min (seqnc)
        into vnu_travl
        from vd_i_afw_25_travl t
       where     t.ref_stat = vnu_stat_initl
             and ref_utils = pnu_utils
             and indic_imedt = vva_imedt
             and ref_type_travl = vnu_type_travl;
    end if;

    return vnu_travl;
  exception
    when others
    then
      raise;
  end obten_travl_courn;

  function initl_travl (pva_nom_fichr_sort   in varchar2
                       ,pva_indic_imedt      in varchar2
                       ,pnu_type_travl       in number default null
                       ,pbo_mesgr            in boolean default false
                       ,pnu_domn             in number default afw_12_domn_pkg.obten_domn_sesn
                       ,pnu_utils            in number default afw_12_utils_pkg.obten_usagr_conct)
    return number
  is
    vnu_travl_courn   number (10)
                        default obten_travl_courn (pva_indic_imedt = 'O'
                                                  ,pnu_type_travl
                                                  ,pbo_mesgr
                                                  ,pnu_domn    => pnu_domn
                                                  ,pnu_utils   => pnu_utils);
  begin
    if vnu_travl_courn is null
    then
      insert into vd_i_afw_25_travl (ref_utils
                                    ,indic_imedt
                                    ,nom
                                    ,ref_domn
                                    ,ref_type_travl)
           values (pnu_utils
                  ,pva_indic_imedt
                  ,pva_nom_fichr_sort
                  ,pnu_domn
                  ,pnu_type_travl)
        returning seqnc
             into vnu_travl_courn;
    end if;

    return vnu_travl_courn;
  exception
    when others
    then
      raise;
  end initl_travl;

  function ajout_publc_travl (pva_nom_fichr_sort    in varchar2
                             ,pva_code_type_publc   in varchar2
                             ,pnu_travl             in number
                             ,pva_code_publc        in varchar2 default null
                             ,pnu_domn              in number default afw_12_domn_pkg.obten_domn_sesn)
    return number
  is
    vnu_type_publc    number (10);
    vnu_publc         number (10);
    vnu_publc_travl   number (10);
    vnu_versn_publc   number (10);
  begin
    select seqnc
      into vnu_type_publc
      from vd_i_afw_25_type_publc tp
     where     tp.code = pva_code_type_publc
           and tp.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn;

    if pva_code_publc is not null
    then
      --Si on a un code de publication, prendre cette publication
      select seqnc
        into vnu_publc
        from vd_i_afw_25_publc
       where     code = pva_code_publc
             and ref_type_publc = vnu_type_publc;
    else
      --Prendre la publication par defaut pour le domaine
      select ref_publc
        into vnu_publc
        from vd_i_afw_25_domn_type_publc
       where     ref_domn = pnu_domn
             and ref_type_publc = vnu_type_publc;
    end if;


    declare
      vva_nom_publc   varchar2 (60);
    begin
      select seqnc
        into vnu_versn_publc
        from vd_i_afw_25_versn_publc
       where     (select sysdate
                    from dual) between date_debut_efect
                                   and nvl (date_fin_efect
                                           , (select sysdate + 10
                                                from dual))
             and ref_publc = vnu_publc;
    exception
      when no_data_found
      then
        if (vnu_publc is not null)
        then
          select nom
            into vva_nom_publc
            from vd_afw_25_publc
           where seqnc = vnu_publc;
        else
          vva_nom_publc   := 'ce rapport';
        end if;

        afw_01_err_apex_pkg.lever_err_apex_code ('RAP.000005'
                                                ,vva_nom_publc
                                                ,pva_code_prodt   => 'SEM');
    end;

    insert into vd_i_afw_25_publc_travl pt (nom
                                           ,ref_versn_publc
                                           ,ref_travl)
         values (pva_nom_fichr_sort
                ,vnu_versn_publc
                ,pnu_travl)
      returning seqnc
           into vnu_publc_travl;

    return vnu_publc_travl;
  end ajout_publc_travl;

  procedure ajout_publc_travl (pva_nom_fichr_sort    in varchar2
                              ,pva_code_type_publc   in varchar2
                              ,pnu_travl             in number
                              ,pva_code_publc        in varchar2 default null
                              ,pnu_domn              in number default afw_12_domn_pkg.obten_domn_sesn)
  is
    vnu_publc_travl   number (10);
  begin
    vnu_publc_travl      :=
      ajout_publc_travl (pva_nom_fichr_sort
                        ,pva_code_type_publc
                        ,pnu_travl
                        ,pva_code_publc);
  end ajout_publc_travl;

  function obten_type_publc (pnu_publc_travl in number)
    return number
  is
    vnu_type_publc   number (10);
  begin
    select p.ref_type_publc
      into vnu_type_publc
      from vd_i_afw_25_publc_travl pt
          ,vd_i_afw_25_publc       p
          ,vd_i_afw_25_versn_publc vp
     where     vp.seqnc = pt.ref_versn_publc
           and vp.ref_publc = p.seqnc
           and pt.seqnc = pnu_publc_travl;

    return vnu_type_publc;
  end obten_type_publc;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pva_valr_varch    in varchar2
                        ,pnu_valr_numbr    in number
                        ,pda_valr_date        date
                        ,pnu_publc_travl   in number)
  is
    vnu_seqnc_parmt   number (10);
    vnu_type_publc    number (10);
  begin
    vnu_type_publc   := obten_type_publc (pnu_publc_travl);

    select seqnc
      into vnu_seqnc_parmt
      from vd_i_afw_25_parmt_type_publc
     where     ref_type_publc = vnu_type_publc
           and upper (code) = upper (pva_code_parmt);

    insert into vd_i_afw_25_parmt_publc_travl (ref_publc_travl
                                              ,ref_parmt_type_publc
                                              ,valr_varch
                                              ,valr_date
                                              ,valr_numbr)
         values (pnu_publc_travl
                ,vnu_seqnc_parmt
                ,pva_valr_varch
                ,pda_valr_date
                ,pnu_valr_numbr);
  end ajout_parmt;

  function ajout_parmt (pva_code_parmt    in varchar2
                       ,pva_valr_varch    in varchar2
                       ,pnu_valr_numbr    in number
                       ,pda_valr_date        date
                       ,pnu_publc_travl   in number)
    return number
  is
    vnu_seqnc_parmt   number (10);
    vnu_type_publc    number (10);
    vnu_seqnc         number (10);
  begin
    vnu_type_publc   := obten_type_publc (pnu_publc_travl);

    select seqnc
      into vnu_seqnc_parmt
      from vd_i_afw_25_parmt_type_publc
     where     ref_type_publc = vnu_type_publc
           and upper (code) = upper (pva_code_parmt);

    insert into vd_i_afw_25_parmt_publc_travl (ref_publc_travl
                                              ,ref_parmt_type_publc
                                              ,valr_varch
                                              ,valr_date
                                              ,valr_numbr)
         values (pnu_publc_travl
                ,vnu_seqnc_parmt
                ,pva_valr_varch
                ,pda_valr_date
                ,pnu_valr_numbr)
      returning seqnc
           into vnu_seqnc;

    return vnu_seqnc;
  end ajout_parmt;

  procedure lancr_travl (pva_formt             in varchar2
                        ,pnu_travl             in number
                        ,pbo_redrg_web_reslt   in boolean default true)
  is
  begin
    afw_25_travl_publc_pkg.lancr_travl (pnu_travl
                                       ,pva_formt
                                       ,pbo_redrg_web_reslt);
  end lancr_travl;

  function obten_nombr_ocurn_exect_courn
    return number
  is
  begin
    return 0;
  end obten_nombr_ocurn_exect_courn;
end afw_25_publc_noyau_pkg;
/
