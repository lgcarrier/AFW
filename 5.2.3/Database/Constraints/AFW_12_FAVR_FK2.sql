SET DEFINE OFF;
ALTER TABLE AFW_12_FAVR ADD (
  CONSTRAINT AFW_12_FAVR_FK2 
  FOREIGN KEY (REF_UTILS) 
  REFERENCES AFW_12_UTILS (SEQNC)
  ENABLE VALIDATE)
/