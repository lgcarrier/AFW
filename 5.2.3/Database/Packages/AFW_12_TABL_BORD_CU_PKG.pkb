SET DEFINE OFF;
create or replace package body afw_12_tabl_bord_cu_pkg
is
  function obten_valr_parmt_date (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return date
  is
    row_parmt    vd_i_afw_12_lien_gadgt_utils_p%rowtype
                   := afw_12_tabl_bord_pkg.obten_row_lgup (pnu_seqnc_lgup
                                                          ,'DATE');
    vdt_result   date := null;
  begin
    case afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don)
      when 'STATC'
      then
        vdt_result      :=
          to_date (row_parmt.forml_don
                  ,'YYYY-MM-DD HH24:MI:SS');
      when 'DYNMQ'
      then
        if row_parmt.ref_lien_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_date (afw_12_tabl_bord_pkg.obten_forml_lgpr (row_parmt.ref_lien_gadgt_parmt_racrc));
        elsif row_parmt.ref_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_date (afw_12_tabl_bord_pkg.obten_forml_gpr (row_parmt.ref_gadgt_parmt_racrc));
        end if;
      when 'AVANC'
      then
        vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_date (row_parmt.forml_don);
      else
        vdt_result   := null;
    end case;

    return vdt_result;
  exception
    when others
    then
      raise;
  end;


  function obten_valr_parmt_numbr (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return number
  is
    row_parmt    vd_i_afw_12_lien_gadgt_utils_p%rowtype
                   := afw_12_tabl_bord_pkg.obten_row_lgup (pnu_seqnc_lgup
                                                          ,'NUMBR');
    vdt_result   number := null;
  begin
    case afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don)
      when 'STATC'
      then
        vdt_result   := to_number (row_parmt.forml_don);
      when 'DYNMQ'
      then
        if row_parmt.ref_lien_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_numbr (afw_12_tabl_bord_pkg.obten_forml_lgpr (row_parmt.ref_lien_gadgt_parmt_racrc));
        elsif row_parmt.ref_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_numbr (afw_12_tabl_bord_pkg.obten_forml_gpr (row_parmt.ref_gadgt_parmt_racrc));
        end if;
      when 'AVANC'
      then
        vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_numbr (row_parmt.forml_don);
      else
        vdt_result   := null;
    end case;

    return vdt_result;
  exception
    when others
    then
      raise;
  end;

  function obten_valr_parmt_boln (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return boolean
  is
    row_parmt    vd_i_afw_12_lien_gadgt_utils_p%rowtype
                   := afw_12_tabl_bord_pkg.obten_row_lgup (pnu_seqnc_lgup
                                                          ,'BOLN');
    vdt_result   boolean := null;
  begin
    case afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don)
      when 'STATC'
      then
        vdt_result   := case when row_parmt.forml_don = 'O' then true when row_parmt.forml_don = 'Y' then true when row_parmt.forml_don = 'N' then false end;
      when 'DYNMQ'
      then
        if row_parmt.ref_lien_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_boln (afw_12_tabl_bord_pkg.obten_forml_lgpr (row_parmt.ref_lien_gadgt_parmt_racrc));
        elsif row_parmt.ref_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_boln (afw_12_tabl_bord_pkg.obten_forml_gpr (row_parmt.ref_gadgt_parmt_racrc));
        end if;
      when 'AVANC'
      then
        vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_boln (row_parmt.forml_don);
      else
        vdt_result   := null;
    end case;

    return vdt_result;
  exception
    when others
    then
      raise;
  end;

  function obten_valr_parmt_boln_vc (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return varchar2
  is
    row_parmt    vd_i_afw_12_lien_gadgt_utils_p%rowtype
                   := afw_12_tabl_bord_pkg.obten_row_lgup (pnu_seqnc_lgup
                                                          ,'BOLN');
    vdt_result   varchar2 (1) := null;
  begin
    case afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don)
      when 'STATC'
      then
        vdt_result   := case when row_parmt.forml_don = 'Y' then 'O' else row_parmt.forml_don end;
      when 'DYNMQ'
      then
        if row_parmt.ref_lien_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_boln_v (afw_12_tabl_bord_pkg.obten_forml_lgpr (row_parmt.ref_lien_gadgt_parmt_racrc));
        elsif row_parmt.ref_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_boln_v (afw_12_tabl_bord_pkg.obten_forml_gpr (row_parmt.ref_gadgt_parmt_racrc));
        end if;
      when 'AVANC'
      then
        vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql_boln_v (row_parmt.forml_don);
      else
        vdt_result   := null;
    end case;

    return vdt_result;
  exception
    when others
    then
      raise;
  end;

  function obten_valr_parmt_varch (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return varchar2
  is
    row_parmt    vd_i_afw_12_lien_gadgt_utils_p%rowtype
                   := afw_12_tabl_bord_pkg.obten_row_lgup (pnu_seqnc_lgup
                                                          ,'VARCH');
    vdt_result   varchar2 (4000) := null;
  begin
    case afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don)
      when 'STATC'
      then
        vdt_result   := row_parmt.forml_don;
      when 'DYNMQ'
      then
        if row_parmt.ref_lien_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql (afw_12_tabl_bord_pkg.obten_forml_lgpr (row_parmt.ref_lien_gadgt_parmt_racrc));
        elsif row_parmt.ref_gadgt_parmt_racrc is not null
        then
          vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql (afw_12_tabl_bord_pkg.obten_forml_gpr (row_parmt.ref_gadgt_parmt_racrc));
        end if;
      when 'AVANC'
      then
        vdt_result   := afw_21_util_pkg.obten_reslt_expre_plsql (row_parmt.forml_don);
      else
        vdt_result   := null;
    end case;

    return vdt_result;
  exception
    when others
    then
      raise;
  end;

  function obten_valr_parmt_list_m (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return varchar2
  is
    row_parmt    vd_i_afw_12_lien_gadgt_utils_p%rowtype
                   := afw_12_tabl_bord_pkg.obten_row_lgup (pnu_seqnc_lgup
                                                          ,'LIST_M');
    vdt_result   varchar2 (4000) := null;
  begin
    case afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don)
      when 'STATC'
      then
        vdt_result   := row_parmt.forml_don;
      else
        vdt_result   := null;
    end case;

    return vdt_result;
  exception
    when others
    then
      raise;
  end;

  function obten_valr_parmt_list_s (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return varchar2
  is
    row_parmt    vd_i_afw_12_lien_gadgt_utils_p%rowtype
                   := afw_12_tabl_bord_pkg.obten_row_lgup (pnu_seqnc_lgup
                                                          ,'LIST_S');
    vdt_result   varchar2 (4000) := null;
  begin
    case afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don)
      when 'STATC'
      then
        vdt_result   := row_parmt.forml_don;
      else
        vdt_result   := null;
    end case;

    return vdt_result;
  exception
    when others
    then
      raise;
  end;

  function obten_valr_parmt_date (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                 ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return date
  is
    vnu_seqnc_lgup   vd_i_afw_12_lien_gadgt_utils.seqnc%type
                       := afw_12_tabl_bord_pkg.obten_seqnc_lgup (pnu_seqnc_lgu
                                                                ,pva_gadgt_parmt_code);
  begin
    return obten_valr_parmt_date (vnu_seqnc_lgup);
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_valr_parmt_numbr (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                  ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return number
  is
    vnu_seqnc_lgup   vd_i_afw_12_lien_gadgt_utils.seqnc%type
                       := afw_12_tabl_bord_pkg.obten_seqnc_lgup (pnu_seqnc_lgu
                                                                ,pva_gadgt_parmt_code);
  begin
    return obten_valr_parmt_numbr (vnu_seqnc_lgup);
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_valr_parmt_boln (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                 ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return boolean
  is
    vnu_seqnc_lgup   vd_i_afw_12_lien_gadgt_utils.seqnc%type
                       := afw_12_tabl_bord_pkg.obten_seqnc_lgup (pnu_seqnc_lgu
                                                                ,pva_gadgt_parmt_code);
  begin
    return obten_valr_parmt_boln (vnu_seqnc_lgup);
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_valr_parmt_boln_vc (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                    ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return varchar2
  is
    vnu_seqnc_lgup   vd_i_afw_12_lien_gadgt_utils.seqnc%type
                       := afw_12_tabl_bord_pkg.obten_seqnc_lgup (pnu_seqnc_lgu
                                                                ,pva_gadgt_parmt_code);
  begin
    return obten_valr_parmt_boln_vc (vnu_seqnc_lgup);
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_valr_parmt_varch (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                  ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return varchar2
  is
    vnu_seqnc_lgup   vd_i_afw_12_lien_gadgt_utils.seqnc%type
                       := afw_12_tabl_bord_pkg.obten_seqnc_lgup (pnu_seqnc_lgu
                                                                ,pva_gadgt_parmt_code);
  begin
    return obten_valr_parmt_varch (vnu_seqnc_lgup);
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_valr_parmt_list_m (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                   ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return varchar2
  is
    vnu_seqnc_lgup   vd_i_afw_12_lien_gadgt_utils.seqnc%type
                       := afw_12_tabl_bord_pkg.obten_seqnc_lgup (pnu_seqnc_lgu
                                                                ,pva_gadgt_parmt_code);
  begin
    return obten_valr_parmt_list_m (vnu_seqnc_lgup);
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_valr_parmt_list_s (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                   ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return varchar2
  is
    vnu_seqnc_lgup   vd_i_afw_12_lien_gadgt_utils.seqnc%type
                       := afw_12_tabl_bord_pkg.obten_seqnc_lgup (pnu_seqnc_lgu
                                                                ,pva_gadgt_parmt_code);
  begin
    return obten_valr_parmt_list_s (vnu_seqnc_lgup);
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_valr_boln_afich (vva_forml_don in vd_i_afw_12_lien_gadgt_utils_p.forml_don%type)
    return varchar2;

  function obten_valr_liste_s_afich (pnu_seqnc_lgup   in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                    ,vva_forml_don    in vd_i_afw_12_lien_gadgt_utils_p.forml_don%type)
    return varchar2;

  function obten_valr_liste_m_afich (pnu_seqnc_lgup         in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                    ,vva_forml_don          in vd_i_afw_12_lien_gadgt_utils_p.forml_don%type
                                    ,vva_char_seprt_afich   in varchar2 default ', '
                                    ,vva_char_seprt_don     in varchar2 default ':')
    return varchar2;

  function obten_valr_parmt_afich (pnu_seqnc_lgup      in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type
                                  ,pva_type_don_code   in varchar2)
    return varchar2
  is
    vva_result   vd_i_afw_12_lien_gadgt_utils_p.forml_don%type := null;
  begin
    case pva_type_don_code
      when 'DATE'
      then
        vva_result      :=
          to_char (obten_valr_parmt_date (pnu_seqnc_lgup)
                  ,'YYYY-MM-DD HH24:MI:SS');
      when 'NUMBR'
      then
        vva_result   := to_char (obten_valr_parmt_numbr (pnu_seqnc_lgup));
      when 'BOLN'
      then
        vva_result   := obten_valr_parmt_boln_vc (pnu_seqnc_lgup);
        vva_result   := obten_valr_boln_afich (vva_result);
      when 'VARCH'
      then
        vva_result   := obten_valr_parmt_varch (pnu_seqnc_lgup);
      when 'LIST_S'
      then
        vva_result   := obten_valr_parmt_list_s (pnu_seqnc_lgup);
        vva_result      :=
          obten_valr_liste_s_afich (pnu_seqnc_lgup
                                   ,vva_result);
      when 'LIST_M'
      then
        vva_result   := obten_valr_parmt_list_m (pnu_seqnc_lgup);
        vva_result      :=
          obten_valr_liste_m_afich (pnu_seqnc_lgup
                                   ,vva_result);
      else
        vva_result   := null;
    end case;

    return vva_result;
  exception
    when others
    then
      return '{ERROR}';
  end;

  function obten_valr_boln_afich (vva_forml_don in vd_i_afw_12_lien_gadgt_utils_p.forml_don%type)
    return varchar2
  is
    vva_result   varchar2 (3) := null;
  begin
    --TODO : Traduire
    if vva_forml_don = 'O'
    then
      vva_result   := 'Yes';
    elsif vva_forml_don = 'N'
    then
      vva_result   := 'No';
    end if;

    return vva_result;
  end;

  function obten_valr_liste_s_afich (pnu_seqnc_lgup   in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                    ,vva_forml_don    in vd_i_afw_12_lien_gadgt_utils_p.forml_don%type)
    return varchar2
  is
    vva_result           vd_i_afw_12_lien_gadgt_utils_p.forml_don%type;
    vnu_ref_domn_valr    vd_i_afw_14_domn_valr.seqnc%type;
    vva_code_domn_valr   vd_i_afw_14_domn_valr.code%type;
    vva_enonc_sourc      vd_i_afw_14_domn_valr.enonc_sourc%type;
  begin
    afw_12_tabl_bord_pkg.obten_infor_dv_parmt (pnu_seqnc_lgup
                                              ,vnu_ref_domn_valr
                                              ,vva_code_domn_valr
                                              ,vva_enonc_sourc);

    if vva_enonc_sourc is null
    then
      vva_result   := afw_14_domn_valr_pkg.obten_valr (vva_forml_don);
    else
      vva_result      :=
        afw_14_domn_valr_cu_pkg.obten_valr (vva_code_domn_valr
                                           ,vva_forml_don);
    end if;

    return vva_result;
  end;

  function obten_valr_liste_m_afich (pnu_seqnc_lgup         in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                    ,vva_forml_don          in vd_i_afw_12_lien_gadgt_utils_p.forml_don%type
                                    ,vva_char_seprt_afich   in varchar2 default ', '
                                    ,vva_char_seprt_don     in varchar2 default ':')
    return varchar2
  is
    vva_result   vd_i_afw_12_lien_gadgt_utils_p.forml_don%type;
    vbl_first    boolean := true;

    cursor vals
    is
          select trim (regexp_substr (vva_forml_don
                                     ,   '[^'
                                      || vva_char_seprt_don
                                      || ']+'
                                     ,1
                                     ,level))
                   don
            from dual
      connect by level <=   regexp_count (vva_forml_don
                                         ,vva_char_seprt_don)
                          + 1;
  begin
    for val in vals
    loop
      if vbl_first
      then
        vbl_first   := false;
      else
        vva_result      :=
             vva_result
          || vva_char_seprt_afich;
      end if;

      vva_result      :=
           vva_result
        || obten_valr_liste_s_afich (pnu_seqnc_lgup
                                    ,val.don);
    end loop;

    return vva_result;
  end;
end afw_12_tabl_bord_cu_pkg;
/
