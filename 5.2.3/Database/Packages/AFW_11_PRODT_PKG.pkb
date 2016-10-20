SET DEFINE OFF;
create or replace package body afw_11_prodt_pkg
is
  gda_const_date   constant date
                              default to_date (   '1'
                                               || '9'
                                               || '8'
                                               || '7'
                                               || '-'
                                               || '0'
                                               || '7'
                                               || '-'
                                               || '0'
                                               || '9'
                                              ,'yyyy-mm-dd') ;
  gnu_versn_niv_1           number default 2;
  gnu_versn_niv_2           number default 3;
  gnu_versn_niv_3           number default 0;
  gnu_versn_niv_4           number default 0;

  function obten_prodt_sesn
    return number
  is
    vnu_seqnc_prodt   vd_i_afw_11_prodt.seqnc%type;
  begin
    /*
     select pr.seqnc
       into vnu_seqnc_prodt
       from vd_i_afw_11_prodt pr
           ,vd_i_afw_11_aplic ap
      where     pr.seqnc = ap.ref_prodt
            and ap.seqnc = afw_11_aplic_pkg.obten_aplic_sesn ();


     return vnu_seqnc_prodt;*/


    return afw_07_polc_pkg.obten_valr_contx_seqnc_prodt;
  exception
    when no_data_found
    then
      raise;
  end obten_prodt_sesn;

  function obten_prodt (pva_code_prodt in varchar2)
    return number
  is
    vnu_prodt   afw_11_prodt.seqnc%type;
  begin
    select seqnc
      into vnu_prodt
      from vd_i_afw_11_prodt
     where code = pva_code_prodt;

    return vnu_prodt;
  exception
    when no_data_found
    then
      return null;
  end obten_prodt;

  function obten_code_prodt (pnu_seqnc in number default null)
    return varchar2
  is
    vva_code   afw_11_prodt.code%type;
  begin
    select code
      into vva_code
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_seqnc, obten_prodt_sesn);

    return vva_code;
  end obten_code_prodt;

  function obten_aplic_acuei (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return vd_i_afw_11_prodt.ref_aplic_acuei%type
  is
    vnu_aplic   vd_i_afw_11_aplic.seqnc%type;
  begin
    select p.ref_aplic_acuei
      into vnu_aplic
      from vd_i_afw_11_prodt p
     where p.seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vnu_aplic;
  end obten_aplic_acuei;

  function obten_numr_apex_aplic_acuei (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return number
  is
    vnu_aplic_acuei        vd_afw_11_prodt.ref_aplic_acuei%type;
    vnu_numr_aplic_acuei   vd_afw_11_prodt.ref_numr_aplic_acuei%type;
  begin
    vnu_aplic_acuei   := obten_aplic_acuei (pnu_prodt);

    if vnu_aplic_acuei is null
    then
      vnu_numr_aplic_acuei   := null;
    else
      vnu_numr_aplic_acuei   := afw_11_aplic_pkg.obten_numr_apex_aplic (vnu_aplic_acuei);
    end if;

    return vnu_numr_aplic_acuei;
  end obten_numr_apex_aplic_acuei;

  function obten_page_acuei (pnu_prodt in number default null)
    return number
  is
    vnu_page   vd_i_afw_13_page.seqnc%type;
  begin
    select p.ref_page_acuei
      into vnu_page
      from vd_afw_11_prodt p
     where p.seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vnu_page;
  end obten_page_acuei;

  function obten_numr_apex_page_acuei (pnu_prodt in number default null)
    return number
  is
    vnu_page_acuei        vd_afw_11_prodt.ref_page_acuei%type;
    vnu_numr_page_acuei   vd_afw_11_prodt.ref_numr_page_acuei%type;
  begin
    vnu_page_acuei   := obten_page_acuei (pnu_prodt);

    if vnu_page_acuei is null
    then
      vnu_numr_page_acuei   := afw_11_aplic_pkg.obten_numr_apex_page_acuei;
    else
      vnu_numr_page_acuei   := afw_13_page_pkg.obten_numr_apex_page (vnu_page_acuei);
    end if;

    return vnu_numr_page_acuei;
  end obten_numr_apex_page_acuei;

  function obten_aplic_comnt_bogue (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return vd_i_afw_11_prodt.ref_aplic_comnt_bogue%type
  is
    vnu_aplic_comnt_bogue   vd_afw_11_prodt.ref_aplic_comnt_bogue%type;
  begin
    select p.ref_aplic_comnt_bogue
      into vnu_aplic_comnt_bogue
      from vd_afw_11_prodt p
     where p.seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vnu_aplic_comnt_bogue;
  end obten_aplic_comnt_bogue;

  function obten_numr_apex_aplic_cb (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return number
  is
    vnu_aplic_comnt_bogue   vd_afw_11_prodt.ref_numr_aplic_comnt_bogue%type;
  begin
    select p.ref_numr_aplic_comnt_bogue
      into vnu_aplic_comnt_bogue
      from vd_afw_11_prodt p
     where p.seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vnu_aplic_comnt_bogue;
  end obten_numr_apex_aplic_cb;

  function obten_page_comnt_bogue (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return vd_i_afw_11_prodt.ref_page_comnt_bogue%type
  is
    vnu_page_comnt_bogue   vd_afw_11_prodt.ref_page_comnt_bogue%type;
  begin
    select p.ref_page_comnt_bogue
      into vnu_page_comnt_bogue
      from vd_afw_11_prodt p
     where p.seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vnu_page_comnt_bogue;
  end obten_page_comnt_bogue;

  function obten_numr_apex_page_cb (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default null)
    return number
  is
    vnu_page_comnt_bogue   vd_afw_11_prodt.ref_numr_page_comnt_bogue%type;
  begin
    select p.ref_numr_page_comnt_bogue
      into vnu_page_comnt_bogue
      from vd_afw_11_prodt p
     where p.seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vnu_page_comnt_bogue;
  end obten_numr_apex_page_cb;

  /*
      OBSOLETE: il faut utiliser AFW_11_VERSN_PKG.OBTEN_NUMR_VERSN
  */
  function obten_numr_versn (pnu_versn_niv_1   in number
                            ,pnu_versn_niv_2   in number
                            ,pnu_versn_niv_3   in number
                            ,pnu_versn_niv_4   in number)
    return number
    deterministic
  is
  begin
    return afw_11_versn_pkg.obten_numr_versn (pnu_versn_niv_1
                                             ,pnu_versn_niv_2
                                             ,pnu_versn_niv_3
                                             ,pnu_versn_niv_4);
  end obten_numr_versn;

  --CONAL :: Ne devrait plus etre utilise
  /*
          function obten_numr_versn_aplic (pnu_numr_aplic in number default null)
      return number is
      vnu_versn_formt   number;
    begin
      --TODO revoir cette partie lorsqu'on remplacera le repartiteur
      if pnu_numr_aplic is null then
        return obten_numr_versn (gnu_versn_niv_1,
                                 gnu_versn_niv_2,
                                 gnu_versn_niv_3,
                                 gnu_versn_niv_4);
      else
        select (select obten_numr_versn (v.numr_versn_1,
                                                          v.numr_versn_2,
                                                          v.numr_versn_3,
                                                          v.numr_versn_4)
                  from vd_i_afw_11_versn v
                 where v.ref_prodt = p.seqnc)
          into vnu_versn_formt
          from vd_afw_11_prodt p
         where p.numr_aplic_apex = pnu_numr_aplic;
        return vnu_versn_formt;
      end if;
    end obten_numr_versn_aplic;
  */

  --OBSOLETE: il faut utiliser AFW_11_VERSN_PKG.OBTEN_VERSN
  function obten_versn (pnu_versn_niv_1   in number
                       ,pnu_versn_niv_2   in number
                       ,pnu_versn_niv_3   in number
                       ,pnu_versn_niv_4   in number)
    return varchar2
    deterministic
  is
  begin
    return afw_11_versn_pkg.obten_versn (pnu_versn_niv_1
                                        ,pnu_versn_niv_2
                                        ,pnu_versn_niv_3
                                        ,pnu_versn_niv_4);
  end obten_versn;

  function obten_versn
    return varchar2
  is
    vva_nom   varchar2 (200);
  begin
    select    p.nom
           || ' '
           || (select obten_versn (v.numr_versn_1
                                  ,v.numr_versn_2
                                  ,v.numr_versn_3
                                  ,v.numr_versn_4)
                 from vd_i_afw_11_versn v
                where v.seqnc = p.ref_versn)
      into vva_nom
      from vd_i_afw_11_prodt p
     where p.seqnc = obten_prodt_sesn;

    return vva_nom;
  end obten_versn;

  --CONAL, il faut trouver une facon d'obtenir le schema d'un produit
  /*
        function obten_schem (pnu_seqnc in number default null )
      return varchar2 is
      vva_schem                               varchar2 (60);
    begin
      if pnu_seqnc is null then
        select   a.owner
          into   vva_schem
          from   apex_aplic a
         where   a.id = afw_07_util_pkg.nv ('APP_ID');
      else
        select   a.owner
          into   vva_schem
          from   apex_aplic a,
                 vd_i_afw_11_prodt p
         where   a.id = p.numr_aplic_apex and p.seqnc = pnu_seqnc;
      end if;
      return vva_schem;
    end obten_schem;
  */
  --Temporairement, j'en ai besoin pour la migration CONAL
  function obten_schem_afw
    return varchar2
  is
    vnu_seqnc_safp   vd_i_afw_11_aplic.seqnc%type default afw_11_aplic_pkg.obten_aplic ('SAFP');
  begin
    return afw_11_aplic_pkg.obten_schem (vnu_seqnc_safp);
  end obten_schem_afw;

  function obten_dosr_fichr_prodt (pnu_seqnc in number default null)
    return varchar2
  is
    vva_dosr_fichr   vd_afw_11_prodt.dosr_fichr%type;
  begin
    select dosr_fichr
      into vva_dosr_fichr
      from vd_afw_11_prodt
     where seqnc = nvl (pnu_seqnc, obten_prodt_sesn);

    return vva_dosr_fichr;
  end obten_dosr_fichr_prodt;

  procedure inser_prodt (pva_code           in varchar2
                        ,pva_nom            in varchar2
                        ,pnu_numr_versn_1   in number
                        ,pnu_numr_versn_2   in number
                        ,pnu_numr_versn_3   in number
                        ,pnu_numr_versn_4   in number)
  is
    vnu_prodt   vd_i_afw_11_prodt.seqnc%type;
    vnu_versn   vd_i_afw_11_versn.seqnc%type;
  begin
    insert into vd_i_afw_11_prodt (code
                                  ,nom)
         values (pva_code
                ,pva_nom)
      returning seqnc
           into vnu_prodt;

    insert into vd_i_afw_11_versn (ref_prodt
                                  ,numr_versn_1
                                  ,numr_versn_2
                                  ,numr_versn_3
                                  ,numr_versn_4
                                  ,dnr_ref_prodt)
         values (vnu_prodt
                ,pnu_numr_versn_1
                ,pnu_numr_versn_2
                ,pnu_numr_versn_3
                ,pnu_numr_versn_4
                ,vnu_prodt)
      returning seqnc
           into vnu_versn;

    update vd_i_afw_11_prodt
       set ref_versn   = vnu_versn
     where seqnc = vnu_prodt;
  exception
    when others
    then
      raise_application_error (-20001
                              ,   'Erreur - afw_11_prodt_pkg.inser_prodt - '
                               || sqlerrm);
  end inser_prodt;

  function maj_prodt (pva_code                in varchar2
                     ,pva_nom                 in varchar2
                     ,pva_procd_expor_metdn   in varchar2
                     ,pnu_tail_tabl_extra     in number
                     ,pva_indic_extra_tout    in varchar2
                     ,pnu_ref_versn_courn     in number default null)
    return number
  is
    vnu_seqnc   number;
  begin
    begin
      select seqnc
        into vnu_seqnc
        from vd_i_afw_11_prodt
       where code = upper (pva_code);

      update vd_i_afw_11_prodt
         set nom                 = pva_nom
            ,procd_expor_metdn   = pva_procd_expor_metdn
            ,tail_tabl_extra     = pnu_tail_tabl_extra
            ,indic_extra_tout    = pva_indic_extra_tout
            ,ref_versn           = pnu_ref_versn_courn
       where seqnc = vnu_seqnc;
    exception
      when no_data_found
      then
        null;

        insert into vd_i_afw_11_prodt (code
                                      ,nom
                                      ,procd_expor_metdn
                                      ,tail_tabl_extra
                                      ,indic_extra_tout
                                      ,ident_envir)
             values (pva_code
                    ,pva_nom
                    ,pva_procd_expor_metdn
                    ,pnu_tail_tabl_extra
                    ,pva_indic_extra_tout
                    ,'ACC')
          returning seqnc
               into vnu_seqnc;
    end;

    return vnu_seqnc;
  exception
    when others
    then
      --TODO: revoir la gestion des erreurs selon AFW
      raise_application_error (-20001
                              ,   'Erreur - afw_11_prodt_pkg.maj_prodt - '
                               || sqlerrm);
  end maj_prodt;

  procedure telvs_fichr (pcl_fichr              in clob
                        ,pva_nom_fichr          in varchar2
                        ,pbo_atach              in boolean default true
                        ,pva_contn_type         in varchar2 default 'text/plain'
                        ,pbo_arret_engin_apex   in boolean default false
                        ,pnu_chars_id           in number default 0)
  is
  begin
    afw_07_util_pkg.telvr_fichr (pcl_fichr
                                ,pva_nom_fichr
                                ,pva_contn_type
                                ,pbo_atach
                                ,pbo_arret_engin_apex
                                ,pnu_chars_id);
  end telvs_fichr;


  procedure telvs_fichr (pbl_fichr              in out nocopy blob
                        ,pva_nom_fichr          in            varchar2
                        ,pva_contn_type         in            varchar2
                        ,pbo_atach              in            boolean default true
                        ,pbo_arret_engin_apex   in            boolean default false
                        ,pnu_chars_id           in            number default 0)
  is
  begin
    afw_07_util_pkg.telvr_fichr (pbl_fichr
                                ,pva_nom_fichr
                                ,pva_contn_type
                                ,pbo_atach
                                ,pbo_arret_engin_apex
                                ,pnu_chars_id);
  end telvs_fichr;

  function obten_lang_deft (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn ())
    return vd_i_afw_01_lang.seqnc%type
  is
    vnu_lang   number (10);
  begin
    select l.seqnc
      into vnu_lang
      from vd_i_afw_11_prodt_lang pl
          ,vd_i_afw_01_lang       l
     where     pl.indic_deft = 'O'
           and l.seqnc = pl.ref_lang
           and pl.ref_prodt = pnu_prodt;

    return vnu_lang;
  exception
    when others
    then
      return null;
  end obten_lang_deft;

  function obten_code_lang_deft (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn ())
    return vd_i_afw_01_lang.code%type
  is
    vva_lang   vd_i_afw_01_lang.code%type;
  begin
    select l.code
      into vva_lang
      from vd_i_afw_11_prodt_lang pl
          ,vd_i_afw_01_lang       l
     where     pl.indic_deft = 'O'
           and l.seqnc = pl.ref_lang
           and pl.ref_prodt = pnu_prodt;

    return vva_lang;
  exception
    when others
    then
      return null;
  end obten_code_lang_deft;

  function obten_lang (pva_code    in vd_i_afw_01_lang.code%type
                      ,pnu_prodt   in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn ())
    return vd_i_afw_01_lang.seqnc%type
  is
    vnu_lang   number (10);
  begin
    select l.seqnc
      into vnu_lang
      from vd_i_afw_11_prodt_lang pl
          ,vd_i_afw_01_lang       l
     where     pl.ref_prodt = pnu_prodt
           and l.seqnc = pl.ref_lang
           and l.code = upper (pva_code);

    return vnu_lang;
  exception
    when others
    then
      return null;
  end obten_lang;

  function obten_lang_sesn (pva_code_deft in varchar2 default null)
    return number
  is
    vnu_seqnc_lang   number (10);
    vva_code_lang    varchar2 (10) default afw_01_lang_pkg.obten_lang_furtr ();
  begin
    /*
    -- Determiner si la langue du browser existe pour l'application
    vnu_seqnc_lang   := obten_lang (vva_code_lang);

    -- Si la langue du browser n'existe pas pour l'application
    -- Determiner si la langue du browser sans territoire existe pour l'application
    if vnu_seqnc_lang is null and instr (vva_code_lang, '-') > 0
    then
      vnu_seqnc_lang      :=
        obten_lang (
          substr (vva_code_lang, 1, instr (vva_code_lang, '-') - 1));
    end if;

    -- Si la langue du browser sans territoire n'existe pas pour l'application
    -- Utiliser la langue par defaut
    if vnu_seqnc_lang is null and pva_code_deft is not null
    then
      vnu_seqnc_lang   := obten_lang (pva_code_deft);
    end if;


    --Prendre l'application primaire de l'application
    if vnu_seqnc_lang is null
    then
      vnu_seqnc_lang      :=
        obten_lang (afw_07_util_pkg.obten_lang_aplic_deft ());
    end if;

    */



    vnu_seqnc_lang   := obten_lang_deft ();

    return vnu_seqnc_lang;
  end obten_lang_sesn;

  function obten_code_lang_sesn (pva_code_deft in varchar2 default null)
    return varchar2
  is
    vva_code   vd_i_afw_01_lang.code%type;
  begin
    select code
      into vva_code
      from vd_i_afw_01_lang l
     where l.seqnc = obten_lang_sesn (pva_code_deft);

    return vva_code;
  end obten_code_lang_sesn;

  function obten_versn_plugn_formt (pnu_no_versn in number)
    return varchar2
  is
  begin
    return null;
  end obten_versn_plugn_formt;

  function obten_ident_envir (pnu_prodt in number default obten_prodt_sesn)
    return varchar2
  is
    vva_ident_envir   varchar2 (60);
  begin
    select ident_envir
      into vva_ident_envir
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_ident_envir;
  end obten_ident_envir;

  function obten_versn_courn (pnu_prodt in number)
    return number
  is
    vnu_versn   number (10);
  begin
    select ref_versn
      into vnu_versn
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vnu_versn;
  end obten_versn_courn;

  function obten_jquer_ui_css_scope (pnu_prodt in number default null)
    return varchar2
  is
    vva_jquer_ui_css_scope   vd_i_afw_11_prodt.jquer_ui_css_scope%type;
  begin
    select jquer_ui_css_scope
      into vva_jquer_ui_css_scope
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_jquer_ui_css_scope;
  exception
    when others
    then
      --TODO::CARLO
      return obten_code_prodt (pnu_prodt);
  end obten_jquer_ui_css_scope;

  function obten_mesg_tout_droit_resrv (pnu_prodt in number default null)
    return varchar2
  is
    vva_mesg_tout_droit_resrv   vd_i_afw_11_prodt.mesg_tout_droit_resrv%type;
  begin
    select mesg_tout_droit_resrv
      into vva_mesg_tout_droit_resrv
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_mesg_tout_droit_resrv;
  exception
    when others
    then
      return null;
  end obten_mesg_tout_droit_resrv;

  function obten_templ_javsc_core_1 (pnu_prodt in number default null)
    return varchar2
  is
  begin
    return    afw_15_htp_pkg.ouvri_bals ('script'
                                        ,'src'
                                        ,   obten_dosr_fichr_afw
                                         || 'assets/libs/afw_core.min.js'
                                         || '?v='
                                         || obten_numr_versn_prodt_afw
                                        ,'type'
                                        ,'text/javascript')
           || afw_15_htp_pkg.fermr_bals ('script')
           || afw_15_htp_pkg.ouvri_bals ('script'
                                        ,'src'
                                        ,   obten_dosr_fichr_afw
                                         || 'assets/libs/afw_ie.min.js'
                                         || '?v='
                                         || obten_numr_versn_prodt_afw
                                        ,'type'
                                        ,'text/javascript')
           || afw_15_htp_pkg.fermr_bals ('script');
  exception
    when others
    then
      return null;
  end obten_templ_javsc_core_1;

  function obten_templ_theme_jquer_ui (pnu_prodt in number default null)
    return varchar2
  is
  begin
    return    '<!-- AFW - Theme - jQuery UI - CSS -->'
           || '<link rel="stylesheet" href="'
           || obten_dosr_fichr_afw
           || 'theme/jquery-ui/css/ui-afw/jquery-ui-1.8.17.custom.min.css'
           || '?v='
           || obten_numr_versn_prodt_afw
           || '" type="text/css" />'
           || '<link rel="stylesheet" href="'
           || obten_dosr_fichr_prodt
           || 'theme/jquery-ui/css/'
           || case
                when obten_jquer_ui_css_scope is not null
                then
                     obten_jquer_ui_css_scope
                  || '/'
                else
                  null
              end
           || 'jquery-ui-1.8.17.custom.min.css'
           || '?v='
           || obten_numr_versn_prodt
           || '" type="text/css" />'
           || '<!-- AFW - Theme - jQuery UI - Custom Icons -->'
           || '<link rel="stylesheet" href="'
           || obten_dosr_fichr_afw
           || 'theme/jquery-ui/custom_icons/assets/css/fff.icon.core.min.css'
           || '?v='
           || obten_numr_versn_prodt_afw
           || '" type="text/css" />'
           || '<link rel="stylesheet" href="'
           || obten_dosr_fichr_afw
           || 'theme/jquery-ui/custom_icons/assets/css/fff.icon.icons.min.css'
           || '?v='
           || obten_numr_versn_prodt_afw
           || '" type="text/css" />';
  end obten_templ_theme_jquer_ui;

  function obten_templ_javsc_core_2 (pnu_prodt in number default null)
    return varchar2
  is
  begin
    return    afw_15_htp_pkg.ouvri_bals ('script'
                                        ,'src'
                                        ,   obten_dosr_fichr_afw
                                         || 'assets/libs/afw.min.js'
                                         || '?v='
                                         || obten_numr_versn_prodt_afw
                                        ,'type'
                                        ,'text/javascript')
           || afw_15_htp_pkg.fermr_bals ('script')
           || afw_15_htp_pkg.ouvri_bals ('script'
                                        ,'src'
                                        ,   obten_dosr_fichr_afw
                                         || 'assets/libs/afw_legacy.min.js'
                                         || '?v='
                                         || obten_numr_versn_prodt_afw
                                        ,'type'
                                        ,'text/javascript')
           || afw_15_htp_pkg.fermr_bals ('script');
  end obten_templ_javsc_core_2;

  function obten_templ_javsc_jquer (pnu_prodt in number default null)
    return varchar2
  is
  begin
    --todo CARLO
    --remplacer impromptu par jquery ui dialog
    --trouver un remplacement pour hotkey
    return    '<!-- AFW - JavaScript - jQuery Plug-in -->'
           || '<script src="'
           || obten_dosr_fichr_afw
           || 'assets/plugins/jquery-apex/4.1.0/jquery.apex-aplic_procs.min.js'
           || '?v='
           || obten_numr_versn_prodt_afw
           || '" type="text/javascript" defer></script>'
           || '<script src="'
           || obten_dosr_fichr_afw
           || 'assets/plugins/jquery-apex/4.1.0/jquery.apex-session.min.js'
           || '?v='
           || obten_numr_versn_prodt_afw
           || '" type="text/javascript" defer></script>';
  end obten_templ_javsc_jquer;

  function obten_templ_custm (pnu_prodt in number default null)
    return varchar2
  is
  begin
    return    '<!-- Application - Theme - CSS -->'
           || '<link rel="stylesheet" href="'
           || obten_dosr_fichr_afw
           || 'res/assets/css/theme.min.css?v='
           || obten_numr_versn_prodt_afw
           || '" type="text/css" />'
           || '<link rel="stylesheet" href="'
           || obten_dosr_fichr_prodt
           || 'res/assets/css/theme.min.css?v='
           || obten_numr_versn_prodt
           || '" type="text/css" />';
  end obten_templ_custm;

  function obten_boutn_deplc_range_raprt
    return varchar2
  is
  begin
    return    afw_15_htp_pkg.ouvri_bals ('div'
                                        ,'class'
                                        ,'barre_boutn_deplc_range_raprt')
           || afw_15_htp_pkg.ouvri_bals ('a'
                                        ,'href'
                                        ,'#'
                                        ,'onclick'
                                        ,'afw.afw_13.page.raprt_sql.deplc_rang_haut(this);')
           || afw_15_htp_pkg.ouvri_bals ('span'
                                        ,'class'
                                        ,'small_text_button ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only')
           || afw_15_htp_pkg.ouvri_bals ('span'
                                        ,'class'
                                        ,'ui-icon-primary ui-icon ui-icon-triangle-1-n'
                                        ,'title'
                                        ,'Déplacer vers le haut.')
           || afw_15_htp_pkg.fermr_bals ('span')
           || afw_15_htp_pkg.ouvri_bals ('span'
                                        ,'class'
                                        ,'ui-button-text')
           || 'Déplacer vers le haut.'
           || afw_15_htp_pkg.fermr_bals ('span')
           || afw_15_htp_pkg.fermr_bals ('span')
           || afw_15_htp_pkg.fermr_bals ('a')
           || afw_15_htp_pkg.ouvri_bals ('a'
                                        ,'href'
                                        ,'#'
                                        ,'onclick'
                                        ,'afw.afw_13.page.raprt_sql.deplc_rang_bas(this);')
           || afw_15_htp_pkg.ouvri_bals ('span'
                                        ,'class'
                                        ,'small_text_button ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only')
           || afw_15_htp_pkg.ouvri_bals ('span'
                                        ,'class'
                                        ,'ui-icon-primary ui-icon ui-icon-triangle-1-s'
                                        ,'title'
                                        ,'Déplacer vers le bas.')
           || afw_15_htp_pkg.fermr_bals ('span')
           || afw_15_htp_pkg.ouvri_bals ('span'
                                        ,'class'
                                        ,'ui-button-text')
           || 'Déplacer vers le bas.'
           || afw_15_htp_pkg.fermr_bals ('span')
           || afw_15_htp_pkg.fermr_bals ('span')
           || afw_15_htp_pkg.fermr_bals ('a')
           || afw_15_htp_pkg.fermr_bals ('div');
  end obten_boutn_deplc_range_raprt;

  function obten_url_acuei (pnu_prodt in number default obten_prodt_sesn)
    return varchar2
  is
  begin
    return    obten_base_url (pnu_prodt)
           || afw_08_url_pkg.genr_url (obten_numr_apex_aplic_acuei (pnu_prodt)
                                      ,obten_numr_apex_page_acuei (pnu_prodt)
                                      ,'SIDF'
                                      ,null);
  end obten_url_acuei;

  function obten_url_authe_cible_sesn
    return varchar2
  is
  begin
    return    obten_base_url (obten_prodt_sesn)
           || afw_08_url_pkg.genr_url (afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_APLIC')
                                      ,afw_07_sesn_pkg.obten_valr_sesn ('S_AUTHE_CIBLE_NUMR_APEX_PAGE')
                                      ,'SIDF'
                                      ,null);
  end obten_url_authe_cible_sesn;

  procedure defnr_item_aplic_apex
  is
  begin
    --Initialisation d'etat dans la session
    if     afw_12_utils_pkg.obten_usagr_conct is not null
       and afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_11_TRAIT_MESGS_ERR') is null
    then
      afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_11_TRAIT_MESGS_ERR'
                                      ,0);
    end if;

    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_NUMR_VERSN_PRODT'
                                    ,obten_numr_versn_prodt);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_NUMR_VERSN_PRODT_AFW'
                                    ,obten_numr_versn_prodt_afw);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_DOSR_FICHR'
                                    ,obten_dosr_fichr_prodt);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_DOSR_FICHR_AFW'
                                    ,obten_dosr_fichr_afw);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_ENVIR'
                                    ,   '<span class="ident_envir">'
                                     || obten_ident_envir
                                     || '</span>');
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_VERSN_PRODT'
                                    ,obten_versn);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_ACRON_PRODT'
                                    ,obten_code_prodt);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_NOM_PRODT'
                                    ,obten_nom);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_ACRON_APLIC'
                                    ,afw_11_aplic_pkg.obten_code_aplic);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_NOM_APLIC'
                                    ,afw_11_aplic_pkg.obten_nom_aplic);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_JQUER_UI_CSS_SCOPE'
                                    ,obten_jquer_ui_css_scope);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_MESG_TOUT_DROIT_RESRV'
                                    ,obten_mesg_tout_droit_resrv);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_TEMPL_JAVSC_CORE_1'
                                    ,obten_templ_javsc_core_1);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_TEMPL_THEME_JQUER_UI'
                                    ,obten_templ_theme_jquer_ui);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_TEMPL_JAVSC_CORE_2'
                                    ,obten_templ_javsc_core_2);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_TEMPL_JAVSC_JQUER'
                                    ,obten_templ_javsc_jquer);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_TEMPL_CUSTM'
                                    ,obten_templ_custm);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_MESG_SUPRS'
                                    ,afw_07_util_pkg.obten_mesg_suprs ());
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_TRAIT_MESGS_ERR'
                                    ,nvl (afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_11_TRAIT_MESGS_ERR'), 0));
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_URL_ACUEI'
                                    ,obten_url_acuei);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_URL_AUTHE_CIBLE'
                                    ,obten_url_authe_cible_sesn);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_11_DEPLC_RANGE_RAPRT'
                                    ,obten_boutn_deplc_range_raprt);
  exception
    when others
    then
      ete ();
      raise;
  end defnr_item_aplic_apex;

  function obten_page_inexs_maj_refrn (pnu_prodt in vd_i_afw_11_prodt.seqnc%type)
    return boolean
  is
    vva_indic_page_inexs_maj_refrn   varchar2 (1);
  begin
    select indic_page_inexs_maj_refrn
      into vva_indic_page_inexs_maj_refrn
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return (vva_indic_page_inexs_maj_refrn = 'O');
  end obten_page_inexs_maj_refrn;

  function obten_mesg_sucs_prodt (pnu_prodt in number default null)
    return varchar2
  is
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select afw_01_gestn_mesg_pkg.obten_mesg (ref_mesg_sucs)
      into vva_mesg
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_mesg;
  exception
    when others
    then
      raise;
  end obten_mesg_sucs_prodt;

  function obten_mesg_echec_prodt (pnu_prodt in number default null)
    return varchar2
  is
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select afw_01_gestn_mesg_pkg.obten_mesg (ref_mesg_echec)
      into vva_mesg
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_mesg;
  end obten_mesg_echec_prodt;

  function obten_mesg_fetch_prodt (pnu_prodt in number default null)
    return varchar2
  is
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select afw_01_gestn_mesg_pkg.obten_mesg (ref_mesg_fetch)
      into vva_mesg
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_mesg;
  end obten_mesg_fetch_prodt;

  function obten_mesg_suprm_prodt (pnu_prodt in number default null)
    return varchar2
  is
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select afw_01_gestn_mesg_pkg.obten_mesg (ref_mesg_range_suprm)
      into vva_mesg
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_mesg;
  end obten_mesg_suprm_prodt;

  function obten_mesg_modf_prodt (pnu_prodt in number default null)
    return varchar2
  is
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select afw_01_gestn_mesg_pkg.obten_mesg (ref_mesg_range_modf)
      into vva_mesg
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_mesg;
  end obten_mesg_modf_prodt;

  function obten_mesg_inser_prodt (pnu_prodt in number default null)
    return varchar2
  is
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select afw_01_gestn_mesg_pkg.obten_mesg (ref_mesg_range_inser)
      into vva_mesg
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_mesg;
  end obten_mesg_inser_prodt;

  function obten_mesg_aucun_don_prodt (pnu_prodt in number default null)
    return varchar2
  is
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select afw_01_gestn_mesg_pkg.obten_mesg (ref_mesg_aucun_don_trouv)
      into vva_mesg
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_mesg;
  end obten_mesg_aucun_don_prodt;

  function obten_mesg_trop_don_prodt (pnu_prodt in number default null)
    return varchar2
  is
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select afw_01_gestn_mesg_pkg.obten_mesg (ref_mesg_trop_don_trouv)
      into vva_mesg
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, obten_prodt_sesn);

    return vva_mesg;
  end obten_mesg_trop_don_prodt;

  procedure deplr_formt_resrc_prodt (pnu_prodt in number)
  is
  begin
    --delete from vd_i_afw_13_formt_resrc where ref_prodt = pnu_prodt;
    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,largr
                                          ,hautr
                                          ,nom)
           values ('ICONE_16PX'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'IMAG')
                  ,16
                  ,16
                  ,'Icone 16 pixels');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,largr
                                          ,hautr
                                          ,nom)
           values ('IMAGE_MOYEN'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'IMAG')
                  ,48
                  ,48
                  ,'Icone moyenne');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,largr
                                          ,hautr
                                          ,nom)
           values ('IMAGE_24PX'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'IMAG')
                  ,24
                  ,24
                  ,'Icone 24 pixels');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,largr
                                          ,hautr
                                          ,nom)
           values ('IMAGE_32PX'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'IMAG')
                  ,32
                  ,32
                  ,'Icone 32 pixels');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,largr
                                          ,hautr
                                          ,nom)
           values ('IMAGE_64PX'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'IMAG')
                  ,64
                  ,64
                  ,'Icone 64 pixels');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,largr
                                          ,hautr
                                          ,nom)
           values ('IMAGE_48PX'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'IMAG')
                  ,48
                  ,48
                  ,'Icone 48 pixels');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,largr
                                          ,hautr
                                          ,nom)
           values ('IMAGE_128PX'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'IMAG')
                  ,128
                  ,128
                  ,'Icone 128 pixels');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,nom)
           values ('NON_COMPR'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'CSS')
                  ,'Non compresse');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,nom)
           values ('NON_COMPR'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'JS')
                  ,'Non compresse');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,nom)
           values ('COMPR'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'JS')
                  ,'Compresse');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,nom)
           values ('JS_MIN'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'JS')
                  ,'Javascript compresse (minify)');
    exception
      when dup_val_on_index
      then
        null;
    end;

    begin
      insert into vd_i_afw_13_formt_resrc (code
                                          ,ref_prodt
                                          ,ref_type_fichr
                                          ,nom)
           values ('JS_DEBUG'
                  ,pnu_prodt
                  , (select seqnc
                       from vd_afw_13_type_fichr
                      where code = 'JS')
                  ,'Javascript non compresse (debug)');
    exception
      when dup_val_on_index
      then
        null;
    end;
  end deplr_formt_resrc_prodt;

  function obten_dosr_fichr_afw (pnu_prodt in number default null)
    return varchar2
    result_cache relies_on (afw_11_prodt)
  is
    vva_dosr_fichr   varchar2 (200);
  begin
    select dosr_fichr
      into vva_dosr_fichr
      from vd_i_afw_11_prodt
     where code = 'AFW';

    return vva_dosr_fichr;
  end obten_dosr_fichr_afw;

  function obten_fonct_obten_base_url (pnu_prodt in vd_i_afw_11_prodt.seqnc%type)
    return varchar2
  is
    vva_fonct_obten_base_url   vd_i_afw_11_prodt.fonct_obten_base_url%type;
  begin
    select fonct_obten_base_url
      into vva_fonct_obten_base_url
      from vd_i_afw_11_prodt s
     where s.seqnc = pnu_prodt;

    return vva_fonct_obten_base_url;
  exception
    when no_data_found
    then
      raise;
  end obten_fonct_obten_base_url;

  function obten_base_url (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2
  is
    vva_base_url               varchar2 (1000);
    vva_fonct_obten_base_url   vd_i_afw_11_prodt.fonct_obten_base_url%type;

    function exect_fonct_obten_base_url (pva_nom_fonct in varchar2)
      return varchar2
    is
      vva_progr_a_lancr   varchar2 (4000)
                            default    'begin '
                                    || '  afw_11_prodt_pkg.gva_base_url := %FONCT_PERSN%; '
                                    || '  exception when others then ete();'
                                    || 'end;';
    begin
      vva_progr_a_lancr      :=
        replace (vva_progr_a_lancr
                ,'%FONCT_PERSN%'
                ,pva_nom_fonct);

      execute immediate vva_progr_a_lancr;

      return gva_base_url;
    exception
      when others
      then
        return null;
    end exect_fonct_obten_base_url;
  begin
    vva_fonct_obten_base_url   := obten_fonct_obten_base_url (pnu_prodt);

    if vva_fonct_obten_base_url is not null
    then
      vva_base_url      :=
           rtrim (exect_fonct_obten_base_url (vva_fonct_obten_base_url)
                 ,'/')
        || '/';
    else
      vva_base_url      :=
           case
             when afw_08_url_pkg.obten_port_servr = 443
             then
               'https://'
             else
                  afw_08_url_pkg.obten_protc_reqt
               || '://'
           end
        || afw_08_url_pkg.obten_host_http
        || case
             when     afw_08_url_pkg.obten_port_servr not in (80
                                                             ,443
                                                             ,8080)
                  and instr (afw_08_url_pkg.obten_host_http
                            ,   ':'
                             || afw_08_url_pkg.obten_port_servr) = 0
             then
                  ':'
               || afw_08_url_pkg.obten_port_servr
             else
               null
           end
        || afw_08_url_pkg.obten_nom_scrip
        || '/';
    end if;

    return vva_base_url;
  exception
    when others
    then
      return null;
  end obten_base_url;

  function obten_procd_entet_plpdf (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return vd_i_afw_11_prodt.procd_impre_entet_pdf_ir%type
  is
    vva_procd   vd_i_afw_11_prodt.procd_impre_entet_pdf_ir%type;
  begin
    select procd_impre_entet_pdf_ir
      into vva_procd
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_procd;
  end obten_procd_entet_plpdf;

  function obten_procd_pied_page_plpdf (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return vd_i_afw_11_prodt.procd_impre_pied_page_pdf_ir%type
  is
    vva_procd   vd_i_afw_11_prodt.procd_impre_pied_page_pdf_ir%type;
  begin
    select procd_impre_pied_page_pdf_ir
      into vva_procd
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_procd;
  end obten_procd_pied_page_plpdf;

  function obten_procd_coulr_plpdf (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return vd_i_afw_11_prodt.procd_plpdf_coulr%type
  is
    vva_procd   vd_i_afw_11_prodt.procd_plpdf_coulr%type;
  begin
    select procd_plpdf_coulr
      into vva_procd
      from vd_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_procd;
  end obten_procd_coulr_plpdf;

  function obten_numr_versn_prodt (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2
  is
    vva_numr_versn   varchar2 (200);
  begin
    select (select afw_11_versn_pkg.obten_versn (v.numr_versn_1
                                                ,v.numr_versn_2
                                                ,v.numr_versn_3
                                                ,v.numr_versn_4)
              from vd_i_afw_11_versn v
             where v.seqnc = p.ref_versn)
      into vva_numr_versn
      from vd_afw_11_prodt p
     where p.seqnc = pnu_prodt;

    return vva_numr_versn;
  exception
    when no_data_found
    then
      return null;
  end obten_numr_versn_prodt;

  function obten_numr_versn_prodt_afw
    return varchar2
  is
  begin
    return obten_numr_versn_prodt (obten_prodt ('AFW'));
  end obten_numr_versn_prodt_afw;

  function obten_nom (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2
  is
    vva_nom   vd_i_afw_11_prodt.nom%type;
  begin
    select nom
      into vva_nom
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_nom;
  exception
    when no_data_found
    then
      return null;
  end obten_nom;

  procedure creer_mesg_base_prodt (pnu_prodt   in vd_i_afw_11_prodt.seqnc%type
                                  ,pnu_lang    in vd_i_afw_01_lang.seqnc%type default null)
  is
    vva_mesg_sucs              vd_i_afw_01_mesg_lang.mesg%type default 'Opération réussie.';
    vva_type_mesg_sucs         varchar2 (1) default afw_01_gestn_mesg_pkg.kva_type_mesg_infor;

    vva_mesg_echec             vd_i_afw_01_mesg_lang.mesg%type default 'Opération échouée.';
    vva_type_mesg_echec        varchar2 (1) default afw_01_gestn_mesg_pkg.kva_type_mesg_err;

    vva_mesg_extra             vd_i_afw_01_mesg_lang.mesg%type default 'Impossible d''extraire la ligne.';
    vva_type_mesg_extra        varchar2 (1) default afw_01_gestn_mesg_pkg.kva_type_mesg_err;

    vva_mesg_rang_suprm        vd_i_afw_01_mesg_lang.mesg%type default 'rangée(s) supprimée(s)';
    vva_type_mesg_rang_suprm   varchar2 (1) default afw_01_gestn_mesg_pkg.kva_type_mesg_infor;

    vva_mesg_rang_modf         vd_i_afw_01_mesg_lang.mesg%type default 'rangée(s) modifiée(s)';
    vva_type_mesg_rang_modf    varchar2 (1) default afw_01_gestn_mesg_pkg.kva_type_mesg_infor;

    vva_mesg_rang_inser        vd_i_afw_01_mesg_lang.mesg%type default 'rangée(s) insérée(s)';
    vva_type_mesg_rang_inser   varchar2 (1) default afw_01_gestn_mesg_pkg.kva_type_mesg_infor;

    vva_mesg_aucun_don         vd_i_afw_01_mesg_lang.mesg%type default 'Aucune donnée trouvée.';
    vva_type_mesg_aucun_don    varchar2 (1) default afw_01_gestn_mesg_pkg.kva_type_mesg_infor;

    vva_mesg_trop_don          vd_i_afw_01_mesg_lang.mesg%type
      default 'La requête retourne plus de #MAX_ROW_COUNT# enregistrements. Veuillez utiliser un filtre pour accéder aux enregistrements désirés.';
    vva_type_mesg_trop_don     varchar2 (1) default afw_01_gestn_mesg_pkg.kva_type_mesg_err;

    vva_catgr_mesg             varchar2 (3) default 'GEN';

    vnu_mesg_sucs              vd_i_afw_11_prodt.ref_mesg_sucs%type;
    vnu_mesg_echec             vd_i_afw_11_prodt.ref_mesg_echec%type;
    vnu_mesg_extra             vd_i_afw_11_prodt.ref_mesg_fetch%type;
    vnu_mesg_rang_suprm        vd_i_afw_11_prodt.ref_mesg_range_suprm%type;
    vnu_mesg_rang_modf         vd_i_afw_11_prodt.ref_mesg_range_modf%type;
    vnu_mesg_rang_inser        vd_i_afw_11_prodt.ref_mesg_range_inser%type;
    vnu_mesg_aucun_don         vd_i_afw_11_prodt.ref_mesg_aucun_don_trouv%type;
    vnu_mesg_trop_don          vd_i_afw_11_prodt.ref_mesg_trop_don_trouv%type;

    vnu_lang                   vd_i_afw_01_lang.seqnc%type;
  begin
    vnu_lang   := nvl (pnu_lang, afw_01_lang_pkg.obten_lang ('FR-CA'));

    vnu_mesg_sucs      :=
      afw_01_gestn_mesg_pkg.creer_mesg (vva_catgr_mesg
                                       ,vva_mesg_sucs
                                       ,vva_type_mesg_sucs
                                       ,pnu_prodt
                                       ,vnu_lang);

    vnu_mesg_echec      :=
      afw_01_gestn_mesg_pkg.creer_mesg (vva_catgr_mesg
                                       ,vva_mesg_echec
                                       ,vva_type_mesg_echec
                                       ,pnu_prodt
                                       ,vnu_lang);

    vnu_mesg_extra      :=
      afw_01_gestn_mesg_pkg.creer_mesg (vva_catgr_mesg
                                       ,vva_mesg_extra
                                       ,vva_type_mesg_extra
                                       ,pnu_prodt
                                       ,vnu_lang);

    vnu_mesg_rang_suprm      :=
      afw_01_gestn_mesg_pkg.creer_mesg (vva_catgr_mesg
                                       ,vva_mesg_rang_suprm
                                       ,vva_type_mesg_rang_suprm
                                       ,pnu_prodt
                                       ,vnu_lang);

    vnu_mesg_rang_modf      :=
      afw_01_gestn_mesg_pkg.creer_mesg (vva_catgr_mesg
                                       ,vva_mesg_rang_modf
                                       ,vva_type_mesg_rang_modf
                                       ,pnu_prodt
                                       ,vnu_lang);

    vnu_mesg_rang_inser      :=
      afw_01_gestn_mesg_pkg.creer_mesg (vva_catgr_mesg
                                       ,vva_mesg_rang_inser
                                       ,vva_type_mesg_rang_inser
                                       ,pnu_prodt
                                       ,vnu_lang);

    vnu_mesg_aucun_don      :=
      afw_01_gestn_mesg_pkg.creer_mesg (vva_catgr_mesg
                                       ,vva_mesg_aucun_don
                                       ,vva_type_mesg_aucun_don
                                       ,pnu_prodt
                                       ,vnu_lang);

    vnu_mesg_trop_don      :=
      afw_01_gestn_mesg_pkg.creer_mesg (vva_catgr_mesg
                                       ,vva_mesg_trop_don
                                       ,vva_type_mesg_trop_don
                                       ,pnu_prodt
                                       ,vnu_lang);

    update vd_i_afw_11_prodt
       set ref_mesg_sucs              = vnu_mesg_sucs
          ,ref_mesg_echec             = vnu_mesg_echec
          ,ref_mesg_fetch             = vnu_mesg_extra
          ,ref_mesg_range_suprm       = vnu_mesg_rang_suprm
          ,ref_mesg_range_modf        = vnu_mesg_rang_modf
          ,ref_mesg_range_inser       = vnu_mesg_rang_inser
          ,ref_mesg_aucun_don_trouv   = vnu_mesg_aucun_don
          ,ref_mesg_trop_don_trouv    = vnu_mesg_trop_don
     where seqnc = pnu_prodt;
  end creer_mesg_base_prodt;

  function obten_domn_docmn_html (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2
  is
    vva_domn_docmn_html   vd_i_afw_11_prodt.domn_docmn_html%type;
  begin
    select domn_docmn_html
      into vva_domn_docmn_html
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_domn_docmn_html;
  exception
    when no_data_found
    then
      return null;
  end obten_domn_docmn_html;

  function obten_initl_comps_javsc (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2
  is
    vva_initl_comps_javsc   vd_i_afw_11_prodt.initl_comps_javsc%type;
  begin
    select initl_comps_javsc
      into vva_initl_comps_javsc
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_initl_comps_javsc;
  exception
    when no_data_found
    then
      return null;
  end obten_initl_comps_javsc;

  function obten_note_scrip_pre_migrt (pnu_prodt in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_11_prodt.note_scrip_pre_migrt%type
  is
    vva_note_scrip_pre_migrt   vd_i_afw_11_prodt.note_scrip_pre_migrt%type;
  begin
    select note_scrip_pre_migrt
      into vva_note_scrip_pre_migrt
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_note_scrip_pre_migrt;
  exception
    when no_data_found
    then
      return null;
  end obten_note_scrip_pre_migrt;

  function obten_note_scrip_post_migrt (pnu_prodt in vd_i_afw_11_prodt.seqnc%type)
    return vd_i_afw_11_prodt.note_scrip_post_migrt%type
  is
    vva_note_scrip_post_migrt   vd_i_afw_11_prodt.note_scrip_post_migrt%type;
  begin
    select note_scrip_post_migrt
      into vva_note_scrip_post_migrt
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_note_scrip_post_migrt;
  exception
    when no_data_found
    then
      return null;
  end obten_note_scrip_post_migrt;

  procedure activ_aplic (pnu_prodt         in vd_i_afw_11_prodt.seqnc%type
                        ,pbo_mode_debg     in boolean default false
                        ,pbo_barre_editn   in boolean default false)
  is
    vnu_mode_debg   number (1) default 0;
    vva_code_stat   varchar2 (30) default 'AVAILABLE';
  begin
    vnu_mode_debg   := case when pbo_mode_debg then 1 else 0 end;

    vva_code_stat   := case when pbo_barre_editn then 'AVAILABLE_W_EDIT_LINK' else 'AVAILABLE' end;

    update apex_aplic aa
       set aa.flow_status           = vva_code_stat
          ,aa.application_tab_set   = vnu_mode_debg
     where exists
             (select null
                from vd_i_afw_11_aplic a
               where     a.numr_aplic_apex = aa.id
                     and a.ref_prodt = pnu_prodt);
  end activ_aplic;

  procedure deact_aplic (pnu_prodt in vd_i_afw_11_prodt.seqnc%type)
  is
  begin
    -- Rendre indisponible
    -- Désactiver le mode debug
    update apex_aplic aa
       set aa.flow_status   = 'UNAVAILABLE'
     where exists
             (select null
                from vd_i_afw_11_aplic a
               where     a.numr_aplic_apex = aa.id
                     and a.ref_prodt = pnu_prodt);
  -- Gestion du message hardcodé
  /*
  flow_status = 'UNAVAILABLE'
  flow_unavailable_text = '<br/>Cette application est hors service pour maintenance.<br/>Nous sommes désolés des inconvénients occasionnés.'
  */
  -- Gestion du message dynamique
  /*
  flow_status = 'UNAVAILABLE_PLSQL'
  flow_unavailable_text = 'mon_package_pkg.ma_fonction'
  */
  end deact_aplic;

  function obten_fonct_migrt_persn (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default obten_prodt_sesn)
    return varchar2
  is
    vva_fonct_migrt_persn   vd_i_afw_11_prodt.fonct_migrt_persn%type;
  begin
    select fonct_migrt_persn
      into vva_fonct_migrt_persn
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_fonct_migrt_persn;
  end obten_fonct_migrt_persn;
end afw_11_prodt_pkg;
/
