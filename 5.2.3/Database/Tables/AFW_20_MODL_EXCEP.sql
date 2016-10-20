SET DEFINE OFF;
CREATE TABLE AFW_20_MODL_EXCEP
(
  SEQNC        NUMBER(10),
  REF_MODL     NUMBER(10),
  NOM_ORGAN    VARCHAR2(30 BYTE),
  DATE_CREAT   DATE,
  UTILS_CREAT  VARCHAR2(123 BYTE),
  DATE_MODFC   DATE,
  UTILS_MODFC  VARCHAR2(123 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/