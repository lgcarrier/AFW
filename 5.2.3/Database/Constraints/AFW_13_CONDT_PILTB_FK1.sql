SET DEFINE OFF;
ALTER TABLE AFW_13_CONDT_PILTB ADD (
  CONSTRAINT AFW_13_CONDT_PILTB_FK1 
  FOREIGN KEY (REF_PAGE) 
  REFERENCES AFW_13_PAGE (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
