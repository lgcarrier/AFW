SET DEFINE OFF;
ALTER TABLE AFW_01_DESTN_CONFG_EVENM_NOTFB ADD (
  CONSTRAINT AFW_01_DESTN_CONFG_EN_FK3 
  FOREIGN KEY (REF_DESTN) 
  REFERENCES AFW_01_DESTN (SEQNC)
  ENABLE VALIDATE)
/
