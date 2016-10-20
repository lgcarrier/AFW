SET DEFINE OFF;
ALTER TABLE AFW_12_LIEN_GROUP_UTILS ADD (
  CONSTRAINT AFW_12_LIEN_GROUP_UTILS_CK2
  CHECK ((dnr_ref_prodt is not null and ref_domn is null)
or
(dnr_ref_prodt is null and ref_domn is not null))
  ENABLE VALIDATE)
/
