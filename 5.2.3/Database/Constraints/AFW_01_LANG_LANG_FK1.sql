SET DEFINE OFF;
ALTER TABLE AFW_01_LANG_LANG ADD (
  CONSTRAINT AFW_01_LANG_LANG_FK1 
  FOREIGN KEY (REF_LANG) 
  REFERENCES AFW_01_LANG (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
