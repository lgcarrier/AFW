SET DEFINE OFF;
ALTER TABLE AFW_21_PLUGN_ITEM_MENU ADD (
  CONSTRAINT AFW_21_PLUGN_ITEM_MENU_CK1
  CHECK (
  ref_dv_contn_item_menu is not null and niv_item = 1
  or
  ref_dv_contn_item_menu is null
)
  ENABLE VALIDATE)
/
