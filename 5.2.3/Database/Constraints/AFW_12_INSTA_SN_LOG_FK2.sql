SET DEFINE OFF;
ALTER TABLE AFW_12_INSTA_SCENR_NOTFC_LOG ADD (
  CONSTRAINT AFW_12_INSTA_SN_LOG_FK2 
  FOREIGN KEY (REF_STRUC_APLIC) 
  REFERENCES AFW_12_STRUC_APLIC (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
