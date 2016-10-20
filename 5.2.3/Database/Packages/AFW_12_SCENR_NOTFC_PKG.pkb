SET DEFINE OFF;
create or replace package body afw_12_scenr_notfc_pkg
as
  function obten_seqnc (pva_code    in vd_i_afw_12_scenr_notfc.code%type
                       ,pnu_prodt   in vd_i_afw_12_scenr_notfc.ref_prodt%type default afw_11_prodt_pkg.obten_prodt_sesn)
    return vd_i_afw_12_scenr_notfc.seqnc%type
  is
    vnu_seqnc   vd_i_afw_12_scenr_notfc.seqnc%type;
  begin
    select seqnc
      into vnu_seqnc
      from vd_i_afw_12_scenr_notfc
     where     code = pva_code
           and ref_prodt = pnu_prodt;

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return null;
  end obten_seqnc;

  function obten_code (pnu_seqnc   in vd_i_afw_12_scenr_notfc.seqnc%type
                      ,pnu_prodt   in vd_i_afw_12_scenr_notfc.ref_prodt%type default afw_11_prodt_pkg.obten_prodt_sesn)
    return vd_i_afw_12_scenr_notfc.code%type
  is
    vva_code   vd_i_afw_12_scenr_notfc.code%type;
  begin
    select code
      into vva_code
      from vd_i_afw_12_scenr_notfc
     where     seqnc = pnu_seqnc
           and ref_prodt = pnu_prodt;

    return vva_code;
  exception
    when no_data_found
    then
      return null;
  end obten_code;
end afw_12_scenr_notfc_pkg;
/
