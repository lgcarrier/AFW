SET DEFINE OFF;
ALTER TABLE AFW_12_CACHE_DROIT_ACCES ADD (
  CONSTRAINT AFW_12_CACHE_DROIT_ACCES_UK1
  UNIQUE (REF_SESN, CLE_ACCES)
  ENABLE VALIDATE)
/