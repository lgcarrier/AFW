SET DEFINE OFF;
ALTER TABLE AFW_12_LIEN_STRUC ADD (
  CONSTRAINT AFW_12_LIEN_STRUC_FK1 
  FOREIGN KEY (REF_STRUC_ADMIN) 
  REFERENCES AFW_12_STRUC_ADMIN (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
