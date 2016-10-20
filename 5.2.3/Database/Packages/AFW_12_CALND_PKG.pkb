SET DEFINE OFF;
create or replace package body afw_12_calnd_pkg
as
  function obten_date (pnu_numr_apex_regn in number)
    return date
  is
    vda_date_calnd   date;
  begin
    vda_date_calnd      :=
      nvl (afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_date)
          ,afw_07_sesn_pkg.obten_valr_sesn (   'S_AFW_21_CALND_'
                                            || pnu_numr_apex_regn
                                            || '_DATE'));

    afw_07_sesn_pkg.suprm_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_date);

    return vda_date_calnd;
  end obten_date;

  function obten_mode (pnu_numr_apex_regn in number)
    return varchar2
  is
    vva_mode_calnd   varchar2 (30);
  begin
    vva_mode_calnd      :=
      nvl (afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_mode)
          ,afw_07_sesn_pkg.obten_valr_sesn (   'S_AFW_21_CALND_'
                                            || pnu_numr_apex_regn
                                            || '_MODE'));

    afw_07_sesn_pkg.suprm_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_mode);

    return vva_mode_calnd;
  end obten_mode;

  function obten_type_agend
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_type_agend);
  end obten_type_agend;

  function obten_selct_indic_journ_compl
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_selct_indic_journ_compl);
  end obten_selct_indic_journ_compl;

  function obten_selct_date_debut
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_selct_date_debut);
  end obten_selct_date_debut;

  function obten_selct_date_fin
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_selct_date_fin);
  end obten_selct_date_fin;

  function obten_choix_evenm_ident
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_choix_evenm_ident);
  end obten_choix_evenm_ident;

  function obten_deplc_evenm_ident
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_deplc_ident);
  end obten_deplc_evenm_ident;

  function obten_deplc_indic_journ_compl
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_deplc_indic_journ_compl);
  end obten_deplc_indic_journ_compl;

  function obten_deplc_date_debut
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_deplc_date_debut);
  end obten_deplc_date_debut;

  function obten_deplc_date_fin
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_deplc_date_fin);
  end obten_deplc_date_fin;

  function obten_ajust_evenm_ident
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_ajust_ident);
  end obten_ajust_evenm_ident;

  function obten_ajust_date_fin
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_ajust_date_fin);
  end obten_ajust_date_fin;

  procedure defnr_date (pnu_numr_apex_regn   in number
                       ,pva_date             in varchar2)
  is
  begin
    if pnu_numr_apex_regn is not null
    then
      afw_07_sesn_pkg.defnr_valr_sesn (   'S_AFW_21_CALND_'
                                       || pnu_numr_apex_regn
                                       || '_DATE'
                                      ,pva_date);
    else
      afw_07_sesn_pkg.defnr_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_date
                                      ,pva_date);
    end if;
  end defnr_date;

  procedure defnr_mode (pnu_numr_apex_regn   in number
                       ,pva_mode             in varchar2)
  is
  begin
    if pnu_numr_apex_regn is not null
    then
      afw_07_sesn_pkg.defnr_valr_sesn (   'S_AFW_21_CALND_'
                                       || pnu_numr_apex_regn
                                       || '_MODE'
                                      ,pva_mode);
    else
      afw_07_sesn_pkg.defnr_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_mode
                                      ,pva_mode);
    end if;
  end defnr_mode;

  procedure defnr_type_agend (pva_type in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (afw_21_plugn_calnd_pkg.kva_s_type_agend
                                    ,pva_type);
  end defnr_type_agend;
end afw_12_calnd_pkg;
/
