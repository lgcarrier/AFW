SET DEFINE OFF;
CREATE TABLE AFW_12_GROUP_UTILS
(
  SEQNC                    NUMBER(10),
  NOM                      VARCHAR2(100 BYTE),
  DESCR                    VARCHAR2(2000 BYTE),
  DATE_CREAT               DATE,
  UTILS_CREAT              VARCHAR2(123 BYTE),
  DATE_MODFC               DATE,
  UTILS_MODFC              VARCHAR2(123 BYTE),
  REF_PRODT                NUMBER(10),
  CODE                     VARCHAR2(29 BYTE),
  INDIC_IGNOR_GROUP_ADMIN  VARCHAR2(1 BYTE)     DEFAULT 'N',
  INDIC_SYSTM              VARCHAR2(1 BYTE)     DEFAULT 'N',
  DNR_REF_PRODT            NUMBER(10),
  REF_DOMN                 NUMBER(10),
  INDIC_ACCES_GLOBL        VARCHAR2(1 BYTE)     DEFAULT 'N',
  REF_FONCT                NUMBER(10),
  INDIC_GROUP_APLIC        VARCHAR2(1 BYTE)     DEFAULT 'N'
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
