SET DEFINE OFF;
ALTER TABLE AFW_13_PAGE_ITEM ADD (
  CONSTRAINT AFW_13_PAGE_ITEM_FK2 
  FOREIGN KEY (REF_MESG_AIDE) 
  REFERENCES AFW_01_MESG (SEQNC)
  ENABLE VALIDATE)
/
