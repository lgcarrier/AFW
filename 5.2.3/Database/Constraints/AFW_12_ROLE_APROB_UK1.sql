SET DEFINE OFF;
ALTER TABLE AFW_12_ROLE_APROB ADD (
  CONSTRAINT AFW_12_ROLE_APROB_UK1
  UNIQUE (CODE, REF_GROUP_STAT)
  ENABLE VALIDATE)
/
