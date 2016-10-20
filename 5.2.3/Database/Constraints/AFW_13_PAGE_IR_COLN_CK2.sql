SET DEFINE OFF;
ALTER TABLE AFW_13_PAGE_IR_COLN ADD (
  CONSTRAINT AFW_13_PAGE_IR_COLN_CK2
  CHECK (
        type_largr is not null and largr is not null
        or
        type_largr is null and largr is null)
  ENABLE VALIDATE)
/
