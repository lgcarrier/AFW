SET DEFINE OFF;
ALTER TABLE AFW_25_VALR_CHAMP ADD (
  CONSTRAINT AFW_25_VALR_CHAMP_FK2 
  FOREIGN KEY (REF_CHAMP) 
  REFERENCES AFW_25_CHAMP (SEQNC)
  ENABLE VALIDATE)
/