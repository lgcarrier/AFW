SET DEFINE OFF;
ALTER TABLE AFW_25_DOMN_TYPE_PUBLC ADD (
  CONSTRAINT AFW_25_DOMN_TYPE_PUBLC_FK2 
  FOREIGN KEY (REF_TYPE_PUBLC) 
  REFERENCES AFW_25_TYPE_PUBLC (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
