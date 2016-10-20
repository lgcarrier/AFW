SET DEFINE OFF;
CREATE TABLE AFW_11_ENTIT
(
  SEQNC                    NUMBER(10),
  NOM                      VARCHAR2(60 BYTE),
  NOM_TABLE_TEMPR          VARCHAR2(30 BYTE),
  NOM_TABLE_EREUR          VARCHAR2(30 BYTE),
  INDIC_CREER_OCURN        VARCHAR2(1 BYTE),
  INDIC_MODIF_OCURN        VARCHAR2(1 BYTE),
  INDIC_SUPRM_OCURN        VARCHAR2(1 BYTE),
  REF_VERSN                NUMBER(10),
  DATE_CREAT               DATE,
  UTILS_CREAT              VARCHAR2(123 BYTE),
  DATE_MODFC               DATE,
  UTILS_MODFC              VARCHAR2(123 BYTE),
  ORDRE_EXECT              NUMBER(10)           DEFAULT 1,
  DNR_REF_PRODT            NUMBER(10),
  CODE                     VARCHAR2(30 BYTE),
  INDIC_FORCE_SELCT        VARCHAR2(1 BYTE)     DEFAULT 'N',
  LONGR_BLOC               NUMBER(5),
  INDIC_NOUVL_ENTIT        VARCHAR2(1 BYTE)     DEFAULT 'O',
  NIV_INCLU_MIGRT          VARCHAR2(23 BYTE),
  CONFG_INCLU_MIGRT        VARCHAR2(4000 BYTE),
  REF_ATRIB_ENTIT_SUPR     NUMBER(10),
  INDIC_EXPOR_TABL_INDEX   VARCHAR2(1 BYTE)     DEFAULT 'O',
  INDIC_SUPRM_DON_PRODT    VARCHAR2(1 BYTE)     DEFAULT 'N',
  INDIC_DEPLM_INTER_PRODT  VARCHAR2(1 BYTE)     DEFAULT 'N',
  WHERE_CLAUS_CUSTM        VARCHAR2(4000 BYTE),
  REF_SCHEM_PRODT          NUMBER(10)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/