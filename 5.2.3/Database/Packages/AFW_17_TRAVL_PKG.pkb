SET DEFINE OFF;
create or replace package body afw_17_travl_pkg
as
  procedure obten_semph (pva_natr_envo in varchar2)
  is
  begin
    afw_07_semph_pkg.obten_semph (   'AFW_17_TRAVL_'
                                  || pva_natr_envo
                                 ,null
                                 ,null
                                 ,null
                                 ,'O'
                                 ,0);
  end obten_semph;

  procedure libr_semph (pva_natr_envo in varchar2)
  is
  begin
    afw_07_semph_pkg.suprm_semph (   'AFW_17_TRAVL_'
                                  || pva_natr_envo
                                 ,null
                                 ,null
                                 ,null);
  end libr_semph;

  procedure exect_envoi_sms
  is
  begin
    obten_semph ('SMS');
    libr_semph ('SMS');
  exception
    when afw_07_semph_pkg.semph_non_dispn
    then
      null;
    when others
    then
      ete ();
  end exect_envoi_sms;

  procedure exect_envoi_courl
  is
  begin
    obten_semph ('COURL');

    afw_17_envoi_courl_pkg.envoy_toute_fil_atent ();

    libr_semph ('COURL');
  exception
    when afw_07_semph_pkg.semph_non_dispn
    then
      raise;
    when others
    then
      ete ();
  end exect_envoi_courl;

  procedure exect_envoi_telcp
  is
  begin
    obten_semph ('TELCP');
    libr_semph ('TELCP');
  exception
    when afw_07_semph_pkg.semph_non_dispn
    then
      null;
    when others
    then
      ete ();
  end exect_envoi_telcp;
end afw_17_travl_pkg;
/
