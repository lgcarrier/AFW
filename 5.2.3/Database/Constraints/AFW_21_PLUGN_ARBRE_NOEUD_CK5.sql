SET DEFINE OFF;
ALTER TABLE AFW_21_PLUGN_ARBRE_NOEUD ADD (
  CONSTRAINT AFW_21_PLUGN_ARBRE_NOEUD_CK5
  CHECK (INDIC_SELCT_NOEUD in ('O','N'))
  ENABLE VALIDATE)
/
