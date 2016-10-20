SET DEFINE OFF;
create or replace package body afw_12_domn_pkg
is
  function ajout_domn (pva_code    in varchar2
                      ,pva_nom     in varchar2
                      ,pva_descr   in varchar2)
    return vd_i_afw_12_domn.seqnc%type
  is
    vnu_domn   vd_i_afw_12_domn.seqnc%type;
  begin
    insert into vd_i_afw_12_domn (code
                                 ,nom
                                 ,descr)
         values (upper (pva_code)
                ,pva_nom
                ,pva_descr)
      returning seqnc
           into vnu_domn;

    return vnu_domn;
  exception
    when others
    then
      ete ();
      return null;
  end ajout_domn;

  procedure ajout_domn (pva_code    in varchar2
                       ,pva_nom     in varchar2
                       ,pva_descr   in varchar2)
  is
    vnu_domn   vd_i_afw_12_domn.seqnc%type;
  begin
    vnu_domn      :=
      ajout_domn (pva_code    => pva_code
                 ,pva_nom     => pva_nom
                 ,pva_descr   => pva_descr);
  exception
    when others
    then
      ete ();
  end ajout_domn;

  function modfc_domn (pnu_seqnc   in number
                      ,pva_code    in varchar2
                      ,pva_nom     in varchar2
                      ,pva_descr   in varchar2)
    return vd_i_afw_12_domn.seqnc%type
  is
    vnu_seqnc   number (10);
  begin
    if pnu_seqnc is null
    then
      vnu_seqnc   := afw_12_domn_pkg.obten_seqnc_domn (pva_code);
    end if;

    update vd_i_afw_12_domn
       set code    = upper (pva_code)
          ,nom     = pva_nom
          ,descr   = pva_descr
     where seqnc = vnu_seqnc;

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return ajout_domn (pva_code
                        ,pva_nom
                        ,pva_descr);
    when others
    then
      ete ();
      return null;
  end modfc_domn;

  procedure modfc_domn (pnu_seqnc   in number
                       ,pva_code    in varchar2
                       ,pva_nom     in varchar2
                       ,pva_descr   in varchar2)
  is
    vnu_seqnc   number (10);
  begin
    vnu_seqnc      :=
      modfc_domn (pnu_seqnc
                 ,pva_code
                 ,pva_nom
                 ,pva_descr);
  end modfc_domn;

  procedure suprm_domn (pnu_seqnc in number)
  is
  begin
    delete from vd_i_afw_12_domn
          where seqnc = pnu_seqnc;
  exception
    when others
    then
      ete ();
  end suprm_domn;

  function obten_code_domn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.code%type
  is
    vva_code   vd_i_afw_12_domn.code%type;
  begin
    select code
      into vva_code
      from vd_i_afw_12_domn
     where seqnc = pnu_domn;

    return vva_code;
  end obten_code_domn;

  function ajout_utils (pnu_utils         in number
                       ,pnu_domn          in number
                       ,pda_debut_efect   in date default sysdate
                       ,pda_fin_efect     in date default null)
    return vd_i_afw_12_domn_utils.seqnc%type
  is
    vnu_domn_utils   vd_i_afw_12_domn_utils.seqnc%type;
  begin
    if     pnu_utils is not null
       and pnu_domn is not null
    then
      insert into vd_i_afw_12_domn_utils (ref_utils
                                         ,ref_domn
                                         ,date_debut_efect
                                         ,date_fin_efect)
           values (pnu_utils
                  ,pnu_domn
                  ,pda_debut_efect
                  ,pda_fin_efect)
        returning seqnc
             into vnu_domn_utils;
    end if;

    return vnu_domn_utils;
  end ajout_utils;

  procedure ajout_utils (pnu_utils         in number
                        ,pnu_domn          in number
                        ,pda_debut_efect   in date default sysdate
                        ,pda_fin_efect     in date default null)
  is
    vnu_domn_utils   vd_i_afw_12_domn_utils.seqnc%type;
  begin
    vnu_domn_utils      :=
      ajout_utils (pnu_utils
                  ,pnu_domn
                  ,pda_debut_efect
                  ,pda_fin_efect);
  end ajout_utils;

  procedure modfc_utils (pnu_seqnc         in number
                        ,pda_debut_efect   in date
                        ,pda_fin_efect     in date)
  is
  begin
    if pnu_seqnc is not null
    then
      update vd_i_afw_12_domn_utils
         set date_debut_efect   = pda_debut_efect
            ,date_fin_efect     = pda_fin_efect
       where seqnc = pnu_seqnc;
    end if;
  end modfc_utils;

  procedure termn_utils (pnu_utils       in number
                        ,pda_fin_efect   in date)
  is
  begin
    update vd_i_afw_12_domn_utils du
       set du.date_fin_efect   = pda_fin_efect
     where du.ref_utils = pnu_utils;
  end termn_utils;

  procedure termn_utils (pnu_utils       in number
                        ,pnu_domn        in number
                        ,pda_fin_efect   in date)
  is
  begin
    update vd_i_afw_12_domn_utils du
       set du.date_fin_efect   = pda_fin_efect
     where     du.ref_utils = pnu_utils
           and du.ref_domn = pnu_domn;
  end termn_utils;

  procedure suprm_utils (pnu_seqnc in number)
  is
  begin
    delete from vd_i_afw_12_domn_utils
          where seqnc = pnu_seqnc;
  exception
    when others
    then
      ete ();
  end suprm_utils;

  function obten_seqnc_domn (pva_code in vd_i_afw_12_domn.code%type)
    return vd_i_afw_12_domn.seqnc%type
  is
    vnu_domn   vd_i_afw_12_domn.seqnc%type;
  begin
    select seqnc
      into vnu_domn
      from vd_i_afw_12_domn
     where code = upper (pva_code);

    return vnu_domn;
  exception
    when others
    then
      return null;
  end obten_seqnc_domn;

  function obten_nom_domn (pva_code in vd_i_afw_12_domn.code%type)
    return vd_i_afw_12_domn.nom%type
  is
    vva_nom   vd_i_afw_12_domn.nom%type;
  begin
    select nom
      into vva_nom
      from vd_i_afw_12_domn
     where code = upper (pva_code);

    return vva_nom;
  exception
    when others
    then
      return null;
  end obten_nom_domn;

  function obten_nom_domn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.nom%type
  is
    vva_nom   vd_i_afw_12_domn.nom%type;
  begin
    select nom
      into vva_nom
      from vd_i_afw_12_domn
     where seqnc = pnu_domn;

    return vva_nom;
  exception
    when others
    then
      return null;
  end obten_nom_domn;

  function obten_domn_sesn
    return vd_i_afw_12_domn.seqnc%type
  is
  begin
    return obten_seqnc_domn (nvl (afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN_POUR'), afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN')));
  exception
    when others
    then
      return null;
  end obten_domn_sesn;

  function obten_code_domn_sesn
    return vd_i_afw_12_domn.code%type
  is
  begin
    return nvl (afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN_POUR'), afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN'));
  exception
    when others
    then
      return null;
  end obten_code_domn_sesn;

  function obten_nom_domn_sesn
    return vd_i_afw_12_domn.nom%type
  is
  begin
    return obten_nom_domn (nvl (afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN_POUR'), afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN')));
  exception
    when others
    then
      return null;
  end obten_nom_domn_sesn;

  function obten_domn_sesn_authe
    return number
  is
  begin
    return obten_seqnc_domn (afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN'));
  exception
    when others
    then
      return null;
  end obten_domn_sesn_authe;

  function obten_code_domn_sesn_authe
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN');
  exception
    when others
    then
      return null;
  end obten_code_domn_sesn_authe;

  function obten_type_travl_deft (pnu_seqnc in number)
    return number
  is
    vnu_type_travl   number (10);
  begin
    select type_travl_deft
      into vnu_type_travl
      from vd_i_afw_12_domn
     where seqnc = pnu_seqnc;

    return vnu_type_travl;
  end obten_type_travl_deft;

  procedure chang_domn (pnu_domn in number)
  is
  begin
    if afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN_POUR') is not null
    then
      afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_DOMN_POUR'
                                      ,afw_12_domn_pkg.obten_code_domn (pnu_domn));
    else
      afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_DOMN'
                                      ,afw_12_domn_pkg.obten_code_domn (pnu_domn));
    end if;
  --TODO:: Ajouter 1 colonne sur afw_12_utils pour savoir le dernier domaine connecté
  /*
        afw_12_utils_pkg.updat_dernr_prodt (afw_12_utils_pkg.obten_usagr_conct,
                                      afw_11_prodt_pkg.obten_code_prodt (pnu_prodt));*/
  end chang_domn;

  function obten_procd_authe_exter_afw (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_authe_exter_afw%type
  is
    vva_procd_authe_exter_afw   vd_i_afw_12_domn.procd_authe_exter_afw%type;
  begin
    select procd_authe_exter_afw
      into vva_procd_authe_exter_afw
      from vd_i_afw_12_domn
     where seqnc = pnu_domn;

    return vva_procd_authe_exter_afw;
  exception
    when no_data_found
    then
      return null;
  end obten_procd_authe_exter_afw;

  function obten_procd_avant_conxn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_avant_conxn%type
  is
    vva_procd_avant_conxn   vd_i_afw_12_domn.procd_avant_conxn%type;
  begin
    select procd_avant_conxn
      into vva_procd_avant_conxn
      from vd_i_afw_12_domn
     where seqnc = pnu_domn;

    return vva_procd_avant_conxn;
  exception
    when no_data_found
    then
      return null;
  end obten_procd_avant_conxn;

  function obten_procd_apres_conxn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_apres_conxn%type
  is
    vva_procd_apres_conxn   vd_i_afw_12_domn.procd_apres_conxn%type;
  begin
    select procd_apres_conxn
      into vva_procd_apres_conxn
      from vd_i_afw_12_domn
     where seqnc = pnu_domn;

    return vva_procd_apres_conxn;
  exception
    when no_data_found
    then
      return null;
  end obten_procd_apres_conxn;

  function obten_procd_apres_decnx (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_apres_decnx%type
  is
    vva_procd_apres_decnx   vd_i_afw_12_domn.procd_apres_decnx%type;
  begin
    select procd_apres_decnx
      into vva_procd_apres_decnx
      from vd_i_afw_12_domn
     where seqnc = pnu_domn;

    return vva_procd_apres_decnx;
  exception
    when no_data_found
    then
      return null;
  end obten_procd_apres_decnx;

  function valdr_demnd_activ_compt_utils (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return boolean
  is
    vbo_vald    boolean default false;
    vva_indic   vd_i_afw_12_domn.indic_demnd_activ_compt_utils%type;
  begin
    select indic_demnd_activ_compt_utils
      into vva_indic
      from vd_i_afw_12_domn
     where seqnc = pnu_domn;

    if vva_indic = 'O'
    then
      vbo_vald   := true;
    end if;

    return vbo_vald;
  exception
    when no_data_found
    then
      return vbo_vald;
  end valdr_demnd_activ_compt_utils;

  function obten_domn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn%rowtype
  is
    cursor cur_domn (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    is
      select *
        from vd_i_afw_12_domn
       where seqnc = pnu_domn;

    rec_domn   cur_domn%rowtype;
  begin
    open cur_domn (pnu_domn);

    fetch cur_domn
      into rec_domn;

    close cur_domn;

    return rec_domn;
  end;

  procedure alimn_type_travl (pnu_domn in vd_i_afw_12_domn.seqnc%type)
  is
  begin
    insert into vd_i_afw_25_type_travl (code
                                       ,nom
                                       ,ref_domn)
         values ('FILE_ATENT'
                ,'File d''attente'
                ,pnu_domn);

    insert into vd_i_afw_25_type_travl (code
                                       ,nom
                                       ,ref_domn)
         values ('SAUVG_DOSR'
                ,'Sauvegarde dossier'
                ,pnu_domn);
  end;

  procedure alimn_group_utils (pnu_domn        in vd_i_afw_12_domn.seqnc%type
                              ,pnu_modl_domn   in vd_i_afw_12_domn.seqnc%type default 0)
  is
    cursor cur_group_utils
    is
      select seqnc
        from vd_afw_12_group_utils
       where ref_domn = pnu_modl_domn;
  begin
    for rec_gu in cur_group_utils
    loop
      afw_12_group_utils_pkg.ajout_group_utils_domn (rec_gu.seqnc
                                                    ,pnu_domn);
    end loop;
  end alimn_group_utils;

  procedure alimn_modl_rechr (pnu_domn        in vd_afw_12_domn.seqnc%type
                             ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0)
  is
    cursor cur_modl_rechr
    is
      select seqnc
        from vd_afw_23_modl_rechr
       where ref_domn = pnu_modl_domn;
  begin
    for rec_mr in cur_modl_rechr
    loop
      afw_23_rechr_pkg.ajout_modl_rechr_domn (rec_mr.seqnc
                                             ,pnu_domn);
    end loop;
  end alimn_modl_rechr;

  procedure alimn_domn_type_publc (pnu_domn        in vd_i_afw_12_domn.seqnc%type
                                  ,pnu_modl_domn   in vd_i_afw_12_domn.seqnc%type default 0)
  is
    cursor cur_domn_type_publc
    is
      select seqnc
        from vd_afw_25_domn_type_publc
       where ref_domn = pnu_modl_domn;
  begin
    for rec_dtp in cur_domn_type_publc
    loop
      afw_25_domn_type_publc_pkg.creat_domn_type_publc (rec_dtp.seqnc
                                                       ,pnu_domn);
    end loop;
  end alimn_domn_type_publc;

  procedure alimn_profl_courl (pnu_domn        in vd_afw_12_domn.seqnc%type
                              ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0)
  is
    cursor cur_profl_courl
    is
      select seqnc
        from vd_afw_17_profl_courl
       where ref_domn = pnu_modl_domn;
  begin
    for rec_pc in cur_profl_courl
    loop
      afw_17_profl_courl_pkg.ajout_profl_courl_domn (rec_pc.seqnc
                                                    ,pnu_domn);
    end loop;
  end alimn_profl_courl;

  procedure alimn_confg_evenm_notfb (pnu_domn        in vd_afw_12_domn.seqnc%type
                                    ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0)
  is
    cursor cur_confg_evenm_notfb
    is
      select seqnc
        from vd_afw_01_confg_evenm_notfb
       where ref_domn = pnu_modl_domn;
  begin
    for rec_cen in cur_confg_evenm_notfb
    loop
      afw_01_evenm_notfb_pkg.ajout_confg_en_domn (rec_cen.seqnc
                                                 ,pnu_domn);
    end loop;
  end alimn_confg_evenm_notfb;

  procedure alimn_domn_opert (pnu_domn        in vd_afw_12_domn.seqnc%type
                             ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0)
  is
    cursor cur_domn_opert
    is
      select seqnc
        from vd_afw_12_gr_ut_opert_opt_dom
       where ref_domn = pnu_modl_domn;
  begin
    for rec_fd in cur_domn_opert
    loop
      afw_12_fonct_pkg.ajout_opert_domn (rec_fd.seqnc
                                        ,pnu_domn);
    end loop;
  end alimn_domn_opert;

  procedure alimn_domn_fonct (pnu_domn        in vd_afw_12_domn.seqnc%type
                             ,pnu_modl_domn   in vd_afw_12_domn.seqnc%type default 0)
  is
    cursor cur_domn_fonct
    is
      select seqnc
        from vd_afw_12_domn_fonct
       where ref_domn = pnu_modl_domn;
  begin
    for rec_fd in cur_domn_fonct
    loop
      afw_12_fonct_pkg.ajout_fonct_domn (rec_fd.seqnc
                                        ,pnu_domn);
    end loop;
  end alimn_domn_fonct;

  procedure valdr_chevc_date_domn_utils (pnu_seqnc        in vd_afw_12_domn_utils.seqnc%type
                                        ,pnu_ref_domn     in vd_afw_12_domn.seqnc%type
                                        ,pnu_ref_utils    in vd_afw_12_utils.seqnc%type
                                        ,pda_date_debut   in date
                                        ,pda_date_fin     in date)
  is
    cursor cur_exist_perd
    is
      select 1
        from vd_afw_12_domn_utils du
       where     du.ref_domn = pnu_ref_domn
             and du.ref_utils = pnu_ref_utils
             and du.seqnc != pnu_seqnc
             and (   pda_date_fin >= du.date_debut_efect
                  or pda_date_fin is null)
             and (   pda_date_debut <= du.date_fin_efect
                  or du.date_fin_efect is null)
             and rownum = 1;
  begin
    for rec_exist_perd in cur_exist_perd
    loop
      afw_01_err_apex_pkg.lever_err_apex_code (pva_code         => 'DOM.000149'
                                              ,pva_code_prodt   => 'AFW');
    end loop;
  end valdr_chevc_date_domn_utils;

  function obten_procd_infor_utils (pnu_domn in vd_i_afw_12_domn.seqnc%type)
    return vd_i_afw_12_domn.procd_obten_infor_utils%type
  is
    vva_procd_infor_utils   vd_i_afw_12_domn.procd_obten_infor_utils%type;
  begin
    select procd_obten_infor_utils
      into vva_procd_infor_utils
      from vd_i_afw_12_domn
     where seqnc = pnu_domn;

    return vva_procd_infor_utils;
  exception
    when no_data_found
    then
      return null;
  end obten_procd_infor_utils;

  function obten_indic_authe_courl (pva_code in vd_i_afw_12_domn.code%type)
    return vd_i_afw_12_domn.indic_authe_courl%type
  is
    vva_indic_authe_courl   vd_i_afw_12_domn.indic_authe_courl%type;
  begin
    select indic_authe_courl
      into vva_indic_authe_courl
      from vd_i_afw_12_domn
     where code = pva_code;

    return vva_indic_authe_courl;
  exception
    when no_data_found
    then
      return null;
  end obten_indic_authe_courl;
end afw_12_domn_pkg;
/
