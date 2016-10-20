SET DEFINE OFF;
create or replace package body afw_11_versn_pkg
is
  function obten_numr_versn (pnu_versn_niv_1   in number
                            ,pnu_versn_niv_2   in number
                            ,pnu_versn_niv_3   in number
                            ,pnu_versn_niv_4   in number)
    return number
    deterministic
  is
  begin
    return pnu_versn_niv_1 * 10000000 + pnu_versn_niv_2 * 100000 + pnu_versn_niv_3 * 1000 + pnu_versn_niv_4;
  end obten_numr_versn;

  function obten_versn (pnu_versn_niv_1   in number
                       ,pnu_versn_niv_2   in number
                       ,pnu_versn_niv_3   in number
                       ,pnu_versn_niv_4   in number)
    return varchar2
    deterministic
  is
    vva_versn   varchar2 (20);
  begin
    if nvl (pnu_versn_niv_4, 0) > 0
    then
      vva_versn      :=
           '.'
        || pnu_versn_niv_4;
    end if;

    if    nvl (pnu_versn_niv_3, 0) > 0
       or vva_versn is not null
    then
      vva_versn      :=
           '.'
        || nvl (pnu_versn_niv_3, 0)
        || vva_versn;
    end if;

    return    nvl (pnu_versn_niv_1, 0)
           || '.'
           || nvl (pnu_versn_niv_2, 0)
           || vva_versn;
  end obten_versn;

  function obten_seqnc_versn_courn_prodt (pnu_seqnc_prodt in number)
    return varchar2
    deterministic
  is
    vnu_versn   number (10);
  begin
    select ref_versn
      into vnu_versn
      from vd_i_afw_11_prodt
     where seqnc = pnu_seqnc_prodt;

    return vnu_versn;
  end obten_seqnc_versn_courn_prodt;

  function obten_seqnc_versn_courn_aplic (pnu_seqnc_aplic in number)
    return varchar2
    deterministic
  is
    vnu_versn   number (10);
  begin
    select ref_versn
      into vnu_versn
      from vd_i_afw_11_aplic
     where seqnc = pnu_seqnc_aplic;

    return vnu_versn;
  end obten_seqnc_versn_courn_aplic;

  procedure copr_entit (pnu_versn_sourc   in number
                       ,pnu_versn_destn   in number)
  is
    vnu_entit               number (10);
    vnu_entit_refrn         number (10);
    vnu_atrib_entit         number (10);

    type vty_asoct is table of number (10)
      index by varchar2 (20);

    vta_schem_prodt         vty_asoct;
    vnu_seqnc_schem_prodt   number (10);

    cursor cur_schem_prodt
    is
      select *
        from vd_i_afw_11_schem_prodt
       where     ref_versn = pnu_versn_sourc
             and indic_deplm = 'O';

    type vty_entit is table of number (10)
      index by varchar2 (20);

    vta_entit               vty_asoct;

    cursor cur_entit
    is
      select *
        from vd_i_afw_11_entit
       where ref_versn = pnu_versn_sourc;

    vta_atrib_entit         vty_asoct;

    cursor cur_atrib_entit
    is
      select *
        from vd_i_afw_11_atrib_entit
       where ref_entit in (select seqnc
                             from vd_i_afw_11_entit e
                            where e.ref_versn = pnu_versn_sourc);

    function obten_schem_prodt (pnu_seqnc_sourc in number)
      return number
    is
    begin
      if pnu_seqnc_sourc is not null
      then
        return vta_schem_prodt (pnu_seqnc_sourc);
      else
        raise no_data_found;
      end if;
    exception
      when no_data_found
      then
        return pnu_seqnc_sourc;
    end obten_schem_prodt;

    function obten_entit (pnu_seqnc_sourc in number)
      return number
    is
    begin
      if pnu_seqnc_sourc is not null
      then
        return vta_entit (pnu_seqnc_sourc);
      else
        raise no_data_found;
      end if;
    exception
      when no_data_found
      then
        return pnu_seqnc_sourc;
    end obten_entit;

    function obten_atrib_entit (pnu_seqnc_sourc in number)
      return number
    is
    begin
      if pnu_seqnc_sourc is not null
      then
        return vta_atrib_entit (pnu_seqnc_sourc);
      else
        raise no_data_found;
      end if;
    exception
      when no_data_found
      then
        return pnu_seqnc_sourc;
    end obten_atrib_entit;
  begin
    for rec_schem_prodt in cur_schem_prodt
    loop
      insert into vd_i_afw_11_schem_prodt (code
                                          ,nom
                                          ,descr
                                          ,ref_versn)
           values (rec_schem_prodt.code
                  ,rec_schem_prodt.nom
                  ,rec_schem_prodt.descr
                  ,pnu_versn_destn)
        returning seqnc
             into vnu_seqnc_schem_prodt;

      vta_schem_prodt (rec_schem_prodt.seqnc)   := vnu_seqnc_schem_prodt;
    end loop;

    for rec_entit in cur_entit
    loop
      vnu_seqnc_schem_prodt         := obten_schem_prodt (rec_entit.ref_schem_prodt);

      insert into vd_i_afw_11_entit (nom
                                    ,nom_table_tempr
                                    ,nom_table_ereur
                                    ,indic_creer_ocurn
                                    ,indic_modif_ocurn
                                    ,indic_suprm_ocurn
                                    ,indic_force_selct
                                    ,ref_versn
                                    ,ordre_exect
                                    ,code
                                    ,longr_bloc
                                    ,indic_nouvl_entit
                                    ,niv_inclu_migrt
                                    ,confg_inclu_migrt
                                    ,indic_expor_tabl_index
                                    ,indic_suprm_don_prodt
                                    ,indic_deplm_inter_prodt
                                    ,where_claus_custm
                                    ,ref_schem_prodt
                                    ,ref_atrib_entit_supr)
           values (rec_entit.nom
                  ,rec_entit.nom_table_tempr
                  ,rec_entit.nom_table_ereur
                  ,rec_entit.indic_creer_ocurn
                  ,rec_entit.indic_modif_ocurn
                  ,rec_entit.indic_suprm_ocurn
                  ,rec_entit.indic_force_selct
                  ,pnu_versn_destn
                  ,rec_entit.ordre_exect
                  ,rec_entit.code
                  ,rec_entit.longr_bloc
                  ,rec_entit.indic_nouvl_entit
                  ,rec_entit.niv_inclu_migrt
                  ,rec_entit.confg_inclu_migrt
                  ,rec_entit.indic_expor_tabl_index
                  ,rec_entit.indic_suprm_don_prodt
                  ,rec_entit.indic_deplm_inter_prodt
                  ,rec_entit.where_claus_custm
                  ,vnu_seqnc_schem_prodt
                  ,rec_entit.ref_atrib_entit_supr)
        returning seqnc
             into vnu_entit;

      vta_entit (rec_entit.seqnc)   := vnu_entit;
    end loop;

    for rec_atrib_entit in cur_atrib_entit
    loop
      vnu_entit                                 := obten_entit (rec_atrib_entit.ref_entit);
      vnu_entit_refrn                           := obten_entit (rec_atrib_entit.ref_entit_refrn);

      insert into vd_i_afw_11_atrib_entit (nom
                                          ,type_don
                                          ,compr_migrt
                                          ,ref_entit
                                          ,code
                                          ,ref_entit_refrn
                                          ,indic_nouvl_atrib)
           values (rec_atrib_entit.nom
                  ,rec_atrib_entit.type_don
                  ,rec_atrib_entit.compr_migrt
                  ,vnu_entit
                  ,rec_atrib_entit.code
                  ,vnu_entit_refrn
                  ,rec_atrib_entit.indic_nouvl_atrib)
        returning seqnc
             into vnu_atrib_entit;

      vta_atrib_entit (rec_atrib_entit.seqnc)   := vnu_atrib_entit;
    end loop;

    for rec_entit in cur_entit
    loop
      vnu_atrib_entit   := obten_atrib_entit (rec_entit.ref_atrib_entit_supr);

      update vd_i_afw_11_entit e
         set ref_atrib_entit_supr   = vnu_atrib_entit
       where e.seqnc = rec_entit.seqnc;
    end loop;
  end copr_entit;

  function creer_versn (pnu_seqnc        in number
                       ,pva_type         in varchar2
                       ,pnu_versn_niv1   in number
                       ,pnu_versn_niv2   in number
                       ,pnu_versn_niv3   in number
                       ,pnu_versn_niv4   in number
                       ,pva_code         in varchar2 default null)
    return number
  is
    vva_code    varchar2 (23);
    vnu_versn   number (10);
  begin
    if pva_code is null
    then
      vva_code      :=
           pnu_versn_niv1
        || pnu_versn_niv2
        || pnu_versn_niv3
        || pnu_versn_niv4;
    else
      vva_code   := pva_code;
    end if;

    case pva_type
      when 'APLIC'
      then
        insert into vd_i_afw_11_versn (ref_aplic
                                      ,numr_versn_1
                                      ,numr_versn_2
                                      ,numr_versn_3
                                      ,numr_versn_4
                                      ,code
                                      ,dnr_ref_aplic)
             values (pnu_seqnc
                    ,pnu_versn_niv1
                    ,pnu_versn_niv2
                    ,pnu_versn_niv3
                    ,pnu_versn_niv4
                    ,vva_code
                    ,pnu_seqnc)
          returning seqnc
               into vnu_versn;
      when 'PRODT'
      then
        insert into vd_i_afw_11_versn (ref_prodt
                                      ,numr_versn_1
                                      ,numr_versn_2
                                      ,numr_versn_3
                                      ,numr_versn_4
                                      ,code
                                      ,dnr_ref_prodt)
             values (pnu_seqnc
                    ,pnu_versn_niv1
                    ,pnu_versn_niv2
                    ,pnu_versn_niv3
                    ,pnu_versn_niv4
                    ,vva_code
                    ,pnu_seqnc)
          returning seqnc
               into vnu_versn;
      when 'PLUGN'
      then
        insert into vd_i_afw_11_versn (ref_plugn
                                      ,numr_versn_1
                                      ,numr_versn_2
                                      ,numr_versn_3
                                      ,numr_versn_4
                                      ,code)
             values (pnu_seqnc
                    ,pnu_versn_niv1
                    ,pnu_versn_niv2
                    ,pnu_versn_niv3
                    ,pnu_versn_niv4
                    ,vva_code)
          returning seqnc
               into vnu_versn;
    end case;

    return vnu_versn;
  end creer_versn;

  procedure creer_versn (pnu_seqnc        in number
                        ,pva_type         in varchar2
                        ,pnu_versn_niv1   in number
                        ,pnu_versn_niv2   in number
                        ,pnu_versn_niv3   in number
                        ,pnu_versn_niv4   in number
                        ,pva_code         in varchar2 default null)
  is
    vnu_versn   number (10);
  begin
    vnu_versn      :=
      creer_versn (pnu_seqnc
                  ,pva_type
                  ,pnu_versn_niv1
                  ,pnu_versn_niv2
                  ,pnu_versn_niv3
                  ,pnu_versn_niv4
                  ,pva_code);
  end creer_versn;

  procedure creer_versn_aplic (pnu_seqnc        in number
                              ,pnu_versn_niv1   in number
                              ,pnu_versn_niv2   in number
                              ,pnu_versn_niv3   in number default 0
                              ,pnu_versn_niv4   in number default 0
                              ,pva_code         in varchar2 default null)
  is
  begin
    creer_versn (pnu_seqnc
                ,'APLIC'
                ,pnu_versn_niv1
                ,pnu_versn_niv2
                ,pnu_versn_niv3
                ,pnu_versn_niv4
                ,pva_code);
  end creer_versn_aplic;

  function creer_versn_aplic (pnu_seqnc        in number
                             ,pnu_versn_niv1   in number
                             ,pnu_versn_niv2   in number
                             ,pnu_versn_niv3   in number default 0
                             ,pnu_versn_niv4   in number default 0
                             ,pva_code         in varchar2 default null)
    return number
  is
    vnu_versn   number (10);
  begin
    vnu_versn      :=
      creer_versn (pnu_seqnc
                  ,'APLIC'
                  ,pnu_versn_niv1
                  ,pnu_versn_niv2
                  ,pnu_versn_niv3
                  ,pnu_versn_niv4
                  ,pva_code);

    return vnu_versn;
  end creer_versn_aplic;

  procedure creer_versn_aplic_base (pnu_aplic in number)
  is
    vnu_versn   number (10);
  begin
    vnu_versn      :=
      creer_versn_aplic (pnu_aplic
                        ,0
                        ,1);

    update vd_afw_11_aplic
       set ref_versn   = vnu_versn
     where seqnc = pnu_aplic;
  end creer_versn_aplic_base;

  procedure creer_versn_prodt (pnu_seqnc        in number
                              ,pnu_versn_niv1   in number
                              ,pnu_versn_niv2   in number
                              ,pnu_versn_niv3   in number default 0
                              ,pnu_versn_niv4   in number default 0
                              ,pva_code         in varchar2 default null)
  is
  begin
    creer_versn (pnu_seqnc
                ,'PRODT'
                ,pnu_versn_niv1
                ,pnu_versn_niv2
                ,pnu_versn_niv3
                ,pnu_versn_niv4
                ,pva_code);
  end creer_versn_prodt;

  procedure creer_versn_plugn (pnu_seqnc        in number
                              ,pnu_versn_niv1   in number
                              ,pnu_versn_niv2   in number
                              ,pnu_versn_niv3   in number default 0
                              ,pnu_versn_niv4   in number default 0
                              ,pva_code         in varchar2 default null)
  is
  begin
    creer_versn (pnu_seqnc
                ,'PLUGN'
                ,pnu_versn_niv1
                ,pnu_versn_niv2
                ,pnu_versn_niv3
                ,pnu_versn_niv4
                ,pva_code);
  end creer_versn_plugn;
end afw_11_versn_pkg;
/
