SET DEFINE OFF;
ALTER TABLE AFW_12_GROUP_STAT ADD (
  CONSTRAINT AFW_12_GROUP_STAT_CK1
  CHECK (
  ref_prodt is not null and dnr_ref_prodt is not null and ref_domn is null and dnr_ref_domn is null
  or
  ref_prodt is null and dnr_ref_prodt is null and ref_domn is not null and dnr_ref_domn is not null
)
  ENABLE VALIDATE)
/
