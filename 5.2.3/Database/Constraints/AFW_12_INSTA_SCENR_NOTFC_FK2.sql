SET DEFINE OFF;
ALTER TABLE AFW_12_INSTA_SCENR_NOTFC ADD (
  CONSTRAINT AFW_12_INSTA_SCENR_NOTFC_FK2 
  FOREIGN KEY (REF_ATRIB_SCENR_NOTFC) 
  REFERENCES AFW_12_ATRIB_SCENR_NOTFC (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/