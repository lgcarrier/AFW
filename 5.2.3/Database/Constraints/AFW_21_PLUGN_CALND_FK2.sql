SET DEFINE OFF;
ALTER TABLE AFW_21_PLUGN_CALND ADD (
  CONSTRAINT AFW_21_PLUGN_CALND_FK2 
  FOREIGN KEY (REF_DV_VUE_DEFT) 
  REFERENCES AFW_14_DETL_DOMN_VALR (SEQNC)
  ENABLE VALIDATE)
/