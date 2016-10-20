SET DEFINE OFF;
ALTER TABLE AFW_07_AUDIT_STRUC_APLIC ADD (
  CONSTRAINT AFW_07_AUDIT_STRUC_APLIC_CK2
  CHECK ((natr_audit in ('CRE','MOD','SUP') and ref_page is null and
ref_actio_audit is null) or (natr_audit in ('CRE','MOD','SUP')))
  ENABLE VALIDATE)
/
