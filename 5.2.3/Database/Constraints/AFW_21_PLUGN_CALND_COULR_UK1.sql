SET DEFINE OFF;
ALTER TABLE AFW_21_PLUGN_CALND_COULR ADD (
  CONSTRAINT AFW_21_PLUGN_CALND_COULR_UK1
  UNIQUE (ORDRE_PRESN)
  ENABLE VALIDATE)
/
