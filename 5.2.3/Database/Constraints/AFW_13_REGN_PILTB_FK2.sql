SET DEFINE OFF;
ALTER TABLE AFW_13_REGN_PILTB ADD (
  CONSTRAINT AFW_13_REGN_PILTB_FK2 
  FOREIGN KEY (REF_DV_TYPE_REGN_PILTB) 
  REFERENCES AFW_14_DETL_DOMN_VALR (SEQNC)
  ENABLE VALIDATE)
/