SET DEFINE OFF;
create or replace package body afw_01_elemn_confg_en_pkg
is
  procedure inser_elemn_confg_en (pnu_confg_evenm_notfb   in vd_i_afw_01_elemn_confg_en.ref_confg_evenm_notfb%type
                                 ,pva_code                in vd_i_afw_01_elemn_confg_en.code%type
                                 ,pva_ident_acces         in vd_i_afw_01_elemn_confg_en.ident_acces%type
                                 ,pva_ident_acces_formt   in vd_i_afw_01_elemn_confg_en.ident_acces_formt%type)
  is
  begin
    insert into vd_i_afw_01_elemn_confg_en (ref_confg_evenm_notfb
                                           ,code
                                           ,ident_acces
                                           ,ident_acces_formt)
         values (pnu_confg_evenm_notfb
                ,pva_code
                ,pva_ident_acces
                ,pva_ident_acces_formt);
  end inser_elemn_confg_en;

  function formt_elemn_subst_mesg (pva_code in vd_i_afw_01_elemn_confg_en.code%type)
    return varchar2
  is
  begin
    return    kva_prefx_elemn_subst_mesg
           || pva_code
           || kva_sufx_elemn_subst_mesg;
  end formt_elemn_subst_mesg;
end afw_01_elemn_confg_en_pkg;
/
