SET DEFINE OFF;
ALTER TABLE AFW_19_SPECF_FONCT ADD (
  CONSTRAINT AFW_19_SPECF_FONCT_CK1
  CHECK ((ref_item is not null and ref_page is null) or (ref_item is null and
ref_page is not null))
  ENABLE VALIDATE)
/
