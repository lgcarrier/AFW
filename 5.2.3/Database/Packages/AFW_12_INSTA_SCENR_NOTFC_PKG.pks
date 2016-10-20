SET DEFINE OFF;
create or replace package afw_12_insta_scenr_notfc_pkg
as
  procedure creer_insta (pnu_atrib_scenr_notfc   in vd_i_afw_12_insta_scenr_notfc.ref_atrib_scenr_notfc%type
                        ,pnu_scenr_notfc_actio   in vd_i_afw_12_insta_scenr_notfc.ref_scenr_notfc_actio%type
                        ,pva_indic_notfr         in vd_i_afw_12_insta_scenr_notfc.indic_notfr%type default 'O'
                        ,pnu_domn                in vd_i_afw_12_insta_scenr_notfc.ref_domn%type default afw_12_domn_pkg.obten_domn_sesn);

  procedure suprm_insta (pnu_seqnc in vd_i_afw_12_insta_scenr_notfc.seqnc%type);

  procedure activ_insta (pnu_seqnc in vd_i_afw_12_insta_scenr_notfc.seqnc%type);

  procedure desct_insta (pnu_seqnc in vd_i_afw_12_insta_scenr_notfc.seqnc%type);

  function obten_actio (pnu_seqnc in vd_i_afw_12_insta_scenr_notfc.seqnc%type)
    return vd_i_afw_12_insta_scenr_notfc.ref_scenr_notfc_actio%type;
end afw_12_insta_scenr_notfc_pkg;
/
