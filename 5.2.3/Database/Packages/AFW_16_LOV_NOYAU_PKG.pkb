SET DEFINE OFF;
create or replace package body afw_16_lov_noyau_pkg
as
  function obten_lov_item (pnu_seqnc_item in number)
    return varchar2
  is
    vva_lov   varchar2 (4000);
  begin
    select aip.lov
      into vva_lov
      from vd_i_afw_13_page_item pi
          ,apex_item_page        aip
     where     pi.seqnc = pnu_seqnc_item
           and aip.id = pi.id_apex;

    return vva_lov;
  exception
    when no_data_found
    then
      return null;
  end;
end afw_16_lov_noyau_pkg;
/
