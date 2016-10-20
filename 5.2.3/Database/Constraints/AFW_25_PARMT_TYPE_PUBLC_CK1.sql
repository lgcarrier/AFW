SET DEFINE OFF;
ALTER TABLE AFW_25_PARMT_TYPE_PUBLC ADD (
  CONSTRAINT AFW_25_PARMT_TYPE_PUBLC_CK1
  CHECK (ref_type_publc is not null and ref_engin is null
 or
 ref_type_publc is null and ref_engin is not null)
  ENABLE VALIDATE)
/
