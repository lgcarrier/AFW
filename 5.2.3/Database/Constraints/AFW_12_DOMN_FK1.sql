SET DEFINE OFF;
ALTER TABLE AFW_12_DOMN ADD (
  CONSTRAINT AFW_12_DOMN_FK1 
  FOREIGN KEY (REF_MODL_RECHR_DEFT) 
  REFERENCES AFW_23_MODL_RECHR (SEQNC)
  ENABLE VALIDATE)
/