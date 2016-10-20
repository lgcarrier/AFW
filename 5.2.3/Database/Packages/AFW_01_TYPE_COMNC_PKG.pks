SET DEFINE OFF;
create or replace package afw_01_type_comnc_pkg
is
  kva_code_courl   constant varchar2 (30) default 'COURL';
  kva_code_sms     constant varchar2 (30) default 'SMS';
  kva_code_ecran   constant varchar2 (30) default 'ECRAN';

  function obtnr_const (pva_const in varchar2)
    return varchar2;

  function obten_code (pnu_type_comnc in vd_i_afw_01_type_comnc.seqnc%type)
    return vd_i_afw_01_type_comnc.code%type;
end afw_01_type_comnc_pkg;
/
