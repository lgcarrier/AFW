SET DEFINE OFF;
CREATE TABLE AFW_21_PLUGN_ARBRE_NOEUD
(
  SEQNC              NUMBER(10),
  CODE               VARCHAR2(35 BYTE),
  NOM                VARCHAR2(60 BYTE),
  DESCR              VARCHAR2(2000 BYTE),
  REF_PLUGN_ARBRE    NUMBER(10),
  INDIC_SELCT_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O',
  INDIC_OUVRI_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O',
  INDIC_CREER_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O',
  INDIC_SUPRM_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O',
  DATE_CREAT         DATE,
  UTILS_CREAT        VARCHAR2(123 BYTE),
  DATE_MODFC         DATE,
  UTILS_MODFC        VARCHAR2(123 BYTE),
  INDIC_FERMR_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O',
  REF_RESRC          NUMBER(10),
  REF_OCURN_RESRC    NUMBER(10),
  DNR_REF_PRODT      NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/