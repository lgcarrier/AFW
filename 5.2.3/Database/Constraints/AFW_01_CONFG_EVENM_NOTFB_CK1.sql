SET DEFINE OFF;
ALTER TABLE AFW_01_CONFG_EVENM_NOTFB ADD (
  CONSTRAINT AFW_01_CONFG_EVENM_NOTFB_CK1
  CHECK (
  ref_profl_courl is not null and ref_compt_twili is null
  or
  ref_profl_courl is null and ref_compt_twili is not null
  or
  ref_profl_courl is null and ref_compt_twili is null
)
  ENABLE VALIDATE)
/
