SET DEFINE OFF;
ALTER TABLE AFW_12_TYPE_STRUC ADD (
  CONSTRAINT AFW_12_TYPE_STRUC_UK1
  UNIQUE (REF_DOMN, CODE)
  ENABLE VALIDATE)
/
