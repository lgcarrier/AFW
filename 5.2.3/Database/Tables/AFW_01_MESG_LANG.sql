SET DEFINE OFF;
CREATE TABLE AFW_01_MESG_LANG
(
  SEQNC          NUMBER(10),
  MESG           VARCHAR2(4000 BYTE),
  DATE_CREAT     DATE,
  UTILS_CREAT    VARCHAR2(123 BYTE),
  DATE_MODFC     DATE,
  UTILS_MODFC    VARCHAR2(123 BYTE),
  REF_MESG       NUMBER(10),
  REF_LANG       NUMBER(10),
  DNR_REF_PRODT  NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
