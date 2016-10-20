SET DEFINE OFF;
ALTER TABLE AFW_14_DOMN_VALR ADD (
  CONSTRAINT AFW_14_DOMN_VALR_FK4 
  FOREIGN KEY (REF_DOMN) 
  REFERENCES AFW_12_DOMN (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/