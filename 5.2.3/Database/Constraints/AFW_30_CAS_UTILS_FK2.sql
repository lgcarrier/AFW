SET DEFINE OFF;
ALTER TABLE AFW_30_CAS_UTILS ADD (
  CONSTRAINT AFW_30_CAS_UTILS_FK2 
  FOREIGN KEY (REF_STAT) 
  REFERENCES AFW_12_STAT (SEQNC)
  ENABLE VALIDATE)
/