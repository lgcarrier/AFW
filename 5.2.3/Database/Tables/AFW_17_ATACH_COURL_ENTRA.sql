SET DEFINE OFF;
CREATE TABLE AFW_17_ATACH_COURL_ENTRA
(
  SEQNC                  NUMBER(18),
  REF_COURL_ENTRA        NUMBER(16),
  NOM                    VARCHAR2(100 BYTE),
  CONTN                  BLOB,
  REF_MIME_TYPE          NUMBER(10),
  PROPR                  VARCHAR2(4000 BYTE),
  TAIL                   NUMBER(10),
  DATE_CREAT             DATE,
  UTILS_CREAT            VARCHAR2(123 BYTE),
  DATE_MODFC             DATE,
  UTILS_MODFC            VARCHAR2(123 BYTE),
  NUMR_PIECE_CORPS_MESG  VARCHAR2(4 BYTE)
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
