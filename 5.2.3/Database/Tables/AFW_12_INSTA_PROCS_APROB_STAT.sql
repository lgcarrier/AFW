SET DEFINE OFF;
CREATE TABLE AFW_12_INSTA_PROCS_APROB_STAT
(
  SEQNC                  NUMBER(10),
  REF_INSTA_PROCS_APROB  NUMBER(10),
  REF_STAT               NUMBER(10),
  DATE_DEBUT_EFECT       DATE,
  DATE_FIN_EFECT         DATE,
  UTILS_CREAT            VARCHAR2(123 BYTE),
  DATE_CREAT             DATE,
  UTILS_MODFC            VARCHAR2(123 BYTE),
  DATE_MODFC             DATE,
  DNR_REF_DOMN           NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/