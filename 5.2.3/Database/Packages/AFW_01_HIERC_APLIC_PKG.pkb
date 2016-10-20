SET DEFINE OFF;
create or replace package body afw_01_hierc_aplic_pkg
as
  procedure creer_hierc_aplic (pnu_ref_evenm_notfb         in number
                              ,pnu_ref_atrib_struc_aplic   in number
                              ,pnu_aplic_prior             in number default 0)
  as
  begin
    insert into vd_afw_01_hierc_aplic (ref_evenm_notfb
                                      ,ref_atrib_struc_aplic
                                      ,aplic_prior)
         values (pnu_ref_evenm_notfb
                ,pnu_ref_atrib_struc_aplic
                ,pnu_aplic_prior);
  end creer_hierc_aplic;

  procedure maj_hierc_aplic (pnu_seqnc         in number
                            ,pnu_aplic_prior   in number)
  as
  begin
    update vd_afw_01_hierc_aplic
       set aplic_prior   = pnu_aplic_prior
     where seqnc = pnu_seqnc;
  end maj_hierc_aplic;

  procedure suprm_hierc_aplic (pnu_seqnc in number)
  as
  begin
    delete from vd_i_afw_01_hierc_aplic
          where seqnc = pnu_seqnc;
  end suprm_hierc_aplic;
end afw_01_hierc_aplic_pkg;
/
