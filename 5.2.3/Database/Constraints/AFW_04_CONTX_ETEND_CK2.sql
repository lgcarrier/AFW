SET DEFINE OFF;
ALTER TABLE AFW_04_CONTX_ETEND ADD (
  CONSTRAINT AFW_04_CONTX_ETEND_CK2
  CHECK (TYPE_ELEMN in ('I', 'V'))
  ENABLE VALIDATE)
/