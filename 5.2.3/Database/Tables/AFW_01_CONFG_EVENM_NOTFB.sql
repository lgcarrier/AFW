SET DEFINE OFF;
CREATE TABLE AFW_01_CONFG_EVENM_NOTFB
(
  SEQNC             NUMBER(10),
  REF_TYPE_COMNC    NUMBER(10),
  DATE_CREAT        DATE,
  UTILS_CREAT       VARCHAR2(123 BYTE),
  DATE_MODFC        DATE,
  UTILS_MODFC       VARCHAR2(123 BYTE),
  REF_EVENM_NOTFB   NUMBER(10),
  NOM               VARCHAR2(60 BYTE),
  DESCR             VARCHAR2(4000 BYTE),
  REF_DOMN          NUMBER(10),
  REF_COMPT_TWILI   NUMBER(10),
  REF_PROFL_COURL   NUMBER(10),
  INDIC_DEFT        VARCHAR2(1 BYTE)            DEFAULT 'N',
  INDIC_ENVOI_DIFR  VARCHAR2(1 BYTE)            DEFAULT 'O',
  DNR_REF_DOMN      NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/