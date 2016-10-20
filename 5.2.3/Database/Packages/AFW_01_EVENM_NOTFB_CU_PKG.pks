SET DEFINE OFF;
create or replace package afw_01_evenm_notfb_cu_pkg
  authid current_user
as
  type typ_rec_destn is record
  (
    nom_formt     varchar2 (4000)
   ,adres_courl   varchar2 (200)
   ,numr_telph    number (10)
   ,type_destn    varchar2 (23)
  );

  type typ_tab_destn is table of typ_rec_destn
    index by pls_integer;

  type typ_rec_piec_joint is record
  (
    nom         varchar2 (4000)
   ,mime_type   varchar2 (200)
   ,contn       blob
   ,tail        number
  );

  type typ_tab_piec_joint is table of typ_rec_piec_joint
    index by pls_integer;

  function resdr_ocurn_destn (pnu_seqnc_destn_confg   in number
                             ,pnu_seqnc_struc_aplic   in number)
    return afw_01_destn_evenm_notfb_pkg.gta_destn;

  procedure apliq_confg (pnu_confg               in number
                        ,pnu_seqnc_struc_aplic   in number
                        ,pnu_lang                in number);

  procedure propg_evenm_notfb (pva_evenm_notfb         in varchar2
                              ,pnu_seqnc_struc_aplic   in number
                              ,pva_code_prodt          in varchar2 default null
                              ,pva_code_domn           in varchar2 default null
                              ,pnu_utils_tracr_histr   in number default null
                              ,pnu_lang                in number default null);
end afw_01_evenm_notfb_cu_pkg;
/
