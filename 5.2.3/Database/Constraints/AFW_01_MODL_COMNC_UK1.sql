SET DEFINE OFF;
ALTER TABLE AFW_01_MODL_COMNC ADD (
  CONSTRAINT AFW_01_MODL_COMNC_UK1
  UNIQUE (REF_DOMN, CODE)
  ENABLE VALIDATE)
/
