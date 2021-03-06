SET DEFINE OFF;
CREATE TABLE AFW_13_EMPLA_DOSR_VIRTL
(
  SEQNC           NUMBER(10),
  REF_DOSR_VIRTL  NUMBER(10),
  REF_VERSN       NUMBER(10),
  EMPLA           VARCHAR2(100 BYTE),
  DATE_CREAT      DATE,
  UTILS_CREAT     VARCHAR2(123 BYTE),
  DATE_MODFC      DATE,
  UTILS_MODFC     VARCHAR2(123 BYTE),
  DNR_REF_PRODT   NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
