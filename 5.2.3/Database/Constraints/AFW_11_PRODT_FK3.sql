SET DEFINE OFF;
ALTER TABLE AFW_11_PRODT ADD (
  CONSTRAINT AFW_11_PRODT_FK3 
  FOREIGN KEY (REF_VERSN) 
  REFERENCES AFW_11_VERSN (SEQNC)
  ENABLE VALIDATE)
/