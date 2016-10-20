SET DEFINE OFF;
create or replace package body afw_13_condt_piltb_pkg
as
  gva_en_modfc               varchar2 (1);
  gva_en_creat               varchar2 (1);
  gva_cas_err_vrai           varchar2 (1999);
  gva_condt_creat   constant varchar2 (1000) default 'afw_07_util_pkg.nv(''P%PAGE%_SEQNC'') is not null';
  gnu_page_courn             number (10);
  gnu_seqnc_page_courn       number (10);
  gva_cachr_tous_boutn       varchar2 (1);
  gva_lectr_seule_tout       varchar2 (1);

  function obten_indic_lectr_seul_cas (pva_code_cas in varchar2)
    return varchar2
  is
    cursor cur_condt_piltb
    is
      select 1
        from table (afw_07_util_pkg.strin_to_table_nu (gva_cas_err_vrai)) cls_vrai
            ,vd_afw_13_condt_piltb                                        cp
       where     cp.ref_page = gnu_seqnc_page_courn
             and cp.condt is not null
             and cp.code = pva_code_cas
             and cp.seqnc = cls_vrai.column_value
             and rownum = 1;
  begin
    for rec_condt_piltb in cur_condt_piltb
    loop
      return 'O';
    end loop;

    return 'N';
  end obten_indic_lectr_seul_cas;

  function obten_lectr_seul_cas (pva_code_cas in varchar2)
    return boolean
  is
  begin
    return obten_indic_lectr_seul_cas (pva_code_cas) = 'O';
  end obten_lectr_seul_cas;

  function verfr_condt_retn (pva_code_condt in varchar2)
    return boolean
  is
  begin
    return obten_indic_lectr_seul_cas (pva_code_condt) = 'O';
  end verfr_condt_retn;

  function verfr_condt_retn_va (pva_code_condt in varchar2)
    return varchar2
  is
  begin
    return obten_indic_lectr_seul_cas (pva_code_condt);
  end verfr_condt_retn_va;

  function obten_indic_lectr_seul
    return varchar2
  is
  begin
    if gva_cas_err_vrai is not null
    then
      return 'O';
    else
      return 'N';
    end if;
  end obten_indic_lectr_seul;

  function obten_lectr_seul
    return boolean
  is
  begin
    return gva_cas_err_vrai is not null;
  end obten_lectr_seul;

  function obten_lectr_seul (pva_nom_item in varchar2)
    return boolean
  is
    vnu_exist   pls_integer default 0;
  begin
    if gva_cas_err_vrai is not null
    then
      select count (1)
        into vnu_exist
        from table (afw_07_util_pkg.strin_to_table_nu (gva_cas_err_vrai)) cls_vrai
            ,vd_afw_13_page_item                                          pi
            ,vd_afw_13_lien_condt_piltb                                   lcp
       where     lcp.ref_page_item = pi.seqnc
             and pi.ref_page = gnu_seqnc_page_courn
             and pi.nom_apex = pva_nom_item
             and lcp.ref_page_item = pi.seqnc
             and lcp.indic_lectr_seul = 'O'
             and lcp.ref_condt_piltb = cls_vrai.column_value
             and rownum = 1;
    end if;

    if vnu_exist = 0
    then
      afw_07_util_pkg.ajout_info_debug ('AFW_13 - L''item est affiché ');
    else
      afw_07_util_pkg.ajout_info_debug (   'AFW_13 - L''item "'
                                        || pva_nom_item
                                        || '" est en lecture seule ');
    end if;

    return vnu_exist != 0;
  end obten_lectr_seul;

  function obten_afich (pva_nom_item in varchar2)
    return boolean
  is
    vnu_exist   pls_integer default 0;
  begin
    if gva_cas_err_vrai is not null
    then
      select count (1)
        into vnu_exist
        from table (afw_07_util_pkg.strin_to_table_nu (gva_cas_err_vrai)) cls_vrai
            ,vd_afw_13_page_item                                          pi
            ,vd_afw_13_lien_condt_piltb                                   lcp
       where     lcp.ref_page_item = pi.seqnc
             and pi.ref_page = gnu_seqnc_page_courn
             and pi.nom_apex = pva_nom_item
             and lcp.ref_page_item = pi.seqnc
             and lcp.indic_afich = 'N'
             and lcp.ref_condt_piltb = cls_vrai.column_value
             and rownum = 1;
    end if;

    if vnu_exist = 0
    then
      afw_07_util_pkg.ajout_info_debug ('AFW_13 - L''item est affiché ');
    else
      afw_07_util_pkg.ajout_info_debug (   'AFW_13 - L''item "'
                                        || pva_nom_item
                                        || '" n''est pas affiché ');
    end if;

    return vnu_exist = 0;
  end obten_afich;

  function obten_lectr_seul_va (pva_nom_item in varchar2)
    return varchar2
  is
  begin
    if obten_lectr_seul (pva_nom_item)
    then
      return 'O';
    else
      return 'N';
    end if;
  end obten_lectr_seul_va;

  function obten_afich_va (pva_nom_item in varchar2)
    return varchar2
  is
  begin
    if obten_afich (pva_nom_item)
    then
      return 'O';
    else
      return 'N';
    end if;
  end obten_afich_va;

  procedure lectr_seule_tout
  is
  begin
    gva_lectr_seule_tout   := 'O';
    gnu_page_courn         := afw_07_util_pkg.nv ('APP_PAGE_ID');
  end lectr_seule_tout;

  procedure cachr_tous_boutn
  is
  begin
    gva_cachr_tous_boutn   := 'O';
    gnu_page_courn         := afw_07_util_pkg.nv ('APP_PAGE_ID');
  end cachr_tous_boutn;

  procedure defn_contx_exect_page
  is
    vva_contn_formt   varchar2 (1999)
                        default replace (gva_condt_creat
                                        ,'%PAGE%'
                                        ,afw_07_util_pkg.nv ('APP_PAGE_ID'));
    vva_condt_subst   varchar2 (4000);

    cursor cur_condt_piltb (pnu_seqnc_page in number)
    is
      select cp.seqnc
            ,cp.condt
            ,cp.nom
        from vd_afw_13_condt_piltb cp
       where     cp.ref_page = pnu_seqnc_page
             and cp.condt is not null;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW_13 - Définir le contexte de page');
    gva_cas_err_vrai   := null;

    if    gnu_page_courn != afw_07_util_pkg.nv ('APP_PAGE_ID')
       or gnu_page_courn is null
    then
      gva_cachr_tous_boutn   := 'N';
      gva_lectr_seule_tout   := 'N';
      gnu_page_courn         := afw_07_util_pkg.nv ('APP_PAGE_ID');
    end if;

    select pa.seqnc
      into gnu_seqnc_page_courn
      from vd_afw_13_page pa
     where     pa.ref_aplic = afw_11_aplic_pkg.obten_aplic_sesn ()
           and pa.numr_apex = gnu_page_courn;

    for rec_condt_piltb in cur_condt_piltb (gnu_seqnc_page_courn)
    loop
      vva_condt_subst   := aa.do_substitutions (rec_condt_piltb.condt);

      if afw_05_forml_noyau_pkg.resdr_condt_simple_booln (vva_condt_subst)
      then
        if gva_cas_err_vrai is null
        then
          gva_cas_err_vrai   := rec_condt_piltb.seqnc;
        else
          gva_cas_err_vrai      :=
               gva_cas_err_vrai
            || ':'
            || rec_condt_piltb.seqnc;
        end if;

        afw_07_util_pkg.ajout_info_debug (   'AFW_13 - Conditions "'
                                          || rec_condt_piltb.nom
                                          || '" retenue dans l''évaluation');
      else
        afw_07_util_pkg.ajout_info_debug (   'AFW_13 - Conditions "'
                                          || rec_condt_piltb.nom
                                          || '" non retenue dans l''évaluation');
      end if;
    end loop;

    if afw_05_forml_noyau_pkg.resdr_condt_simple_booln (vva_contn_formt)
    then
      gva_en_creat   := 'O';
      gva_en_modfc   := 'N';
    else
      gva_en_creat   := 'N';
      gva_en_modfc   := 'N';
    end if;
  exception
    when others
    then
      null;
  end defn_contx_exect_page;

  procedure ajout_lien_cas_lectr (pnu_seqnc_cas   in number
                                 ,pnu_page        in number)
  is
  begin
    insert into vd_i_afw_13_lien_condt_piltb (ref_page_item
                                             ,ref_condt_piltb
                                             ,indic_lectr_seul)
      select pi.seqnc
            ,pnu_seqnc_cas
            ,'N'
        from vd_i_afw_13_page_item pi
       where     pi.ref_page = pnu_page
             and pi.type_item = 'ITEM';
  end ajout_lien_cas_lectr;

  procedure ajout_lien_cas_lectr_item (pnu_item    in number
                                      ,pnu_page    in number
                                      ,pnu_aplic   in number default afw_04_contx_pkg.obten_seqnc_contx ('APLIC'))
  is
  begin
    insert into vd_i_afw_13_lien_condt_piltb (ref_page_item
                                             ,ref_condt_piltb
                                             ,indic_lectr_seul
                                             ,dnr_ref_aplic)
      select pnu_item
            ,cp.seqnc
            ,'N'
            ,pnu_aplic
        from vd_afw_13_condt_piltb cp
       where cp.ref_page = pnu_page;
  end ajout_lien_cas_lectr_item;
end afw_13_condt_piltb_pkg;
/
