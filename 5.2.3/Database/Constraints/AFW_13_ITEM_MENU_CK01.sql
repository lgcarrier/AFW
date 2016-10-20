SET DEFINE OFF;
ALTER TABLE AFW_13_ITEM_MENU ADD (
  CONSTRAINT AFW_13_ITEM_MENU_CK01
  CHECK ((ref_page is not null and forml_valr_url is null) or (ref_page is
null and forml_valr_url is not null)
        or (ref_page is null and forml_valr_url is null))
  ENABLE VALIDATE)
/
