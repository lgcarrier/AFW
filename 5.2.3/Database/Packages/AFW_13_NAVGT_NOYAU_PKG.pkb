SET DEFINE OFF;
create or replace package body afw_13_navgt_noyau_pkg
as
  cursor cur_item_rechr (pnu_ref_page          in number
                        ,pva_schem             in varchar2
                        ,pva_table             in varchar2
                        ,pva_inclu_non_rechr   in varchar2 default 'N')
  is
    select aip.source                   nom_coln
          ,aip.name                     nom_item
          ,null                         type_don
          ,aip.format_mask              formt
          ,afw_07_util_pkg.v (aip.name) valr_rechr
          ,pi.indic_rechr
      from vd_i_afw_13_page_item pi
          ,apex_item_page        aip
     where     pi.ref_page = pnu_ref_page
           and (   pva_inclu_non_rechr = 'O'
                or pi.indic_rechr = 'O')
           and aip.id = pi.id_apex;


  function obten_item_rechr (pnu_ref_page          in number
                            ,pva_schem             in varchar2
                            ,pva_table             in varchar2
                            ,pva_inclu_non_rechr   in varchar2 default 'N')
    return typ_arr_item_rechr
  is
    var_item_rechr   typ_arr_item_rechr;
  begin
    open cur_item_rechr (pnu_ref_page
                        ,pva_schem
                        ,pva_table
                        ,pva_inclu_non_rechr);

    fetch cur_item_rechr
      bulk collect into var_item_rechr;

    close cur_item_rechr;

    return var_item_rechr;
  end;

  function obten_sql (pnu_navgt in number)
    return varchar2
  is
    vva_sql   varchar2 (32767);
  begin
    select enonc_sql
      into vva_sql
      from vd_afw_13_navgt
     where seqnc = pnu_navgt;

    vva_sql      :=
      replace (vva_sql
              ,'"#OWNER#".'
              ,null);

    return vva_sql;
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_indic_extra_total (pnu_page in number)
    return varchar2
  is
    vva_indic_extra_total   vd_i_afw_12_struc_aplic.indic_extra_tout%type;
  begin
    select indic_extra_tout
      into vva_indic_extra_total
      from vd_i_afw_12_struc_aplic sa
     where sa.seqnc = afw_13_page_pkg.obten_struc_aplic (pnu_page);

    return vva_indic_extra_total;
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_tail_tabl_extra (pnu_page in number)
    return number
  is
    vnu_tail_tabl_extra   vd_i_afw_12_struc_aplic.tail_tabl_extra%type;
  begin
    select nvl (tail_tabl_extra, 0)
      into vnu_tail_tabl_extra
      from vd_i_afw_12_struc_aplic sa
     where sa.seqnc = afw_13_page_pkg.obten_struc_aplic (pnu_page);

    return vnu_tail_tabl_extra;
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_indic_extra_total_prodt (pnu_prodt in number)
    return varchar2
  is
    vva_indic_extra_total   vd_i_afw_11_prodt.indic_extra_tout%type;
  begin
    select indic_extra_tout
      into vva_indic_extra_total
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vva_indic_extra_total;
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_tail_tabl_extra_prodt (pnu_prodt in number)
    return number
  is
    vnu_tail_tabl_extra   vd_i_afw_11_prodt.tail_tabl_extra%type;
  begin
    select nvl (tail_tabl_extra, 0)
      into vnu_tail_tabl_extra
      from vd_i_afw_11_prodt
     where seqnc = pnu_prodt;

    return vnu_tail_tabl_extra;
  exception
    when no_data_found
    then
      return null;
  end;

  procedure suprm_navgt_courn
  is
  begin
    delete vd_afw_13_navgt;
  end;

  function creer_navgt (pva_indic_extra_total   in varchar2
                       ,pva_indic_extra_termn   in varchar2
                       ,pnu_nombr_rang_extra    in number
                       ,pva_selct               in varchar2
                       ,pnu_tail_tabl_extra     in number
                       ,pnu_rpts_id             in number
                       ,pnu_ref_ir              in number)
    return number
  is
    vnu_navgt   number;
    vcl_selct   clob;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Créer la navigation');
    -- Supprimer la navigation courante au cas où une existe déjà
    suprm_navgt_courn ();

    vcl_selct   := aa.do_substitutions (pva_selct);

    insert into vd_afw_13_navgt (ref_fil_arian
                                ,indic_extra_total
                                ,indic_extra_termn
                                ,nombr_rang_extra
                                ,enonc_sql
                                ,tail_tabl_extra
                                ,apex_repts_id
                                ,ref_raprt_inter)
         values (afw_04_fil_arian_pkg.obten_fa_courn ()
                ,pva_indic_extra_total
                ,pva_indic_extra_termn
                ,pnu_nombr_rang_extra
                ,vcl_selct
                ,pnu_tail_tabl_extra
                ,pnu_rpts_id
                ,pnu_ref_ir)
      returning seqnc
           into vnu_navgt;

    return vnu_navgt;
  exception
    when others
    then
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SAF.000031'
                                                     ,pva_code_prodt   => 'AFW');
      afw_03_journ_pkg.ecrir_journ (null
                                   ,null
                                   ,'SEM_ANOML_N1'
                                   ,false);
      return null;
  end;

  function obten_navgt_courn (pnu_navgt               out number
                             ,pva_indic_extra_total   out varchar2
                             ,pva_indic_extra_termn   out varchar2
                             ,pnu_nombr_rang_extra    out number
                             ,pnu_tail_tabl_extra     out number
                             ,pnu_rpts_id             out number
                             ,pnu_ref_ir              out number)
    return boolean
  is
  begin
    select seqnc
          ,indic_extra_total
          ,indic_extra_termn
          ,nombr_rang_extra
          ,tail_tabl_extra
          ,apex_repts_id
          ,ref_raprt_inter
      into pnu_navgt
          ,pva_indic_extra_total
          ,pva_indic_extra_termn
          ,pnu_nombr_rang_extra
          ,pnu_tail_tabl_extra
          ,pnu_rpts_id
          ,pnu_ref_ir
      from vd_afw_13_navgt;

    return true;
  exception
    when no_data_found
    then
      return false;
  end;


  procedure maj_navgt (pnu_navgt               in number
                      ,pva_indic_extra_total   in varchar2
                      ,pva_indic_extra_termn   in varchar2
                      ,pnu_nombr_rang_extra    in number
                      ,pnu_rpts_id             in number
                      ,pnu_ref_ir              in number)
  is
  begin
    update vd_afw_13_navgt
       set indic_extra_total   = pva_indic_extra_total
          ,indic_extra_termn   = pva_indic_extra_termn
          ,nombr_rang_extra    = pnu_nombr_rang_extra
          ,apex_repts_id       = pnu_rpts_id
          ,ref_raprt_inter     = pnu_ref_ir
     where seqnc = pnu_navgt;
  end;

  procedure ajout_elemn_navgt (pnu_navgt         in number
                              ,pnu_numr_elemn    in number
                              ,pnu_sspc          in number
                              ,pva_indic_courn   in varchar2)
  is
  begin
    insert into afw_13_navgt_elemn (numr_elemn
                                   ,indic_courn
                                   ,seqnc_elemn
                                   ,ref_navgt)
         values (pnu_numr_elemn
                ,pva_indic_courn
                ,pnu_sspc
                ,pnu_navgt);
  end;

  procedure defnr_elemn_courn_sspc (pnu_sspc in number)
  is
  begin
    -- Enlever l'indicateur courant de l'élément courant actuel
    update vd_afw_13_navgt_elemn
       set indic_courn   = 'N'
     where indic_courn = 'O';

    -- Définir le nouveau
    update vd_afw_13_navgt_elemn
       set indic_courn   = 'O'
     where seqnc_elemn = pnu_sspc;
  end;

  function obten_sspc_numr_elemn (pva_indic_extra_termn   in     varchar2
                                 ,pnu_numr                in     number
                                 ,pnu_numr_elemn             out number)
    return number
  is
    vnu_seqnc        number;
    vnu_numr_elemn   number;
  begin
    if pnu_numr > 0
    then
      vnu_numr_elemn   := pnu_numr;

      select seqnc_elemn
        into vnu_seqnc
        from vd_afw_13_navgt_elemn ne
       where ne.numr_elemn = pnu_numr;
    elsif pva_indic_extra_termn = 'O'
    then
      select seqnc_elemn
            ,numr_elemn
        into vnu_seqnc
            ,vnu_numr_elemn
        from vd_afw_13_navgt_elemn ne
       where ne.numr_elemn =   (select max (ne2.numr_elemn)
                                  from vd_afw_13_navgt_elemn ne2)
                             + 1
                             + pnu_numr;
    end if;

    pnu_numr_elemn   := vnu_numr_elemn;

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_sspc_numr_elemn (pva_indic_extra_termn   in varchar2
                                 ,pnu_numr                in number)
    return number
  is
    vnu_numr_elemn   number;
  begin
    return obten_sspc_numr_elemn (pva_indic_extra_termn
                                 ,pnu_numr
                                 ,vnu_numr_elemn);
  end;

  function obten_numr_elemn_sspc (pnu_sspc in number)
    return number
  is
    vnu_numr_elemn   number;
  begin
    select ne.numr_elemn
      into vnu_numr_elemn
      from vd_afw_13_navgt_elemn ne
     where ne.seqnc_elemn = pnu_sspc;

    return vnu_numr_elemn;
  exception
    when no_data_found
    then
      return null;
  end;
end afw_13_navgt_noyau_pkg;
/
