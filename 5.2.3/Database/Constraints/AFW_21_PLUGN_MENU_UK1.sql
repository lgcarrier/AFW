SET DEFINE OFF;
ALTER TABLE AFW_21_PLUGN_MENU ADD (
  CONSTRAINT AFW_21_PLUGN_MENU_UK1
  UNIQUE (CODE, REF_PRODT)
  ENABLE VALIDATE)
/
