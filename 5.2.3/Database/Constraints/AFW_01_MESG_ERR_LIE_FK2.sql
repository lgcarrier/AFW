SET DEFINE OFF;
ALTER TABLE AFW_01_MESG_ERR_LIE ADD (
  CONSTRAINT AFW_01_MESG_ERR_LIE_FK2 
  FOREIGN KEY (REF_MESG) 
  REFERENCES AFW_01_MESG (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
