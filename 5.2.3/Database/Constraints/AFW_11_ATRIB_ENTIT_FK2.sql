SET DEFINE OFF;
ALTER TABLE AFW_11_ATRIB_ENTIT ADD (
  CONSTRAINT AFW_11_ATRIB_ENTIT_FK2 
  FOREIGN KEY (REF_ENTIT_REFRN) 
  REFERENCES AFW_11_ENTIT (SEQNC)
  ENABLE VALIDATE)
/
