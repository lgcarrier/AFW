SET DEFINE OFF;
ALTER TABLE AFW_12_REGLE_APROB ADD (
  CONSTRAINT AFW_12_REGLE_APROB_CK1
  CHECK (
    ref_group_aprob is not null and ref_aprob is null and ref_role_aprob is null
    or
    ref_group_aprob is null and ref_aprob is not null and ref_role_aprob is null
    or
    ref_group_aprob is null and ref_aprob is null and ref_role_aprob is not null
)
  ENABLE VALIDATE)
/
