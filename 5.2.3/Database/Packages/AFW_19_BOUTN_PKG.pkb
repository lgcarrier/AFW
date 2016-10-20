SET DEFINE OFF;
create or replace package body afw_19_boutn_pkg
as
  knu_sidf          number (10) default afw_07_util_pkg.nv ('SIDF');
  knu_app_id        number default afw_07_util_pkg.nv ('APP_ID');
  knu_app_page_id   number default afw_07_util_pkg.nv ('APP_PAGE_ID');
  knu_session       number default afw_07_util_pkg.nv ('SESSION');

  function obten_prise_charg_page
    return boolean
  is
    vnu_indic_prise_charg_page   vd_afw_13_page.indic_prise_charg_afw19%type;
  begin
    select p.indic_prise_charg_afw19
      into vnu_indic_prise_charg_page
      from vd_afw_13_page p
     where p.seqnc = afw_13_page_pkg.obten_page_sesn;

    if vnu_indic_prise_charg_page = 'O'
    then
      return true;
    end if;

    return false;
  end;

  procedure defnr_varbl_sesn
  is
    cursor cur_afw_19_boutn
    is
      select b.item_subst
            ,b.libl
            ,nvl (b.templ_boutn, abt.template) gabrt
            ,   'afw.afw_19.boutn.fonct.'
             || lower (f.code)
               code
            ,   'afw_19_boutn_'
             || lower (f.code)
               id_html
            ,b.indic_actif
            ,f.nom_formt                       aide_contx
            ,f.condt_prise_charg
            , (select 'O'
                 from vd_afw_04_contx_etend ce
                where     ce.ref_contx = knu_sidf
                      and ce.nom = f.code
                      and ce.valr_varch = 'desct')
               desct
            ,b.ref_code_type_mesg_aide_contx
            ,b.mesg_aide_contx
        from vd_afw_19_dispn_fonct df
            ,vd_afw_19_fonct       f
            ,vd_afw_19_boutn       b
            ,apex_boutn_templ      abt
       where     df.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
             and df.ref_fonct = f.seqnc
             and b.ref_dispn_fonct = df.seqnc
             and b.ref_lang = afw_01_lang_pkg.obten_lang_sesn
             and abt.id(+) = b.id_templ_boutn;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 19 Boutons (Clés de fonctions) - Définition des variables de session');

    for rec_afw_19_boutn in cur_afw_19_boutn
    loop
      gbo_prise_charg   := false;


      if rec_afw_19_boutn.condt_prise_charg is null
      then
        gbo_prise_charg   := true;
      elsif rec_afw_19_boutn.condt_prise_charg is not null
      then
        execute immediate
             'begin afw_19_boutn_pkg.gbo_prise_charg := '
          || rec_afw_19_boutn.condt_prise_charg
          || '; end;';
      end if;

      if    rec_afw_19_boutn.indic_actif = 'N'
         or not gbo_prise_charg
         or not obten_prise_charg_page
         or rec_afw_19_boutn.desct = 'O'
      then
        --Désactiver le bouton
        if afw_07_util_pkg.exist_item (rec_afw_19_boutn.item_subst)
        then
          afw_07_util_pkg.defnr_etat_sessn (rec_afw_19_boutn.item_subst
                                           ,null);
        end if;
      else
        --Activer le bouton
        if rec_afw_19_boutn.ref_code_type_mesg_aide_contx = 'FONCT_PLSQL'
        then
          --TODO: Carlo
          --execute immediate 'begin afw_19_boutn_pkg.gva_mesg_aide_contx := ' || rec_afw_19_boutn.mesg_aide_contx || '; end;';
          gva_mesg_aide_contx   := rec_afw_19_boutn.aide_contx;
        elsif rec_afw_19_boutn.condt_prise_charg is not null
        then
          gva_mesg_aide_contx   := rec_afw_19_boutn.aide_contx;
        else
          gva_mesg_aide_contx   := null;
        end if;

        if afw_07_util_pkg.exist_item (rec_afw_19_boutn.item_subst)
        then
          afw_07_util_pkg.defnr_etat_sessn (rec_afw_19_boutn.item_subst
                                           ,afw_07_util_pkg.multi_replc (rec_afw_19_boutn.gabrt
                                                                        ,'#LINK#'
                                                                        ,   'javascript:eval('
                                                                         || rec_afw_19_boutn.code
                                                                         || ');'
                                                                        ,'#LABEL#'
                                                                        ,rec_afw_19_boutn.libl
                                                                        ,'#TITLE#'
                                                                        ,gva_mesg_aide_contx
                                                                        ,'#ID#'
                                                                        ,rec_afw_19_boutn.id_html));
        end if;
      end if;
    end loop;
  end;
end afw_19_boutn_pkg;
/
