SET DEFINE OFF;
create or replace package afw_12_audit_struc_aplic_pkg
as
  kva_creat   constant varchar2 (3) default 'CRE';
  kva_modfc   constant varchar2 (3) default 'MOD';
  kva_suprs   constant varchar2 (3) default 'SUP';
  kva_afich   constant varchar2 (3) default 'AFF';
  kva_persn   constant varchar2 (3) default 'PER';

  procedure inscr_audit_afich_page;

  procedure inscr_audit (pnu_seqnc_struc_aplic   in number
                        ,pnu_prodt               in number
                        ,pva_code_struc_aplic    in varchar2
                        ,pva_type                in varchar2
                        ,pva_valr_formt          in varchar2
                        ,pan_ancn_valr           in anydata default null
                        ,pan_nouvl_valr          in anydata default null);

  function inscr_audit (pnu_seqnc_struc_aplic   in number
                       ,pnu_prodt               in number
                       ,pva_code_struc_aplic    in varchar2
                       ,pva_type                in varchar2
                       ,pva_valr_formt          in varchar2
                       ,pan_ancn_valr           in anydata default null
                       ,pan_nouvl_valr          in anydata default null)
    return number;
end afw_12_audit_struc_aplic_pkg;
/
