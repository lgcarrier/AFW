SET DEFINE OFF;
ALTER TABLE AFW_12_GROUP_UTILS ADD (
  CONSTRAINT AFW_12_GROUP_UTILS_CK1
  CHECK (
(ref_domn is not null and ref_prodt is null and dnr_ref_prodt is null)
or
(ref_domn is null and ref_prodt is not null and dnr_ref_prodt is not null)
or
(ref_domn is null and ref_prodt is null and dnr_ref_prodt is null and code = 'SUPER_UTILS')
)
  ENABLE VALIDATE)
/
