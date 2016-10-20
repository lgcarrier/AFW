SET DEFINE OFF;
create or replace package afw_12_scenr_notfc_cu_pkg
  authid current_user
as
  procedure resdr_scenr_notfc (pva_code_prodt                in vd_afw_11_prodt.code%type
                              ,pva_code_scenr_notfc          in vd_afw_12_scenr_notfc.code%type
                              ,pva_code_struc_aplic          in vd_afw_12_struc_aplic.code%type
                              ,pva_code_atrib_struc_aplic    in vd_afw_12_atrib_struc_aplic.nom_coln%type
                              ,pnu_seqnc_struc_aplic         in number
                              ,pnu_seqnc_struc_aplic_actio   in number default null
                              ,pva_code_domn                 in vd_afw_12_domn.code%type default afw_12_domn_pkg.obten_code_domn_sesn
                              ,pbo_lancr_maj_actio           in boolean default true);
end afw_12_scenr_notfc_cu_pkg;
/
