SET DEFINE OFF;
ALTER TABLE AFW_13_PAGE ADD (
  CONSTRAINT AFW_13_PAGE_FK11 
  FOREIGN KEY (REF_MESG_RANGE_INSER_SPECF) 
  REFERENCES AFW_01_MESG (SEQNC)
  ENABLE VALIDATE)
/
