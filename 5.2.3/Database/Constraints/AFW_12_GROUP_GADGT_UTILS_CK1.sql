SET DEFINE OFF;
ALTER TABLE AFW_12_GROUP_GADGT_UTILS ADD (
  CONSTRAINT AFW_12_GROUP_GADGT_UTILS_CK1
  CHECK (indic_systm in ('N','O'))
  ENABLE VALIDATE)
/
