SET DEFINE OFF;
CREATE TABLE AFW_03_JOURN_STRUC_APLIC
(
  SEQNC              NUMBER(12),
  REF_DOMN           NUMBER(10),
  STRUC_APLIC        NUMBER(10),
  SEQNC_STRUC_APLIC  NUMBER(10),
  DATE_TIME          DATE,
  NUMR_ERR           VARCHAR2(10 BYTE),
  ACTIO_JOURN        VARCHAR2(200 BYTE),
  DON_NOMNL          VARCHAR2(200 BYTE),
  RESLT              VARCHAR2(500 BYTE),
  DATE_CREAT         DATE,
  UTILS_CREAT        VARCHAR2(123 BYTE),
  DATE_MODFC         DATE,
  UTILS_MODFC        VARCHAR2(123 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
