SET DEFINE OFF;
ALTER TABLE AFW_11_VERSN ADD (
  CONSTRAINT AFW_11_VERSN_UK1
  UNIQUE (REF_PRODT, REF_PLUGN, REF_APLIC, CODE)
  ENABLE VALIDATE)
/
