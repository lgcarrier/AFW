SET DEFINE OFF;
ALTER TABLE AFW_12_LIEN_GR_GADGT_GR_UTILS ADD (
  CONSTRAINT AFW_12_LIEN_GR_G_GR_U_FK2 
  FOREIGN KEY (REF_GROUP_GADGT_UTILS) 
  REFERENCES AFW_12_GROUP_GADGT_UTILS (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/
