SET DEFINE OFF;
ALTER TABLE AFW_12_STAT ADD (
  CONSTRAINT AFW_12_STAT_CK4
  CHECK (mint_prevu between 0 and 59
         and heure_prevu between 0 and 23 
         and jour_prevu >= 0)
  ENABLE VALIDATE)
/
