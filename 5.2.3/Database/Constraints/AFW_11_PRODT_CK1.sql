SET DEFINE OFF;
ALTER TABLE AFW_11_PRODT ADD (
  CONSTRAINT AFW_11_PRODT_CK1
  CHECK ((indic_extra_tout = 'N' and tail_tabl_extra is not null) or indic_extra_tout = 'O')
  ENABLE VALIDATE)
/
