SET DEFINE OFF;
create or replace package body afw_01_type_comnc_pkg
is
  type typ_tab_const is table of varchar2 (30)
    index by varchar2 (30);

  tab_const   typ_tab_const;


  procedure intls_const
  is
  begin
    tab_const ('kva_code_courl')   := kva_code_courl;
    tab_const ('kva_code_sms')     := kva_code_sms;
    tab_const ('kva_code_ecran')   := kva_code_ecran;
  end intls_const;

  function obtnr_const (pva_const in varchar2)
    return varchar2
  is
  begin
    return tab_const (lower (pva_const));
  end obtnr_const;

  function obten_code (pnu_type_comnc in vd_i_afw_01_type_comnc.seqnc%type)
    return vd_i_afw_01_type_comnc.code%type
  is
    vva_code   vd_i_afw_01_type_comnc.code%type;
  begin
    select tc.code
      into vva_code
      from vd_i_afw_01_type_comnc tc
     where tc.seqnc = pnu_type_comnc;

    return vva_code;
  exception
    when no_data_found
    then
      return null;
  end obten_code;
begin
  intls_const;
end afw_01_type_comnc_pkg;
/
