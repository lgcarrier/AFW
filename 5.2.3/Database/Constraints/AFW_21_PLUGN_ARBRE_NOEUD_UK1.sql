SET DEFINE OFF;
ALTER TABLE AFW_21_PLUGN_ARBRE_NOEUD ADD (
  CONSTRAINT AFW_21_PLUGN_ARBRE_NOEUD_UK1
  UNIQUE (REF_PLUGN_ARBRE, CODE)
  ENABLE VALIDATE)
/
