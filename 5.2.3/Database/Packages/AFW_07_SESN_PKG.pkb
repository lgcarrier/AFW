SET DEFINE OFF;
create or replace package body afw_07_sesn_pkg
as
  gbo_mode_debug   boolean default false;

  procedure defnr_valr_sesn (pva_nom    in varchar2
                            ,pva_valr   in varchar2)
  is
    pragma autonomous_transaction;
  begin
    update afw_07_etat_sesn ss
       set ss.valr   = pva_valr
     where     ss.nom = upper (pva_nom)
           and session_id = afw_12_sesn_pkg.obten_sesn;

    if sql%rowcount = 0
    then
      insert into afw_07_etat_sesn (nom
                                   ,valr)
           values (upper (pva_nom)
                  ,pva_valr);
    end if;

    commit;
  exception
    when others
    then
      ete ();
  end defnr_valr_sesn;

  procedure defnr_valr_sesn_alter (pva_nom    in varchar2
                                  ,pva_valr   in varchar2)
  is
  begin
    update afw_07_etat_sesn ss
       set ss.valr   = pva_valr
     where     ss.nom = upper (pva_nom)
           and session_id = afw_12_sesn_pkg.obten_sesn;

    if sql%rowcount = 0
    then
      insert into afw_07_etat_sesn (nom
                                   ,valr)
           values (upper (pva_nom)
                  ,pva_valr);
    end if;

    commit;
  exception
    when others
    then
      ete ();
  end defnr_valr_sesn_alter;

  function obten_valr_sesn (pva_nom in varchar2)
    return varchar2
  is
    vva_valr   afw_07_etat_sesn.valr%type;
  begin
    select ss.valr
      into vva_valr
      from afw_07_etat_sesn ss
     where     ss.nom = upper (pva_nom)
           and session_id = afw_12_sesn_pkg.obten_sesn;

    return vva_valr;
  exception
    when no_data_found
    then
      return null;
  end obten_valr_sesn;

  procedure suprm_valr_sesn (pva_nom in varchar2)
  is
    pragma autonomous_transaction;
  begin
    delete afw_07_etat_sesn ss
     where     ss.nom = upper (pva_nom)
           and session_id = afw_12_sesn_pkg.obten_sesn;

    commit;
  end suprm_valr_sesn;

  procedure defnr_aplic_en_cours (pva_aplic in varchar2)
  is
  begin
    gva_aplic_en_cours   := pva_aplic;
  end defnr_aplic_en_cours;

  function obten_aplic_en_cours
    return varchar2
  is
  begin
    return gva_aplic_en_cours;
  end obten_aplic_en_cours;

  procedure defnr_prodt_en_cours (pva_prodt in varchar2)
  is
  begin
    gva_prodt_en_cours   := pva_prodt;
  end defnr_prodt_en_cours;

  function obten_prodt_en_cours
    return varchar2
  is
  begin
    return gva_prodt_en_cours;
  end obten_prodt_en_cours;
end afw_07_sesn_pkg;
/
