SET DEFINE OFF;
ALTER TABLE AFW_04_CONTX_ETEND ADD (
  CONSTRAINT AFW_04_CONTX_ETEND_FK1 
  FOREIGN KEY (REF_CONTX) 
  REFERENCES AFW_04_CONTX (REF_FIL_ARIAN)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
