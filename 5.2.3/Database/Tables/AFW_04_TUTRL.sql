SET DEFINE OFF;
CREATE TABLE AFW_04_TUTRL
(
  SEQNC        NUMBER(10),
  REF_SESN     NUMBER,
  REF_TUTRL    NUMBER(10),
  TIMST        TIMESTAMP(6),
  DATE_CREAT   DATE,
  UTILS_CREAT  VARCHAR2(123 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
