SET DEFINE OFF;
ALTER TABLE AFW_37_GADGT_CATGR ADD (
  CONSTRAINT AFW_37_GADGT_CATGR_FK2 
  FOREIGN KEY (REF_GADGT_CATGR) 
  REFERENCES AFW_37_GADGT_CATGR (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
