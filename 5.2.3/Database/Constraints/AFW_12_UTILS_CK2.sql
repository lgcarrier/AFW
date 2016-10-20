SET DEFINE OFF;
ALTER TABLE AFW_12_UTILS ADD (
  CONSTRAINT AFW_12_UTILS_CK2
  CHECK (
courl is null
or
regexp_like (courl,'^[A-Za-z0-9''._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'))
  ENABLE VALIDATE)
/
