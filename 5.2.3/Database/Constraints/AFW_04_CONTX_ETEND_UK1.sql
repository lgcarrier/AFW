SET DEFINE OFF;
ALTER TABLE AFW_04_CONTX_ETEND ADD (
  CONSTRAINT AFW_04_CONTX_ETEND_UK1
  UNIQUE (REF_CONTX, NOM, PAGE_CIBLE)
  ENABLE VALIDATE)
/