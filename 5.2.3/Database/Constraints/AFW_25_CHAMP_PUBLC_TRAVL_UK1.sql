SET DEFINE OFF;
ALTER TABLE AFW_25_CHAMP_PUBLC_TRAVL ADD (
  CONSTRAINT AFW_25_CHAMP_PUBLC_TRAVL_UK1
  UNIQUE (REF_PUBLC_TRAVL, REF_CHAMP)
  ENABLE VALIDATE)
/
