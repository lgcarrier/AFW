SET DEFINE OFF;
create or replace package body afw_04_fil_arian_cu_pkg
as
  function afich (pbo_regrp_menu in boolean default false)
    return clob
  is
    cursor cur_fil_arian
    is
        select libl
              ,page
              ,seqnc
              ,app_id
              ,indic_virtl
              ,indic_duplc
              ,lead (indic_virtl) over (order by seqnc desc) proch_indic_virtl
              ,lead (indic_duplc) over (order by seqnc desc) proch_indic_duplc
              ,seqnc_contx                                 seqnc_contx
          from vd_afw_04_fil_arian fa
              ,vd_afw_04_contx   c
         where     fa.indic_afich = 'O'
               and c.ref_fil_arian = fa.seqnc
      order by seqnc desc;

    vcl_fil          clob;
    vbo_menu_actif   boolean default false;

    function resdr_libl (pva_libl          in varchar2
                        ,pnu_numr_page     in number
                        ,pnu_seqnc_contx   in number default null
                        ,pnu_numr_aplic    in number default null)
      return varchar2
    is
      vva_libl   varchar2 (200) default pva_libl;
    begin
      if pva_libl = afw_13_page_lang_cu_pkg.kva_mesg_par_deft
      then
        vva_libl      :=
          apex_application.do_substitutions (afw_13_page_lang_cu_pkg.genr_libl_page (pnu_numr_page
                                                                                    ,pnu_numr_aplic_apex   => pnu_numr_aplic
                                                                                    ,pnu_seqnc_contx       => pnu_seqnc_contx));
      end if;

      return vva_libl;
    end resdr_libl;

    procedure creer_fil_vide (pva_libl in varchar2)
    is
    begin
      vcl_fil      :=
           '<li>'
        || pva_libl
        || '</li>'
        || vcl_fil;
    end creer_fil_vide;

    procedure creer_fil (pnu_aplic   in number
                        ,pnu_page    in number
                        ,pnu_seqnc   in number
                        ,pva_libl    in varchar2)
    is
    begin
      vcl_fil      :=
           '<li><a href="'
        || afw_08_url_pkg.genr_url (pnu_numr_aplic     => pnu_aplic
                                   ,pnu_numr_page      => pnu_page
                                   ,pva_nom_varbl_1    => 'SIDF'
                                   ,pva_valr_varbl_1   => afw_04_fil_arian_pkg.obten_fa_courn ()
                                   ,pva_nom_varbl_2    => 'SAPC'
                                   ,pva_valr_varbl_2   =>   'XFA'
                                                         || pnu_seqnc)
        || '">'
        || pva_libl
        || '</a></li>'
        || vcl_fil;
    end creer_fil;

    procedure valdt_ouver_sous_menu (pva_indic_duplc         in varchar2
                                    ,pva_proch_indic_duplc   in varchar2
                                    ,pva_proch_indic_virtl   in varchar2)
    is
    begin
      if     pva_proch_indic_duplc = 'N'
         --and pva_indic_duplc = 'O'
         and pva_proch_indic_virtl = 'N'
         and vbo_menu_actif
      --and pbo_regrp_menu
      then
        vcl_fil          :=
             '<li class="afw-04-fil-arian-dropdown"><div class="afw-04-dropdown-container"">[...]<div class="afw-04-dropdown"><ul>'
          || vcl_fil;
        vbo_menu_actif   := false;
      end if;
    end valdt_ouver_sous_menu;

    procedure valdt_fermt_sous_menu (pva_proch_indic_virtl   in varchar2
                                    ,pva_proch_indic_duplc   in varchar2)
    is
    begin
      --Laissons tomber la premiere entree
      if     vcl_fil is not null
         and pva_proch_indic_duplc = 'O'
         and pva_proch_indic_virtl = 'N'
         and not vbo_menu_actif
      --and pbo_regrp_menu
      then
        vcl_fil          :=
             '</ul></div></div></li>'
          || vcl_fil;
        vbo_menu_actif   := true;
      end if;
    end valdt_fermt_sous_menu;
  begin
    if not afw_04_fil_arian_pkg.trait_page ()
    then
      return null;
    end if;

    --TODO: Optimisation : Array de mapping selon sequence FA et libelle transforme.  (Permet d'update le libelle du FA, évite de recalculer à chaque fois)
    for rec_fil in cur_fil_arian
    loop
      valdt_fermt_sous_menu (rec_fil.indic_virtl
                            ,rec_fil.indic_duplc);

      if vcl_fil is null
      then
        creer_fil_vide (resdr_libl (rec_fil.libl
                                   ,rec_fil.page
                                   ,rec_fil.seqnc_contx
                                   ,rec_fil.app_id));
      else
        creer_fil (rec_fil.app_id
                  ,rec_fil.page
                  ,rec_fil.seqnc
                  ,resdr_libl (rec_fil.libl
                              ,rec_fil.page
                              ,rec_fil.seqnc_contx
                              ,rec_fil.app_id));
      end if;

      valdt_ouver_sous_menu (rec_fil.indic_duplc
                            ,rec_fil.proch_indic_duplc
                            ,rec_fil.proch_indic_virtl);
    end loop;

    return    '<ol class="breadcrumb">'
           || vcl_fil
           || '</ol>';
  end afich;
end afw_04_fil_arian_cu_pkg;
/
