SET DEFINE OFF;
ALTER TABLE AFW_12_APROB ADD (
  CONSTRAINT AFW_12_APROB_CK1
  CHECK (
    ref_utils is not null and ref_group_utils is null
    or
    ref_utils is null and ref_group_utils is not null
)
  ENABLE VALIDATE)
/
