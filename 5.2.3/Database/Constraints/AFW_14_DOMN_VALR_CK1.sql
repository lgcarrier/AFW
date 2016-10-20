SET DEFINE OFF;
ALTER TABLE AFW_14_DOMN_VALR ADD (
  CONSTRAINT AFW_14_DOMN_VALR_CK1
  CHECK ((   indic_systm = 'O')  or (   indic_systm = 'N'     and
ref_type_domn_valr is not null))
  ENABLE VALIDATE)
/
