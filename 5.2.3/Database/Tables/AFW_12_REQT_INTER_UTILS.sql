SET DEFINE OFF;
CREATE TABLE AFW_12_REQT_INTER_UTILS
(
  SEQNC                        NUMBER(10),
  IDENT                        RAW(16),
  REF_UTILS                    NUMBER(10),
  REF_DV_TYPE_REQT_INTER       NUMBER(10),
  DATE_DEBUT_EFECT             DATE,
  DATE_FIN_EFECT               DATE,
  DATE_CREAT                   DATE,
  UTILS_CREAT                  VARCHAR2(123 BYTE),
  DATE_MODFC                   DATE,
  UTILS_MODFC                  VARCHAR2(123 BYTE),
  REF_DOMN                     NUMBER(10),
  REF_PRODT                    NUMBER(10),
  NUMR_APLIC_APEX              NUMBER,
  NUMR_PAGE_APEX               NUMBER,
  DATE_TRAIT                   DATE,
  PROCD_PERSN_URL_APRES_AUTHE  VARCHAR2(92 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
