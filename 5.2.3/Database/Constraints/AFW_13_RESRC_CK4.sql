SET DEFINE OFF;
ALTER TABLE AFW_13_RESRC ADD (
  CONSTRAINT AFW_13_RESRC_CK4
  CHECK (
   (REF_PRODT is not null and REF_STRUC_APLIC is null and REF_PLUGN is null)
   or
   (REF_PRODT is null and REF_STRUC_APLIC is not null and REF_PLUGN is null)
   or
   (REF_PRODT is null and REF_STRUC_APLIC is null and REF_PLUGN is not null)
   )
  ENABLE VALIDATE)
/
