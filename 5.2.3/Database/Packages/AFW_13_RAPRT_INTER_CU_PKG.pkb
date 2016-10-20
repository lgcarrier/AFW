SET DEFINE OFF;
create or replace package body afw_13_raprt_inter_cu_pkg
is
  gnu_page_apex   number (10);
  gva_code_ir     varchar2 (23);

  procedure defnr_ir_specf (pnu_page_apex   in number
                           ,pva_code_ir     in varchar2 default null)
  is
  begin
    if pnu_page_apex is not null
    then
      gnu_page_apex   := pnu_page_apex;
      afw_04_contx_pkg.defnr_contx_etend_numbr ('AFW_13_NUMR_PAGE_APEX_SOURC'
                                               ,pnu_page_apex
                                               ,'M'
                                               ,false);
    end if;

    if pva_code_ir is not null
    then
      gva_code_ir   := pva_code_ir;
      afw_04_contx_pkg.defnr_contx_etend_varch ('AFW_13_CODE_PAGE_IR_SOURC'
                                               ,pva_code_ir
                                               ,'M'
                                               ,false);
    end if;
  end defnr_ir_specf;

  function obten_seqnc_raprt_courn
    return typ_seqnc_reprt_courn
    pipelined
  is
    vnu_aplic        number default afw_07_util_pkg.v ('APP_ID');
    vnu_page_apex    number default nvl (afw_04_contx_pkg.obten_contx_etend_numbr ('AFW_13_NUMR_PAGE_APEX_SOURC'), afw_07_util_pkg.v ('APP_PAGE_ID'));
    vva_code_ir      varchar2 (23);
    vnu_ref_ir       number;
    vva_selct        varchar2 (32767);
    vnu_cursr        number;
    var_infor_coln   afw_07_sql_pkg.typ_arr_infor_coln;
    vnu_rpts_id      number;
  begin
    --obtenir les informations du contexte étendu si existantes
    vnu_page_apex   := nvl (afw_04_contx_pkg.obten_contx_etend_numbr ('AFW_13_NUMR_PAGE_APEX_SOURC'), afw_07_util_pkg.v ('APP_PAGE_ID'));

    begin
      vva_code_ir   := afw_04_contx_pkg.obten_contx_etend_varch ('AFW_13_CODE_PAGE_IR_SOURC');

      if vva_code_ir is not null
      then
        select pi.seqnc
          into vnu_ref_ir
          from vd_afw_13_page_ir pi
              ,vd_afw_13_page    p
         where     pi.code = vva_code_ir
               and p.seqnc = pi.ref_page
               and p.numr_apex = vnu_page_apex
               and p.ref_aplic = afw_11_aplic_pkg.obten_aplic_numr_apex (vnu_aplic);
      else
        -- Chercher le rapport interactif sur la page
        select pi.seqnc
          into vnu_ref_ir
          from vd_afw_13_page    p
              ,vd_afw_13_page_ir pi
         where     p.seqnc = pi.ref_page
               and p.numr_apex = vnu_page_apex
               and p.ref_aplic = afw_11_aplic_pkg.obten_aplic_numr_apex (vnu_aplic);
      end if;

      -- Récupérer le select
      vnu_rpts_id      :=
        afw_13_raprt_inter_pkg.obten_repts_courn (vnu_page_apex
                                                 ,vva_code_ir);
      vva_selct      :=
        afw_13_raprt_inter_pkg.obten_selct_rpts (vnu_rpts_id
                                                ,false
                                                ,'SEQNC');
    exception
      when no_data_found
      then
        vva_selct   := null;
    end;

    if vva_selct is not null
    then
      vnu_cursr      :=
        afw_07_sql_pkg.ouvri_selct (vnu_ref_ir
                                   ,vnu_rpts_id
                                   ,vva_selct
                                   ,var_infor_coln
                                   ,chr (10));

      if var_infor_coln.first () is not null
      then
        -- Extraire la valeur de la séquence pour chaque rangée
        while afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                              ,var_infor_coln)
        loop
          pipe row (var_infor_coln (1).nu_valr_numbr);
        end loop;
      end if;

      -- Fermer le curseur
      afw_07_sql_pkg.fermr_selct (vnu_cursr);
    end if;

    return;
  exception
    when others
    then
      raise;
  end obten_seqnc_raprt_courn;
end afw_13_raprt_inter_cu_pkg;
/
