SET DEFINE OFF;
ALTER TABLE AFW_30_CARNT_PRODT ADD (
  CONSTRAINT AFW_30_CARNT_SYSTM_FK2 
  FOREIGN KEY (REF_UTILS_RESPN) 
  REFERENCES AFW_12_UTILS (SEQNC)
  ENABLE VALIDATE)
/
