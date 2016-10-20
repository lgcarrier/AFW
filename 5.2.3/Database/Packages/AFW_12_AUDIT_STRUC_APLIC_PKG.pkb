SET DEFINE OFF;
create or replace package body afw_12_audit_struc_aplic_pkg
as
  procedure inscr_audit_afich_page
  is
  begin
    null;
  end inscr_audit_afich_page;

  procedure inscr_audit (pnu_seqnc_struc_aplic   in number
                        ,pnu_prodt               in number
                        ,pva_code_struc_aplic    in varchar2
                        ,pva_type                in varchar2
                        ,pva_valr_formt          in varchar2
                        ,pan_ancn_valr           in anydata default null
                        ,pan_nouvl_valr          in anydata default null)
  is
    vnu_audit   number (16);
  begin
    vnu_audit      :=
      inscr_audit (pnu_seqnc_struc_aplic
                  ,pnu_prodt
                  ,pva_code_struc_aplic
                  ,pva_type
                  ,pva_valr_formt
                  ,pan_ancn_valr
                  ,pan_nouvl_valr);
  end inscr_audit;

  function inscr_audit (pnu_seqnc_struc_aplic   in number
                       ,pnu_prodt               in number
                       ,pva_code_struc_aplic    in varchar2
                       ,pva_type                in varchar2
                       ,pva_valr_formt          in varchar2
                       ,pan_ancn_valr           in anydata default null
                       ,pan_nouvl_valr          in anydata default null)
    return number
  is
  begin
    --op()
    return null;
  end inscr_audit;
end afw_12_audit_struc_aplic_pkg;
/
