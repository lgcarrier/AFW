SET DEFINE OFF;
ALTER TABLE AFW_21_PLUGN_ITEM_MENU ADD (
  CONSTRAINT AFW_21_PLUGN_ITEM_MENU_UK1
  UNIQUE (REF_ITEM_MENU, REF_PLUGN_MENU)
  ENABLE VALIDATE)
/
