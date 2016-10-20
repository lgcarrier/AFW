SET DEFINE OFF;
create or replace package afw_01_elemn_confg_en_pkg
is
  kva_prefx_elemn_subst_mesg   constant varchar2 (30) default '[#';
  kva_sufx_elemn_subst_mesg    constant varchar2 (30) default '#]';

  procedure inser_elemn_confg_en (pnu_confg_evenm_notfb   in vd_i_afw_01_elemn_confg_en.ref_confg_evenm_notfb%type
                                 ,pva_code                in vd_i_afw_01_elemn_confg_en.code%type
                                 ,pva_ident_acces         in vd_i_afw_01_elemn_confg_en.ident_acces%type
                                 ,pva_ident_acces_formt   in vd_i_afw_01_elemn_confg_en.ident_acces_formt%type);

  function formt_elemn_subst_mesg (pva_code in vd_i_afw_01_elemn_confg_en.code%type)
    return varchar2;
end afw_01_elemn_confg_en_pkg;
/
