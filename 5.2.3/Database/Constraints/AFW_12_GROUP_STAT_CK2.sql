SET DEFINE OFF;
ALTER TABLE AFW_12_GROUP_STAT ADD (
  CONSTRAINT AFW_12_GROUP_STAT_CK2
  CHECK (
  ref_domn is not null and date_debut_efect is not null
  or
  ref_domn is null
)
  ENABLE VALIDATE)
/
