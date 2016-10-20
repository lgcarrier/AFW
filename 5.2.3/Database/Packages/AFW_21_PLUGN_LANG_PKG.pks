SET DEFINE OFF;
create or replace package afw_21_plugn_lang_pkg
  authid current_user
as
  kva_colct_plugn_lang   constant varchar2 (23) := 'COLCT_PLUGN_LANG';
  kva_clas_champ_tradc   constant varchar2 (30) := 'tradc_champ';
  kva_champ_atrib_lang   constant varchar2 (30) := 'data-afw-lang';
  kva_champ_atrib_code   constant varchar2 (30) := 'data-afw-atrib-struc-aplic';

  type gty_tradc is record
  (
    ref_lang                number
   ,ref_struc_aplic         number
   ,ref_seqnc_struc_aplic   number
   ,atrib_struc_aplic       varchar2 (30)
   ,valr                    varchar2 (4000)
  );

  type gta_tradc is table of gty_tradc;

  procedure sauvg_tradc (pnu_lang                in number
                        ,pnu_struc_aplic         in number
                        ,pnu_seqnc_struc_aplic   in number
                        ,pva_atrib_struc_aplic   in varchar2
                        ,pva_valr                in varchar2);

  function obten_tradc (pnu_lang                in number
                       ,pnu_struc_aplic         in number
                       ,pnu_seqnc_struc_aplic   in number
                       ,pva_atrib_struc_aplic   in varchar2)
    return varchar2;

  function obten_seqnc_tradc (pnu_lang                in number
                             ,pnu_struc_aplic         in number
                             ,pnu_seqnc_struc_aplic   in number
                             ,pva_atrib_struc_aplic   in varchar2)
    return number;

  function obten_nom_colct_plugn_lang
    return varchar2;

  procedure reint_tradc (pnu_struc_aplic in number);

  function obten_tradc_struc_aplic (pnu_struc_aplic         in number
                                   ,pnu_seqnc_struc_aplic   in number)
    return gta_tradc;
end afw_21_plugn_lang_pkg;
/
