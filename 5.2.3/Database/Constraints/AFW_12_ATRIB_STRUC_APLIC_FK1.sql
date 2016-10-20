SET DEFINE OFF;
ALTER TABLE AFW_12_ATRIB_STRUC_APLIC ADD (
  CONSTRAINT AFW_12_ATRIB_STRUC_APLIC_FK1 
  FOREIGN KEY (REF_DV_NATR_INFOR) 
  REFERENCES AFW_14_DETL_DOMN_VALR (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/