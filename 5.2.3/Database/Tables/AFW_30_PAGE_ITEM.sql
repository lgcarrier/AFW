SET DEFINE OFF;
CREATE TABLE AFW_30_PAGE_ITEM
(
  SEQNC                 NUMBER(10),
  REF_AFW_30_PAGE       NUMBER(10),
  REF_ITEM_CARNT_PRODT  NUMBER(10),
  DATE_CREAT            DATE,
  UTILS_CREAT           VARCHAR2(123 BYTE),
  DATE_MODFC            DATE,
  UTILS_MODFC           VARCHAR2(123 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/
