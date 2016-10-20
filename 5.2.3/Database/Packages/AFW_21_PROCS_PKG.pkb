SET DEFINE OFF;
create or replace package body afw_21_procs_pkg
is
  function inser_trace (p_process   in apex_plugin.t_process
                       ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs   apex_plugin.t_process_exec_result;
  begin
    -- Cet appel à la procédure ETE n'est pas une trace pour le débogage
    return rec_procs;
  end inser_trace;

  function authe_redrg (p_process   in apex_plugin.t_process
                       ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs   apex_plugin.t_process_exec_result;
  begin
    afw_12_authe_apex_pkg.authe_redrg (pva_code_utils        => p_process.attribute_02
                                      ,pva_mot_passe         => p_process.attribute_03
                                      ,pva_domn              => p_process.attribute_01
                                      ,pnu_numr_apex_aplic   => p_process.attribute_04
                                      ,pnu_numr_apex_page    => p_process.attribute_05);
    return rec_procs;
  end authe_redrg;

  function fermr_dialg_ifram (p_process   in apex_plugin.t_process
                             ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    vva_mesg_sucs        varchar2 (4000);
    vva_item_cle_etran   varchar2 (60);

    rec_procs            apex_plugin.t_process_exec_result;
  begin
    vva_item_cle_etran   := afw_12_dialg_ifram_pkg.obten_item_cle_etran (afw_12_dialg_ifram_pkg.obten_dialg_ouver);

    if vva_item_cle_etran is not null
    then
      afw_07_util_pkg.defnr_etat_sesn (vva_item_cle_etran
                                      ,p_process.attribute_01);
    end if;

    vva_mesg_sucs        :=
      ltrim (   aa.g_print_success_message
             || ' '
             || aa.g_notification
             || ' '
             || p_process.success_message);

    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_21_MESG_SUCS'
                                    ,vva_mesg_sucs);

    afw_21_plugn_dialg_ifram_pkg.fermr_dialg;

    afw_07_util_pkg.aret_trait_page_apex;

    return rec_procs;
  exception
    when others
    then
      return rec_procs;
  end fermr_dialg_ifram;

  function defnr_item_page (p_process   in apex_plugin.t_process
                           ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    vnu_indx_courn   pls_integer;
    vvc_elemn        apex_application_global.vc_arr2;
    vvc_valr         apex_application_global.vc_arr2;

    rec_procs        apex_plugin.t_process_exec_result;
  begin
    vvc_elemn      :=
      afw_07_util_pkg.string_to_table (p_process.attribute_01
                                      ,',');
    vvc_valr      :=
      afw_07_util_pkg.string_to_table (p_process.attribute_02
                                      ,',');

    if vvc_elemn.count () != 0
    then
      vnu_indx_courn   := vvc_elemn.first ();

      while vnu_indx_courn is not null
      loop
        afw_07_util_pkg.defnr_etat_sesn (vvc_elemn (vnu_indx_courn)
                                        ,vvc_valr (vnu_indx_courn));
        vnu_indx_courn   := vvc_elemn.next (vnu_indx_courn);
      end loop;
    end if;

    return rec_procs;
  end defnr_item_page;

  function defnr_contx_afw_04_fil_arian (p_process   in apex_plugin.t_process
                                        ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    vnu_fil_arian   number default afw_07_util_pkg.nv ('SIDF');
    rec_procs       apex_plugin.t_process_exec_result;
  begin
    update vd_afw_04_contx c
       set c.infor_suplm             = p_process.attribute_01
          ,c.nom_procd_infor_suplm   = p_process.attribute_02
     where c.ref_fil_arian = vnu_fil_arian;

    return rec_procs;
  end defnr_contx_afw_04_fil_arian;

  function suprm_afw_21_colct_clob (p_process   in apex_plugin.t_process
                                   ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs            apex_plugin.t_process_exec_result;
    vva_nom_colct_clob   varchar2 (255) default 'IO_AFW_21_COLCT_CLOB';
  begin
    if apex_collection.collection_exists (vva_nom_colct_clob)
    then
      apex_collection.delete_collection (vva_nom_colct_clob);
    end if;

    return rec_procs;
  end suprm_afw_21_colct_clob;

  function dml_maj_clob (p_process   in apex_plugin.t_process
                        ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs            apex_plugin.t_process_exec_result;
    vva_nom_colct_clob   varchar2 (255) default 'IO_AFW_21_COLCT_CLOB';

    procedure maj_clob (pva_table              in varchar2
                       ,pva_item_cle_primr_1   in varchar2
                       ,pva_coln_cle_primr_1   in varchar2
                       ,pva_item_cle_primr_2   in varchar2 default null
                       ,pva_coln_cle_primr_2   in varchar2 default null
                       ,pva_liste_item         in varchar2
                       ,pva_liste_coln         in varchar2)
    is
      vva_squel_progr_a_lancr   varchar2 (32767) default 'declare
         vnu_cle_primr_1 number default :p1;
         vnu_cle_primr_2 number default :p2;
         vva_nom_colct varchar2(255) default ''%NOM_COLCT_CLOB%'';
         %DECLR_ITEM%
       begin
         update  %TABLE% 
         set %DEFNR_COLN%
         where  %COLN_CLE_PRIMR_1% = vnu_cle_primr_1%ENONC_CLE_PRIMR_2%;
       end;';

      vva_progr_a_lancr         varchar2 (32767);

      vva_declr_item            varchar2 (4000);
      vva_defnr_coln            varchar2 (4000);

      vvc_liste_item            apex_application_global.vc_arr2;
      vvc_liste_coln            apex_application_global.vc_arr2;
    begin
      vvc_liste_item      :=
        afw_07_util_pkg.string_to_table (pva_liste_item
                                        ,',');
      vvc_liste_coln      :=
        afw_07_util_pkg.string_to_table (pva_liste_coln
                                        ,',');

      if     vvc_liste_coln.count > 0
         and vvc_liste_coln.count = vvc_liste_item.count
      then
        for i in 1 .. vvc_liste_coln.count
        loop
          vva_defnr_coln      :=
               vva_defnr_coln
            || vvc_liste_coln (i)
            || ' = '
            || ' (select ac.clob001 from apex_collections ac where ac.collection_name = vva_nom_colct and ac.c001 = vva_'
            || vvc_liste_item (i)
            || '),';

          vva_declr_item      :=
               vva_declr_item
            || 'vva_'
            || lower (vvc_liste_item (i))
            || ' varchar2(30) default '''
            || vvc_liste_item (i)
            || ''';';
        end loop;
      end if;

      vva_progr_a_lancr      :=
        afw_07_util_pkg.multi_replc (vva_squel_progr_a_lancr
                                    ,'%TABLE%'
                                    ,pva_table
                                    ,'%COLN_CLE_PRIMR_1%'
                                    ,pva_coln_cle_primr_1
                                    ,'%ENONC_CLE_PRIMR_2%'
                                    ,case
                                       when pva_coln_cle_primr_2 is not null
                                       then
                                            ' and '
                                         || pva_coln_cle_primr_2
                                         || ' = :p2'
                                       else
                                         null
                                     end
                                    ,'%NOM_COLCT_CLOB%'
                                    ,vva_nom_colct_clob
                                    ,'%DECLR_ITEM%'
                                    ,vva_declr_item
                                    ,'%DEFNR_COLN%'
                                    ,rtrim (vva_defnr_coln
                                           ,','));

      execute immediate vva_progr_a_lancr
        using afw_07_util_pkg.v (pva_item_cle_primr_1)
             ,afw_07_util_pkg.v (pva_item_cle_primr_2);
    exception
      when others
      then
        raise;
    end maj_clob;
  begin
    maj_clob (p_process.attribute_01
             ,p_process.attribute_02
             ,p_process.attribute_03
             ,p_process.attribute_04
             ,p_process.attribute_05
             ,p_process.attribute_06
             ,p_process.attribute_07);

    return rec_procs;
  end dml_maj_clob;

  function valdt_afw_21_colct_clob (p_process   in apex_plugin.t_process
                                   ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs            apex_plugin.t_process_exec_result;
    vva_nom_colct_clob   varchar2 (255) default 'IO_AFW_21_COLCT_CLOB';

    procedure valdt_clob (pva_code_valdt   in varchar2
                         ,pva_numr_mesg    in varchar2
                         ,pva_item         in varchar2
                         ,pva_coln         in varchar2)
    is
      vva_declr_item   varchar2 (4000);
      vva_defnr_coln   varchar2 (4000);
      vnu_tail_clob    pls_integer;
    begin
      case pva_code_valdt
        when 'NOT_NULL'
        then
          begin
            select dbms_lob.getlength (ac.clob001)
              into vnu_tail_clob
              from apex_collections ac
             where     ac.collection_name = vva_nom_colct_clob
                   and ac.c001 = pva_item;

            if vnu_tail_clob = 0
            then
              afw_01_err_apex_pkg.lever_err_apex_code (pva_numr_mesg);
            end if;
          exception
            when others
            then
              raise;
          end;
        else
          null;
      end case;
    end valdt_clob;
  begin
    valdt_clob (p_process.attribute_01
               ,p_process.attribute_02
               ,p_process.attribute_03
               ,p_process.attribute_04);

    return rec_procs;
  end valdt_afw_21_colct_clob;

  function defnr_afw_04_mode_page (p_process   in apex_plugin.t_process
                                  ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs   apex_plugin.t_process_exec_result;
  begin
    if afw_07_util_pkg.exist_item (p_process.attribute_01)
    then
      if afw_07_util_pkg.v ('A_AFW_04_ACTIO') is not null
      then
        afw_07_util_pkg.defnr_etat_sesn (p_process.attribute_01
                                        ,afw_07_util_pkg.v ('A_AFW_04_ACTIO'));
      elsif p_process.attribute_02 is not null
      then
        afw_07_util_pkg.defnr_etat_sesn (p_process.attribute_01
                                        ,p_process.attribute_02);
      end if;
    end if;

    return rec_procs;
  end defnr_afw_04_mode_page;

  --OBSOLETE::CARLO
  /*function defnr_aplic_safp (p_process in apex_plugin.t_process,
                             p_plugin in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result is
    rec_procs                               apex_plugin.t_process_exec_result;
  begin
    afw_11_aplic_pkg.defnr_aplic_safp (null);
    return rec_procs;
  end defnr_aplic_safp;*/

  function trait_mesgs_err (p_process   in apex_plugin.t_process
                           ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs   apex_plugin.t_process_exec_result;
  begin
    afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_11_TRAIT_MESGS_ERR'
                                    ,case p_process.attribute_01 when 'Y' then 1 else 0 end);
    return rec_procs;
  end trait_mesgs_err;


  function defnr_afw_21_confr_sauvg (p_process   in apex_plugin.t_process
                                    ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs   apex_plugin.t_process_exec_result;
  begin
    afw_21_plugn_confr_sauvg_pkg.defnr_mesg_confr (p_process.attribute_01);
    afw_21_plugn_confr_sauvg_pkg.defnr_reqt_sauvg (p_process.attribute_02);

    return rec_procs;
  end defnr_afw_21_confr_sauvg;

  function reint_afw_13_menu (p_process   in apex_plugin.t_process
                             ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs   apex_plugin.t_process_exec_result;
  begin
    afw_12_menu_pkg.defnr_item_actif (afw_13_menu_pkg.obten_menu_sesn (p_process.attribute_01)
                                     ,afw_13_menu_pkg.obten_item_menu_sesn (p_process.attribute_01
                                                                           ,p_process.attribute_02));

    return rec_procs;
  end reint_afw_13_menu;

  function chang_libl_fil_arian (p_process   in apex_plugin.t_process
                                ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs   apex_plugin.t_process_exec_result;
  begin
    afw_04_fil_arian_pkg.persn (afw_21_util_pkg.obten_reslt_expre_plsql (p_process.attribute_01));

    return rec_procs;
  end chang_libl_fil_arian;

  function trait_tradc (p_process   in apex_plugin.t_process
                       ,p_plugin    in apex_plugin.t_plugin)
    return apex_plugin.t_process_exec_result
  is
    rec_procs           apex_plugin.t_process_exec_result;
    vva_progr_a_lancr   varchar2 (4000)
                          default    'begin '
                                  || '  %PROCD_TRAIT%(:1); '
                                  || '  exception when others then ete();'
                                  || 'end;';
  begin
    vva_progr_a_lancr      :=
      replace (vva_progr_a_lancr
              ,'%PROCD_TRAIT%'
              ,p_process.attribute_01);

    execute immediate vva_progr_a_lancr using p_process.attribute_02;

    return rec_procs;
  end trait_tradc;
end afw_21_procs_pkg;
/
