SET DEFINE OFF;
ALTER TABLE AFW_12_INSTA_PROCS_APROB_ROLE ADD (
  CONSTRAINT AFW_12_IPA_ROLE_FK3 
  FOREIGN KEY (REF_APROB) 
  REFERENCES AFW_12_APROB (SEQNC)
  ENABLE VALIDATE)
/