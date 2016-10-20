SET DEFINE OFF;
ALTER TABLE AFW_12_UTILS ADD (
  CONSTRAINT AFW_12_UTILS_CK1
  CHECK (
  regexp_like (code_utils,'^[[:alnum:]]+(_[[:alnum:]]+)*$')
)
  ENABLE VALIDATE)
/
