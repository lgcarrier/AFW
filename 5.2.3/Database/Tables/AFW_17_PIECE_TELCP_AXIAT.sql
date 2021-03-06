SET DEFINE OFF;
CREATE TABLE AFW_17_PIECE_TELCP_AXIAT
(
  SEQNC            NUMBER(10),
  REF_TELCP_AXIAT  NUMBER(10),
  NOMBR_PAGE       NUMBER(5),
  ORDRE_ATACH      NUMBER(3),
  CONTN            BLOB,
  DATE_CREAT       DATE,
  UTILS_CREAT      VARCHAR2(123 BYTE),
  DATE_MODFC       DATE,
  UTILS_MODFC      VARCHAR2(123 BYTE),
  MIME_TYPE        VARCHAR2(100 BYTE),
  NOM_FICHR        VARCHAR2(100 BYTE)
)
LOB (CONTN) STORE AS BASICFILE (
  TABLESPACE  APEXFRAMEWORK
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
