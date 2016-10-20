SET DEFINE OFF;
create or replace package afw_29_asurn_qualt_corct_pkg
as
  procedure corgr_item_hidn (pnu_aplic number);

  procedure corgr_ir_aucun_don_trouv (pnu_aplic number);

  procedure corgr_ir_trop_don_trouv (pnu_aplic number);

  procedure corgr_regn_trop_don_trouv (pnu_aplic number);

  procedure corgr_regn_aucun_don_trouv (pnu_aplic number);
end afw_29_asurn_qualt_corct_pkg;
/
