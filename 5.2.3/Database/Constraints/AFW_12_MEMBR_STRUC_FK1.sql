SET DEFINE OFF;
ALTER TABLE AFW_12_MEMBR_STRUC ADD (
  CONSTRAINT AFW_12_MEMBR_STRUC_FK1 
  FOREIGN KEY (REF_UTILS) 
  REFERENCES AFW_12_UTILS (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
