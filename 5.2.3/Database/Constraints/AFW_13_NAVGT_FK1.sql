SET DEFINE OFF;
ALTER TABLE AFW_13_NAVGT ADD (
  CONSTRAINT AFW_13_NAVGT_FK1 
  FOREIGN KEY (REF_ID_SESN) 
  REFERENCES AFW_12_SESN (ID_SESN)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
