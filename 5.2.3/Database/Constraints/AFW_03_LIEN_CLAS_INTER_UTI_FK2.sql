SET DEFINE OFF;
ALTER TABLE AFW_03_LIEN_CLAS_INTER_UTILS ADD (
  CONSTRAINT AFW_03_LIEN_CLAS_INTER_UTI_FK2 
  FOREIGN KEY (REF_UTILS) 
  REFERENCES AFW_12_UTILS (SEQNC)
  ENABLE VALIDATE)
/