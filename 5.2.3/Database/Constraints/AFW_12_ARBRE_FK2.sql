SET DEFINE OFF;
ALTER TABLE AFW_12_ARBRE ADD (
  CONSTRAINT AFW_12_ARBRE_FK2 
  FOREIGN KEY (REF_SESN) 
  REFERENCES AFW_12_SESN (ID_SESN)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
