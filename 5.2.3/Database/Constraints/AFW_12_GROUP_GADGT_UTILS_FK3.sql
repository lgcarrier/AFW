SET DEFINE OFF;
ALTER TABLE AFW_12_GROUP_GADGT_UTILS ADD (
  CONSTRAINT AFW_12_GROUP_GADGT_UTILS_FK3 
  FOREIGN KEY (REF_UTILS_DEMDR) 
  REFERENCES AFW_12_UTILS (SEQNC)
  ON DELETE SET NULL
  ENABLE VALIDATE)
/
