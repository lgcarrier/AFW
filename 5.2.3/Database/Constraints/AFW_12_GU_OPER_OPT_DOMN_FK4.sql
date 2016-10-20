SET DEFINE OFF;
ALTER TABLE AFW_12_GR_UT_OPERT_OPTIO_DOMN ADD (
  CONSTRAINT AFW_12_GU_OPER_OPT_DOMN_FK4 
  FOREIGN KEY (REF_DOMN) 
  REFERENCES AFW_12_DOMN (SEQNC)
  ON DELETE CASCADE
  ENABLE VALIDATE)
/