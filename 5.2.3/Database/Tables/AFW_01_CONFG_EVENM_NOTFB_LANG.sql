SET DEFINE OFF;
CREATE TABLE AFW_01_CONFG_EVENM_NOTFB_LANG
(
  SEQNC                  NUMBER(10),
  REF_CONFG_EVENM_NOTFB  NUMBER(10),
  REF_LANG               NUMBER(10),
  OBJET                  VARCHAR2(200 BYTE),
  TITRE_MESG             VARCHAR2(60 BYTE),
  MESG_SMS               VARCHAR2(160 BYTE),
  MESG                   CLOB,
  DATE_CREAT             DATE,
  UTILS_CREAT            VARCHAR2(123 BYTE),
  DATE_MODFC             DATE,
  UTILS_MODFC            VARCHAR2(123 BYTE),
  DNR_REF_DOMN           NUMBER(10)
)
LOB (MESG) STORE AS BASICFILE (
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
