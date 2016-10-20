SET DEFINE OFF;
create or replace package afw_25_plpdf_expor_ir_pkg
  authid current_user
as
  --En point
  knu_marge_cel     constant number default 0.5;
  kva_formt_nombr   constant varchar2 (30) default 'FM9G999G999G990D00';

  type typ_rec_coulr_pdf is record
  (
    vva_coulr_polc_entet    varchar2 (7)
   ,vva_coulr_backg_entet   varchar2 (7)
  );

  type typ_rec_parmt_impre is record
  (
    va_indic_trouv        varchar2 (1) default 'N'
   ,va_contn_disps        apex_regn.prn_content_disposition%type default 'ATTACHMENT'
   ,va_formt_papr         apex_regn.prn_paper_size%type default 'LETTER'
   ,va_orien_papr         apex_regn.prn_orientation%type default 'VERTICAL'
   ,va_unite_mesr         apex_regn.prn_units%type default 'INCHES'
   ,nu_largr_papr         apex_regn.prn_width%type default 8.5
   ,nu_hautr_papr         apex_regn.prn_height%type default 11
   ,nu_bordr_tail         apex_regn.prn_border_width%type default 0.5
   ,va_bordr_coulr        apex_regn.prn_border_color%type
   ,va_entet_polc_faml    apex_regn.prn_page_header_font_family%type default 'Helvetica'
   ,va_entet_polc_poids   apex_regn.prn_page_header_font_weight%type default 'normal'
   ,nu_entet_polc_tail    apex_regn.prn_page_header_font_size%type default 12
   ,va_entet_polc_coulr   apex_regn.prn_page_header_font_color%type
   ,va_entet_align        apex_regn.prn_page_header_alignment%type default 'LEFT'
   ,va_entet_texte        apex_regn.prn_page_header%type
   ,va_coln_polc_faml     apex_regn.prn_header_font_family%type default 'Helvetica'
   ,va_coln_polc_poids    apex_regn.prn_header_font_weight%type default 'bold'
   ,nu_coln_polc_tail     apex_regn.prn_header_font_size%type default 8
   ,va_coln_polc_coulr    apex_regn.prn_header_font_color%type
   ,va_coln_fond_coulr    apex_regn.prn_header_bg_color%type default '#e0e0e0'
   ,va_corps_polc_faml    apex_regn.prn_body_font_family%type default 'Helvetica'
   ,va_corps_polc_poids   apex_regn.prn_body_font_weight%type default 'normal'
   ,nu_corps_polc_tail    apex_regn.prn_body_font_size%type default 8
   ,va_corps_polc_coulr   apex_regn.prn_body_font_color%type
   ,va_corps_fond_coulr   apex_regn.prn_body_bg_color%type default '#f5f5f5'
   ,va_pied_polc_faml     apex_regn.prn_page_footer_font_family%type default 'Helvetica'
   ,va_pied_polc_poids    apex_regn.prn_page_footer_font_weight%type default 'normal'
   ,nu_pied_polc_tail     apex_regn.prn_page_footer_font_size%type default 8
   ,va_pied_polc_coulr    apex_regn.prn_page_footer_font_color%type
   ,va_pied_align         apex_regn.prn_page_footer_alignment%type default 'LEFT'
   ,va_pied_texte         apex_regn.prn_page_footer%type
  );

  type typ_tab_hautr_minml is table of number
    index by varchar2 (5);

  type typ_rec_hautr_faml_polc is record (vta_hautr_minml typ_tab_hautr_minml);

  type typ_tab_hautr_faml_polc is table of typ_rec_hautr_faml_polc
    index by varchar2 (4000);

  kva_seprt_coln    constant varchar2 (1) default ',';
  gnu_largr_logo             number;
  gbl_logo                   blob;
  gre_coulr_pdf              typ_rec_coulr_pdf;
  gpi_parmt_impr             typ_rec_parmt_impre;
  gta_hautr_cel              typ_tab_hautr_faml_polc;

  procedure afich_pdf (pnu_aplic   in number default afw_07_util_pkg.v ('APP_ID')
                      ,pnu_page    in number default afw_07_util_pkg.v ('APP_PAGE_ID'));

  procedure afich_csv (pnu_aplic        in number default afw_07_util_pkg.v ('APP_ID')
                      ,pnu_page         in number default afw_07_util_pkg.v ('APP_PAGE_ID')
                      ,pva_seprt_coln   in varchar2 default kva_seprt_coln);

  function detrm_type_surlg (pva_coulr_polc_ligne     apex_ir_condt.row_font_color%type
                            ,pva_coulr_backg_ligne    apex_ir_condt.row_bg_color%type)
    return varchar2;

  function convr_parmt_align (pva_parmt   in varchar2
                             ,pva_deft    in varchar2)
    return varchar2;

  function convr_parmt_faml (pva_parmt in varchar2)
    return varchar2;

  function convr_parmt_poids (pva_parmt   in varchar2
                             ,pva_deft    in varchar2)
    return varchar2;

  procedure init_hautr_cel (pva_faml_polc in varchar2 default 'Arial');

  function obten_hautr_cel (pva_faml_polc   in varchar2 default 'Arial'
                           ,pnu_tail_polc   in number default 8)
    return number;
end afw_25_plpdf_expor_ir_pkg;
/
