SET DEFINE OFF;
create or replace package body afw_25_type_travl_pkg
is
  function obten_seqnc (pnu_domn   in number
                       ,pva_code   in varchar2)
    return vd_afw_25_type_publc.seqnc%type
  is
    vnu_seqnc   vd_afw_25_type_publc.seqnc%type;
  begin
    select seqnc
      into vnu_seqnc
      from vd_afw_25_type_travl
     where     ref_domn = pnu_domn
           and code = pva_code;

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return null;
  end obten_seqnc;
end afw_25_type_travl_pkg;
/
