SET DEFINE OFF;
ALTER TABLE AFW_12_EVOLT_STAT ADD (
  CONSTRAINT AFW_12_EVOLT_STAT_FK1 
  FOREIGN KEY (REF_STAT) 
  REFERENCES AFW_12_STAT (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
