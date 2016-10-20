SET DEFINE OFF;
CREATE TABLE AFW_19_BOUTN
(
  SEQNC                        NUMBER(10),
  REF_LANG                     NUMBER(10),
  REF_DISPN_FONCT              NUMBER(10),
  ITEM_SUBST                   VARCHAR2(60 BYTE),
  ID_TEMPL_BOUTN               NUMBER,
  TEMPL_BOUTN                  VARCHAR2(4000 BYTE),
  DATE_CREAT                   DATE,
  UTILS_CREAT                  VARCHAR2(123 BYTE),
  DATE_MODFC                   DATE,
  UTILS_MODFC                  VARCHAR2(123 BYTE),
  LIBL                         VARCHAR2(200 BYTE),
  INDIC_ACTIF                  VARCHAR2(1 BYTE) DEFAULT 'O',
  REF_DV_TYPE_MESG_AIDE_CONTX  NUMBER(10),
  MESG_AIDE_CONTX              VARCHAR2(200 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
