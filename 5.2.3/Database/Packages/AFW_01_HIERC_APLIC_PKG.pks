SET DEFINE OFF;
create or replace package afw_01_hierc_aplic_pkg
as
  procedure creer_hierc_aplic (pnu_ref_evenm_notfb         in number
                              ,pnu_ref_atrib_struc_aplic   in number
                              ,pnu_aplic_prior             in number default 0);

  procedure maj_hierc_aplic (pnu_seqnc         in number
                            ,pnu_aplic_prior   in number);

  procedure suprm_hierc_aplic (pnu_seqnc in number);
end afw_01_hierc_aplic_pkg;
/
