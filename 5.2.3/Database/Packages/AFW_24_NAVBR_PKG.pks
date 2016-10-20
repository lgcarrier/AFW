SET DEFINE OFF;
create or replace package afw_24_navbr_pkg
  authid current_user
as
  type typ_rec_confg_plugn is record
  (
    seqnc                     number (10)
   ,ref_dv_type_menu_code     varchar2 (23)
   ,ref_dv_orien_menu_code    varchar2 (23)
   ,ref_dv_coulr_theme_code   varchar2 (23)
   ,ref_dv_coulr_princ_code   varchar2 (23)
   ,ref_dv_formt_menu_code    varchar2 (23)
   ,ref_menu                  number (10)
  );

  type typ_rec_confg_plugn_item is record
  (
    seqnc                     number (10)
   ,clas_css_racn             varchar2 (60)
   ,clas_css_elemn            varchar2 (60)
   ,etend_nombr_coln          number (1)
   ,ref_item_menu             number (10)
   ,ref_plugn_menu            number (10)
   ,ref_dv_align_valr_organ   varchar2 (60)
  );

  kva_s_menu_actif   constant varchar2 (60) default 'S_AFW_21_MENU_ACTIF';

  function obten_enreg_confg_plugn (pnu_numr_apex_regn in number)
    return typ_rec_confg_plugn;

  function obten_enreg_confg_plugn_item (pnu_plugn_menu   in number
                                        ,pnu_item_menu    in number)
    return typ_rec_confg_plugn_item;

  function obten_plugn_menu (pva_code_prodt   in vd_i_afw_11_prodt.code%type
                            ,pva_code_menu    in vd_i_afw_21_plugn_menu.code%type)
    return number;

  function genr_reqt_sql (pty_rec_confg_plugn in typ_rec_confg_plugn)
    return varchar2;

  procedure maj_plugn_item_menu (pnu_plugn_menu in number);

  /*
    MODE : COLN = Menu avec columnwidth (Coin arrondi)
           COMPL = Menu avec fullwidth (Barre complète)
  */
  procedure creer_entet;

  procedure fermr_entet;

  procedure creer_sectn (pva_id      in varchar2 default null
                        ,pva_clas    in varchar2 default null
                        ,pva_align   in varchar2 default null);

  procedure fermr_sectn;

  procedure creer_liste (pva_clas in varchar2 default null);

  procedure fermr_liste;

  procedure creer_liste_desrd (pva_clas in varchar2 default null);

  procedure fermr_liste_desrd;

  procedure ajout_icone (pva_icone   in varchar2 default null
                        ,pva_clas    in varchar2 default null);

  procedure ecrir_lien (pva_libl        in varchar2
                       ,pva_clas        in varchar2 default null
                       ,pva_url_cible   in varchar2 default null
                       ,pva_icone       in varchar2 default null
                       ,pva_id          in varchar2 default null
                       ,pva_atrib       in varchar2 default null);

  procedure genr_elemn_no_drop (pva_libl             in varchar2
                               ,pva_url_cible        in varchar2 default null
                               ,pva_icone            in varchar2 default null
                               ,pva_class_css_html   in varchar2 default null
                               ,pva_id_html          in varchar2 default null
                               ,pva_atrib_html       in varchar2 default null);

  procedure creer_elemn_drop (pva_libl         in varchar2
                             ,pva_url_cible    in varchar2 default null
                             ,pva_clas_liste   in varchar2 default null
                             ,pva_align        in varchar2 default null
                             ,pva_icone        in varchar2 default null
                             ,pva_id_html      in varchar2 default null);

  procedure fermr_elemn_drop;

  procedure creer_contn_item (pty_rec_plugn_item in typ_rec_confg_plugn_item);

  procedure fermr_contn_item (pty_rec_plugn_item in typ_rec_confg_plugn_item);

  procedure genr_tabl (pty_rec_plugn_item in typ_rec_confg_plugn_item);

  function obten_contn (pnu_plugn_item_menu in number)
    return varchar2;

  function obten_align (pnu_plugn_item_menu in number)
    return varchar2;

  function obten_formt_menu (pnu_plugn_menu in number)
    return varchar2;

  function obten_coulr_menu (pnu_plugn_menu in number)
    return varchar2;

  function obten_usagr_formt_sesn
    return varchar2;
end afw_24_navbr_pkg;
/
