SET DEFINE OFF;
ALTER TABLE AFW_12_LIEN_SA_SCENR_NOTFC ADD (
  CONSTRAINT AFW_12_LIEN_SA_SCENR_NOTFC_UK1
  UNIQUE (REF_STRUC_APLIC, REF_SCENR_NOTFC)
  ENABLE VALIDATE)
/
