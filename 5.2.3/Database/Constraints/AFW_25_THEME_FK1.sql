SET DEFINE OFF;
ALTER TABLE AFW_25_THEME ADD (
  CONSTRAINT AFW_25_THEME_FK1 
  FOREIGN KEY (REF_GROUP_PUBLC) 
  REFERENCES AFW_25_GROUP_PUBLC (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
