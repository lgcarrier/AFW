SET DEFINE OFF;
ALTER TABLE AFW_30_CARNT_SPRIN ADD (
  CONSTRAINT AFW_30_CARNT_SPRIN_UK1
  UNIQUE (REF_VERSN, DATE_FIN_PREVU, DATE_DEBUT_PREVU, REF_CARNT_PRODT)
  ENABLE VALIDATE)
/