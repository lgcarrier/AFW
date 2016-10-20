SET DEFINE OFF;
ALTER TABLE AFW_12_STAT ADD (
  CONSTRAINT AFW_12_STAT_CK2
  CHECK (
  dnr_ref_domn is not null and dnr_ref_prodt is null
  or
  dnr_ref_domn is null and dnr_ref_prodt is not null
)
  ENABLE VALIDATE)
/
