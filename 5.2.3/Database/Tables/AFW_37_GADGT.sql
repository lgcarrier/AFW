SET DEFINE OFF;
CREATE TABLE AFW_37_GADGT
(
  SEQNC             NUMBER(10),
  REF_PRODT         NUMBER(10),
  REF_STRUC_APLIC   NUMBER(10),
  REF_GADGT_CATGR   NUMBER(10),
  CODE              VARCHAR2(23 BYTE),
  NOM               VARCHAR2(250 BYTE),
  PROCD_GENRT       VARCHAR2(123 BYTE),
  PROCD_AJAX        VARCHAR2(123 BYTE),
  CLASS_CSS         VARCHAR2(100 CHAR),
  DESCR             VARCHAR2(4000 BYTE),
  ICONE             VARCHAR2(30 BYTE),
  ORDRE_PRESN       NUMBER,
  DATE_DEBUT_EFECT  DATE                        DEFAULT SYSDATE,
  DATE_FIN_EFECT    DATE,
  DATE_CREAT        DATE,
  UTILS_CREAT       VARCHAR2(123 BYTE),
  DATE_MODFC        DATE,
  UTILS_MODFC       VARCHAR2(123 BYTE),
  DNR_REF_PRODT     NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
