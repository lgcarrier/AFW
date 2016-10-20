SET DEFINE OFF;
ALTER TABLE AFW_12_DOMN ADD (
  CONSTRAINT AFW_12_DOMN_CK1
  CHECK (indic_authe_courl in ('N'
                              ,'O'))
  ENABLE VALIDATE)
/
