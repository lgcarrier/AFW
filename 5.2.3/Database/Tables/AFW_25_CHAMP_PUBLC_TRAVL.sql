SET DEFINE OFF;
CREATE TABLE AFW_25_CHAMP_PUBLC_TRAVL
(
  SEQNC            NUMBER(10),
  REF_CHAMP        NUMBER(10),
  REF_PUBLC_TRAVL  NUMBER(10),
  CONTN            VARCHAR2(4000 BYTE),
  DATE_CREAT       DATE,
  UTILS_CREAT      VARCHAR2(123 BYTE),
  DATE_MODFC       DATE,
  UTILS_MODFC      VARCHAR2(123 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/