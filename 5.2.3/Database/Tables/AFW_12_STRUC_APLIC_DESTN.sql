SET DEFINE OFF;
CREATE TABLE AFW_12_STRUC_APLIC_DESTN
(
  SEQNC            NUMBER(10),
  REF_STRUC_APLIC  NUMBER(10),
  UTILS_CREAT      VARCHAR2(123 BYTE),
  DATE_CREAT       DATE,
  UTILS_MODFC      VARCHAR2(123 BYTE),
  DATE_MODFC       DATE,
  REF_DESTN        NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
