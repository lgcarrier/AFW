SET DEFINE OFF;
ALTER TABLE AFW_04_FIL_ARIAN ADD (
  CONSTRAINT AFW_04_FIL_ARIAN_CK1
  CHECK (
(ref_navgt_histr is not null and session_id is null) or
(ref_navgt_histr is null and session_id is not null)
)
  ENABLE VALIDATE)
/
