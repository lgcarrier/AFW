SET DEFINE OFF;
ALTER TABLE AFW_11_VERSN ADD (
  CONSTRAINT AFW_11_VERSN_CK1
  CHECK (ref_prodt is not null and dnr_ref_prodt is not null and ref_aplic is null and dnr_ref_aplic is null and ref_plugn is null or
          ref_prodt is null and dnr_ref_prodt is null and ref_aplic is not null and dnr_ref_aplic is not null and ref_plugn is null or
          ref_prodt is null and dnr_ref_prodt is null and ref_aplic is null and dnr_ref_aplic is null and ref_plugn is not null)
  ENABLE VALIDATE)
/
