SET DEFINE OFF;
CREATE TABLE AFW_12_GROUP_GADGT_UTILS
(
  SEQNC            NUMBER(10),
  REF_UTILS        NUMBER(10),
  REF_TABL_BORD    NUMBER(10),
  NOM              VARCHAR2(250 BYTE),
  INDIC_SYSTM      CHAR(1 BYTE)                 DEFAULT 'N',
  CONFG_GRIL       CLOB,
  CONFG_GADGT      CLOB,
  DATE_CREAT       DATE,
  UTILS_CREAT      VARCHAR2(123 BYTE),
  DATE_MODFC       DATE,
  UTILS_MODFC      VARCHAR2(123 BYTE),
  REF_UTILS_DEMDR  NUMBER(10)
)
LOB (CONFG_GRIL) STORE AS BASICFILE (
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
LOB (CONFG_GADGT) STORE AS BASICFILE (
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
