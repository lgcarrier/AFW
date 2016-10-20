SET DEFINE OFF;
ALTER TABLE AFW_01_CONFG_EVENM_NOTFB ADD (
  CONSTRAINT AFW_01_CONFG_EVENM_NOTFB_CK2
  CHECK ((ref_compt_twili is null and ref_profl_courl is not null) or (
ref_compt_twili is not null and ref_profl_courl is null))
  ENABLE VALIDATE)
/
