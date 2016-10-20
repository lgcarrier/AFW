SET DEFINE OFF;
create or replace package body afw_25_publc_pkg
is
  function obten_travl_courn (pva_imedt in varchar2)
    return number
  is
  begin
    if (   pva_imedt = 'YES'
        or pva_imedt = 'TRUE')
    then
      return afw_25_publc_noyau_pkg.obten_travl_courn (true);
    else
      return afw_25_publc_noyau_pkg.obten_travl_courn (false);
    end if;
  end obten_travl_courn;

  function obten_travl_courn (pbo_imedt in boolean default true)
    return number
  is
  begin
    return afw_25_publc_noyau_pkg.obten_travl_courn (pbo_imedt);
  end obten_travl_courn;

  function obten_nouv_travl (pva_nom_raprt    in varchar2
                            ,pnu_type_travl   in number default null
                            ,pbo_mesgr        in boolean default false)
    return number
  is
  begin
    return afw_25_publc_noyau_pkg.initl_travl (pva_nom_raprt
                                              ,'N'
                                              ,pnu_type_travl
                                              ,pbo_mesgr);
  end obten_nouv_travl;

  function obten_nombr_publc_travl (pnu_travl in number default null)
    return number
  is
    vnu_travl   number (10) default nvl (pnu_travl, obten_travl_courn ());
    vnu_count   pls_integer;
  begin
    select count (1)
      into vnu_count
      from vd_afw_25_publc_travl pt
     where pt.ref_travl = vnu_travl;

    return vnu_count;
  end obten_nombr_publc_travl;

  procedure ajout_publc_travl (pva_nom          in varchar2
                              ,pva_type_publc   in varchar2
                              ,pva_code_parmt   in varchar2
                              ,pnu_valr_parmt   in number
                              ,pnu_travl        in number default null
                              ,pnu_type_travl   in number default null
                              ,pbo_mesgr        in boolean default false)
  is
    vnu_travl   number (10);
  begin
    vnu_travl      :=
      ajout_publc_travl (pva_nom
                        ,pva_type_publc
                        ,pva_code_parmt
                        ,pnu_valr_parmt
                        ,pnu_travl
                        ,pnu_type_travl
                        ,pbo_mesgr);
  end ajout_publc_travl;

  function ajout_publc_travl (pva_nom          in varchar2
                             ,pva_type_publc   in varchar2
                             ,pva_code_parmt   in varchar2
                             ,pnu_valr_parmt   in number
                             ,pnu_travl        in number default null
                             ,pnu_type_travl   in number default null
                             ,pbo_mesgr        in boolean default false)
    return number
  is
    vnu_travl         number (10);
    vnu_publc_travl   number (10);
  begin
    vnu_travl      :=
      nvl (pnu_travl
          ,afw_25_publc_noyau_pkg.initl_travl (null
                                              ,'N'
                                              ,pnu_type_travl
                                              ,pbo_mesgr));

    vnu_publc_travl      :=
      afw_25_publc_noyau_pkg.ajout_publc_travl (pva_nom
                                               ,pva_type_publc
                                               ,vnu_travl
                                               ,null);

    ajout_parmt (pva_code_parmt
                ,pnu_valr_parmt
                ,vnu_publc_travl);

    return vnu_publc_travl;
  end ajout_publc_travl;

  function initl_travl (pnu_travl            in number
                       ,pva_nom_fichr_sort   in varchar2
                       ,pva_indic_imedt      in varchar2
                       ,pnu_type_travl       in number default null)
    return number
  is
    vnu_travl   number (10);
  begin
    vnu_travl      :=
      nvl (pnu_travl
          ,afw_25_publc_noyau_pkg.initl_travl (null
                                              ,'N'
                                              ,pnu_type_travl));

    return vnu_travl;
  end initl_travl;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pva_valr_parmt    in varchar2
                        ,pnu_travl_publc   in number)
  is
  begin
    afw_25_publc_noyau_pkg.ajout_parmt (pva_code_parmt
                                       ,pva_valr_parmt
                                       ,null
                                       ,null
                                       ,pnu_travl_publc);
  end ajout_parmt;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pnu_valr_parmt    in number
                        ,pnu_travl_publc   in number)
  is
  begin
    afw_25_publc_noyau_pkg.ajout_parmt (pva_code_parmt
                                       ,null
                                       ,pnu_valr_parmt
                                       ,null
                                       ,pnu_travl_publc);
  end ajout_parmt;

  procedure ajout_parmt (pva_code_parmt    in varchar2
                        ,pda_valr_parmt    in date
                        ,pnu_travl_publc   in number)
  is
  begin
    afw_25_publc_noyau_pkg.ajout_parmt (pva_code_parmt
                                       ,null
                                       ,null
                                       ,pda_valr_parmt
                                       ,pnu_travl_publc);
  end ajout_parmt;

  procedure copie_publc_travl (pnu_sorc_travl    in number
                              ,pnu_destn_travl   in number
                              ,pnu_publc_travl   in number default null)
  is
    vnu_nouv_publc_travl         number (10);
    vnu_nouv_parmt_publc_travl   number (10);

    cursor cur_publc_travl
    is
      select seqnc
            ,ref_versn_publc
            ,ref_stat
            ,nom
            ,indic_parmt_alimn
        from vd_i_afw_25_publc_travl
       where     (   ref_travl = pnu_sorc_travl
                  or pnu_sorc_travl is null)
             and (   seqnc = pnu_publc_travl
                  or pnu_publc_travl is null)
             and (   pnu_sorc_travl is not null
                  or pnu_publc_travl is not null);

    cursor cur_parmt_publc_travl (pnu_publc_travl_seqnc in number)
    is
      select seqnc
            ,ref_parmt_type_publc
            ,valr_varch
            ,valr_date
            ,valr_numbr
        from vd_i_afw_25_parmt_publc_travl
       where ref_publc_travl = pnu_publc_travl_seqnc;

    cursor cur_ocurn_parmt_publc (pnu_parmt_publc_seqnc in number)
    is
      select seqnc
            ,valr_date
            ,valr_numbr
            ,valr_varch
        from vd_i_afw_25_ocurn_parmt_publc
       where ref_parmt_publc_travl = pnu_parmt_publc_seqnc;
  begin
    for rec_publc_travl in cur_publc_travl
    loop
      -- Copie de chaque publc_travl de la job à merger
      insert into vd_i_afw_25_publc_travl (ref_versn_publc
                                          ,ref_travl
                                          ,ref_stat
                                          ,nom
                                          ,indic_parmt_alimn)
           values (rec_publc_travl.ref_versn_publc
                  ,pnu_destn_travl
                  ,rec_publc_travl.ref_stat
                  ,rec_publc_travl.nom
                  ,'N')
        returning seqnc
             into vnu_nouv_publc_travl;

      -- copie de chaque parmt_publc_travl associé au publc_travl
      for rec_parmt_publc_travl in cur_parmt_publc_travl (rec_publc_travl.seqnc)
      loop
        insert into vd_i_afw_25_parmt_publc_travl (ref_publc_travl
                                                  ,ref_parmt_type_publc
                                                  ,valr_varch
                                                  ,valr_date
                                                  ,valr_numbr)
             values (vnu_nouv_publc_travl
                    ,rec_parmt_publc_travl.ref_parmt_type_publc
                    ,rec_parmt_publc_travl.valr_varch
                    ,rec_parmt_publc_travl.valr_date
                    ,rec_parmt_publc_travl.valr_numbr)
          returning seqnc
               into vnu_nouv_parmt_publc_travl;

        --copie de chaque ocurn_parmt_publc_travl asocié au parmt_publc_travl
        for rec_ocurn_parmt_publc in cur_ocurn_parmt_publc (rec_parmt_publc_travl.seqnc)
        loop
          insert into vd_i_afw_25_ocurn_parmt_publc (valr_date
                                                    ,valr_numbr
                                                    ,valr_varch
                                                    ,ref_parmt_publc_travl)
               values (rec_ocurn_parmt_publc.valr_date
                      ,rec_ocurn_parmt_publc.valr_numbr
                      ,rec_ocurn_parmt_publc.valr_varch
                      ,vnu_nouv_parmt_publc_travl);
        end loop;
      end loop;
    end loop;
  end copie_publc_travl;

  procedure ajout_travl_courn (pnu_travl         in number default null
                              ,pnu_publc_travl   in number default null)
  is
    vnu_travl_courn   number (10) default 0;
  begin
    vnu_travl_courn   := nvl (obten_travl_courn (false), obten_nouv_travl (null));
    copie_publc_travl (pnu_travl
                      ,vnu_travl_courn
                      ,pnu_publc_travl);
  end ajout_travl_courn;

  procedure defnr_stat_publc_travl (pnu_seqnc       in number
                                   ,pva_code_stat   in varchar2)
  is
    vnu_stat_seqnc   number (10);
  begin
    vnu_stat_seqnc      :=
      afw_12_stat_pkg.obten_stat ('PUBLC_TRAVL'
                                 ,pva_code_stat
                                 ,'AFW');

    update vd_afw_25_publc_travl
       set ref_stat   = vnu_stat_seqnc
     where seqnc = pnu_seqnc;

    commit;
  end defnr_stat_publc_travl;
/*
          procedure lancr_raprt is
  begin
    afw_25_publc_noyau_pkg.lancr_travl ('PDF');
  end lancr_raprt;
  procedure lancr_raprt (pva_nom_raprt in varchar2,
                         pva_type_raprt in varchar2,
                         pva_code_parmt in varchar2,
                         pnu_valr_parmt in number) is
    pragma autonomous_transaction;
  begin
    initl_exect_raprt (pva_nom_raprt,
                       pva_type_raprt);
    ajout_parmt (pva_code_parmt,
                 pnu_valr_parmt);
    commit;
    lancr_raprt ();
    commit;
  end lancr_raprt;*/

end afw_25_publc_pkg;
/
