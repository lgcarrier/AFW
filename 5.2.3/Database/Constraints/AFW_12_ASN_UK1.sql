SET DEFINE OFF;
ALTER TABLE AFW_12_ATRIB_SCENR_NOTFC_ITEM ADD (
  CONSTRAINT AFW_12_ASN_UK1
  UNIQUE (REF_PAGE, REF_PAGE_ITEM, REF_ATRIB_SCENR_NOTFC)
  ENABLE VALIDATE)
/