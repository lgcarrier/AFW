SET DEFINE OFF;
ALTER TABLE AFW_12_STRUC_ADMIN ADD (
  CONSTRAINT AFW_12_STRUC_ADMIN_FK3 
  FOREIGN KEY (REF_RESPN) 
  REFERENCES AFW_12_UTILS (SEQNC)
  ENABLE VALIDATE)
/
