SET DEFINE OFF;
ALTER TABLE AFW_12_STRUC_APLIC_LANG ADD (
  CONSTRAINT AFW_12_STRUC_APLIC_LANG_FK2 
  FOREIGN KEY (REF_LANG) 
  REFERENCES AFW_01_LANG (SEQNC)
  ENABLE VALIDATE)
/
