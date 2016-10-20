SET DEFINE OFF;
create or replace package body afw_17_envoi_telcp_axiat_pkg
as
  cursor cur_compt (pva_code_compt_axiat   in varchar2
                   ,pnu_domn               in number)
  is
    select seqnc
      from vd_i_afw_17_compt_axiat ca
     where     ca.code = pva_code_compt_axiat
           and ref_domn = nvl (pnu_domn, afw_12_domn_pkg.obten_domn_sesn ());

  procedure envoy_telcp_simpl (pva_code_compt_axiat   in varchar2
                              ,pnu_a                  in number
                              ,pva_destn_formt        in varchar2
                              ,pnu_domn               in number
                              ,pda_date_envo_difr     in date default null)
  is
    pragma autonomous_transaction;
    vnu_seqnc   number (10);
  begin
    vnu_seqnc      :=
      envoy_telcp_simpl (pva_code_compt_axiat
                        ,pnu_a
                        ,pva_destn_formt
                        ,pnu_domn
                        ,pda_date_envo_difr);
  end envoy_telcp_simpl;

  function envoy_telcp_simpl (pva_code_compt_axiat   in varchar2
                             ,pnu_a                  in number
                             ,pva_destn_formt        in varchar2
                             ,pnu_domn               in number
                             ,pda_date_envo_difr     in date default null)
    return number
  is
    vnu_seqnc         number (10);
    vnu_seqnc_compt   number (10);
    pragma autonomous_transaction;
  begin
    open cur_compt (pva_code_compt_axiat
                   ,pnu_domn);

    fetch cur_compt
      into vnu_seqnc_compt;

    close cur_compt;

    insert into vd_i_afw_17_telcp_axiat ta (ref_compt_axiat
                                           ,destn_formt
                                           ,numr_destn
                                           ,stat_soums
                                           ,date_envoi_difr
                                           ,objet)
         values (vnu_seqnc_compt
                ,pva_destn_formt
                ,pnu_a
                ,'EN_CREAT'
                ,pda_date_envo_difr
                ,'***')
      returning seqnc
           into vnu_seqnc;

    commit;
    return vnu_seqnc;
  end envoy_telcp_simpl;

  procedure ajout_piece_joint (pnu_telcp_axiat   in number
                              ,pbl_contn         in blob
                              ,pnu_nombr_page    in number
                              ,pva_mime_type     in varchar2
                              ,pva_nom_fichr     in varchar2)
  is
    pragma autonomous_transaction;
  begin
    insert into vd_i_afw_17_piece_telcp_axiat pta (ref_telcp_axiat
                                                  ,nombr_page
                                                  ,contn
                                                  ,mime_type
                                                  ,nom_fichr)
         values (pnu_telcp_axiat
                ,pnu_nombr_page
                ,pbl_contn
                ,pva_mime_type
                ,pva_nom_fichr);

    commit;
  end ajout_piece_joint;

  procedure termn_envoi (pnu_telcp_axiat in number)
  is
    pragma autonomous_transaction;
  begin
    update vd_afw_17_telcp_axiat
       set stat_soums   = 'A_ENVOY'
     where seqnc = pnu_telcp_axiat;

    commit;
  end termn_envoi;

  procedure vider_file_atent (pva_code_compt_axiat   in varchar2
                             ,pnu_domn               in number)
  is
    pragma autonomous_transaction;
    vnu_compt         number (10);
    vco_courl         afw_17_envoi_courl_pkg.courl;

    cursor cur_telcp
    is
        select seqnc
              ,numr_destn
              ,destn_formt
              ,ref_compt_axiat
              ,objet
          from vd_i_afw_17_telcp_axiat ta
         where     ta.stat_soums = 'A_ENVOY'
               and (   ref_compt_axiat = vnu_compt
                    or vnu_compt is null)
               and (   date_envoi_difr <= sysdate
                    or date_envoi_difr is null)
      order by ref_compt_axiat;

    cursor cur_piece (pnu_telcp in number)
    is
      select contn
            ,mime_type
            ,nom_fichr
        from vd_i_afw_17_piece_telcp_axiat pta
       where pta.ref_telcp_axiat = pnu_telcp;

    cursor cur_profl_courl (pnu_compt_axiat in number)
    is
      select pc.servr_sortn
            ,pc.port_sortn
            ,pc.nom_envoy
            ,pc.adres_envoy
            ,pc.authe_methd_sortn
            ,pc.authe_usagr_sortn
            ,pc.authe_mdp_sortn
        from vd_i_afw_17_profl_courl pc
            ,vd_i_afw_17_compt_axiat ca
       where     ca.seqnc = pnu_compt_axiat
             and ca.ref_profl_courl = pc.seqnc;

    rec_profl_courl   cur_profl_courl%rowtype;
    vnu_domn_courl    number (10);
    vbo_semph_obten   boolean default false;

    procedure alimn_profl_courl (pnu_domn in number)
    is
    begin
      if    vnu_domn_courl is null
         or vnu_domn_courl != pnu_domn
      then
        open cur_profl_courl (pnu_domn);

        fetch cur_profl_courl
          into rec_profl_courl;

        close cur_profl_courl;
      end if;
    end alimn_profl_courl;
  begin
    if not vbo_semph_obten
    then
      begin
        afw_07_semph_pkg.obten_semph ('SEM_TRAVL_TELCP'
                                     ,null
                                     ,null
                                     ,null
                                     ,'O'
                                     ,5
                                     ,null);
        vbo_semph_obten   := true;
      exception
        when others
        then
          return;
      end;
    end if;

    --Valeur hardcodé pour test
    --trouver un moyen d'utiliser le domaine de la session pour les job !!
    open cur_compt (pva_code_compt_axiat
                   ,21);

    fetch cur_compt
      into vnu_compt;

    close cur_compt;

    for rec_telcp in cur_telcp
    loop
      --Initier envoi courriel
      alimn_profl_courl (rec_telcp.ref_compt_axiat);

      vco_courl      :=
        afw_17_envoi_courl_pkg.creer (rec_profl_courl.nom_envoy
                                     ,rec_profl_courl.adres_envoy
                                     ,rec_telcp.objet
                                     ,rec_profl_courl.servr_sortn
                                     ,rec_profl_courl.port_sortn);

      if rec_profl_courl.authe_methd_sortn = 'SIMPL'
      then
        afw_17_envoi_courl_pkg.defnr_authe_simpl (rec_profl_courl.authe_usagr_sortn
                                                 ,rec_profl_courl.authe_mdp_sortn);
      end if;

      afw_17_envoi_courl_pkg.ajout_destn (rec_telcp.destn_formt
                                         ,   rec_telcp.numr_destn
                                          || '@fax.axiatel.com'
                                         ,afw_17_envoi_courl_pkg.kva_destn_uniq);

      --Pièces jointes
      for rec_piece in cur_piece (rec_telcp.seqnc)
      loop
        afw_17_envoi_courl_pkg.ajout_piece_joint (rec_piece.contn
                                                 ,rec_piece.mime_type
                                                 ,rec_piece.nom_fichr);
      end loop;

      afw_17_envoi_courl_pkg.envoy ();

      update vd_i_afw_17_telcp_axiat
         set stat_soums   = 'ENVOY'
       where seqnc = rec_telcp.seqnc;
    end loop;

    afw_07_semph_pkg.suprm_semph ('SEM_TRAVL_TELCP'
                                 ,null
                                 ,null
                                 ,null);
    commit;
  exception
    when others
    then
      afw_07_semph_pkg.suprm_semph ('SEM_TRAVL_TELCP'
                                   ,null
                                   ,null
                                   ,null);
      raise;
  end vider_file_atent;
end afw_17_envoi_telcp_axiat_pkg;
/
