SET DEFINE OFF;
CREATE TABLE AFW_12_SCENR_NOTFC_ACTIO
(
  SEQNC                       NUMBER(10),
  CODE                        VARCHAR2(23 BYTE),
  NOM                         VARCHAR2(200 BYTE),
  DESCR                       VARCHAR2(4000 BYTE),
  REF_SCENR_NOTFC             NUMBER(10),
  REF_STRUC_APLIC_STAT        NUMBER(10),
  REF_STAT                    NUMBER(10),
  REF_EVENM_NOTFB             NUMBER(10),
  UTILS_CREAT                 VARCHAR2(123 BYTE),
  DATE_CREAT                  DATE,
  UTILS_MODFC                 VARCHAR2(123 BYTE),
  DATE_MODFC                  DATE,
  DNR_REF_PRODT               NUMBER(10),
  REF_ATRIB_STRUC_APLIC_STAT  NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
