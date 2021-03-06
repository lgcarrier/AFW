SET DEFINE OFF;
CREATE TABLE AFW_13_PAGE_IR
(
  SEQNC                   NUMBER(10),
  LIBL_REGN               VARCHAR2(255 BYTE),
  ID_APEX                 NUMBER,
  REF_PAGE                NUMBER(10),
  DATE_CREAT              DATE,
  UTILS_CREAT             VARCHAR2(123 BYTE),
  DATE_MODFC              DATE,
  UTILS_MODFC             VARCHAR2(123 BYTE),
  LARGR_DEFT              NUMBER,
  UNITE_MESR_LARGR_DEFT   NUMBER(10),
  CODE                    VARCHAR2(23 BYTE),
  DNR_REF_APLIC           NUMBER(10),
  INDIC_FORCR_AJUST_PAGE  VARCHAR2(1 BYTE)      DEFAULT 'N',
  NOMBR_PAGE_LARGR        NUMBER(2)             DEFAULT 1
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
