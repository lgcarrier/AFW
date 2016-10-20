SET DEFINE OFF;
create or replace package body afw_36_type_don_pkg
as
  function obten_mesg_place_holdr (pnu_type_don in number)
    return varchar2
  is
    vva_mesg_place_holdr   varchar2 (30);
  begin
    select mesg_place_holdr
      into vva_mesg_place_holdr
      from vd_i_afw_36_type_don
     where seqnc = pnu_type_don;

    return vva_mesg_place_holdr;
  exception
    when no_data_found
    then
      return null;
  end obten_mesg_place_holdr;
end afw_36_type_don_pkg;
/
