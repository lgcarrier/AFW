SET DEFINE OFF;
ALTER TABLE AFW_17_COMPT_AXIAT ADD (
  CONSTRAINT AFW_17_COMPT_AXIAT_FK3 
  FOREIGN KEY (REF_PUBLC_PAGE_GARDE) 
  REFERENCES AFW_25_PUBLC (SEQNC)
  ENABLE VALIDATE)
/