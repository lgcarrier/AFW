SET DEFINE OFF;
ALTER TABLE AFW_01_MODL_AFICH_NOTFC ADD (
  CONSTRAINT AFW_01_MODL_AFICH_NOTFC_FK4 
  FOREIGN KEY (REF_DOMN) 
  REFERENCES AFW_12_DOMN (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/