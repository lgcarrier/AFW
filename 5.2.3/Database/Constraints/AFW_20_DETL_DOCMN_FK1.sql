SET DEFINE OFF;
ALTER TABLE AFW_20_DETL_DOCMN ADD (
  CONSTRAINT AFW_20_DETL_DOCMN_FK1 
  FOREIGN KEY (REF_DOCMN) 
  REFERENCES AFW_20_DOCMN (SEQNC)
  ENABLE VALIDATE)
/
