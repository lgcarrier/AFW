SET DEFINE OFF;
ALTER TABLE AFW_12_GROUP_UTILS ADD (
  CONSTRAINT AFW_12_GROUP_UTILS_FK2 
  FOREIGN KEY (REF_DOMN) 
  REFERENCES AFW_12_DOMN (SEQNC)
  ENABLE VALIDATE)
/
