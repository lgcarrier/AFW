SET DEFINE OFF;
ALTER TABLE AFW_30_CAS_UTILS ADD (
  CONSTRAINT AFW_30_CAS_UTILS_FK1 
  FOREIGN KEY (REF_CARNT_PRODT) 
  REFERENCES AFW_30_CARNT_APLIC (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
