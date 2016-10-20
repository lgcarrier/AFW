SET DEFINE OFF;
ALTER TABLE AFW_11_PRODT_RESRC ADD (
  CONSTRAINT AFW_11_PRODT_RESRC_CK1
  CHECK (
(ref_plugn is null or ref_prodt is not null) or
(ref_plugn is not null or ref_prodt is null))
  ENABLE VALIDATE)
/
