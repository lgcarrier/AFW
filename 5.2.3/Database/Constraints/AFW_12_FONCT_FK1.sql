SET DEFINE OFF;
ALTER TABLE AFW_12_FONCT ADD (
  CONSTRAINT AFW_12_FONCT_FK1 
  FOREIGN KEY (REF_PRODT) 
  REFERENCES AFW_11_PRODT (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
