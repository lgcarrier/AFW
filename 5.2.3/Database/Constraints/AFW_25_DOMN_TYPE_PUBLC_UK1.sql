SET DEFINE OFF;
ALTER TABLE AFW_25_DOMN_TYPE_PUBLC ADD (
  CONSTRAINT AFW_25_DOMN_TYPE_PUBLC_UK1
  UNIQUE (REF_DOMN, REF_TYPE_PUBLC)
  ENABLE VALIDATE)
/
