SET DEFINE OFF;
CREATE TABLE AFW_17_TELCP_AXIAT
(
  SEQNC            NUMBER(10),
  REF_COMPT_AXIAT  NUMBER(10),
  DESTN_FORMT      VARCHAR2(100 BYTE),
  NUMR_DESTN       NUMBER(10),
  DATE_CREAT       DATE,
  UTILS_CREAT      VARCHAR2(123 BYTE),
  DATE_MODFC       DATE,
  UTILS_MODFC      VARCHAR2(123 BYTE),
  STAT_SOUMS       VARCHAR2(30 BYTE),
  DATE_ENVOI_DIFR  DATE,
  OBJET            VARCHAR2(500 BYTE),
  SENS             VARCHAR2(5 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
