SET DEFINE OFF;
ALTER TABLE AFW_12_STRUC_APLIC ADD (
  CONSTRAINT AFW_12_STRUC_APLIC_UK1
  UNIQUE (REF_PRODT, CODE)
  ENABLE VALIDATE)
/
