SET DEFINE OFF;
ALTER TABLE AFW_20_DEPLM ADD (
  CONSTRAINT AFW_20_DEPLM_CK1
  CHECK (
  (ref_modl is not null and ref_modl_parmt is null)
  or
  (ref_modl is null and ref_modl_parmt is not null)
)
  ENABLE VALIDATE)
/
