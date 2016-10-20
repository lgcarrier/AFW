SET DEFINE OFF;
create or replace package body afw_29_asurn_qualt_corct_pkg
as
  procedure corgr_item_hidn (pnu_aplic number)
  is
    vnu_id                number;
    vnu_compt             number (1);
    vnu_numr_aplic_apex   number;

    cursor cur_item
    is
      select id
            ,flow_id
        from apex_item_page aip
       where     display_as like '%HIDDEN%'
             and item_plug_id != (select id
                                    from apex_regn ar
                                   where     page_id = 0
                                         and plug_name = 'Items cachés'
                                         and ar.flow_id = aip.flow_id)
             and flow_id = (select numr_aplic_apex
                              from vd_i_afw_11_aplic p
                             where p.seqnc = pnu_aplic);
  begin
    select numr_aplic_apex
      into vnu_numr_aplic_apex
      from vd_i_afw_11_aplic p
     where p.seqnc = pnu_aplic;


    select count (1)
      into vnu_compt
      from apex_regn
     where     page_id = 0
           and plug_name = 'Items cachés'
           and flow_id = vnu_numr_aplic_apex;

    if (vnu_compt != 0)
    then
      select id
        into vnu_id
        from apex_regn
       where     page_id = 0
             and plug_name = 'Items cachés'
             and flow_id = vnu_numr_aplic_apex;

      for rec_item in cur_item
      loop
        update apex_item_page aia
           set item_plug_id   = vnu_id
         where aia.id = rec_item.id;
      end loop;
    end if;
  end corgr_item_hidn;

  procedure corgr_ir_aucun_don_trouv (pnu_aplic number)
  is
  begin
    update apex_ir
       set no_data_found_message   = '&A_AFW_13_MESG_AUCUN_DON_TROUV.'
     where     flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
           and no_data_found_message != '&A_AFW_13_MESG_AUCUN_DON_TROUV.';
  end corgr_ir_aucun_don_trouv;

  procedure corgr_ir_trop_don_trouv (pnu_aplic number)
  is
  begin
    update apex_ir
       set max_row_count_message   = '&A_AFW_13_MESG_TROP_DON_TROUV.'
     where     flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
           and max_row_count_message != '&A_AFW_13_MESG_TROP_DON_TROUV.';
  end corgr_ir_trop_don_trouv;

  procedure corgr_regn_trop_don_trouv (pnu_aplic number)
  is
  begin
    update apex_regn
       set plug_query_more_data   = '&A_AFW_13_MESG_TROP_DON_TROUV.'
     where     flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
           and (   plug_query_more_data != '&A_AFW_13_MESG_TROP_DON_TROUV.'
                or plug_query_more_data is null)
           and plug_source_type like '%SQL_QUERY%';
  end corgr_regn_trop_don_trouv;

  procedure corgr_regn_aucun_don_trouv (pnu_aplic number)
  is
  begin
    update apex_regn
       set plug_query_no_data_found   = '&A_AFW_13_MESG_AUCUN_DON_TROUV.'
     where     flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
           and (   plug_query_no_data_found != '&A_AFW_13_MESG_AUCUN_DON_TROUV.'
                or plug_query_no_data_found is null)
           and plug_source_type like '%SQL_QUERY%';
  end corgr_regn_aucun_don_trouv;
end afw_29_asurn_qualt_corct_pkg;
/
