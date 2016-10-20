SET DEFINE OFF;
create or replace package body afw_12_scenr_notfc_actio_pkg
as
  function obten_seqnc (pva_scenr_notfc_code   in varchar2
                       ,pva_actio_code         in varchar2
                       ,pnu_prodt              in vd_i_afw_12_scenr_notfc.ref_prodt%type default afw_11_prodt_pkg.obten_prodt_sesn)
    return vd_i_afw_12_scenr_notfc_actio.seqnc%type
  is
    vnu_seqnc   vd_i_afw_12_scenr_notfc_actio.seqnc%type;
  begin
    select sna.seqnc
      into vnu_seqnc
      from vd_i_afw_12_scenr_notfc_actio sna
          ,vd_i_afw_12_scenr_notfc       sn
     where     sna.code = pva_actio_code
           and sna.ref_scenr_notfc = sn.seqnc
           and sn.code = pva_scenr_notfc_code
           and sn.ref_prodt = pnu_prodt;

    return vnu_seqnc;
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
end afw_12_scenr_notfc_actio_pkg;
/
