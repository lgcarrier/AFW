SET DEFINE OFF;
ALTER TABLE AFW_25_VALR_ELEMN_CONFG ADD (
  CONSTRAINT AFW_25_VALR_ELEMN_CONFG_CK1
  CHECK (valr_varch is not null and valr_numbr is null and valr_date is null
 or
 valr_varch is null and valr_numbr is not null and valr_date is null
 or
 valr_varch is null and valr_numbr is null and valr_date is not null)
  ENABLE VALIDATE)
/
