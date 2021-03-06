SET DEFINE OFF;
CREATE TABLE AFW_07_AUDIT_STRUC_APLIC
(
  SEQNC                   NUMBER(16),
  REF_UTILS               NUMBER(10),
  REF_SEQNC_STRUC_APLIC   NUMBER(10),
  DNR_REF_SEQNC_SA_FORMT  VARCHAR2(4000 BYTE),
  REF_STRUC_APLIC         NUMBER(10),
  REF_ACTIO_AUDIT         NUMBER(10),
  REF_PAGE                NUMBER(10),
  NATR_AUDIT              VARCHAR2(3 BYTE),
  DATE_CREAT              DATE,
  UTILS_CREAT             VARCHAR2(123 BYTE),
  DATE_MODFC              DATE,
  UTILS_MODFC             VARCHAR2(123 BYTE),
  REF_DOMN                NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
