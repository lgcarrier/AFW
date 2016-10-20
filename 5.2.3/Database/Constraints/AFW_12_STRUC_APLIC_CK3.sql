SET DEFINE OFF;
ALTER TABLE AFW_12_STRUC_APLIC ADD (
  CONSTRAINT AFW_12_STRUC_APLIC_CK3
  CHECK (
(indic_dispn_docmn = 'O' and nom_struc_acces_don is not null)
or
(indic_dispn_docmn = 'N'))
  ENABLE VALIDATE)
/
