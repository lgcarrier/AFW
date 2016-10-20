SET DEFINE OFF;
ALTER TABLE AFW_12_SESN ADD (
  CONSTRAINT AFW_12_SESN_FK1 
  FOREIGN KEY (ID_SESN) 
  REFERENCES APEX_050000.WWV_FLOW_SESSIONS$ (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
