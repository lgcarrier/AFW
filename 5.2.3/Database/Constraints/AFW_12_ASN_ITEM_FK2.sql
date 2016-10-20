SET DEFINE OFF;
ALTER TABLE AFW_12_ATRIB_SCENR_NOTFC_ITEM ADD (
  CONSTRAINT AFW_12_ASN_ITEM_FK2 
  FOREIGN KEY (REF_PAGE_ITEM) 
  REFERENCES AFW_13_PAGE_ITEM (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/