SET DEFINE OFF;
ALTER TABLE AFW_13_ITEM_MENU ADD (
  CONSTRAINT AFW_13_ITEM_MENU_FK8 
  FOREIGN KEY (REF_ITEM_MENU) 
  REFERENCES AFW_13_ITEM_MENU (SEQNC)
  ON DELETE SET NULL
  ENABLE VALIDATE)
/