SET DEFINE OFF;
ALTER TABLE AFW_13_ITEM_MENU ADD (
  CONSTRAINT AFW_13_ITEM_MENU_FK5 
  FOREIGN KEY (REF_PAGE) 
  REFERENCES AFW_13_PAGE (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
