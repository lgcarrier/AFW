SET DEFINE OFF;
ALTER TABLE AFW_12_FAVR ADD (
  CONSTRAINT AFW_12_FAVR_UK1
  UNIQUE (REF_UTILS, REF_STRUC_APLIC, REF_SEQNC_STRUC_APLIC)
  ENABLE VALIDATE)
/
