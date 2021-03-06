SET DEFINE OFF;
CREATE TABLE AFW_12_STRUC_APLIC_LANG
(
  SEQNC            NUMBER(10),
  REF_STRUC_APLIC  NUMBER(10),
  ADJEC_DEMNS      VARCHAR2(10 BYTE),
  NOM              VARCHAR2(255 BYTE),
  REF_LANG         NUMBER(10),
  DATE_CREAT       DATE,
  UTILS_CREAT      VARCHAR2(123 BYTE),
  DATE_MODFC       DATE,
  UTILS_MODFC      VARCHAR2(123 BYTE),
  DESCR            VARCHAR2(4000 BYTE),
  DNR_REF_PRODT    NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
