SET DEFINE OFF;
ALTER TABLE AFW_12_LIEN_GROUP_UTILS ADD (
  CONSTRAINT AFW_12_LIEN_GROUP_UTILS_FK3 
  FOREIGN KEY (REF_GROUP_UTILS_LIE) 
  REFERENCES AFW_12_GROUP_UTILS (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
