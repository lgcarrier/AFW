SET DEFINE OFF;
ALTER TABLE AFW_12_STRUC_APLIC ADD (
  CONSTRAINT AFW_12_STRUC_APLIC_FK2 
  FOREIGN KEY (REF_MESG_ERR_SUPRS) 
  REFERENCES AFW_01_MESG (SEQNC)
  ENABLE VALIDATE)
/