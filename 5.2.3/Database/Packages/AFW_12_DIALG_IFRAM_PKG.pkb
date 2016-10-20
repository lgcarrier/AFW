SET DEFINE OFF;
create or replace package body afw_12_dialg_ifram_pkg
is
  procedure ouvri_dialg (pnu_numr_apex_actio_dynmq   in number
                        ,pnu_numr_apex_aplic         in number
                        ,pnu_numr_apex_page          in number)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (   'S_AFW_21_DIALG_IFRAM_APLIC_'
                                     || pnu_numr_apex_actio_dynmq
                                    ,pnu_numr_apex_aplic);

    afw_07_sesn_pkg.defnr_valr_sesn (   'S_AFW_21_DIALG_IFRAM_PAGE_'
                                     || pnu_numr_apex_actio_dynmq
                                    ,pnu_numr_apex_page);
  end;

  procedure defnr_item_cle_etran (pnu_numr_apex_actio_dynmq   in number
                                 ,pva_item_cle_etran          in varchar2)
  is
  begin
    afw_07_sesn_pkg.defnr_valr_sesn (   'S_AFW_21_DIALG_IFRAM_ITEM_CLE_ETRAN_'
                                     || pnu_numr_apex_actio_dynmq
                                    ,pva_item_cle_etran);
  end defnr_item_cle_etran;

  function obten_item_cle_etran (pnu_numr_apex_actio_dynmq in number)
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (   'S_AFW_21_DIALG_IFRAM_ITEM_CLE_ETRAN_'
                                            || pnu_numr_apex_actio_dynmq);
  end obten_item_cle_etran;

  function obten_dialg_ouver
    return number
  is
    vnu_numr_apex_actio_dynmq   number;
  begin
    select to_number (substr (ss.nom
                             ,27))
      into vnu_numr_apex_actio_dynmq
      from afw_07_etat_sesn ss
     where     ss.nom like 'S_AFW_21_DIALG_IFRAM_PAGE_%'
           and ss.session_id = afw_12_sesn_pkg.obten_sesn
           and ss.date_creat = (select max (ss.date_creat)
                                  from afw_07_etat_sesn ss
                                 where     ss.nom like 'S_AFW_21_DIALG_IFRAM_PAGE_%'
                                       and ss.session_id = afw_12_sesn_pkg.obten_sesn);

    return vnu_numr_apex_actio_dynmq;
  exception
    when no_data_found
    then
      return null;
  end obten_dialg_ouver;

  function valdr_dialg_ouvert
    return boolean
  is
    vbo_vald   boolean default false;
  begin
    if obten_dialg_ouver is not null
    then
      vbo_vald   := true;
    end if;

    return vbo_vald;
  end valdr_dialg_ouvert;

  procedure fermr_dialg_ouver
  is
    vnu_numr_apex_actio_dynmq   number;
  begin
    vnu_numr_apex_actio_dynmq   := obten_dialg_ouver;

    afw_07_sesn_pkg.suprm_valr_sesn (   'S_AFW_21_DIALG_IFRAM_APLIC_'
                                     || vnu_numr_apex_actio_dynmq);

    afw_07_sesn_pkg.suprm_valr_sesn (   'S_AFW_21_DIALG_IFRAM_PAGE_'
                                     || vnu_numr_apex_actio_dynmq);
  end fermr_dialg_ouver;

  procedure suprm_dialg_sesn (pnu_sesn in number default afw_12_sesn_pkg.obten_sesn)
  is
    pragma autonomous_transaction;
  begin
    delete from afw_07_etat_sesn ss
          where     ss.session_id = pnu_sesn
                and (   ss.nom like 'S_AFW_21_DIALG_IFRAM_PAGE_%'
                     or ss.nom like 'S_AFW_21_DIALG_IFRAM_APLIC_%'
                     or ss.nom like 'S_AFW_21_DIALG_IFRAM_ITEM_CLE_ETRAN_%');

    commit;
  exception
    when others
    then
      rollback;
  end suprm_dialg_sesn;
end afw_12_dialg_ifram_pkg;
/
