SET DEFINE OFF;
create or replace package body afw_13_menu_pkg
as
  function obten_url_cible (pnu_item_menu in number /*,
                                                                             pnu_item_parnt in number default null*/
                                                   )
    return varchar2
  is
    vnu_dv_valr_url           number (10);
    vva_forml_valr_url        varchar2 (4000);
    vnu_numr_aplic            number;
    vnu_numr_page             number;
    vva_efacr_cache           varchar2 (1000);
    vnu_dv_valr_reqst         number (10);
    vva_forml_valr_reqst      varchar2 (4000);
    vva_indic_reint_pagnt     varchar2 (1);
    vva_indic_reint_page_ir   varchar2 (1);
    vva_indic_clear_page_ir   varchar2 (1);
    vva_indic_soums_page      varchar2 (1);
    vva_indic_reint_navgt     varchar2 (1);
    vnu_dv_valr_scpc          number (10);
    vva_forml_valr_scpc       varchar2 (4000);
    vnu_dv_valr_sspc          number (10);
    vva_forml_valr_sspc       varchar2 (4000);
    vnu_dv_valr_sapc          number (10);
    vva_forml_valr_sapc       varchar2 (4000);
    vnu_dv_valr_scpi          number (10);
    vva_forml_valr_scpi       varchar2 (4000);
    vnu_dv_valr_sspi          number (10);
    vva_forml_valr_sspi       varchar2 (4000);
    vnu_dv_valr_sapi          number (10);
    vva_forml_valr_sapi       varchar2 (4000);
    vnu_dv_valr_snpi          number (10);
    vva_forml_valr_snpi       varchar2 (4000);
    vva_indic_gerer_sidf      vd_i_afw_13_item_menu.indic_gerer_sidf%type;
    vnu_valr_sidf             number;
    vva_url                   varchar2 (4000);

    type typ_rec_page is record (numr_page_apex number);

    type typ_tab_page is table of typ_rec_page
      index by pls_integer;

    gta_page                  typ_tab_page;

    vva_optio_pagnt           varchar2 (11);

    /* TODO:ALEX, à compléter selon le traitement */
    procedure trait_type_insta (pnu_dv_valr_insta   in     number
                               ,pva_valr_insta      in out varchar2)
    is
      vva_code_dv_valr_insta   varchar2 (23);
    begin
      vva_code_dv_valr_insta   := afw_14_domn_valr_pkg.obten_code (pnu_dv_valr_insta);

      case vva_code_dv_valr_insta
        when 'ITEM'
        then
          pva_valr_insta   := afw_07_util_pkg.v (pva_valr_insta);
        when 'PL/SQL'
        then
          pva_valr_insta   := afw_07_util_pkg.obten_reslt_expre_plsql (pva_valr_insta);
        else
          pva_valr_insta   := aa.do_substitutions (pva_valr_insta);
      end case;
    end trait_type_insta;

    procedure alimn_tabl_page (pva_efacr_cache in varchar2)
    is
      vva_efacr_cache   varchar2 (1000) default pva_efacr_cache;
      vva_seprt_page    varchar2 (1) default ':';
      vnu_postn         pls_integer;
      i                 pls_integer;
    begin
      i   := gta_page.count ();
      vnu_postn      :=
        instr (vva_efacr_cache
              ,vva_seprt_page);

      if vnu_postn = 0
      then
        gta_page (i).numr_page_apex   := to_number (vva_efacr_cache);
      else
        gta_page (i).numr_page_apex      :=
          to_number (substr (vva_efacr_cache
                            ,1
                            ,vnu_postn - 1));
        vva_efacr_cache      :=
          substr (vva_efacr_cache
                 ,vnu_postn + 1);

        while vnu_postn != 0
        loop
          i   := gta_page.count ();
          vnu_postn      :=
            instr (vva_efacr_cache
                  ,vva_seprt_page);

          if vnu_postn = 0
          then
            gta_page (i).numr_page_apex   := to_number (vva_efacr_cache);
          else
            gta_page (i).numr_page_apex      :=
              to_number (substr (vva_efacr_cache
                                ,1
                                ,vnu_postn - 1));
          end if;

          vva_efacr_cache      :=
            substr (vva_efacr_cache
                   ,vnu_postn + 1);
        end loop;
      end if;
    end alimn_tabl_page;
  begin
    select ref_dv_valr_url
          ,forml_valr_url
          ,ref_page_numr_apex
          ,ref_prodt_numr_apex_menu
          ,efacr_cache
          ,ref_dv_valr_reqst
          ,forml_valr_reqst
          ,indic_reint_pagnt
          ,indic_reint_page_ir
          ,indic_clear_page_ir
          ,indic_soums_page
          ,indic_reint_navgt
          ,ref_dv_valr_scpc
          ,forml_valr_scpc
          ,ref_dv_valr_sspc
          ,forml_valr_sspc
          ,ref_dv_valr_sapc
          ,forml_valr_sapc
          ,ref_dv_valr_scpi
          ,forml_valr_scpi
          ,ref_dv_valr_sspi
          ,forml_valr_sspi
          ,ref_dv_valr_sapi
          ,forml_valr_sapi
          ,ref_dv_valr_snpi
          ,forml_valr_snpi
          ,indic_gerer_sidf
      into vnu_dv_valr_url
          ,vva_forml_valr_url
          ,vnu_numr_page
          ,vnu_numr_aplic
          ,vva_efacr_cache
          ,vnu_dv_valr_reqst
          ,vva_forml_valr_reqst
          ,vva_indic_reint_pagnt
          ,vva_indic_reint_page_ir
          ,vva_indic_clear_page_ir
          ,vva_indic_soums_page
          ,vva_indic_reint_navgt
          ,vnu_dv_valr_scpc
          ,vva_forml_valr_scpc
          ,vnu_dv_valr_sspc
          ,vva_forml_valr_sspc
          ,vnu_dv_valr_sapc
          ,vva_forml_valr_sapc
          ,vnu_dv_valr_scpi
          ,vva_forml_valr_scpi
          ,vnu_dv_valr_sspi
          ,vva_forml_valr_sspi
          ,vnu_dv_valr_sapi
          ,vva_forml_valr_sapi
          ,vnu_dv_valr_snpi
          ,vva_forml_valr_snpi
          ,vva_indic_gerer_sidf
      from vd_afw_13_item_menu
     where seqnc = pnu_item_menu;

    if     vva_forml_valr_url is null
       and vnu_numr_page is null
    then
      return null;
    end if;

    --Effacer la cache, réinit la navgt, soums_page
    if vva_efacr_cache is not null
    then
      --Alimenter le tableau
      alimn_tabl_page (vva_efacr_cache);

      for i in gta_page.first .. gta_page.last
      loop
        apex_util.clear_page_cache (gta_page (i).numr_page_apex);
      end loop;
    end if;

    if vva_indic_reint_page_ir = 'O'
    then
      --      apex_util.ir_reset (vnu_numr_page);
      vva_optio_pagnt      :=
           vva_optio_pagnt
        || 'RIR,';
    end if;

    if vva_indic_clear_page_ir = 'O'
    then
      --      apex_util.ir_clear (vnu_numr_page);
      vva_optio_pagnt      :=
           vva_optio_pagnt
        || 'CIR,';
    end if;

    if vva_indic_reint_pagnt = 'O'
    then
      --      apex_util.clear_page_cache (vnu_numr_page);
      vva_optio_pagnt      :=
           vva_optio_pagnt
        || 'RP,';
    end if;

    vva_optio_pagnt      :=
      rtrim (vva_optio_pagnt
            ,',');

    if vva_indic_soums_page = 'O'
    then
      if vva_forml_valr_reqst is not null
      then
        vva_forml_valr_reqst      :=
             vva_forml_valr_reqst
          || ',BRANCH_TO_PAGE_ACCEPT';
      else
        vva_forml_valr_reqst   := 'BRANCH_TO_PAGE_ACCEPT';
      end if;
    end if;

    --Traiter les valeurs saf items
    --SIDF seulement
    if vva_indic_gerer_sidf = 'O'
    then
      vnu_valr_sidf   := afw_04_fil_arian_pkg.obten_fa_courn;
    else
      vnu_valr_sidf   := null;
    end if;

    trait_type_insta (vnu_dv_valr_url
                     ,vva_forml_valr_url);
    trait_type_insta (vnu_dv_valr_scpc
                     ,vva_forml_valr_scpc);
    trait_type_insta (vnu_dv_valr_sspc
                     ,vva_forml_valr_sspc);
    trait_type_insta (vnu_dv_valr_sapc
                     ,vva_forml_valr_sapc);
    trait_type_insta (vnu_dv_valr_scpi
                     ,vva_forml_valr_scpi);
    trait_type_insta (vnu_dv_valr_sspi
                     ,vva_forml_valr_sspi);
    trait_type_insta (vnu_dv_valr_sapi
                     ,vva_forml_valr_sapi);
    trait_type_insta (vnu_dv_valr_snpi
                     ,vva_forml_valr_snpi);

    vva_url      :=
      nvl (vva_forml_valr_url
          ,afw_08_url_pkg.genr_url (vnu_numr_aplic
                                   ,vnu_numr_page
                                   ,pva_optio_clear_page   => vva_optio_pagnt
                                   ,pva_nom_varbl_1        => 'SIDF'
                                   ,pva_valr_varbl_1       => vnu_valr_sidf
                                   ,pva_nom_varbl_2        => case when vnu_dv_valr_scpc is not null then 'SCPC' else null end
                                   ,pva_valr_varbl_2       => vva_forml_valr_scpc
                                   ,pva_nom_varbl_3        => case when vnu_dv_valr_sspc is not null then 'SSPC' else null end
                                   ,pva_valr_varbl_3       => vva_forml_valr_sspc
                                   ,pva_nom_varbl_4        => case when vnu_dv_valr_sapc is not null then 'SAPC' else null end
                                   ,pva_valr_varbl_4       => vva_forml_valr_sapc
                                   ,pva_nom_varbl_5        => case when vnu_dv_valr_scpi is not null then 'SCPI' else null end
                                   ,pva_valr_varbl_5       => vva_forml_valr_scpi
                                   ,pva_nom_varbl_6        => case when vnu_dv_valr_sspi is not null then 'SSPI' else null end
                                   ,pva_valr_varbl_6       => vva_forml_valr_sspi
                                   ,pva_nom_varbl_7        => case when vnu_dv_valr_sapi is not null then 'SAPI' else null end
                                   ,pva_valr_varbl_7       => vva_forml_valr_sapi
                                   ,pva_nom_varbl_8        => case when vnu_dv_valr_snpi is not null then 'SNPI' else null end
                                   ,pva_valr_varbl_8       => vva_forml_valr_snpi
                                   , /* pva_nom_varbl_9   => case
                                                                        when pnu_item_parnt is not null then
                                                              'SADA'
                                                            else
                                                              null
                                                           end,
                                      pva_valr_varbl_9  => pnu_item_parnt,*/
                                    pva_optio_reqst        => vva_forml_valr_reqst));

    return nvl (vva_url, '#');
  end obten_url_cible;

  function obten_url_cible_js (pnu_item_menu   in number
                              ,pnu_item_racn   in number default null)
    -- À utiliser que dans un menu avec un query dynamic (List dynamique)
    return varchar2
  is
  begin
    return    'javascript:afw.afw_21.actio_dynmq.menu_redrc.redrc('
           || pnu_item_racn
           || ','''
           || obten_url_cible (pnu_item_menu)
           || ''')';
  end obten_url_cible_js;

  function valdt_noeud_actif (pnu_item_menu   in number
                             ,pnu_menu        in number)
    return varchar2
  is
  begin
    if afw_12_menu_pkg.obten_item_actif (pnu_menu) = pnu_item_menu
    then
      return 'YES';
    else
      return 'NO';
    end if;
  end valdt_noeud_actif;

  function verfr_droit_acces (pnu_item_menu in number)
    return number
  is
    vva_code_struc_aplic   varchar2 (23);
  begin
    begin
      select sa.code
        into vva_code_struc_aplic
        from vd_i_afw_13_item_menu   im
            ,vd_i_afw_12_struc_aplic sa
       where     im.seqnc = pnu_item_menu
             and im.ref_struc_aplic is not null
             and sa.seqnc = im.ref_struc_aplic;
    exception
      when no_data_found
      then
        null;
    end;

    --Structure sur item non-trouvée, utiliser celle de la page cible
    if vva_code_struc_aplic is null
    then
      select sa.code
        into vva_code_struc_aplic
        from vd_afw_13_item_menu     im
            ,vd_i_afw_12_struc_aplic sa
       where     im.seqnc = pnu_item_menu
             and sa.seqnc = im.ref_page_struc_aplic;
    end if;

    return afw_12_secrt_pkg.verfc_droit_acces_numrq (vva_code_struc_aplic
                                                    ,'O'
                                                    ,null
                                                    ,null
                                                    ,null
                                                    ,null);
  exception
    when no_data_found
    then
      return 1;
  end verfr_droit_acces;

  function verfr_enfan_exist (pnu_item_menu in number)
    return boolean
  is
    vnu_void   number (1);
  begin
    select 1
      into vnu_void
      from vd_i_afw_13_item_menu
     where ref_item_menu = pnu_item_menu;

    return true;
  exception
    when no_data_found
    then
      return false;
    when too_many_rows
    then
      return true;
  end verfr_enfan_exist;

  function obten_libl (pnu_item_menu in number)
    return varchar2
  is
    vva_valr_insta_code   varchar2 (23);
    vva_forml_libl        varchar2 (4000);
    vva_libl              varchar2 (200);
  begin
    select forml_libl
          ,afw_14_domn_valr_pkg.obten_code (ref_dv_valr_insta_libl)
      into vva_forml_libl
          ,vva_valr_insta_code
      from vd_i_afw_13_item_menu
     where seqnc = pnu_item_menu;


    --TODO:ALEX, ajouter par préférence
    case vva_valr_insta_code
      when 'ITEM'
      then
        vva_libl   := afw_07_util_pkg.v (vva_forml_libl);
      when 'PL/SQL'
      then
        vva_libl   := afw_07_util_pkg.obten_reslt_expre_plsql (vva_forml_libl);
      else
        vva_libl   := vva_forml_libl;
    end case;

    return vva_libl;
  end obten_libl;

  function trait_condt_afich (pnu_item_menu in number)
    return boolean
  is
    vbo_reslt               boolean default true;
    vva_forml_condt_afich   vd_afw_13_item_menu.forml_condt_afich%type;
  begin
    select forml_condt_afich
      into vva_forml_condt_afich
      from vd_afw_13_item_menu
     where seqnc = pnu_item_menu;

    --TODO CONAL, prochainement, gérer les différentes possibilités de "Condition Display" comme apex le fait
    --avec deux champs d'expressions et un type d'expression à traiter (DV)
    --Pour l'instant, seulement gérer du pl/sql
    if vva_forml_condt_afich is not null
    then
      vbo_reslt   := afw_07_util_pkg.obten_reslt_expre_plsql_bool (vva_forml_condt_afich);
    end if;

    return vbo_reslt;
  end trait_condt_afich;

  function trait_condt_afich_numbr (pnu_item_menu in number)
    return number
  is
    vnu_numbr   pls_integer;
  begin
    if trait_condt_afich (pnu_item_menu)
    then
      vnu_numbr   := 1;
    else
      vnu_numbr   := 0;
    end if;

    return vnu_numbr;
  end trait_condt_afich_numbr;

  function obten_menu_sesn (pva_code_menu in varchar2)
    return vd_i_afw_13_menu.seqnc%type
  is
    vnu_menu   vd_i_afw_13_menu.seqnc%type;
  begin
    select m.seqnc
      into vnu_menu
      from vd_i_afw_13_menu m
     where     m.code = pva_code_menu
           and m.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn;

    return vnu_menu;
  exception
    when no_data_found
    then
      return null;
  end obten_menu_sesn;

  function obten_item_menu_sesn (pva_code_menu        in varchar2
                                ,pva_code_item_menu   in varchar2)
    return vd_i_afw_13_item_menu.seqnc%type
  is
    vnu_item_menu   vd_i_afw_13_item_menu.seqnc%type;
  begin
    select im.seqnc
      into vnu_item_menu
      from vd_i_afw_13_item_menu im
          ,vd_i_afw_13_menu      m
     where     im.code = pva_code_item_menu
           and im.ref_menu = m.seqnc
           and m.code = pva_code_menu
           and m.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn;

    return vnu_item_menu;
  exception
    when no_data_found
    then
      return null;
  end obten_item_menu_sesn;

  function obten_menu_part_item_menu (pnu_item_menu in number)
    return number
  is
    vnu_seqnc   number (10);
  begin
    select im.ref_menu
      into vnu_seqnc
      from vd_i_afw_13_item_menu im
     where seqnc = pnu_item_menu;

    return vnu_seqnc;
  end obten_menu_part_item_menu;

  function obten_resrc_aditn (pnu_menu in number)
    return varchar2
  is
    vva_resrc_aditn   varchar2 (4000);
  begin
    select resrc_aditn
      into vva_resrc_aditn
      from afw_13_menu
     where seqnc = pnu_menu;
  end obten_resrc_aditn;

  function obten_icone (pnu_item_menu in number)
    return varchar2
  is
    vva_icone               varchar2 (4000);
    vva_icone_struc_aplic   varchar2 (200);
    vnu_page                number (10);
  begin
    select icone
          ,ref_page
      into vva_icone
          ,vnu_page
      from vd_i_afw_13_item_menu im
     where im.seqnc = pnu_item_menu;

    if vva_icone is null
    then
      vva_icone_struc_aplic   := afw_13_page_pkg.obten_icone_font_awesm (vnu_page);

      if vva_icone_struc_aplic is not null
      then
        vva_icone   := vva_icone_struc_aplic;
      end if;
    end if;

    return vva_icone;
  end obten_icone;
end afw_13_menu_pkg;
/
