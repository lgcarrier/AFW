SET DEFINE OFF;
ALTER TABLE AFW_12_ARBRE_NOEUD ADD (
  CONSTRAINT AFW_12_ARBRE_NOEUD_FK1 
  FOREIGN KEY (REF_ARBRE) 
  REFERENCES AFW_12_ARBRE (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
