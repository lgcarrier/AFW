SET DEFINE OFF;
ALTER TABLE AFW_01_DESTN_CONFG_EVENM_NOTFB ADD (
  CONSTRAINT AFW_01_DESTN_CONFG_EN_UK1
  UNIQUE (REF_CONFG_EVENM_NOTFB, REF_DESTN, REF_RESLT_DESTN)
  ENABLE VALIDATE)
/
