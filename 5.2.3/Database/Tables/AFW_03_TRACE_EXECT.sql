SET DEFINE OFF;
CREATE TABLE AFW_03_TRACE_EXECT
(
  UN             VARCHAR2(4000 BYTE),
  DEUX           VARCHAR2(4000 BYTE),
  DTHR           TIMESTAMP(9),
  UTILS          VARCHAR2(30 BYTE)              DEFAULT user,
  SEQNC          NUMBER(10),
  LB             CLOB,
  WHO_CALLED_ME  VARCHAR2(4000 BYTE),
  PAGE           NUMBER,
  APP            NUMBER,
  APP_USER       VARCHAR2(30 BYTE),
  FIL            NUMBER(10),
  DUREE          NUMBER(20,3),
  BB             BLOB,
  XML            SYS.XMLTYPE
)
LOB (LB) STORE AS BASICFILE (
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
LOB (BB) STORE AS BASICFILE (
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
XMLTYPE XML STORE AS SECUREFILE BINARY XML (
  TABLESPACE  APEXFRAMEWORK
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  NOCACHE
  LOGGING
      STORAGE    (
                  INITIAL          104K
                  NEXT             1M
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                 ))
ALLOW NONSCHEMA
DISALLOW ANYSCHEMA
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
