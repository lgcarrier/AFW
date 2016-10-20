SET DEFINE OFF;
CREATE TABLE AFW_03_JOURN
(
  DATE_HEURE  TIMESTAMP(6)                      DEFAULT systimestamp,
  EXPLI       VARCHAR2(4000 BYTE),
  EREUR       VARCHAR2(500 BYTE),
  PILE_TRACE  VARCHAR2(4000 BYTE),
  TRAVL       VARCHAR2(200 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/