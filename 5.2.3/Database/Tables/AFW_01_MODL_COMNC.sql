SET DEFINE OFF;
CREATE TABLE AFW_01_MODL_COMNC
(
  SEQNC           NUMBER(10),
  CODE            VARCHAR2(23 BYTE),
  NOM             VARCHAR2(60 BYTE),
  DESCR           VARCHAR2(4000 BYTE),
  REF_TYPE_COMNC  NUMBER(10),
  DATE_CREAT      DATE,
  UTILS_CREAT     VARCHAR2(123 BYTE),
  DATE_MODFC      DATE,
  UTILS_MODFC     VARCHAR2(123 BYTE),
  INDIC_SYSTM     VARCHAR2(1 BYTE)              DEFAULT 'N',
  REF_DOMN        NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
