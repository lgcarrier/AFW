SET DEFINE OFF;
CREATE TABLE AFW_17_SMS_TWILI_ENTRA
(
  SEQNC                   NUMBER(10),
  TW_RECPT_ACCOUNTSID     VARCHAR2(100 BYTE),
  TW_RECPT_APIVERSION     VARCHAR2(10 BYTE),
  TW_RECPT_BODY           VARCHAR2(200 BYTE),
  TW_RECPT_FROM           VARCHAR2(16 BYTE),
  TW_RECPT_FROMCITY       VARCHAR2(100 BYTE),
  TW_RECPT_FROMCOUNTRY    VARCHAR2(100 BYTE),
  TW_RECPT_FROMSTATE      VARCHAR2(100 BYTE),
  TW_RECPT_FROMZIP        VARCHAR2(100 BYTE),
  TW_RECPT_SMSMESSAGESID  VARCHAR2(100 BYTE),
  TW_RECPT_SMSSID         VARCHAR2(100 BYTE),
  TW_RECPT_SMSSTATUS      VARCHAR2(30 BYTE),
  TW_RECPT_TO             VARCHAR2(16 BYTE),
  TW_RECPT_TOCITY         VARCHAR2(100 BYTE),
  TW_RECPT_TOCOUNTRY      VARCHAR2(100 BYTE),
  TW_RECPT_TOSTATE        VARCHAR2(200 BYTE),
  TW_RECPT_TOZIP          VARCHAR2(20 BYTE),
  DATE_CREAT              DATE,
  UTILS_CREAT             VARCHAR2(123 BYTE),
  DATE_MODFC              DATE,
  UTILS_MODFC             VARCHAR2(123 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING
/