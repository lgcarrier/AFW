SET DEFINE OFF;
ALTER TABLE AFW_07_AUDIT_STRUC_APLIC ADD (
  CONSTRAINT AFW_07_AUDIT_STRUC_APLIC_CK4
  CHECK ((natr_audit = 'AFF' and ref_actio_audit is null and ref_page is not
null) or natr_audit != 'AFF')
  ENABLE VALIDATE)
/
