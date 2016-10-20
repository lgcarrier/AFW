SET DEFINE OFF;
ALTER TABLE AFW_21_PLUGN_ARBRE_NOEUD ADD (
  CONSTRAINT AFW_21_PLUGN_ARBRE_NOEUD_CK7
  CHECK ((ref_ocurn_resrc is not null and ref_resrc is null) or (
ref_ocurn_resrc is null and ref_resrc is not null))
  DISABLE NOVALIDATE)
/
