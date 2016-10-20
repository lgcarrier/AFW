SET DEFINE OFF;
ALTER TABLE AFW_13_RESRC ADD (
  CONSTRAINT AFW_13_RESRC_CK2
  CHECK ((indic_stock_meme_reprt = 'O' and ref_dosr_virtl is not null) or
ref_dosr_virtl is null)
  ENABLE VALIDATE)
/
