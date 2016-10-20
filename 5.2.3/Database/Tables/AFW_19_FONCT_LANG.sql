SET DEFINE OFF;
CREATE TABLE AFW_19_FONCT_LANG
(
  SEQNC        NUMBER(10),
  NOM          VARCHAR2(60 BYTE),
  REF_LANG     NUMBER(10),
  DESCR        VARCHAR2(4000 BYTE),
  DATE_CREAT   DATE,
  UTILS_CREAT  VARCHAR2(123 BYTE),
  DATE_MODFC   DATE,
  UTILS_MODFC  VARCHAR2(123 BYTE),
  REF_FONCT    NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/