SET DEFINE OFF;
ALTER TABLE AFW_12_DOMN_UTILS ADD (
  CONSTRAINT AFW_12_DOMN_UTILS_FK2 
  FOREIGN KEY (REF_DOMN) 
  REFERENCES AFW_12_DOMN (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
