SET DEFINE OFF;
ALTER TABLE AFW_12_INSTA_PROCS_APROB_ROLE ADD (
  CONSTRAINT AFW_12_IPA_ROLE_FK2 
  FOREIGN KEY (REF_ROLE_APROB) 
  REFERENCES AFW_12_ROLE_APROB (SEQNC)
  ENABLE VALIDATE)
/