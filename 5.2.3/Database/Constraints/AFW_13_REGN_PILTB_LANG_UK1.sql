SET DEFINE OFF;
ALTER TABLE AFW_13_REGN_PILTB_LANG ADD (
  CONSTRAINT AFW_13_REGN_PILTB_LANG_UK1
  UNIQUE (REF_REGN_PILTB, REF_LANG)
  ENABLE VALIDATE)
/