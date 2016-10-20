SET DEFINE OFF;
create or replace package body afw_19_javsc_pkg
as
  knu_sidf          number (10) default afw_07_util_pkg.nv ('SIDF');
  knu_app_id        number default afw_07_util_pkg.nv ('APP_ID');
  knu_app_page_id   number default afw_07_util_pkg.nv ('APP_PAGE_ID');
  knu_session       number default afw_07_util_pkg.nv ('SESSION');

  function obten_furtr_indic_inter
    return varchar2
  is
    vva_indic_inter   varchar2 (1) := 'O';
  begin
    if lower (afw_07_util_pkg.obten_furtr) like '%firefox%'
    then
      vva_indic_inter   := 'N';
    elsif lower (afw_07_util_pkg.obten_furtr) like '%chrome%'
    then
      vva_indic_inter   := 'N';
    end if;

    return vva_indic_inter;
  end obten_furtr_indic_inter;

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

  procedure ajout_scrip_charg
  is
    cursor cur_dispn_fonct (pva_furtr_indic_inter varchar2)
    is
        select f.code                                              code_fonct
              ,afw_14_domn_valr_pkg.obten_code (f.ref_dv_type_actio) type_actio
              ,afw_14_domn_valr_pkg.obten_code (f.ref_dv_type_expre) type_expre
              ,f.expre_actio
              ,f.indic_afect_input_html
              ,f.indic_prevn_actio_deft
              ,f.condt_prise_charg
              ,c.indic_actif                                       cle_indic_actif
              ,afw_19_cle_pkg.obten_cle_formt (c.seqnc)            cle_formt
              ,c.indic_inter
              ,b.indic_actif                                       boutn_indic_actif
              , (select 'O'
                   from vd_afw_04_contx_etend ce
                  where     ce.ref_contx = afw_07_util_pkg.nv ('SIDF')
                        and ce.nom = f.code
                        and ce.valr_varch = 'desct')
                 desct
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct     f
              ,vd_afw_19_cle       c
              ,vd_afw_19_boutn     b
         where     df.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
               and df.ref_fonct = f.seqnc
               and c.ref_dispn_fonct(+) = df.seqnc
               and c.ref_lang(+) = afw_01_lang_pkg.obten_lang_sesn
               and c.indic_inter(+) = pva_furtr_indic_inter
               and c.indic_actif(+) = 'O'
               and b.ref_dispn_fonct(+) = df.seqnc
               and b.ref_lang = afw_01_lang_pkg.obten_lang_sesn
               and b.indic_actif = 'O'
      order by 1;

    procedure genr_fonct (pre_dispn_fonc in cur_dispn_fonct%rowtype)
    is
      vva_fonct              varchar2 (200);
      vva_boutn              varchar2 (4000);
      vva_boutn_type_actio   varchar2 (50);
      vva_cle                varchar2 (4000);
      vva_cle_type_actio     varchar2 (50);
      vva_cible_evenm        varchar2 (50) := 'document';
      -- nomenclature d'un jQuery CSS Selector (il faut ajouter les quotes)
      vva_evenm              varchar2 (10) := 'keydown'; --on n'utilise pas le keypress

      vva_valr_retr          varchar2 (4000);
    begin
      gbo_prise_charg   := false;

      if pre_dispn_fonc.condt_prise_charg is null
      then
        gbo_prise_charg   := true;
      else
        execute immediate
             'begin afw_19_javsc_pkg.gbo_prise_charg := '
          || pre_dispn_fonc.condt_prise_charg
          || '; end;';
      end if;

      if     gbo_prise_charg
         and pre_dispn_fonc.desct is null
         and pre_dispn_fonc.type_actio is not null
         and pre_dispn_fonc.type_expre is not null
      then
        --Activer la fonction
        --Déterminer le type d'action
        case pre_dispn_fonc.type_actio
          when 'EXECT_FONCT_JAVSC'
          then
            vva_cle_type_actio     := 'afw.afw_19.cle.exect_fonct_javsc';
            vva_boutn_type_actio   := 'afw.afw_19.boutn.exect_fonct_javsc';
          when 'REDRC_URL'
          then
            vva_cle_type_actio     := 'afw.afw_19.cle.redrc_url';
            vva_boutn_type_actio   := 'afw.afw_19.boutn.redrc_url';
          when 'POP_FENTR_URL'
          then
            vva_cle_type_actio     := 'afw.afw_19.cle.pop_fentr_url';
            vva_boutn_type_actio   := 'afw.afw_19.boutn.pop_fentr_url';
          when 'POP_MODL_URL'
          then
            vva_cle_type_actio     := 'afw.afw_19.cle.exect_fonct_javsc';
            vva_boutn_type_actio   := 'afw.afw_19.boutn.exect_fonct_javsc';
          when 'REQT'
          then
            vva_cle_type_actio     := 'afw.afw_19.cle.soums_reqt';
            vva_boutn_type_actio   := 'afw.afw_19.boutn.soums_reqt';
          else
            null;
        end case;

        --Déterminer le type d'expression pour exécuter l'action
        case pre_dispn_fonc.type_expre
          when 'FONCT_JAVSC'
          then
            gva_fonct_javsc   := pre_dispn_fonc.expre_actio;
          when 'URL'
          then
            gva_fonct_javsc   := pre_dispn_fonc.expre_actio;
          when 'REQT'
          then
            gva_fonct_javsc   := pre_dispn_fonc.expre_actio;
          when 'PLSQL_FONCT_JAVSC'
          then
            execute immediate
                 'begin afw_19_javsc_pkg.gva_fonct_javsc := '
              || pre_dispn_fonc.expre_actio
              || '; end;';
          when 'PLSQL_URL'
          then
            execute immediate
                 'begin afw_19_javsc_pkg.gva_fonct_javsc := '
              || pre_dispn_fonc.expre_actio
              || '; end;';
          when 'PLSQL_REQT'
          then
            execute immediate
                 'begin afw_19_javsc_pkg.gva_fonct_javsc := '
              || pre_dispn_fonc.expre_actio
              || '; end;';
          when 'REPRT'
          then
            --TODO::CARLO
            --gva_fonct_javsc := call AJAX -> prompt data
            null;
          else
            null;
        end case;

        --fonction utilisée par le bouton et la clé
        vva_fonct      :=
             'afw.afw_19.fonct.'
          || lower (pre_dispn_fonc.code_fonct);

        vva_valr_retr      :=
             chr (10)
          || ' '
          || vva_fonct
          || ' = "'
          || gva_fonct_javsc
          || '";';

        --assignation de la fonction au bouton
        if pre_dispn_fonc.boutn_indic_actif is not null
        then
          vva_boutn      :=
               'afw.afw_19.boutn.fonct.'
            || lower (pre_dispn_fonc.code_fonct)
            || ' = "'
            || vva_boutn_type_actio
            || '('
            || vva_fonct
            || ');";';
          vva_valr_retr      :=
               vva_valr_retr
            || chr (10)
            || ' '
            || vva_boutn;
        end if;

        --assignation de la fonction à la clé
        if pre_dispn_fonc.cle_indic_actif is not null
        then
          vva_cle      :=
               'afw.jQuery_1_3_2('
            || vva_cible_evenm
            || ').bind('''
            || vva_evenm
            || ''', {combi:'''
            || pre_dispn_fonc.cle_formt
            || ''', disableInInput:'
            || case pre_dispn_fonc.indic_afect_input_html when 'N' then 'true' else 'false' end
            || '}, function (evt){'
            || vva_cle_type_actio
            || '(evt,'
            || vva_fonct
            || ','
            || case pre_dispn_fonc.indic_prevn_actio_deft when 'O' then 'true' else 'false' end
            || ');}'
            || ');';
          vva_valr_retr      :=
               vva_valr_retr
            || chr (10)
            || ' '
            || vva_cle;
        end if;

        afw_07_util_pkg.ajout_code_javsc_charg (vva_valr_retr);
      else
        --Désactiver la fonction
        null;
      end if;
    end;
  begin
    if obten_prise_charg_page
    then
      afw_07_util_pkg.ajout_info_debug ('AFW 19 Clés de fonctions - JavaScript au chargement');

      -- générer les fonctions utilisées par les boutons et les clés de fonction
      -- affecter les clés de fonction
      for rec_dispn_fonc in cur_dispn_fonct (obten_furtr_indic_inter)
      loop
        genr_fonct (rec_dispn_fonc);
      end loop;
    end if;
  exception
    when others
    then
      ete ('afw_19_javsc_pkg'
          ,sqlerrm);
  end ajout_scrip_charg;
end afw_19_javsc_pkg;
/
