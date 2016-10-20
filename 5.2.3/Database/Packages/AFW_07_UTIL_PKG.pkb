SET DEFINE OFF;
create or replace package body afw_07_util_pkg
as
  gti_timsp_initl                timestamp;

  type typ_table_va_index_va is table of varchar2 (4000)
    index by varchar2 (30);

  gta_etat_sessn                 typ_table_va_index_va;

  gnu_mod_encry         constant pls_integer default dbms_crypto.encrypt_aes256 + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5;
  gnu_longr_cle_encry   constant pls_integer default 256 / 8;
  gra_cle_encry_base             raw (2000) default 'D0F0F51AC7FCF834F47B6797951A8244B65809DD33ECA420D0F6446DAF9F47E8';
  gva_charc_set         constant varchar2 (12) default 'WE8MSWIN1252';

  function table_to_string (pta_tabl       apex_application_global.vc_arr2
                           ,pva_seprt   in varchar2 default ':')
    return varchar2
  is
    vva_strin   varchar2 (32767);
    vnu_indx    pls_integer;
  begin
    if pta_tabl.count () != 0
    then
      vnu_indx   := pta_tabl.first ();

      while vnu_indx is not null
      loop
        if vva_strin is not null
        then
          vva_strin      :=
               vva_strin
            || pva_seprt;
        end if;

        vva_strin      :=
             vva_strin
          || pta_tabl (vnu_indx);
        vnu_indx   := pta_tabl.next (vnu_indx);
      end loop;
    end if;

    return vva_strin;
  end table_to_string;

  function table_to_string (pcu_tabl       sys_refcursor
                           ,pva_seprt   in varchar2 default ':')
    return varchar2
  is
    vva_strin   varchar2 (32767);
    vva_elemn   varchar2 (100);
  begin
    fetch pcu_tabl
      into vva_elemn;

    while pcu_tabl%found
    loop
      if vva_strin is not null
      then
        vva_strin      :=
             vva_strin
          || pva_seprt;
      end if;

      vva_strin      :=
           vva_strin
        || vva_elemn;

      fetch pcu_tabl
        into vva_elemn;
    end loop;

    close pcu_tabl;

    return vva_strin;
  end table_to_string;

  function string_to_table (pva_tabl    in varchar2
                           ,pva_seprt   in varchar2 default ':')
    return apex_application_global.vc_arr2
  is
  begin
    return apex_util.string_to_table (pva_tabl
                                     ,pva_seprt);
  end string_to_table;

  function string_to_table2 (pva_tabl    in varchar2
                            ,pva_seprt   in varchar2 default ':')
    return apex_application_global.vc_map
  is
    vvc_table   apex_application_global.vc_arr2;
    vvm_table   apex_application_global.vc_map;
  begin
    vvc_table      :=
      apex_util.string_to_table (pva_tabl
                                ,pva_seprt);

    for i in vvc_table.first .. vvc_table.last
    loop
      vvm_table (vvc_table (i))   := vvc_table (i);
    end loop;

    return vvm_table;
  end string_to_table2;

  function strin_to_table_nu (pva_list in varchar2)
    return typ_table_nu
    pipelined
  is
    vta_arr2   apex_application_global.vc_arr2;
  begin
    vta_arr2   := apex_util.string_to_table (pva_list);

    if vta_arr2.count () != 0
    then
      for i in vta_arr2.first () .. vta_arr2.last ()
      loop
        pipe row (vta_arr2 (i));
      end loop;
    end if;

    return;
  end strin_to_table_nu;

  function table_to_table (pta_list in apex_application_global.vc_arr2)
    return typ_table_nu
    pipelined
  is
    vnu_indx_courn   pls_integer;
  begin
    if pta_list.count () != 0
    then
      vnu_indx_courn   := pta_list.first ();

      while vnu_indx_courn is not null
      loop
        pipe row (pta_list (vnu_indx_courn));
        vnu_indx_courn   := pta_list.next (vnu_indx_courn);
      end loop;
    end if;
  end table_to_table;

  function table_to_table_01
    return typ_table_nu
    pipelined
  is
    vnu_indx_courn   pls_integer;
  begin
    if apex_application.g_f01.count () != 0
    then
      vnu_indx_courn   := apex_application.g_f01.first ();

      while vnu_indx_courn is not null
      loop
        pipe row (apex_application.g_f01 (vnu_indx_courn));
        vnu_indx_courn   := apex_application.g_f01.next (vnu_indx_courn);
      end loop;
    end if;
  end table_to_table_01;

  function table_to_table_02
    return typ_table_nu
    pipelined
  is
    vnu_indx_courn   pls_integer;
  begin
    if apex_application.g_f02.count () != 0
    then
      vnu_indx_courn   := apex_application.g_f02.first ();

      while vnu_indx_courn is not null
      loop
        pipe row (apex_application.g_f02 (vnu_indx_courn));
        vnu_indx_courn   := apex_application.g_f02.next (vnu_indx_courn);
      end loop;
    end if;
  end table_to_table_02;

  function table_to_table_nu (pta_list in typ_table_nu_ibpls)
    return typ_table_nu
    pipelined
  is
    vnu_indx_courn   pls_integer;
  begin
    if pta_list.count () != 0
    then
      vnu_indx_courn   := pta_list.first ();

      while vnu_indx_courn is not null
      loop
        pipe row (pta_list (vnu_indx_courn));
        vnu_indx_courn   := pta_list.next (vnu_indx_courn);
      end loop;
    end if;
  end table_to_table_nu;

  function strin_to_table_va (pva_list in varchar2)
    return typ_table_va
    pipelined
  is
    vta_arr2   apex_application_global.vc_arr2;
  begin
    vta_arr2   := apex_util.string_to_table (pva_list);

    if vta_arr2.count () != 0
    then
      for i in vta_arr2.first () .. vta_arr2.last ()
      loop
        pipe row (vta_arr2 (i));
      end loop;
    end if;

    return;
  end strin_to_table_va;

  function suprm_elemn_liste (pva_elemn   in varchar2
                             ,pva_list    in varchar2)
    return varchar2
  is
    vta_arr2_sourc   apex_application_global.vc_arr2;
    vta_arr2_cible   apex_application_global.vc_arr2;
    vnu_compt        pls_integer default 1;
  begin
    vta_arr2_sourc   := apex_util.string_to_table (pva_list);

    if vta_arr2_sourc.count > 0
    then
      for i in vta_arr2_sourc.first () .. vta_arr2_sourc.last ()
      loop
        if vta_arr2_sourc (i) <> pva_elemn
        then
          vta_arr2_cible (vnu_compt)   := vta_arr2_sourc (i);
          vnu_compt                    := vnu_compt + 1;
        end if;
      end loop;
    end if;

    return table_to_string (vta_arr2_cible);
  end suprm_elemn_liste;

  procedure genr_valr_audit (pbo_inser         in     boolean
                            ,pbo_updat         in     boolean
                            ,pva_utils_creat   in out varchar2
                            ,pda_date_creat    in out date
                            ,pva_utils_modfc   in out varchar2
                            ,pda_date_modfc    in out date)
  is
  begin
    if pbo_inser
    then
      pva_utils_creat   := nvl (afw_12_utils_pkg.obten_audit_usagr_conct, user);
      pda_date_creat    := obten_date_syst;
    elsif pbo_updat
    then
      pva_utils_modfc   := nvl (afw_12_utils_pkg.obten_audit_usagr_conct, user);
      pda_date_modfc    := obten_date_syst;
    end if;
  end genr_valr_audit;

  procedure genr_valr_audit_alter (pbo_inser         in     boolean
                                  ,pbo_updat         in     boolean
                                  ,pva_utils_creat   in out varchar2
                                  ,pda_date_creat    in out date
                                  ,pva_utils_modfc   in out varchar2
                                  ,pda_date_modfc    in out date)
  is
  begin
    if pbo_inser
    then
      pva_utils_creat   := nvl (afw_12_utils_pkg.obten_code_usagr_conct, user);
      pda_date_creat    := obten_date_syst;
    elsif pbo_updat
    then
      pva_utils_modfc   := nvl (afw_12_utils_pkg.obten_code_usagr_conct, user);
      pda_date_modfc    := obten_date_syst;
    end if;
  end genr_valr_audit_alter;

  function obten_date_syst
    return date
  is
  begin
    return sysdate;
  end obten_date_syst;

  function vald_domn_date (pda_date_limt_infr   in date
                          ,pva_date_a_valdr     in date
                          ,pda_date_limt_supr   in date)
    return boolean
  is
    vbo_date_valid   boolean;
  begin
    vbo_date_valid      :=
      (   pva_date_a_valdr >= pda_date_limt_infr
       or pda_date_limt_infr is null);
    vbo_date_valid      :=
          vbo_date_valid
      and (   pva_date_a_valdr <= pda_date_limt_supr
           or pda_date_limt_supr is null);
    return vbo_date_valid;
  end;

  function vald_domn_date_trunc (pda_date_limt_infr   in date
                                ,pva_date_a_valdr     in date
                                ,pda_date_limt_supr   in date)
    return boolean
  is
    vbo_date_valid   boolean;
  begin
    vbo_date_valid      :=
      (   trunc (pva_date_a_valdr) >= trunc (pda_date_limt_infr)
       or pda_date_limt_infr is null);
    vbo_date_valid      :=
          vbo_date_valid
      and (   trunc (pva_date_a_valdr) <= trunc (pda_date_limt_supr)
           or pda_date_limt_supr is null);
    return vbo_date_valid;
  end;

  function obten_versn_sesn
    return number
  is
  begin
    return 102;
  end obten_versn_sesn;

  function obten_sourc_shutl_selct (pva_selct in varchar2)
    return varchar2
  is
    /*cur_ref_r                               sys_refcursor;
    vva_ref_r                               varchar2 (200);*/
    vva_retrn   varchar2 (32767);
  begin
    /*open cur_ref_r for pva_selct;
                        fetch cur_ref_r into                                    vva_ref_r;
    while cur_ref_r%found loop
      vva_retrn := vva_retrn || vva_ref_r || ':';
      fetch cur_ref_r into                                    vva_ref_r;
    end loop;
    close cur_ref_r;
    if vva_retrn is not null then
      vva_retrn :=
        substr (vva_retrn,
                1,
                length (vva_retrn) - 1);
    end if;*/

    vva_retrn   := afw_07_util_cu_pkg.obten_sourc_shutl_selct (pva_selct);

    return vva_retrn;
  end obten_sourc_shutl_selct;

  function obten_sourc_shutl_selct (pre_selct in sys_refcursor)
    return varchar2
  is
    --    vva_ref_r                               varchar2 (200);
    vva_retrn   varchar2 (32767);
  begin
    /*fetch pre_selct into                                    vva_ref_r;
                        while pre_selct%found loop
      vva_retrn := vva_retrn || vva_ref_r || ':';
      fetch pre_selct into                                    vva_ref_r;
    end loop;
    close pre_selct;
    if vva_retrn is not null then
      vva_retrn :=
        substr (vva_retrn,
                1,
                length (vva_retrn) - 1);
    end if;*/

    vva_retrn   := afw_07_util_cu_pkg.obten_sourc_shutl_selct (pre_selct);

    return vva_retrn;
  end obten_sourc_shutl_selct;

  function v (pva_nom_item           in varchar2
             ,pva_indic_forcr_apex   in varchar2 default 'N')
    return varchar2
  is
    err_exist_item   exception;
  begin
    if     wwv_flow.g_instance is null
       and pva_indic_forcr_apex = 'N'
    then
      if gta_etat_sessn.exists (pva_nom_item)
      then
        return gta_etat_sessn (pva_nom_item);
      else
        return null;
      end if;
    else
      -- if exist_item (pva_nom_item) then
      return replace (apex_v (pva_nom_item)
                     ,'%null%'
                     ,null);
    /* else
                                     raise err_exist_item;
     end if;*/
    end if;
  exception
    when err_exist_item
    then
      afw_01_err_apex_pkg.lever_err_apex_mesg (   'Cet item n''existe pas: '
                                               || pva_nom_item);
  end v;

  function vd (pva_nom_item           in varchar2
              ,pva_indic_forcr_apex   in varchar2 default 'N')
    return varchar2
    deterministic
  is
  begin
    return v (pva_nom_item
             ,pva_indic_forcr_apex);
  end vd;

  function nv (pva_nom_item           in varchar2
              ,pva_indic_forcr_apex   in varchar2 default 'N')
    return number
  is
    err_exist_item   exception;
  begin
    if     wwv_flow.g_instance is null
       and pva_indic_forcr_apex = 'N'
    then
      if gta_etat_sessn.exists (pva_nom_item)
      then
        return to_number (gta_etat_sessn (pva_nom_item));
      else
        return null;
      end if;
    else
      --  if exist_item (pva_nom_item) then
      return to_number (replace (replace (replace (apex_v (pva_nom_item)
                                                  ,'%null%'
                                                  ,null)
                                         ,' '
                                         ,null)
                                ,'$'
                                ,null));
    /* else
                                     raise err_exist_item;
     end if;*/
    end if;
  exception
    when err_exist_item
    then
      afw_01_err_apex_pkg.lever_err_apex_mesg (   'Cet item n''existe pas: '
                                               || pva_nom_item);
  end nv;

  function nvd (pva_nom_item           in varchar2
               ,pva_indic_forcr_apex   in varchar2 default 'N')
    return number
    deterministic
  is
  begin
    return nv (pva_nom_item
              ,pva_indic_forcr_apex);
  end nvd;

  function dv (pva_nom_item           in varchar2
              ,pva_formt              in varchar2 default null
              ,pva_indic_forcr_apex   in varchar2 default 'N')
    return date
  is
    err_exist_item   exception;
  begin
    if     wwv_flow.g_instance is null
       and pva_indic_forcr_apex = 'N'
    then
      if gta_etat_sessn.exists (pva_nom_item)
      then
        return to_date (gta_etat_sessn (pva_nom_item));
      else
        return null;
      end if;
    else
      -- if exist_item (pva_nom_item) then
      return to_date (replace (apex_v (pva_nom_item)
                              ,'%null%'
                              ,null)
                     ,pva_formt);
    /* else
                                     raise err_exist_item;
     end if;*/
    end if;
  exception
    when err_exist_item
    then
      afw_01_err_apex_pkg.lever_err_apex_mesg (   'Cet item n''existe pas: '
                                               || pva_nom_item);
  end dv;

  function dvd (pva_nom_item           in varchar2
               ,pva_formt              in varchar2 default null
               ,pva_indic_forcr_apex   in varchar2 default 'N')
    return date
    deterministic
  is
  begin
    return dv (pva_nom_item
              ,pva_formt
              ,pva_indic_forcr_apex);
  end dvd;

  function valr_numrq (pva_valr in varchar2)
    return number
  is
    --    vva_seprt_group   varchar2 (1) default obten_seprt_group ();
    --    vva_carct_decml   varchar2 (1) default obten_carct_decml ();
    --    vva_valr_tempr    varchar2 (4000);
    vva_valr   varchar2 (4000);
  begin
    --    vva_valr_tempr   := pva_valr;
    --
    --    case vva_seprt_group
    --      when '.'
    --      then
    --        vva_valr_tempr   := replace (vva_valr_tempr, '.', 'G');
    --      when ','
    --      then
    --        vva_valr_tempr   := replace (vva_valr_tempr, ',', 'G');
    --      when ' '
    --      then
    --        vva_valr_tempr   := replace (vva_valr_tempr, ' ', 'G');
    --    end case;
    --
    --    vva_valr_tempr   := replace (vva_valr_tempr, ' ', 'G');
    --
    --    case vva_carct_decml
    --      when '.'
    --      then
    --        vva_valr_tempr   := replace (vva_valr_tempr, '.', 'D');
    --      when ','
    --      then
    --        vva_valr_tempr   := replace (vva_valr_tempr, ',', 'D');
    --    end case;
    --
    --    vva_valr         := replace (vva_valr_tempr, '$', null);
    --    vva_valr         := replace (vva_valr, 'G', vva_seprt_group);
    --    vva_valr         := replace (vva_valr, 'D', vva_carct_decml);
    --
    --    ete ('vva_valr', vva_valr);

    vva_valr      :=
      replace (pva_valr
              ,' '
              ,null);
    vva_valr      :=
      replace (vva_valr
              ,'$'
              ,null);
    vva_valr      :=
      replace (vva_valr
              ,'.'
              ,',');

    return vva_valr;
  end valr_numrq;

  procedure defnr_etat_sessn (pva_nom    in varchar2
                             ,pva_valr   in varchar2)
  is
  begin
    defnr_etat_sesn (pva_nom
                    ,pva_valr);
  end defnr_etat_sessn;

  procedure defnr_etat_sesn (pva_nom    in varchar2
                            ,pva_valr   in varchar2)
  is
  begin
    if wwv_flow.g_instance is null
    then
      gta_etat_sessn (pva_nom)   := pva_valr;
    else
      apex_util.set_session_state (pva_nom
                                  ,pva_valr);
    end if;
  end defnr_etat_sesn;

  procedure reint_etat_sesn_page (pnu_no_page in number)
  is
  begin
    apex_util.clear_page_cache (pnu_no_page);
  end reint_etat_sesn_page;

  function exist_item (pva_nom_item in varchar2)
    return boolean
  is
    vnu_aplic   vd_i_afw_11_aplic.numr_aplic_apex%type default apex_v ('APP_ID');
    vnu_exist   pls_integer;
  begin
    begin
      select 1
        into vnu_exist
        from apex_item_page aip
       where     aip.flow_id = vnu_aplic
             and aip.name = pva_nom_item
             and rownum = 1;

      return true;
    exception
      when no_data_found
      then
        begin
          select 1
            into vnu_exist
            from apex_item_aplic aia
           where     aia.flow_id = vnu_aplic
                 and aia.name = pva_nom_item
                 and rownum = 1;

          return true;
        exception
          when no_data_found
          then
            /* begin
                                   select   1
                 into   vnu_exist
                 from   apex_aplic aa
                where   aa.display_id = vnu_aplic
                        and (   substitution_string_01 = pva_nom_item
                             or substitution_string_02 = pva_nom_item
                             or substitution_string_03 = pva_nom_item
                             or substitution_string_04 = pva_nom_item
                             or substitution_string_05 = pva_nom_item
                             or substitution_string_06 = pva_nom_item
                             or substitution_string_07 = pva_nom_item
                             or substitution_string_08 = pva_nom_item
                             or substitution_string_09 = pva_nom_item
                             or substitution_string_10 = pva_nom_item
                             or substitution_string_11 = pva_nom_item
                             or substitution_string_12 = pva_nom_item
                             or substitution_string_13 = pva_nom_item
                             or substitution_string_14 = pva_nom_item
                             or substitution_string_15 = pva_nom_item
                             or substitution_string_16 = pva_nom_item
                             or substitution_string_17 = pva_nom_item
                             or substitution_string_18 = pva_nom_item
                             or substitution_string_19 = pva_nom_item
                             or substitution_string_20 = pva_nom_item);
               return true;
             exception
               when no_data_found then
                 return false;
             end;*/

            return false;
        end;
    end;
  end exist_item;

  function echap_text (pva_text in varchar2)
    return varchar2
  is
  begin
    return htf.escape_sc (pva_text);
  end echap_text;

  function echap_text_js (pva_text in varchar2)
    return varchar2
  is
  begin
    return replace (pva_text
                   ,''''
                   ,'\''');
  end echap_text_js;

  function echap_text_json (pva_text                    in varchar2
                           ,pva_indic_saut_ligne_html   in varchar2 default 'O'
                           ,pva_seprt_saut_ligne        in varchar2 default ' | ')
    return varchar2
  is
  begin
    return multi_replc (pva_text
                       ,'\'
                       ,'\\'
                       ,'/'
                       ,'\/'
                       ,'"'
                       ,'\"'
                       ,   chr (13)
                        || chr (10)
                       ,case pva_indic_saut_ligne_html when 'O' then '<br \\>' else pva_seprt_saut_ligne end
                       ,chr (10)
                       ,case pva_indic_saut_ligne_html when 'O' then '<br \\>' else pva_seprt_saut_ligne end
                       ,chr (9)
                       ,' ');
  end echap_text_json;

  function rognr (pva_chain   in varchar2
                 ,pva_seprt   in varchar2)
    return varchar2
  is
    vva_chain   varchar2 (32767);
    vnu_postn   pls_integer;
  begin
    vnu_postn      :=
      instr (pva_chain
            ,pva_seprt);

    if vnu_postn > 0
    then
      vva_chain      :=
        substr (pva_chain
               ,1
               ,vnu_postn - 1);
    else
      vva_chain   := pva_chain;
    end if;

    return vva_chain;
  end rognr;

  function obten_parmt_url
    return varchar2
  is
  begin
    return rognr (rognr (afw_15_htp_pkg.echap_url_inver (owa_util.get_cgi_env ('QUERY_STRING'))
                        ,'&p_trace=')
                 ,'&success_msg=');
  end obten_parmt_url;

  function obten_base_url
    return varchar2
  is
  begin
    return    owa_util.get_cgi_env ('SERVER_NAME')
           || obten_dad_url;
  end obten_base_url;

  function obten_furtr
    return varchar2
  is
  begin
    return owa_util.get_cgi_env ('HTTP_USER_AGENT');
  end obten_furtr;

  function obten_dad_url
    return varchar2
  is
  begin
    return    owa_util.get_cgi_env ('SCRIPT_NAME')
           || '/';
  end obten_dad_url;

  function obten_fonct_url
    return varchar2
  is
  begin
    return substr (owa_util.get_cgi_env ('PATH_INFO')
                  ,2);
  end obten_fonct_url;

  function obten_ip
    return varchar2
  is
  begin
    return owa_util.get_cgi_env ('REMOTE_ADDR');
  exception
    when others
    then
      return null;
  end obten_ip;

  function verfr_sesn_vald (pnu_sess in number)
    return boolean
  is
    vnu_sesn_vald   pls_integer;
  begin
    select 1
      into vnu_sesn_vald
      from apex_sesn sesn
     where     sesn.id = pnu_sess
           and rownum = 1;

    return true;
  exception
    when no_data_found
    then
      return false;
  end verfr_sesn_vald;

  function hash (pva_sourc in varchar2)
    return raw
  is
  begin
    return dbms_crypto.hash (utl_raw.cast_to_raw (pva_sourc)
                            ,dbms_crypto.hash_md5);
  end;

  function hash_hexa (pva_sourc in varchar2)
    return varchar2
  is
  begin
    return rawtohex (hash (pva_sourc));
  end;

  function verif_nombr_pair (pnu_nombr in number)
    return varchar2
  is
  begin
    if mod (pnu_nombr
           ,2) = 0
    then
      return 'O';
    else
      return 'N';
    end if;
  end verif_nombr_pair;

  --OBSOLETE
  -- utiliser afw_13_page_pkg.obten_mesg_confr_suprs
  function obten_mesg_suprs
    return varchar2
  is
  begin
    return afw_13_page_pkg.obten_mesg_confr_suprs;
  end obten_mesg_suprs;

  function obten_nom_mois (pda_date in date)
    return varchar2
  is
  begin
    return to_char (pda_date
                   ,'fmmonth');
  end;

  function obten_perd (pda_debut   in date
                      ,pda_fin     in date)
    return varchar2
  is
    vva_perd   varchar2 (50);

    function obten_date_le (pda_date in date)
      return varchar2
    is
    begin
      return    'Le '
             || to_char (pda_date
                        ,'FMDD ')
             || obten_nom_mois (pda_date)
             || to_char (pda_date
                        ,'FM YYYY');
    end;
  begin
    if     pda_debut is not null
       and pda_fin is not null
    then
      if to_char (pda_debut
                 ,'YYYY-MM-DD') <> to_char (pda_fin
                                           ,'YYYY-MM-DD')
      then
        vva_perd      :=
             'Du '
          || to_char (pda_debut
                     ,'FMDD');

        if extract (day from pda_debut) = 1
        then
          vva_perd      :=
               vva_perd
            || 'er';
        end if;

        -- N'ajouter le mois que si le debut et la fin ne se trouve PAS dans le meme mois-an
        if to_char (pda_debut
                   ,'YYYY-MM') <> to_char (pda_fin
                                          ,'YYYY-MM')
        then
          vva_perd      :=
               vva_perd
            || ' '
            || obten_nom_mois (pda_debut);
        end if;

        -- N'ajouter l'annee que si l'annee est differente
        if to_char (pda_debut
                   ,'YYYY') <> to_char (pda_fin
                                       ,'YYYY')
        then
          vva_perd      :=
               vva_perd
            || ' '
            || to_char (pda_debut
                       ,'YYYY');
        end if;

        vva_perd      :=
             vva_perd
          || ' au '
          || to_char (pda_fin
                     ,'FMDD');

        if extract (day from pda_fin) = 1
        then
          vva_perd      :=
               vva_perd
            || 'er';
        end if;

        vva_perd      :=
             vva_perd
          || ' '
          || obten_nom_mois (pda_fin)
          || to_char (pda_fin
                     ,'FM YYYY');
      else
        vva_perd   := obten_date_le (pda_debut);
      end if;
    elsif pda_debut is not null
    then
      vva_perd   := obten_date_le (pda_debut);
    elsif pda_fin is not null
    then
      vva_perd   := obten_date_le (pda_fin);
    else
      vva_perd   := null;
    end if;

    return vva_perd;
  end obten_perd;

  function defnr_tablr_form_numbr (pnu_valr in number)
    return number
  is
  begin
    gnu_tablr_form_numbr   := pnu_valr;
    return null;
  end;

  function defnr_tablr_form_varch (pva_valr in varchar2)
    return number
  is
  begin
    gva_tablr_form_varch   := pva_valr;
    return null;
  end;

  function defnr_tablr_form_date (pda_valr in date)
    return number
  is
  begin
    gda_tablr_form_date   := pda_valr;
    return null;
  end;

  procedure gerer_seprt_decml_item (pva_item in varchar2)
  is
    vva_valr_item   varchar (32000) default v (pva_item);
  begin
    if    instr (vva_valr_item
                ,'.') > 0
       or instr (vva_valr_item
                ,' ') > 0
       or instr (vva_valr_item
                ,'$') > 0
    then
      afw_07_util_pkg.defnr_etat_sessn (pva_item
                                       ,replace (replace (replace (vva_valr_item
                                                                  ,'.'
                                                                  ,',')
                                                         ,' '
                                                         ,null)
                                                ,'$'
                                                ,null));
    end if;
  end gerer_seprt_decml_item;

  procedure gerer_seprt_decml_page
  is
    vva_nom_table   varchar2 (30);
  begin
    select substr (process_sql_clob
                  ,  instr (process_sql_clob
                           ,':'
                           ,1)
                   + 1
                  ,  instr (process_sql_clob
                           ,':'
                           ,1
                           ,2)
                   - instr (process_sql_clob
                           ,':'
                           ,1)
                   - 1)
             nom_table
      into vva_nom_table
      from apex_page_procs
     where     flow_id = afw_07_util_pkg.nv ('APP_ID')
           and flow_step_id = afw_07_util_pkg.nv ('APP_PAGE_ID')
           and process_type = 'DML_FETCH_ROW';

    for rec_item in (select name
                           ,format_mask
                       from apex_item_page  aip
                           ,all_tab_columns atc
                      where     flow_id = afw_07_util_pkg.nv ('APP_ID')
                            and flow_step_id = afw_07_util_pkg.nv ('APP_PAGE_ID')
                            and source is not null
                            and source_type = 'DB_COLUMN'
                            and display_as in ('TEXT'
                                              ,'NATIVE_TEXT_FIELD'
                                              ,'NATIVE_NUMBER_FIELD')
                            and table_name = vva_nom_table
                            and atc.data_type = 'NUMBER'
                            and atc.column_name = aip.source
                            and owner = afw_11_aplic_pkg.obten_schem ())
    loop
      gerer_seprt_decml_item (rec_item.name);
    end loop;
  exception
    when no_data_found
    then
      null;
    when too_many_rows
    then
      null;
  end gerer_seprt_decml_page;

  procedure gerer_seprt_decml_list_item (pva_liste_item varchar2)
  is
    vre_liste_item   apex_application_global.vc_arr2 default string_to_table (pva_liste_item);
  begin
    if vre_liste_item.count () != 0
    then
      for i in vre_liste_item.first () .. vre_liste_item.last ()
      loop
        gerer_seprt_decml_item (vre_liste_item (i));
      end loop;
    end if;
  end gerer_seprt_decml_list_item;

  procedure gerer_seprt_decml_g_fxx (pre_tabl_g_fxx in out nocopy apex_application_global.vc_arr2)
  is
  begin
    if pre_tabl_g_fxx.count () != 0
    then
      for i in pre_tabl_g_fxx.first () .. pre_tabl_g_fxx.last ()
      loop
        begin
          if    instr (pre_tabl_g_fxx (i)
                      ,'.') > 0
             or instr (pre_tabl_g_fxx (i)
                      ,' ') > 0
             or instr (pre_tabl_g_fxx (i)
                      ,'$') > 0
          then
            pre_tabl_g_fxx (i)      :=
              to_number (replace (replace (replace (pre_tabl_g_fxx (i)
                                                   ,'.'
                                                   ,',')
                                          ,' '
                                          ,'')
                                 ,'$'
                                 ,''));
          --TODO::LGCARRIER
          --pourquoi utiliser un regexp_replace avec des alpha?
          --            pre_tabl_g_fxx (i)      :=
          --              to_number (
          --                regexp_replace (
          --                  replace (
          --                    replace (replace (lower (pre_tabl_g_fxx (i)), '.', ',')
          --                            ,' '
          --                            ,'')
          --                   ,'$'
          --                   ,'')
          --                 ,'[^[a-z,A-Z,0-9,-]]*'
          --                 ,''));
          end if;
        exception
          when others
          then
            raise;
        end;
      end loop;
    end if;
  end gerer_seprt_decml_g_fxx;

  procedure gerer_seprt_decml_g_fxx (pva_liste_g_f varchar2)
  is
    vre_liste_item   apex_application_global.vc_arr2 default string_to_table (pva_liste_g_f);
  begin
    if vre_liste_item.count () != 0
    then
      for i in vre_liste_item.first () .. vre_liste_item.last ()
      loop
        case vre_liste_item (i)
          when 1
          then
            gerer_seprt_decml_g_fxx (aa.g_f01);
          when 2
          then
            gerer_seprt_decml_g_fxx (aa.g_f02);
          when 3
          then
            gerer_seprt_decml_g_fxx (aa.g_f03);
          when 4
          then
            gerer_seprt_decml_g_fxx (aa.g_f04);
          when 5
          then
            gerer_seprt_decml_g_fxx (aa.g_f05);
          when 6
          then
            gerer_seprt_decml_g_fxx (aa.g_f06);
          when 7
          then
            gerer_seprt_decml_g_fxx (aa.g_f07);
          when 8
          then
            gerer_seprt_decml_g_fxx (aa.g_f08);
          when 9
          then
            gerer_seprt_decml_g_fxx (aa.g_f09);
          when 10
          then
            gerer_seprt_decml_g_fxx (aa.g_f10);
          when 11
          then
            gerer_seprt_decml_g_fxx (aa.g_f11);
          when 12
          then
            gerer_seprt_decml_g_fxx (aa.g_f12);
          when 13
          then
            gerer_seprt_decml_g_fxx (aa.g_f13);
          when 14
          then
            gerer_seprt_decml_g_fxx (aa.g_f14);
          when 15
          then
            gerer_seprt_decml_g_fxx (aa.g_f15);
          when 16
          then
            gerer_seprt_decml_g_fxx (aa.g_f16);
          when 17
          then
            gerer_seprt_decml_g_fxx (aa.g_f17);
          when 18
          then
            gerer_seprt_decml_g_fxx (aa.g_f18);
          when 19
          then
            gerer_seprt_decml_g_fxx (aa.g_f19);
          when 20
          then
            gerer_seprt_decml_g_fxx (aa.g_f20);
          when 21
          then
            gerer_seprt_decml_g_fxx (aa.g_f21);
          when 22
          then
            gerer_seprt_decml_g_fxx (aa.g_f22);
          when 23
          then
            gerer_seprt_decml_g_fxx (aa.g_f23);
          when 24
          then
            gerer_seprt_decml_g_fxx (aa.g_f24);
          when 25
          then
            gerer_seprt_decml_g_fxx (aa.g_f25);
          when 26
          then
            gerer_seprt_decml_g_fxx (aa.g_f26);
          when 27
          then
            gerer_seprt_decml_g_fxx (aa.g_f27);
          when 28
          then
            gerer_seprt_decml_g_fxx (aa.g_f28);
          when 29
          then
            gerer_seprt_decml_g_fxx (aa.g_f29);
          when 30
          then
            gerer_seprt_decml_g_fxx (aa.g_f30);
          when 31
          then
            gerer_seprt_decml_g_fxx (aa.g_f31);
          when 32
          then
            gerer_seprt_decml_g_fxx (aa.g_f32);
          when 33
          then
            gerer_seprt_decml_g_fxx (aa.g_f33);
          when 34
          then
            gerer_seprt_decml_g_fxx (aa.g_f34);
          when 35
          then
            gerer_seprt_decml_g_fxx (aa.g_f35);
          when 36
          then
            gerer_seprt_decml_g_fxx (aa.g_f36);
          when 37
          then
            gerer_seprt_decml_g_fxx (aa.g_f37);
          when 38
          then
            gerer_seprt_decml_g_fxx (aa.g_f38);
          when 39
          then
            gerer_seprt_decml_g_fxx (aa.g_f39);
          when 40
          then
            gerer_seprt_decml_g_fxx (aa.g_f40);
          when 41
          then
            gerer_seprt_decml_g_fxx (aa.g_f41);
          when 42
          then
            gerer_seprt_decml_g_fxx (aa.g_f42);
          when 43
          then
            gerer_seprt_decml_g_fxx (aa.g_f43);
          when 44
          then
            gerer_seprt_decml_g_fxx (aa.g_f44);
          when 45
          then
            gerer_seprt_decml_g_fxx (aa.g_f45);
          when 46
          then
            gerer_seprt_decml_g_fxx (aa.g_f46);
          when 47
          then
            gerer_seprt_decml_g_fxx (aa.g_f47);
          when 48
          then
            gerer_seprt_decml_g_fxx (aa.g_f48);
          when 49
          then
            gerer_seprt_decml_g_fxx (aa.g_f49);
          when 50
          then
            gerer_seprt_decml_g_fxx (aa.g_f50);
        end case;
      end loop;
    end if;
  end gerer_seprt_decml_g_fxx;

  function encry_clob (pcl_clob   in clob
                      ,pra_cle    in raw)
    return blob
  is
    vbl_blob   blob;
  begin
    dbms_lob.createtemporary (vbl_blob
                             ,true);
    dbms_crypto.encrypt (vbl_blob
                        ,pcl_clob
                        ,dbms_crypto.aes_cbc_pkcs5
                        ,pra_cle);
    return vbl_blob;
  end encry_clob;

  function decry_clob (pbl_blob   in blob
                      ,pra_cle    in raw)
    return clob
  is
    vlc_clob   clob;
  begin
    dbms_lob.createtemporary (vlc_clob
                             ,true);
    dbms_crypto.decrypt (vlc_clob
                        ,pbl_blob
                        ,dbms_crypto.aes_cbc_pkcs5
                        ,pra_cle);
    return vlc_clob;
  end decry_clob;

  function multi_replc (pva_valr            in varchar2
                       ,pva_valr_rechr_1    in varchar2
                       ,pva_valr_rempl_1    in varchar2
                       ,pva_valr_rechr_2    in varchar2 default null
                       ,pva_valr_rempl_2    in varchar2 default null
                       ,pva_valr_rechr_3    in varchar2 default null
                       ,pva_valr_rempl_3    in varchar2 default null
                       ,pva_valr_rechr_4    in varchar2 default null
                       ,pva_valr_rempl_4    in varchar2 default null
                       ,pva_valr_rechr_5    in varchar2 default null
                       ,pva_valr_rempl_5    in varchar2 default null
                       ,pva_valr_rechr_6    in varchar2 default null
                       ,pva_valr_rempl_6    in varchar2 default null
                       ,pva_valr_rechr_7    in varchar2 default null
                       ,pva_valr_rempl_7    in varchar2 default null
                       ,pva_valr_rechr_8    in varchar2 default null
                       ,pva_valr_rempl_8    in varchar2 default null
                       ,pva_valr_rechr_9    in varchar2 default null
                       ,pva_valr_rempl_9    in varchar2 default null
                       ,pva_valr_rechr_10   in varchar2 default null
                       ,pva_valr_rempl_10   in varchar2 default null)
    return varchar2
  is
  begin
    return replace (replace (replace (replace (replace (replace (replace (replace (replace (replace (pva_valr
                                                                                                    ,pva_valr_rechr_1
                                                                                                    ,pva_valr_rempl_1)
                                                                                           ,pva_valr_rechr_2
                                                                                           ,pva_valr_rempl_2)
                                                                                  ,pva_valr_rechr_3
                                                                                  ,pva_valr_rempl_3)
                                                                         ,pva_valr_rechr_4
                                                                         ,pva_valr_rempl_4)
                                                                ,pva_valr_rechr_5
                                                                ,pva_valr_rempl_5)
                                                       ,pva_valr_rechr_6
                                                       ,pva_valr_rempl_6)
                                              ,pva_valr_rechr_7
                                              ,pva_valr_rempl_7)
                                     ,pva_valr_rechr_8
                                     ,pva_valr_rempl_8)
                            ,pva_valr_rechr_9
                            ,pva_valr_rempl_9)
                   ,pva_valr_rechr_10
                   ,pva_valr_rempl_10);
  end multi_replc;

  function revrs_chain (pva_chain in varchar2)
    return varchar2
  is
    vva_retrn   varchar2 (100);
  begin
    if pva_chain is not null
    then
      for i in reverse 1 .. length (pva_chain)
      loop
        vva_retrn      :=
             vva_retrn
          || substr (pva_chain
                    ,i
                    ,1);
      end loop;
    end if;

    return vva_retrn;
  end revrs_chain;

  function obten_prefr (pva_nom_prefr in varchar2)
    return varchar2
  is
  begin
    return wwv_flow_preferences.get_preference (pva_nom_prefr);
  end;

  function obten_carct_entre (pva_chain               in varchar2
                             ,pva_carct_rechr_debut   in varchar2
                             ,pnu_insta_debut         in number
                             ,pva_carct_rechr_fin     in varchar2
                             ,pnu_insta_fin           in number
                             ,pnu_debut_rechr         in number default 1)
    return varchar2
  is
    vnu_debut   pls_integer;
    vnu_fin     pls_integer;
  begin
    --trouver le debut
    vnu_debut      :=
      instr (pva_chain
            ,pva_carct_rechr_debut
            ,pnu_debut_rechr
            ,pnu_insta_debut);
    vnu_fin      :=
      instr (pva_chain
            ,pva_carct_rechr_fin
            ,vnu_debut + 1
            ,pnu_insta_fin);
    return substr (pva_chain
                  ,vnu_debut + 1
                  ,vnu_fin - vnu_debut - 1);
  end obten_carct_entre;

  -- D'apres OWA_UTIL.WHO_CALLED_ME

  procedure procd_appel (pva_propr           out varchar2
                        ,pva_nom             out varchar2
                        ,pnu_numr_ligne      out number
                        ,pva_type            out varchar2
                        ,pnu_pile_suplm   in     number default 0)
  is
    vnu_entre_rechr   pls_integer default 3 + pnu_pile_suplm;
    vva_pile          varchar2 (4096) default dbms_utility.format_call_stack;
    vnu_pos           pls_integer;
    vbo_pile_trouve   boolean default false;
    vva_ligne         varchar2 (255);
    vva_temp          varchar2 (255);
    vnu_compt_pile    pls_integer := 0;
  begin
    loop
      vnu_pos      :=
        instr (vva_pile
              ,chr (10));
      exit when (   vnu_compt_pile = vnu_entre_rechr
                 or vnu_pos is null
                 or vnu_pos = 0);
      vva_ligne      :=
        substr (vva_pile
               ,1
               ,vnu_pos - 1);
      vva_pile      :=
        substr (vva_pile
               ,vnu_pos + 1);

      if not vbo_pile_trouve
      then
        if vva_ligne like '%handle%number%name%'
        then
          vbo_pile_trouve   := true;
        end if;
      else
        vnu_compt_pile   := vnu_compt_pile + 1;

        -- vnu_compt_pile =
        -- 1 : Cette procedure
        -- 2 : Procedure appelante de CETTE procedure
        -- 3 a vnu_entre_rechr - 1: Procedures appelantes de procs intermediaires
        -- vnu_entre_rechr : Procedure appelante de celle interessee

        if vnu_compt_pile = vnu_entre_rechr
        then
          vnu_pos      :=
            instr (vva_ligne
                  ,' ');

          if vnu_pos > 0
          then
            vva_temp      :=
              ltrim (substr (vva_ligne
                            ,vnu_pos));
            vnu_pos      :=
              instr (vva_temp
                    ,' ');
          end if;

          if vnu_pos > 0
          then
            pnu_numr_ligne      :=
              to_number (substr (vva_temp
                                ,1
                                ,vnu_pos - 1));
            vva_ligne      :=
              ltrim (substr (vva_temp
                            ,vnu_pos));
          else
            pnu_numr_ligne   := 0;
          end if;

          vnu_pos      :=
            case
              when vva_ligne like 'pr%' then length ('procedure ')
              when vva_ligne like 'fun%' then length ('function ')
              when vva_ligne like 'package body%' then length ('package body ')
              when vva_ligne like 'pack%' then length ('package ')
              when vva_ligne like 'anonymous%' then length ('anonymous block ')
              else null
            end;

          if vnu_pos is not null
          then
            pva_type      :=
              ltrim (rtrim (upper (substr (vva_ligne
                                          ,1
                                          ,vnu_pos - 1))));
          else
            pva_type   := 'TRIGGER';
          end if;

          vva_ligne      :=
            substr (vva_ligne
                   ,nvl (vnu_pos, 1));
          vnu_pos      :=
            instr (vva_ligne
                  ,'.');
          pva_propr      :=
            ltrim (rtrim (substr (vva_ligne
                                 ,1
                                 ,vnu_pos - 1)));
          pva_nom      :=
            ltrim (rtrim (substr (vva_ligne
                                 ,vnu_pos + 1)));
        end if;
      end if;
    end loop;
  end;

  function procd_appel (pnu_pile_suplm in number default 0)
    return varchar2
  is
    vva_propr        varchar2 (30);
    vva_nom          varchar2 (100);
    vnu_numr_ligne   number;
    vva_type         varchar2 (30);
  begin
    procd_appel (vva_propr
                ,vva_nom
                ,vnu_numr_ligne
                ,vva_type
                ,pnu_pile_suplm + 1 -- Il faut ajouter 1 pour compter cette fonction
                                   );
    return    vva_propr
           || '.'
           || vva_nom
           || '('
           || vnu_numr_ligne
           || ')';
  end;

  function procd_courn
    return varchar2
  is
  begin
    return procd_appel ();
  end;

  function valid_numr_entr (pva_valr in varchar)
    return varchar2
  is
  begin
    if to_number (replace (pva_valr
                          ,' '
                          ,null)) = trunc (to_number (replace (pva_valr
                                                              ,' '
                                                              ,null)))
    then
      return 'O';
    else
      return 'N';
    end if;
  exception
    when others
    then
      return 'N';
  end valid_numr_entr;

  procedure ajout_info_debug (pva_valr in varchar2)
  is
    vva_ts   varchar2 (30);
  begin
    if aa.g_debug
    then
      vva_ts   := to_char (systimestamp - gti_timsp_initl);
      vva_ts      :=
        substr (vva_ts
               ,  instr (vva_ts
                        ,':'
                        ,-1)
                + 1
               ,5);

      aa.debug (   'AFW - '
                || pva_valr);
    end if;
  end ajout_info_debug;

  procedure valdr_date_formt (pva_date    in varchar2
                             ,pva_formt   in varchar2)
  is
    vda_date   date;
  begin
    vda_date      :=
      to_date (pva_date
              ,pva_formt);
  exception
    when others
    then
      if sqlcode in (-1861
                    ,-1839)
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000101'
                                                ,pva_date
                                                ,pva_code_prodt   => 'AFW');
      else
        raise;
      end if;
  end valdr_date_formt;

  function valid_si_modfc (pva_valr_1   in varchar2
                          ,pva_valr_2   in varchar2)
    return boolean
  is
  begin
    if    (pva_valr_1 = pva_valr_2)
       or (    pva_valr_1 is null
           and pva_valr_2 is null)
    then
      return false;
    elsif    (    pva_valr_1 is null
              and pva_valr_2 is not null)
          or (    pva_valr_1 is not null
              and pva_valr_2 is null)
          or (pva_valr_1 <> pva_valr_2)
    then
      return true;
    end if;
  end valid_si_modfc;

  function valid_si_modfc (pnu_valr_1   in number
                          ,pnu_valr_2   in number)
    return boolean
  is
  begin
    if    (pnu_valr_1 = pnu_valr_2)
       or (    pnu_valr_1 is null
           and pnu_valr_2 is null)
    then
      return false;
    elsif    (    pnu_valr_1 is null
              and pnu_valr_2 is not null)
          or (    pnu_valr_1 is not null
              and pnu_valr_2 is null)
          or (pnu_valr_1 <> pnu_valr_2)
    then
      return true;
    end if;
  end valid_si_modfc;

  function valid_si_modfc (pda_valr_1   in date
                          ,pda_valr_2   in date)
    return boolean
  is
  begin
    if    (pda_valr_1 = pda_valr_2)
       or (    pda_valr_1 is null
           and pda_valr_2 is null)
    then
      return false;
    elsif    (    pda_valr_1 is null
              and pda_valr_2 is not null)
          or (    pda_valr_1 is not null
              and pda_valr_2 is null)
          or (pda_valr_1 <> pda_valr_2)
    then
      return true;
    end if;
  end valid_si_modfc;

  procedure ajout_libr_javsc (pva_nom          in varchar2
                             ,pva_reprt        in varchar2 default    afw_11_prodt_pkg.obten_dosr_fichr_afw
                                                                   || 'assets/js/'
                             ,pva_versn        in varchar2 default null
                             ,pbo_saut_extns   in boolean default false
                             ,pbo_exten_mini   in boolean default false)
  is
  begin
    apex_javascript.add_library (pva_nom
                                ,pva_reprt
                                ,pva_versn
                                ,p_skip_extension          => pbo_saut_extns
                                ,p_check_to_add_minified   => pbo_exten_mini);
  end ajout_libr_javsc;

  procedure ajout_code_javsc_charg (pva_code   in varchar2
                                   ,pva_cle    in varchar2 default null)
  is
  begin
    apex_javascript.add_onload_code (pva_code
                                    ,pva_cle);
  end ajout_code_javsc_charg;

  procedure ajout_libr_css (pva_nom          in varchar2
                           ,pva_reprt        in varchar2 default    afw_11_prodt_pkg.obten_dosr_fichr_afw
                                                                 || 'assets/css/'
                           ,pva_versn        in varchar2 default null
                           ,pbo_saut_extns   in boolean default false)
  is
  begin
    apex_css.add_file (pva_nom
                      ,pva_reprt
                      ,pva_versn
                      ,p_skip_extension   => pbo_saut_extns);
  end ajout_libr_css;

  procedure ajout_css (pva_style            in varchar2
                      ,pbo_inser_en_ligne   in boolean default true)
  is
  begin
    if pbo_inser_en_ligne
    then
      afw_15_htp_pkg.ouvri_bals ('style'
                                ,'type'
                                ,'text/css');
      afw_15_htp_pkg.ecrir (pva_style);
      afw_15_htp_pkg.fermr_bals ('style');
    else
      apex_css.add (pva_style);
    end if;
  end;

  function verif_presn_role (pva_role in varchar2)
    return boolean
  is
    vnu_role_exist   pls_integer default 0;
  begin
    select count (1)
      into vnu_role_exist
      from user_role_privs
     where     granted_role = pva_role
           and rownum = 1;

    return vnu_role_exist = 1;
  end verif_presn_role;

  function obten_evalt_code_utils (pva_utils in varchar2)
    return varchar2
  is
    vva_utils         varchar2 (30);
    vva_utils_compl   varchar2 (61);
  begin
    if instr (pva_utils
             ,':') > 0
    then
      vva_utils_compl      :=
        substr (pva_utils
               ,1
               ,  instr (pva_utils
                        ,':')
                - 1);
    else
      vva_utils_compl   := pva_utils;
    end if;

    if instr (vva_utils_compl
             ,'@') > 0
    then
      vva_utils      :=
        substr (vva_utils_compl
               ,  instr (vva_utils_compl
                        ,'@')
                + 1);
    else
      vva_utils   := vva_utils_compl;
    end if;

    return upper (vva_utils);
  end obten_evalt_code_utils;

  procedure genr_css_entet_page
  is
  begin
    if gva_css_entet_page is not null
    then
      afw_15_htp_pkg.ouvri_bals ('style'
                                ,'type'
                                ,'text/css');
      afw_15_htp_pkg.ecrir (gva_css_entet_page);
      afw_15_htp_pkg.fermr_bals ('style');
    end if;
  end genr_css_entet_page;

  procedure genr_javsc_entet_page
  is
  begin
    if gva_javsc_entet_page is not null
    then
      afw_15_htp_pkg.ouvri_bals ('script'
                                ,'type'
                                ,'text/javascript');
      afw_15_htp_pkg.ecrir (gva_javsc_entet_page);
      afw_15_htp_pkg.fermr_bals ('script');
    end if;
  end genr_javsc_entet_page;

  function nv_force (pva_item in varchar2)
    return number
  is
    vnu_numbr   number;
    vnu_app     number default v ('APP_ID');
    vnu_insta   number default apex_application.g_instance;
  begin
    select to_number (item_value_vc2)
      into vnu_numbr
      from apex_sesn_valr_item
     where     flow_id = vnu_app
           and item_name = pva_item
           and flow_instance = vnu_insta;

    return vnu_numbr;
  exception
    when others
    then
      return null;
  end nv_force;

  procedure aret_trait_page_apex
  is
  begin
    --aa.g_unrecoverable_error := true;
    apex_application.stop_apex_engine;
  exception
    when apex_application.e_stop_apex_engine
    then
      null;
  -- Ne pas propager le RAISE de l'exception autrement, on doit modifier tous les appels de ARET_TRAIT_PAGE_APEX
  --raise;
  end aret_trait_page_apex;

  function obten_reslt_expre_plsql (pva_expre_plsql in varchar2)
    return varchar2
  is
  begin
    return apex_plugn_util.get_plsql_expression_result (pva_expre_plsql);
  end obten_reslt_expre_plsql;

  function obten_reslt_expre_plsql_bool (pva_expre_plsql in varchar2)
    return boolean
  is
  begin
    return apex_plugn_util.get_plsql_expr_result_boolean (pva_expre_plsql);
  end obten_reslt_expre_plsql_bool;

  function obten_schem_apex
    return varchar2
  is
  begin
    return afw_07_util_noyau_pkg.obten_schem_apex;
  end obten_schem_apex;

  function obten_versn_apex
    return apex_release.version_no%type
  is
    vva_versn   apex_release.version_no%type;
  begin
    select version_no
      into vva_versn
      from apex_release;

    return vva_versn;
  end obten_versn_apex;

  function purgr_html (pva_chain in varchar2)
    return varchar2
  is
  begin
    return multi_replc (multi_replc (apex_aplic_util.striphtml (pva_chain)
                                    ,'&eacute;'
                                    ,'é'
                                    ,'&Eacute;'
                                    ,'É'
                                    ,'&ecirc;'
                                    ,'ê'
                                    ,'&nbsp;'
                                    ,' '
                                    ,'&Agrave;'
                                    ,'À'
                                    ,'&egrave;'
                                    ,'è'
                                    ,'&Eacute;'
                                    ,'É'
                                    ,'&amp;'
                                    ,'&'
                                    ,'&agrave;'
                                    ,'à'
                                    ,'&ccedil;'
                                    ,'ç')
                       ,'&quot;'
                       ,''''
                       ,'&euml;'
                       ,'ë'
                       ,'&ocirc;'
                       ,'ô'
                       ,'&ucirc;'
                       ,'û'
                       ,'&auml;'
                       ,'ä'
                       ,'&iuml;'
                       ,'ï'
                       ,'&Egrave;'
                       ,'È'
                       ,'&Ecirc;'
                       ,'Ê'
                       ,'&gt;'
                       ,'>'
                       ,'&lt;'
                       ,'<');
  end purgr_html;

  function encry_valr (pva_valr in varchar2)
    return raw
  is
  begin
    return dbms_crypto.encrypt (utl_i18n.string_to_raw (pva_valr
                                                       ,gva_charc_set)
                               ,gnu_mod_encry
                               ,gra_cle_encry_base);
  end encry_valr;

  function racrc_chain (pva_chain   in varchar2
                       ,pnu_longr   in number)
    return varchar2
  is
    exc_carct_longr         exception;

    vnu_descr_carct_longr   number;
  begin
    -- Si la chaine à une grandeur négative.
    if pnu_longr <= 0
    then
      raise exc_carct_longr;
    end if;

    -- Longueur de la chaine
    vnu_descr_carct_longr   := length (pva_chain);

    -- Si la chaine est plus longue que la grandeur permise
    if vnu_descr_carct_longr > pnu_longr
    then
      return    trim (substr (pva_chain
                             ,0
                             ,pnu_longr))
             || '...';
    else
      -- Si la chaine est plus courte que la grandeur permise.
      return trim (pva_chain);
    end if;
  exception
    when exc_carct_longr
    then
      return trim (pva_chain);
    when others
    then
      return trim (pva_chain);
  end racrc_chain;

  function boln_vers_numrq (pbo_valr_boln in boolean)
    return number
  is
    vnu_valr_retr   number (1) default 0;
  begin
    if pbo_valr_boln = true
    then
      vnu_valr_retr   := 1;
    end if;

    return vnu_valr_retr;
  end boln_vers_numrq;

  function boln_vers_alpha (pbo_valr_boln in boolean)
    return varchar2
  is
    vva_valr_retr   varchar2 (1) default 'N';
  begin
    if pbo_valr_boln = true
    then
      vva_valr_retr   := 'O';
    end if;

    return vva_valr_retr;
  end boln_vers_alpha;

  function obten_jeu_carct
    return varchar2
  is
    vva_jeu_carct   nls_database_parameters.value%type;
  begin
    select value
      into vva_jeu_carct
      from nls_database_parameters
     where parameter = 'NLS_CHARACTERSET';

    return vva_jeu_carct;
  end obten_jeu_carct;

  function obten_id_jeu_carct
    return number
  is
    vnu_id_jeu_carct   number;
  begin
    select nls_charset_id (value)
      into vnu_id_jeu_carct
      from nls_database_parameters
     where parameter = 'NLS_CHARACTERSET';

    return vnu_id_jeu_carct;
  end obten_id_jeu_carct;

  function obten_date_fin_temps
    return date
  is
  begin
    return to_date ('9999-12-31'
                   ,'YYYY-MM-DD');
  end obten_date_fin_temps;

  function obten_carct_decml
    return varchar2
  is
    vva_carct_decml   varchar2 (1);
  begin
    select substr (value
                  ,1
                  ,1)
      into vva_carct_decml
      from nls_session_parameters
     where parameter = 'NLS_NUMERIC_CHARACTERS';

    return vva_carct_decml;
  end obten_carct_decml;

  function obten_seprt_group
    return varchar2
  is
    vva_seprt_group   varchar2 (1);
  begin
    select substr (value
                  ,2
                  ,1)
      into vva_seprt_group
      from nls_session_parameters
     where parameter = 'NLS_NUMERIC_CHARACTERS';

    return vva_seprt_group;
  end obten_seprt_group;

  function obten_ident_jeu_carct (pva_code_jeu_carct in varchar2)
    return number
  is
  begin
    return nls_charset_id (pva_code_jeu_carct);
  end obten_ident_jeu_carct;

  procedure telvr_fichr (pcl_fichr              in clob
                        ,pva_nom_fichr          in varchar2
                        ,pva_contn_type         in varchar2 default 'text/plain'
                        ,pbo_atach              in boolean default true
                        ,pbo_arret_engin_apex   in boolean default false
                        ,pnu_chars_id           in number default 0)
  is
    vlb             blob;
    vnu_off_sourc   pls_integer default 1;
    vnu_off_dest    pls_integer default 1;
    vnu_lang        pls_integer default 0;
    vnu_warng       pls_integer;
  begin
    if pbo_arret_engin_apex
    then
      aa.g_page_text_generated   := true;
      aa.g_unrecoverable_error   := true;
    --afw_07_util_pkg.aret_trait_page_apex;
    end if;

    dbms_lob.createtemporary (vlb
                             ,true);
    dbms_lob.converttoblob (vlb
                           ,pcl_fichr
                           ,dbms_lob.lobmaxsize
                           , --dbms_lob.getlength (pcl_fichr), /**/
                            vnu_off_dest
                           ,vnu_off_sourc
                           ,pnu_chars_id
                           ,vnu_lang
                           ,vnu_warng);

    afw_15_htp_pkg.creer_temn_trait_servr ();

    owa_util.mime_header (ccontent_type   => nvl (pva_contn_type, 'application/octet')
                         ,bclose_header   => false);

    htp.p (   'Content-length: '
           || dbms_lob.getlength (vlb));

    if pbo_atach
    then
      htp.p (   'Content-Disposition: attachment; filename="'
             || pva_nom_fichr
             || '"');
    else
      htp.p (   'Content-Disposition: filename="'
             || pva_nom_fichr
             || '"');
    end if;

    owa_util.http_header_close;
    wpg_docload.download_file (vlb);
  end;

  procedure telvr_fichr (pbl_fichr              in out nocopy blob
                        ,pva_nom_fichr          in            varchar2
                        ,pva_contn_type         in            varchar2
                        ,pbo_atach              in            boolean default true
                        ,pbo_arret_engin_apex   in            boolean default false
                        ,pnu_chars_id           in            number default 0)
  is
  begin
    if pbo_arret_engin_apex
    then
      aa.g_page_text_generated   := true;
      afw_07_util_pkg.aret_trait_page_apex;
    end if;

    afw_15_htp_pkg.creer_temn_trait_servr ();

    owa_util.mime_header (ccontent_type   => nvl (pva_contn_type, 'application/octet')
                         ,bclose_header   => false);

    htp.p (   'Content-length: '
           || dbms_lob.getlength (pbl_fichr));

    if pbo_atach
    then
      htp.p (   'Content-Disposition: attachment; filename="'
             || pva_nom_fichr
             || '"');
    else
      htp.p (   'Content-Disposition: filename="'
             || pva_nom_fichr
             || '"');
    end if;

    owa_util.http_header_close;
    wpg_docload.download_file (pbl_fichr);
  end;
begin
  gti_timsp_initl   := systimestamp;
end afw_07_util_pkg;
/
