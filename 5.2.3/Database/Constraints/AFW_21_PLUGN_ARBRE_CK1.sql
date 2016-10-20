SET DEFINE OFF;
ALTER TABLE AFW_21_PLUGN_ARBRE ADD (
  CONSTRAINT AFW_21_PLUGN_ARBRE_CK1
  CHECK (
 (nom_table is not null and
 coln_titre is not null and
 coln_valr is not null and
 coln_id is not null and
 coln_id_parnt is not null
 )
 or
 (nom_table is null and
 coln_titre is null and
 coln_valr is null and
 coln_id is null and
 coln_id_parnt is null)
 )
  ENABLE VALIDATE)
/
