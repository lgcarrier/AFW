SET DEFINE OFF;
ALTER TABLE AFW_12_GR_UT_OPERT_OPTIO_DOMN ADD (
  CONSTRAINT AFW_12_GU_OPER_OPT_DOMN_FK3 
  FOREIGN KEY (REF_OPERT_OPTIO) 
  REFERENCES AFW_13_OPERT_OPTIO (SEQNC)
  ENABLE VALIDATE)
/