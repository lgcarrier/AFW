SET DEFINE OFF;
create or replace package afw_01_destn_evenm_notfb_pkg
  authid current_user
is
  type gty_destn is record
  (
    nom_formt          varchar2 (200)
   ,adres_destn        varchar2 (500)
   ,numr_telph_destn   varchar2 (16)
  );

  type gta_destn is table of gty_destn;

  function resdr (pnu_seqnc_destn_confg   in number
                 ,pnu_seqnc_struc_aplic   in number)
    return afw_01_destn_evenm_notfb_pkg.gta_destn;
end afw_01_destn_evenm_notfb_pkg;
/
