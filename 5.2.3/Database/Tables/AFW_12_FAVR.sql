SET DEFINE OFF;
CREATE TABLE AFW_12_FAVR
(
  SEQNC                  NUMBER(10),
  REF_STRUC_APLIC        NUMBER(10),
  REF_SEQNC_STRUC_APLIC  NUMBER(10),
  REF_UTILS              NUMBER(10),
  DATE_CREAT             DATE,
  UTILS_CREAT            VARCHAR2(123 BYTE),
  DATE_MODFC             DATE,
  UTILS_MODFC            VARCHAR2(123 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
