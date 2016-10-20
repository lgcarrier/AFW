SET DEFINE OFF;
ALTER TABLE AFW_17_PROFL_COURL ADD (
  CONSTRAINT AFW_17_PROFL_COURL_CK2
  CHECK ((adres_suprt is not null and nom_suprt is not null and indic_ajout_suprt_cci is not null) or (adres_suprt is null and nom_suprt is null and indic_ajout_suprt_cci is null))
  ENABLE VALIDATE)
/
