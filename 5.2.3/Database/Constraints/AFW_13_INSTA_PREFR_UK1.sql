SET DEFINE OFF;
ALTER TABLE AFW_13_INSTA_PREFR ADD (
  CONSTRAINT AFW_13_INSTA_PREFR_UK1
  UNIQUE (REF_PREFR, REF_UTILS, REF_SESN, REF_STRUC_APLIC)
  ENABLE VALIDATE)
/
