SET DEFINE OFF;
ALTER TABLE AFW_12_DOMN ADD (
  CONSTRAINT AFW_12_DOMN_FK5 
  FOREIGN KEY (REF_PROFL_SMS_NOTFC) 
  REFERENCES AFW_17_COMPT_TWILI (SEQNC)
  ENABLE VALIDATE)
/