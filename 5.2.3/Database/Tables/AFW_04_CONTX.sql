SET DEFINE OFF;
CREATE TABLE AFW_04_CONTX
(
  REF_FIL_ARIAN          NUMBER(10),
  CONTX                  VARCHAR2(30 BYTE),
  ACTIO                  VARCHAR2(200 BYTE),
  SEQNC_CONTX            NUMBER(10),
  DATE_CREAT             DATE,
  UTILS_CREAT            VARCHAR2(123 BYTE),
  DATE_MODFC             DATE,
  UTILS_MODFC            VARCHAR2(123 BYTE),
  CONTX_INTER            VARCHAR2(30 BYTE),
  ACTIO_INTER            VARCHAR2(200 BYTE),
  SEQNC_CONTX_INTER      NUMBER(10),
  INDIC_IGNOR            VARCHAR2(1 BYTE),
  NOM_PROCD_INFOR_SUPLM  VARCHAR2(92 BYTE),
  INFOR_SUPLM            VARCHAR2(4000 BYTE),
  CONTX_FORMT            VARCHAR2(4000 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
