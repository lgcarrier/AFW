SET DEFINE OFF;
CREATE TABLE AFW_25_TYPE_PUBLC
(
  SEQNC            NUMBER(10),
  CODE             VARCHAR2(23 BYTE),
  NOM              VARCHAR2(60 BYTE),
  DESCR            VARCHAR2(200 BYTE),
  DATE_CREAT       DATE,
  UTILS_CREAT      VARCHAR2(123 BYTE),
  DATE_MODFC       DATE,
  UTILS_MODFC      VARCHAR2(123 BYTE),
  REF_STRUC_APLIC  NUMBER(10),
  DNR_REF_PRODT    NUMBER(10),
  REF_PRODT        NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/