SET DEFINE OFF;
ALTER TABLE AFW_23_DETL_APLIC_MODL_RECHR ADD (
  CONSTRAINT AFW_23_DETL_APLIC_MODL_REC_FK2 
  FOREIGN KEY (REF_ATRIB_STRUC_APLIC) 
  REFERENCES AFW_12_ATRIB_STRUC_APLIC (SEQNC)
  ENABLE VALIDATE)
/
