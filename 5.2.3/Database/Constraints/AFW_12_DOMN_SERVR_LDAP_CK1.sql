SET DEFINE OFF;
ALTER TABLE AFW_12_DOMN_SERVR_LDAP ADD (
  CONSTRAINT AFW_12_DOMN_SERVR_LDAP_CK1
  CHECK (
  date_debut_efect < date_fin_efect or date_fin_efect is null
)
  ENABLE VALIDATE)
/
