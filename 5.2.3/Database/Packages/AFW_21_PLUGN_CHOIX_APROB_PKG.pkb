SET DEFINE OFF;
create or replace package body afw_21_plugn_choix_aprob_pkg
as
  kva_clas_contn             constant varchar2 (50) := 'btn-group afw-21-choix-aprob';
  kva_clas_boutn             constant varchar2 (100) := 'btn btn-default btn-sm afw-21-choix-aprob-boutn-void';
  kva_clas_boutn_liste       constant varchar2 (100) := 'btn btn-default btn-sm dropdown-toggle afw-21-choix-aprob';
  kva_clas_drop_down         constant varchar2 (50) := 'dropdown-menu afw-21-choix-aprob';
  kva_clas_drop_down_droit   constant varchar2 (50) := 'dropdown-menu-right';

  gva_id                              varchar2 (255);

  procedure genr_html_optio (pnu_struc_aplic         in number
                            ,pnu_seqnc_struc_aplic   in number
                            ,pnu_insta               in number)
  is
    vva_mesg_confr    varchar2 (4000)
                        := afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('APB.000044'
                                                                     ,'AFW');

    cursor cur_stat_dispn
    is
        select paru.sourc
              ,paru.seqnc_evolt
              ,paru.stat_sourc
              ,paru.stat_cible libl_stat
              ,paru.libl_evolt
              ,paru.indic_choix_termn
              ,paru.indic_choix_exist
          from vs_afw_12_pa_regle_utils paru
         where     paru.seqnc_struc_aplic = pnu_struc_aplic
               and paru.seqnc_concp_struc_aplic = pnu_seqnc_struc_aplic
      order by ordre_presn
              ,paru.stat_cible;

    cursor cur_procs_aprob
    is
        select seqnc
              ,nom
          from vs_afw_12_procs_aprob_utils
         where (   ref_struc_aplic = pnu_struc_aplic
                or ref_struc_aplic is null)
      order by nom;

    cursor cur_procs_aprob_insta
    is
        select seqnc
              ,nom
          from vs_afw_12_procs_aprob_utils pau
         where     (   ref_struc_aplic = pnu_struc_aplic
                    or ref_struc_aplic is null)
               and not exists
                     (select 1
                        from vd_i_afw_12_insta_procs_aprob ipa
                       where     ipa.ref_struc_aplic = pnu_struc_aplic
                             and ipa.ref_seqnc_struc_aplic = pnu_seqnc_struc_aplic
                             and ipa.ref_group_stat = pau.seqnc)
      order by nom;

    vva_indic_insta   varchar2 (1);
  begin
    vva_indic_insta   := afw_12_stat_pkg.obten_indic_insta_procs_aprob (afw_12_insta_procs_aprob_pkg.obten_ipa_etat_actue (pnu_insta));

    if pnu_insta is not null
    then
      -- Afficher les statuts possibles
      for rec_stat_dispn in cur_stat_dispn
      loop
        afw_15_htp_pkg.ouvri_bals ('li');

        if rec_stat_dispn.indic_choix_termn = 'O'
        then
          afw_15_htp_pkg.ouvri_bals ('i'
                                    ,'class'
                                    ,'fa fa-check afw-21-check-choix-aprob');
          afw_15_htp_pkg.fermr_bals ('i');

          afw_15_htp_pkg.ouvri_bals ('a'
                                    ,'href'
                                    ,'javascript:void(0)'
                                    ,'onclick'
                                    ,'return false;');
        else
          if rec_stat_dispn.indic_choix_exist = 'O'
          then
            afw_15_htp_pkg.ouvri_bals ('i'
                                      ,'class'
                                      ,'fa fa-hand-o-right afw-21-check-choix-aprob');
            afw_15_htp_pkg.fermr_bals ('i');
          end if;

          afw_15_htp_pkg.ouvri_bals ('a'
                                    ,'href'
                                    ,'javascript:void(0)'
                                    ,'onclick'
                                    ,'afw.afw_21.item.choix_aprob.ouvri_dialg(this);'
                                    ,'data-choix-aprob-id'
                                    ,gva_id
                                    ,'data-choix-aprob-seqnc'
                                    ,rec_stat_dispn.seqnc_evolt
                                    ,'data-choix-aprob-titre'
                                    ,rec_stat_dispn.libl_evolt
                                    ,'data-procs-aprob'
                                    ,''
                                    ,'data-choix-choix-aprob-mesg'
                                    ,'');
        end if;

        afw_15_htp_pkg.ecrir (rec_stat_dispn.libl_stat
                             ,false);

        afw_15_htp_pkg.fermr_bals ('a');
        afw_15_htp_pkg.fermr_bals ('li');
      end loop;

      -- Afficher les processus possibles (pour créer une nouvelle instance)
      if vva_indic_insta = 'O'
      then
        afw_15_htp_pkg.ouvri_bals ('li');
        afw_15_htp_pkg.ecrir (   '&nbsp;&nbsp;'
                              || afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('APB.000043'
                                                                           ,'AFW')
                             ,false);
        afw_15_htp_pkg.fermr_bals ('li');

        for rec_procs_aprob_insta in cur_procs_aprob_insta
        loop
          afw_15_htp_pkg.ouvri_bals ('li');

          afw_15_htp_pkg.ouvri_bals ('i'
                                    ,'class'
                                    ,'fa fa-code-fork afw-21-check-choix-aprob');
          afw_15_htp_pkg.fermr_bals ('i');

          afw_15_htp_pkg.ouvri_bals ('a'
                                    ,'href'
                                    ,'javascript:void(0)'
                                    ,'onclick'
                                    ,'afw.afw_21.item.choix_aprob.ouvri_dialg(this);'
                                    ,'data-choix-aprob-id'
                                    ,gva_id
                                    ,'data-procs-aprob'
                                    ,rec_procs_aprob_insta.seqnc
                                    ,'data-choix-aprob-seqnc'
                                    ,''
                                    ,'data-choix-aprob-titre'
                                    ,rec_procs_aprob_insta.nom
                                    ,'data-choix-choix-aprob-mesg'
                                    ,vva_mesg_confr);

          afw_15_htp_pkg.ecrir (rec_procs_aprob_insta.nom
                               ,false);
          afw_15_htp_pkg.fermr_bals ('a');
          afw_15_htp_pkg.fermr_bals ('li');
        end loop;
      end if;
    else
      for rec_procs_aprob in cur_procs_aprob
      loop
        afw_15_htp_pkg.ouvri_bals ('li');

        afw_15_htp_pkg.ouvri_bals ('a'
                                  ,'href'
                                  ,'javascript:void(0)'
                                  ,'onclick'
                                  ,'afw.afw_21.item.choix_aprob.ouvri_dialg(this);'
                                  ,'data-choix-aprob-id'
                                  ,gva_id
                                  ,'data-procs-aprob'
                                  ,rec_procs_aprob.seqnc
                                  ,'data-choix-aprob-seqnc'
                                  ,''
                                  ,'data-choix-aprob-titre'
                                  ,rec_procs_aprob.nom
                                  ,'data-choix-choix-aprob-mesg'
                                  ,vva_mesg_confr
                                  ,'data-choix-role-aprob'
                                  ,afw_12_group_stat_pkg.obten_role_aprob_json (rec_procs_aprob.seqnc));
        afw_15_htp_pkg.ecrir (rec_procs_aprob.nom
                             ,false);

        afw_15_htp_pkg.fermr_bals ('a');
        afw_15_htp_pkg.fermr_bals ('li');
      end loop;
    end if;
  exception
    when others
    then
      ete ();
  end genr_html_optio;

  function obten_libl_actue (pnu_struc_aplic         in number
                            ,pnu_seqnc_struc_aplic   in number)
    return varchar2
  is
    vva_libl_actue   varchar2 (200);
  begin
    begin
      select    s.icone_catgr
             || '&nbsp;&nbsp;&nbsp;'
             || ipas.ref_stat_formt
             || decode (afw_12_insta_procs_aprob_pkg.verfr_evolt_bloq (pnu_struc_aplic
                                                                      ,pnu_seqnc_struc_aplic)
                       ,'O',    ' ('
                             || afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('APB.000010'
                                                                          ,'AFW')
                             || ')'
                       ,null)
        into vva_libl_actue
        from vd_afw_12_ip_aprob_stat ipas
            ,vd_afw_12_stat          s
       where     ipas.ref_insta_procs_aprob = afw_12_insta_procs_aprob_pkg.obten_insta_procs_aprob (pnu_struc_aplic
                                                                                                   ,pnu_seqnc_struc_aplic)
             and ipas.date_fin_efect is null
             and s.seqnc = ipas.ref_stat;
    exception
      when no_data_found
      then -- Non instancié
        vva_libl_actue      :=
          afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('APB.000042'
                                                    ,'AFW');
    end;

    return vva_libl_actue;
  end obten_libl_actue;

  function verfr_choix_posbl (pnu_struc_aplic         in number
                             ,pnu_seqnc_struc_aplic   in number
                             ,pnu_insta_procs_aprob   in number)
    return varchar2
  is
    vva_indic_insta   varchar2 (1);
    vva_retr          varchar2 (1) := 'N';
  begin
    vva_indic_insta   := afw_12_stat_pkg.obten_indic_insta_procs_aprob (afw_12_insta_procs_aprob_pkg.obten_ipa_etat_actue (pnu_insta_procs_aprob));

    begin
      select 'O'
        into vva_retr
        from vs_afw_12_pa_regle_utils paru
       where     paru.seqnc_struc_aplic = pnu_struc_aplic
             and paru.seqnc_concp_struc_aplic = pnu_seqnc_struc_aplic
             and rownum = 1;
    exception
      when no_data_found
      then
        vva_retr   := 'N';
    end;

    if     vva_indic_insta = 'O'
       and vva_retr = 'N'
    then
      begin
        select 'O'
          into vva_retr
          from vs_afw_12_procs_aprob_utils pau
         where     (   ref_struc_aplic = pnu_struc_aplic
                    or ref_struc_aplic is null)
               and not exists
                     (select 1
                        from vd_i_afw_12_insta_procs_aprob ipa
                       where     ipa.ref_struc_aplic = pnu_struc_aplic
                             and ipa.ref_seqnc_struc_aplic = pnu_seqnc_struc_aplic
                             and ipa.ref_group_stat = pau.seqnc)
               and rownum = 1;
      exception
        when no_data_found
        then
          vva_retr   := 'N';
      end;
    end if;

    return vva_retr;
  end verfr_choix_posbl;

  procedure genr_html_item (pva_code_struc_aplic    in varchar2
                           ,pnu_seqnc_struc_aplic   in number
                           ,pva_clas                in varchar2 default null
                           ,pva_align               in varchar2 default null)
  is
    vnu_struc_aplic      number (10);
    vnu_insta            number (10);
    vva_libl_actue       varchar2 (200);
    vva_clas_drop_down   varchar2 (200) := kva_clas_drop_down;
    vva_choix_posbl      varchar2 (1);
  begin
    vnu_struc_aplic   := afw_12_struc_aplic_pkg.obten_seqnc (pva_code_struc_aplic);
    vnu_insta         :=
      afw_12_insta_procs_aprob_pkg.obten_insta_procs_aprob (vnu_struc_aplic
                                                           ,pnu_seqnc_struc_aplic);

    begin
      vva_libl_actue      :=
        obten_libl_actue (vnu_struc_aplic
                         ,pnu_seqnc_struc_aplic);

      vva_choix_posbl      :=
        verfr_choix_posbl (vnu_struc_aplic
                          ,pnu_seqnc_struc_aplic
                          ,vnu_insta);

      afw_15_htp_pkg.ouvri_bals ('div'
                                ,'class'
                                ,kva_clas_contn);

      if pva_align = 'D'
      then
        vva_clas_drop_down      :=
             vva_clas_drop_down
          || ' '
          || kva_clas_drop_down_droit;
      end if;

      if    vva_choix_posbl = 'O'
         or vnu_insta is null
      then
        afw_15_htp_pkg.ouvri_bals ('ul'
                                  ,'class'
                                  ,vva_clas_drop_down);

        genr_html_optio (vnu_struc_aplic
                        ,pnu_seqnc_struc_aplic
                        ,vnu_insta);

        afw_15_htp_pkg.fermr_bals ('ul');
      end if;

      afw_15_htp_pkg.ouvri_bals ('button'
                                ,'class'
                                ,kva_clas_boutn
                                ,'onClick'
                                ,'return false;');

      afw_15_htp_pkg.ecrir (vva_libl_actue
                           ,false);

      afw_15_htp_pkg.fermr_bals ('button');

      if    vva_choix_posbl = 'O'
         or vnu_insta is null
      then
        afw_15_htp_pkg.ouvri_bals ('button'
                                  ,'class'
                                  ,kva_clas_boutn_liste
                                  ,'data-toggle'
                                  ,'dropdown');

        afw_15_htp_pkg.ouvri_bals ('span'
                                  ,'class'
                                  ,'caret');

        afw_15_htp_pkg.fermr_bals ('span');
        afw_15_htp_pkg.fermr_bals ('button');
      end if;

      afw_15_htp_pkg.fermr_bals ('div');
    exception
      when no_data_found
      then
        null;
    end;
  end genr_html_item;

  procedure genr_item (p_item    in apex_plugin.t_page_item
                      ,p_value   in varchar2)
  is
    vva_struc_aplic         varchar2 (23);
    vnu_seqnc_struc_aplic   number (10);
    vva_css_class           varchar2 (4000);
    vva_align               varchar2 (1);
  begin
    gva_id                  :=
         p_item.name
      || kva_id_dialg;
    vva_struc_aplic         := p_item.attribute_01;
    vnu_seqnc_struc_aplic   := afw_21_util_pkg.obten_reslt_expre_plsql (p_item.attribute_02);
    vva_css_class           := p_item.attribute_03;
    vva_align               := p_item.attribute_06;

    apex_plugin_util.print_hidden (p_item_name    => p_item.name
                                  ,p_value        => p_value
                                  ,p_id_postfix   => null);

    genr_html_item (vva_struc_aplic
                   ,vnu_seqnc_struc_aplic
                   ,vva_css_class
                   ,vva_align);
  end genr_item;

  procedure genr_item_lectr_seule (p_item                  in apex_plugin.t_page_item
                                  ,p_value                 in varchar2
                                  ,p_is_readonly           in boolean
                                  ,p_is_printer_friendly   in boolean)
  is
    vva_struc_aplic         varchar2 (23);
    vnu_seqnc_struc_aplic   number (10);
    vva_css_class           varchar2 (4000);
    vnu_struc_aplic         number (10);
    vva_libl_actue          varchar2 (60);
  begin
    vva_struc_aplic         := p_item.attribute_01;
    vnu_struc_aplic         := afw_12_struc_aplic_pkg.obten_seqnc (vva_struc_aplic);
    vnu_seqnc_struc_aplic   := afw_21_util_pkg.obten_reslt_expre_plsql (p_item.attribute_02);
    vva_css_class           := p_item.attribute_03;
    vva_libl_actue          :=
      obten_libl_actue (vnu_struc_aplic
                       ,vnu_seqnc_struc_aplic);

    apex_plugin_util.print_hidden (p_item_name    => p_item.name
                                  ,p_value        => p_value
                                  ,p_id_postfix   => null);

    apex_plugin_util.print_display_only (p_item_name          => p_item.name
                                        ,p_display_value      => vva_libl_actue
                                        ,p_show_line_breaks   => false
                                        ,p_escape             => true
                                        ,p_attributes         => p_item.element_attributes);
  end genr_item_lectr_seule;
end afw_21_plugn_choix_aprob_pkg;
/
