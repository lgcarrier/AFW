SET DEFINE OFF;
ALTER TABLE AFW_17_COMPT_TWILI ADD (
  CONSTRAINT AFW_17_COMPT_TWILI_UK1
  UNIQUE (REF_DOMN, CODE)
  ENABLE VALIDATE)
/