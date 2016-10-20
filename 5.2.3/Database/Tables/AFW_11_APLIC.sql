SET DEFINE OFF;
CREATE TABLE AFW_11_APLIC
(
  SEQNC                      NUMBER(10),
  CODE                       VARCHAR2(30 BYTE),
  NOM                        VARCHAR2(60 BYTE),
  DATE_CREAT                 DATE,
  UTILS_CREAT                VARCHAR2(123 BYTE),
  DATE_MODFC                 DATE,
  UTILS_MODFC                VARCHAR2(123 BYTE),
  NUMR_APLIC_APEX            NUMBER,
  DATE_DERNR_MAJ_REFRN_APEX  DATE,
  REF_VERSN                  NUMBER(10),
  INDIC_APLIC_AUTHE          VARCHAR2(1 BYTE)   DEFAULT 'N',
  REF_APLIC_AUTHE            NUMBER(10),
  REF_PAGE_CONXN             NUMBER(10),
  REF_PRODT                  NUMBER(10),
  DNR_REF_PRODT              NUMBER(10),
  REF_PAGE_ACUEI             NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
