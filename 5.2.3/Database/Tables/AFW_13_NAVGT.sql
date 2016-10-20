SET DEFINE OFF;
CREATE TABLE AFW_13_NAVGT
(
  SEQNC              NUMBER(14),
  REF_ID_SESN        NUMBER,
  INDIC_EXTRA_TOTAL  VARCHAR2(1 BYTE),
  TAIL_TABL_EXTRA    NUMBER(10),
  NOMBR_RANG_EXTRA   NUMBER(8),
  ENONC_SQL          CLOB,
  DATE_CREAT         DATE,
  UTILS_CREAT        VARCHAR2(123 BYTE),
  DATE_MODFC         DATE,
  UTILS_MODFC        VARCHAR2(123 BYTE),
  INDIC_EXTRA_TERMN  VARCHAR2(1 BYTE)           DEFAULT 'N',
  APEX_REPTS_ID      NUMBER,
  REF_RAPRT_INTER    NUMBER(10),
  REF_FIL_ARIAN      NUMBER(10)
)
LOB (ENONC_SQL) STORE AS BASICFILE (
  TABLESPACE  APEXFRAMEWORK
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING
      STORAGE    (
                  INITIAL          64K
                  NEXT             1M
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/