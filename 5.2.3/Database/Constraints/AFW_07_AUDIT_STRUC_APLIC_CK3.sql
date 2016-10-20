SET DEFINE OFF;
ALTER TABLE AFW_07_AUDIT_STRUC_APLIC ADD (
  CONSTRAINT AFW_07_AUDIT_STRUC_APLIC_CK3
  CHECK ((natr_audit = 'PER' and ref_actio_audit is not null and ref_page is
null) or natr_audit != 'PER')
  ENABLE VALIDATE)
/
