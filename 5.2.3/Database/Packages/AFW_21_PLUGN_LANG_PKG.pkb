SET DEFINE OFF;
create or replace package body afw_21_plugn_lang_pkg
as
  procedure sauvg_tradc (pnu_lang                in number
                        ,pnu_struc_aplic         in number
                        ,pnu_seqnc_struc_aplic   in number
                        ,pva_atrib_struc_aplic   in varchar2
                        ,pva_valr                in varchar2)
  as
    vnu_seq_id   apex_collections.seq_id%type;
  begin
    if not afw_07_apex_colct_pkg.exist (obten_nom_colct_plugn_lang)
    then
      afw_07_apex_colct_pkg.creer_colct (obten_nom_colct_plugn_lang);
    end if;

    begin
      vnu_seq_id      :=
        obten_seqnc_tradc (pnu_lang
                          ,pnu_struc_aplic
                          ,pnu_seqnc_struc_aplic
                          ,pva_atrib_struc_aplic);
      afw_07_apex_colct_pkg.maj_colct_membr_atrib (obten_nom_colct_plugn_lang
                                                  ,vnu_seq_id
                                                  ,5
                                                  ,pva_valr);
    exception
      when no_data_found
      then
        afw_07_apex_colct_pkg.ajout_membr (obten_nom_colct_plugn_lang
                                          ,pnu_lang
                                          ,pnu_struc_aplic
                                          ,pnu_seqnc_struc_aplic
                                          ,pva_atrib_struc_aplic
                                          ,pva_valr);
    end;
  end sauvg_tradc;

  function obten_tradc (pnu_lang                in number
                       ,pnu_struc_aplic         in number
                       ,pnu_seqnc_struc_aplic   in number
                       ,pva_atrib_struc_aplic   in varchar2)
    return varchar2
  as
    cursor cur_tradc
    is
      select c005
        from apex_collections
       where     collection_name = obten_nom_colct_plugn_lang
             and c001 = pnu_lang
             and c002 = pnu_struc_aplic
             and (   c003 = pnu_seqnc_struc_aplic
                  or (    c003 is null
                      and pnu_seqnc_struc_aplic is null))
             and c004 = pva_atrib_struc_aplic;

    vva_valr   apex_collections.c005%type;
  begin
    if not apex_error.have_errors_occurred
    then
      reint_tradc (pnu_struc_aplic);
    end if;

    open cur_tradc;

    fetch cur_tradc
      into vva_valr;

    if not cur_tradc%found
    then
      raise no_data_found;
    end if;

    close cur_tradc;

    return vva_valr;
  exception
    when no_data_found
    then
      raise;
  end obten_tradc;

  function obten_seqnc_tradc (pnu_lang                in number
                             ,pnu_struc_aplic         in number
                             ,pnu_seqnc_struc_aplic   in number
                             ,pva_atrib_struc_aplic   in varchar2)
    return number
  as
    cursor cur_tradc
    is
      select seq_id
        from apex_collections
       where     collection_name = obten_nom_colct_plugn_lang
             and c001 = pnu_lang
             and c002 = pnu_struc_aplic
             and (   c003 = pnu_seqnc_struc_aplic
                  or (    c003 is null
                      and pnu_seqnc_struc_aplic is null))
             and c004 = pva_atrib_struc_aplic;

    vnu_seq_id   apex_collections.seq_id%type;
  begin
    open cur_tradc;

    fetch cur_tradc
      into vnu_seq_id;

    if not cur_tradc%found
    then
      raise no_data_found;
    end if;

    close cur_tradc;

    return vnu_seq_id;
  exception
    when no_data_found
    then
      raise;
  end obten_seqnc_tradc;

  function obten_nom_colct_plugn_lang
    return varchar2
  as
  begin
    return kva_colct_plugn_lang;
  end obten_nom_colct_plugn_lang;

  procedure reint_tradc (pnu_struc_aplic in number)
  as
  begin
    if afw_07_apex_colct_pkg.exist (obten_nom_colct_plugn_lang)
    then
      afw_07_apex_colct_pkg.suprm_membr (obten_nom_colct_plugn_lang
                                        ,2
                                        ,pnu_struc_aplic);
    end if;
  end reint_tradc;

  function obten_tradc_struc_aplic (pnu_struc_aplic         in number
                                   ,pnu_seqnc_struc_aplic   in number)
    return gta_tradc
  as
    vta_tradc   gta_tradc;

    cursor cur_tradc
    is
      select to_number (c001)
            ,to_number (c002)
            ,to_number (c003)
            ,c004
            ,c005
        from apex_collections
       where     collection_name = obten_nom_colct_plugn_lang
             and c002 = pnu_struc_aplic
             and (   c003 = pnu_seqnc_struc_aplic
                  or (    c003 is null
                      and pnu_seqnc_struc_aplic is null));
  begin
    open cur_tradc;

    fetch cur_tradc
      bulk collect into vta_tradc;

    close cur_tradc;


    return vta_tradc;
  end obten_tradc_struc_aplic;
end afw_21_plugn_lang_pkg;
/
