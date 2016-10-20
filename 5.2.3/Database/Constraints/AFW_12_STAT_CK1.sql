SET DEFINE OFF;
ALTER TABLE AFW_12_STAT ADD (
  CONSTRAINT AFW_12_STAT_CK1
  CHECK ((ref_group_stat is null and ref_struc_aplic is not null) or (
ref_group_stat is not null and ref_struc_aplic is null))
  ENABLE VALIDATE)
/
