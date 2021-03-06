SET DEFINE OFF;
CREATE TABLE AFW_37_GADGT_PARMT_RACRC
(
  SEQNC            NUMBER(10),
  REF_PRODT        NUMBER(10),
  CODE             VARCHAR2(23 BYTE),
  NOM              VARCHAR2(50 BYTE),
  REF_DV_TYPE_DON  NUMBER(10),
  FORML_DON        VARCHAR2(4000 BYTE),
  INDIC_GENRQ      CHAR(1 BYTE)                 DEFAULT 'O',
  DESCR            VARCHAR2(4000 BYTE),
  DATE_CREAT       DATE,
  UTILS_CREAT      VARCHAR2(123 BYTE),
  DATE_MODFC       DATE,
  UTILS_MODFC      VARCHAR2(123 BYTE),
  DNR_REF_PRODT    NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
