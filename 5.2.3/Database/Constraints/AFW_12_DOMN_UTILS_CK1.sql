SET DEFINE OFF;
ALTER TABLE AFW_12_DOMN_UTILS ADD (
  CONSTRAINT AFW_12_DOMN_UTILS_CK1
  CHECK (
  date_debut_efect < date_fin_efect or date_fin_efect is null
)
  ENABLE VALIDATE)
/
