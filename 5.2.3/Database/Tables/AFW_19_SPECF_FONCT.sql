SET DEFINE OFF;
CREATE TABLE AFW_19_SPECF_FONCT
(
  SEQNC              NUMBER(10),
  REF_DISPN_FONCT    NUMBER(10),
  REF_ITEM           NUMBER(10),
  REF_PAGE           NUMBER(10),
  REF_DV_TYPE_SUBST  NUMBER(10),
  VALR_ATRIB_1       VARCHAR2(200 BYTE),
  VALR_ATRIB_2       VARCHAR2(200 BYTE),
  VALR_ATRIB_3       VARCHAR2(200 BYTE),
  VALR_ATRIB_4       VARCHAR2(200 BYTE),
  VALR_ATRIB_5       VARCHAR2(200 BYTE),
  DATE_CREAT         DATE,
  UTILS_CREAT        VARCHAR2(123 BYTE),
  DATE_MODFC         DATE,
  UTILS_MODFC        VARCHAR2(123 BYTE),
  DNR_REF_PAGE       NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
