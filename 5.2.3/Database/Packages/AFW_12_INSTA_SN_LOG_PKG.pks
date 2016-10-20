SET DEFINE OFF;
create or replace package afw_12_insta_sn_log_pkg
as
  procedure inser_scenr_notfc_logs (pnu_utils               in vd_i_afw_12_utils.seqnc%type
                                   ,pnu_struc_aplic         in vd_i_afw_12_struc_aplic.seqnc%type
                                   ,pnu_seqnc_struc_aplic   in number
                                   ,pnu_insta_scenr_notfc   in vd_i_afw_12_insta_scenr_notfc.seqnc%type);

  procedure suprm_scenr_notfc_logs_concp (pnu_struc_aplic         in vd_i_afw_12_struc_aplic.seqnc%type
                                         ,pnu_seqnc_struc_aplic   in number);

  procedure suprm_scenr_notfc_logs_item (pnu_numr_aplic_apex   in vd_i_afw_11_aplic.numr_aplic_apex%type
                                        ,pnu_numr_page_apex    in vd_i_afw_13_page.numr_apex%type
                                        ,pva_nom_item          in vd_i_afw_13_page_item.nom_apex%type default null);

  function obten_exist_concp (pnu_struc_aplic         in vd_i_afw_12_insta_sn_log.ref_struc_aplic%type
                             ,pnu_seqnc_struc_aplic   in vd_i_afw_12_insta_sn_log.ref_seqnc_struc_aplic%type)
    return boolean;

  function obten_exist_item (pnu_id_item             in vd_i_afw_12_insta_sn_log.id_item_apex%type
                            ,pnu_struc_aplic         in vd_i_afw_12_insta_sn_log.ref_struc_aplic%type
                            ,pnu_seqnc_struc_aplic   in vd_i_afw_12_insta_sn_log.ref_seqnc_struc_aplic%type
                            ,pnu_domn                in vd_i_afw_12_insta_scenr_notfc.ref_domn%type default afw_12_domn_pkg.obten_domn_sesn)
    return boolean;
end afw_12_insta_sn_log_pkg;
/
