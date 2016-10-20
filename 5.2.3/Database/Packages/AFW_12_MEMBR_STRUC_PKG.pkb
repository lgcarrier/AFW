SET DEFINE OFF;
create or replace package body afw_12_membr_struc_pkg
as
  function obten_code_utils_de_seqnc (pnu_seqnc_membr_struc in number)
    return varchar2
  is
    vva_code_utils   afw_12_utils.code_utils%type;
  begin
    begin
      select code_utils
        into vva_code_utils
        from vd_afw_12_utils       u
            ,vd_afw_12_membr_struc ms
       where     u.seqnc = ms.ref_utils
             and ms.seqnc = pnu_seqnc_membr_struc;
    exception
      when no_data_found
      then
        return null;
    end;

    return vva_code_utils;
  end;
end afw_12_membr_struc_pkg;
/
