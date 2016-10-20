SET DEFINE OFF;
create or replace package body afw_12_insta_sn_log_pkg
as
  procedure inser_scenr_notfc_logs (pnu_utils               in vd_i_afw_12_utils.seqnc%type
                                   ,pnu_struc_aplic         in vd_i_afw_12_struc_aplic.seqnc%type
                                   ,pnu_seqnc_struc_aplic   in number
                                   ,pnu_insta_scenr_notfc   in vd_i_afw_12_insta_scenr_notfc.seqnc%type)
  is
  begin
    --Pour chaque item li¿ l'instance de sc¿rio
    -- Obtenir l'item de l'item apex
    -- Ins¿r dans le log pour
    insert into vd_i_afw_12_insta_sn_log (ref_utils
                                         ,ref_struc_aplic
                                         ,ref_seqnc_struc_aplic
                                         ,ref_insta_scenr_notfc
                                         ,ref_atrib_scenr_notfc_item
                                         ,id_item_apex)
      select pnu_utils
            ,pnu_struc_aplic
            ,pnu_seqnc_struc_aplic
            ,pnu_insta_scenr_notfc
            ,asni.seqnc
            ,pi.id_apex
        from vd_i_afw_12_insta_scenr_notfc isn
            ,vd_i_afw_12_atrib_scenr_notfc asn
            ,vd_i_afw_12_asn_item          asni
            ,vd_i_afw_13_page_item         pi
       where     isn.ref_atrib_scenr_notfc = asn.seqnc
             and asni.ref_atrib_scenr_notfc = asn.seqnc
             and asni.ref_page_item = pi.seqnc
             and isn.seqnc = pnu_insta_scenr_notfc;
  end inser_scenr_notfc_logs;

  procedure suprm_scenr_notfc_logs_concp (pnu_struc_aplic         in vd_i_afw_12_struc_aplic.seqnc%type
                                         ,pnu_seqnc_struc_aplic   in number)
  is
  begin
    delete from vd_i_afw_12_insta_sn_log
          where     ref_struc_aplic = pnu_struc_aplic
                and ref_seqnc_struc_aplic = pnu_seqnc_struc_aplic;
  end suprm_scenr_notfc_logs_concp;

  procedure suprm_scenr_notfc_logs_item (pnu_numr_aplic_apex   in vd_i_afw_11_aplic.numr_aplic_apex%type
                                        ,pnu_numr_page_apex    in vd_i_afw_13_page.numr_apex%type
                                        ,pva_nom_item          in vd_i_afw_13_page_item.nom_apex%type default null)
  is
  begin
    delete from vd_i_afw_12_insta_sn_log asnl
          where asnl.ref_atrib_scenr_notfc_item in (select asn.seqnc
                                                      from vd_afw_12_asn_item asn
                                                     where     asn.ref_numr_aplic = pnu_numr_aplic_apex
                                                           and asn.ref_numr_page = pnu_numr_page_apex
                                                           and (   asn.ref_page_item_nom_apex = pva_nom_item
                                                                or pva_nom_item is null));
  end suprm_scenr_notfc_logs_item;

  function obten_exist_concp (pnu_struc_aplic         in vd_i_afw_12_insta_sn_log.ref_struc_aplic%type
                             ,pnu_seqnc_struc_aplic   in vd_i_afw_12_insta_sn_log.ref_seqnc_struc_aplic%type)
    return boolean
  is
    vnu_exist   pls_integer default 0;
  begin
    select 1
      into vnu_exist
      from vd_i_afw_12_insta_sn_log
     where     ref_struc_aplic = pnu_struc_aplic
           and ref_seqnc_struc_aplic = pnu_seqnc_struc_aplic
           and rownum < 2;

    return vnu_exist = 1;
  exception
    when no_data_found
    then
      return false;
  end obten_exist_concp;

  function obten_exist_item (pnu_id_item             in vd_i_afw_12_insta_sn_log.id_item_apex%type
                            ,pnu_struc_aplic         in vd_i_afw_12_insta_sn_log.ref_struc_aplic%type
                            ,pnu_seqnc_struc_aplic   in vd_i_afw_12_insta_sn_log.ref_seqnc_struc_aplic%type
                            ,pnu_domn                in vd_i_afw_12_insta_scenr_notfc.ref_domn%type default afw_12_domn_pkg.obten_domn_sesn)
    return boolean
  is
    vnu_exist   pls_integer default 0;
  begin
    select 1
      into vnu_exist
      from dual
     where exists
             (select 1
                from vd_i_afw_12_insta_sn_log      isnl
                    ,vd_i_afw_12_insta_scenr_notfc isn
               where     isnl.ref_insta_scenr_notfc = isn.seqnc
                     and isn.ref_domn = pnu_domn
                     and isnl.id_item_apex = pnu_id_item
                     and isnl.ref_struc_aplic = pnu_struc_aplic
                     and isnl.ref_seqnc_struc_aplic = pnu_seqnc_struc_aplic);

    return vnu_exist = 1;
  exception
    when no_data_found
    then
      return false;
  end obten_exist_item;
end afw_12_insta_sn_log_pkg;
/
