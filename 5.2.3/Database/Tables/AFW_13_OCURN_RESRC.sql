SET DEFINE OFF;
CREATE TABLE AFW_13_OCURN_RESRC
(
  SEQNC            NUMBER(10),
  REF_RESRC        NUMBER(10),
  REF_FORMT_RESRC  NUMBER(10),
  REF_MIME_TYPE    NUMBER(10),
  NOM_PHYSQ        VARCHAR2(300 BYTE),
  DATE_CREAT       DATE,
  UTILS_CREAT      VARCHAR2(123 BYTE),
  DATE_MODFC       DATE,
  UTILS_MODFC      VARCHAR2(123 BYTE),
  CORDN_X_DEBUT    NUMBER(6),
  CORDN_Y_DEBUT    NUMBER(10),
  LARGR_PREPN      NUMBER(3),
  HAUTR_PREPN      NUMBER(3),
  NOM              VARCHAR2(60 BYTE),
  REF_DOSR_VIRTL   NUMBER(10),
  REF_VERSN        NUMBER(10),
  DNR_REF_PRODT    NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
