SET DEFINE OFF;
ALTER TABLE AFW_04_CONTX_ETEND ADD (
  CONSTRAINT AFW_04_CONTX_ETEND_CK1
  CHECK (type_alimn in ('A', 'M', 'RM', 'RMA', 'RC'))
  ENABLE VALIDATE)
/