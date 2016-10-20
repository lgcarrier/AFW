SET DEFINE OFF;
ALTER TABLE AFW_11_SCHEM_PRODT ADD (
  CONSTRAINT AFW_11_SCHEM_PRODT_FK1 
  FOREIGN KEY (REF_VERSN) 
  REFERENCES AFW_11_VERSN (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/