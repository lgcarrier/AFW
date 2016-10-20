SET DEFINE OFF;
create or replace package afw_07_sql_pkg
  authid current_user
as
  -- Déclaration des types publics
  type typ_rec_infor_coln is record
  (
    va_indic_expor   varchar2 (1)
   ,nu_type_don      number
   ,va_nom           varchar2 (1999)
   ,va_libl          varchar2 (100)
   ,nu_largr         number
   ,va_type_largr    varchar2 (5)
   ,nu_largr_reltv   number
   ,va_formt         varchar2 (50)
   ,va_align_entet   varchar2 (10)
   ,va_align_coln    varchar2 (10)
   ,va_type_valr     varchar2 (5)
   ,va_valr_varch    varchar2 (4000)
   ,nu_valr_numbr    number
   ,da_valr_date     date
   ,ts_valr_timst    timestamp
  );

  type typ_arr_infor_coln is table of typ_rec_infor_coln
    index by binary_integer;

  type typ_arr_ndx_vc30 is table of number
    index by varchar2 (30);

  c_liste_type_don_vide   apex_application_global.vc_arr2;

  type typ_gestn_sql is record
  (
    vnu_cursr        number
   ,vva_enonc_sql    varchar2 (32767)
   ,vta_liste_coln   dbms_sql.desc_tab2
  );

  type typ_liste_coln_valr is table of apex_application_global.vc_arr2
    index by pls_integer;

  type typ_coln_valr is record
  (
    vnu_nombr_ligne       pls_integer
   ,vta_liste_coln_valr   typ_liste_coln_valr
  );

  c_liste_nom_vide        apex_application_global.vc_arr2;
  c_liste_valr_vide       apex_application_global.vc_arr2;

  type typ_subst is record
  (
    vva_nom    varchar2 (30)
   ,vva_valr   varchar2 (32767) default null
   ,vnu_valr   number default null
  );

  type typ_liste_subst is table of typ_subst
    index by pls_integer;

  c_liste_subst_vide      typ_liste_subst;

  type typ_varbl_subst is record
  (
    vva_nom         varchar2 (255)
   ,vva_nom_orign   varchar2 (255)
  );

  type typ_liste_varbl_subst is table of typ_varbl_subst
    index by pls_integer;

  type typ_valr_varbl_subst is record
  (
    vva_nom    varchar2 (255)
   ,vva_valr   varchar2 (32767)
  );

  type typ_liste_valr_varbl_subst is table of typ_valr_varbl_subst
    index by pls_integer;

  function rempl_br (pva_chaine     in varchar2
                    ,pva_rempl_br   in varchar2)
    return varchar2;

  function obten_type_valr (pnu_type_don in number)
    return varchar2;

  function ouvri_selct (pnu_ref_ir       in            number
                       ,pnu_rpts_id      in            number
                       ,pva_sql          in            varchar2
                       ,par_infor_coln   in out nocopy typ_arr_infor_coln
                       ,pva_rempl_br     in            varchar2)
    return number;

  function lire_ligne_selct (pnu_cursr        in out        number
                            ,par_infor_coln   in out nocopy typ_arr_infor_coln)
    return boolean;

  procedure fermr_selct (pnu_cursr in out number);

  function obten_don (pva_enonc_sql     in varchar2
                     ,pty_liste_subst   in typ_liste_subst default c_liste_subst_vide)
    return typ_coln_valr;
end afw_07_sql_pkg;
/
