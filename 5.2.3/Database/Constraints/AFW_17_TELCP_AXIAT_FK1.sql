SET DEFINE OFF;
ALTER TABLE AFW_17_TELCP_AXIAT ADD (
  CONSTRAINT AFW_17_TELCP_AXIAT_FK1 
  FOREIGN KEY (REF_COMPT_AXIAT) 
  REFERENCES AFW_17_COMPT_AXIAT (SEQNC)
  ENABLE VALIDATE)
/
