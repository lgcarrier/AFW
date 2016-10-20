SET DEFINE OFF;
create or replace package body afw_03_envoi_courl_pkg
as
  function creer (pva_servr         in varchar2
                 ,pnu_port          in number
                 ,pva_domn          in varchar2
                 ,pva_nom_envoy     in varchar2
                 ,pva_adres_envoy   in varchar2
                 ,pva_authe_methd   in varchar2
                 ,pva_authe_usagr   in varchar2
                 ,pva_authe_mdp     in varchar2
                 ,pva_sujet         in varchar2)
    return afw_17_envoi_courl_pkg.courl
  is
    vco_courl   afw_17_envoi_courl_pkg.courl;
  begin
    vco_courl      :=
      afw_17_envoi_courl_pkg.creer (pva_nom_envoy
                                   ,pva_adres_envoy
                                   ,pva_sujet
                                   ,pva_servr
                                   ,pnu_port
                                   ,pva_domn);

    afw_17_envoi_courl_pkg.formt_html;

    if pva_authe_methd = 'SIMPL'
    then
      afw_17_envoi_courl_pkg.defnr_authe_simpl (pva_authe_usagr
                                               ,pva_authe_mdp);
    end if;

    return vco_courl;
  end creer;

  procedure creer (pva_servr         in varchar2
                  ,pnu_port          in number
                  ,pva_domn          in varchar2
                  ,pva_nom_envoy     in varchar2
                  ,pva_adres_envoy   in varchar2
                  ,pva_authe_methd   in varchar2
                  ,pva_authe_usagr   in varchar2
                  ,pva_authe_mdp     in varchar2
                  ,pva_sujet         in varchar2)
  is
    vco_courl   afw_17_envoi_courl_pkg.courl;
  begin
    vco_courl      :=
      creer (pva_servr
            ,pnu_port
            ,pva_domn
            ,pva_nom_envoy
            ,pva_adres_envoy
            ,pva_authe_methd
            ,pva_authe_usagr
            ,pva_authe_mdp
            ,pva_sujet);
  end creer;

  procedure notfr_clas_inter (pnu_prodt             in number
                             ,pva_code_clas_inter   in varchar2
                             ,pre_afw_03_journ      in vd_i_afw_03_journ%rowtype)
  is
    --Sélectionner les bons destinataires
    cursor cur_destn
    is
      select u.nom_formt nom
            ,u.courl     adres
        from vd_afw_03_lien_clas_inter_util lciu
            ,vd_afw_03_clas_inter           ci
            ,vd_afw_12_utils                u
       where     lciu.ref_clas_inter = ci.seqnc
             and u.courl is not null
             and ci.ref_prodt = pnu_prodt
             and ci.code = pva_code_clas_inter
             and lciu.ref_utils = u.seqnc
             and lciu.date_debut_efect <= sysdate
             and (   lciu.date_fin_efect is null
                  or sysdate < lciu.date_fin_efect)
      union
      select distinct u.nom_formt nom
                     ,u.courl     adres
        from vd_afw_12_utils u
            ,(    select lgu.ref_group
                        ,lgu.ref_utils
                    from vd_afw_12_lien_group_utils lgu
                   where     lgu.date_debut_efect <= sysdate
                         and (   lgu.date_fin_efect is null
                              or sysdate < lgu.date_fin_efect)
              connect by prior lgu.ref_group_utils_lie = lgu.ref_group
              start with lgu.ref_group in (select lciu.ref_group_utils
                                             from vd_afw_03_lien_clas_inter_util lciu
                                                 ,vd_afw_03_clas_inter           ci
                                            where     lciu.date_debut_efect <= sysdate
                                                  and (   lciu.date_fin_efect is null
                                                       or sysdate < lciu.date_fin_efect)
                                                  and lciu.ref_clas_inter = ci.seqnc
                                                  and ci.ref_prodt = pnu_prodt
                                                  and ci.code = pva_code_clas_inter
                                                  and lciu.ref_group_utils is not null)) lgu
       where     u.seqnc = lgu.ref_utils
             and u.courl is not null;

    --Sélectionner les informations de la classe d'intervention
    cursor cur_clas_inter
    is
      select ci.ref_prodt_formt
            ,ci.nom
            ,ci.descr
            ,ci.indic_avert_autr_uniq
        from vd_afw_03_clas_inter ci
       where     ci.ref_prodt = pnu_prodt
             and ci.code = pva_code_clas_inter;

    --Sélectionner les informations du profil de courriel
    cursor cur_profl_courl
    is
      select pc.servr_sortn
            ,pc.port_sortn
            ,pc.domn
            ,pc.nom_envoy
            ,pc.adres_envoy
            ,pc.authe_methd_sortn
            ,pc.authe_usagr_sortn
            ,pc.authe_mdp_sortn
        from vd_afw_03_clas_inter  ci
            ,vd_afw_17_profl_courl pc
       where     ci.ref_prodt = pnu_prodt
             and ci.code = pva_code_clas_inter
             and ci.ref_profl_courl = pc.seqnc;

    rec_clas_inter    cur_clas_inter%rowtype;

    rec_profl_courl   cur_profl_courl%rowtype;

    vnu_nombr_destn   number (3);

    procedure ecrir_fil_arian
    is
      cursor cur_fil_arian
      is
            select fa.page
                  ,fa.libl
              from vd_afw_04_fil_arian fa
        connect by fa.ref_elemn_sup = prior fa.seqnc
        start with fa.ref_elemn_sup is null;
    begin
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('****************************************');
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('**Fil d''Ariane**');
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);

      for rec_fil_arian in cur_fil_arian
      loop
        afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Page: '
                                                  || rec_fil_arian.page
                                                  || ' - '
                                                  || rec_fil_arian.libl);
      end loop;
    end ecrir_fil_arian;

    procedure ecrir_contx
    is
      cursor cur_contx
      is
            select fa.page
                  ,fa.libl
                  ,c.contx
                  ,c.actio
                  ,c.seqnc_contx
                  ,c.contx_inter
                  ,c.actio_inter
                  ,c.seqnc_contx_inter
                  ,ce.nom
                  ,ce.valr_numbr
                  ,ce.valr_varch
                  ,ce.type_alimn
                  ,ce.type_elemn
              from vd_afw_04_fil_arian fa
                  ,vd_afw_04_contx   c
                  ,vd_afw_04_contx_etend ce
             where     c.ref_fil_arian = fa.seqnc
                   and c.ref_fil_arian = ce.ref_contx(+)
        connect by fa.ref_elemn_sup = prior fa.seqnc
        start with fa.ref_elemn_sup is null;

      vnu_page   vd_afw_04_fil_arian.page%type;
    begin
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('****************************************');
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('**Contexte**');

      for rec_contx in cur_contx
      loop
        if    vnu_page is null
           or vnu_page <> rec_contx.page
        then
          afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Page: '
                                                    || rec_contx.page
                                                    || ' - '
                                                    || rec_contx.libl);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Contexte: '
                                                    || rec_contx.contx);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Action: '
                                                    || rec_contx.actio);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Séquence : '
                                                    || rec_contx.seqnc_contx);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Contexte intermédiaire: '
                                                    || rec_contx.contx_inter);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Action intermédiaire: '
                                                    || rec_contx.actio_inter);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Séquence intermédiaire: '
                                                    || rec_contx.seqnc_contx_inter);
        end if;

        vnu_page   := rec_contx.page;

        afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
        afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Contexte étendu: '
                                                  || rec_contx.nom);
        afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Valeur numérique: '
                                                  || rec_contx.valr_numbr);
        afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Valeur alpha: '
                                                  || rec_contx.valr_varch);
        afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Type alimentation: '
                                                  || rec_contx.type_alimn);
        afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Type élément: '
                                                  || rec_contx.type_elemn);
      end loop;
    end ecrir_contx;

    procedure ecrir_page_item
    is
      cursor cur_page_item
      is
          select a.numr_aplic_apex numr_aplic_apex
                ,a.nom_formt       nom_aplic
                ,p.numr_apex       numr_page_apex
                ,p.nom_formt       nom_page
                ,pi.libl           libl_item
                ,asvi.item_name    nom_item
                ,asvi.item_value_vc2 valr_item
            from vd_afw_13_page_item pi
                ,vd_afw_11_aplic   a
                ,vd_afw_13_page    p
                ,(select asvi.item_id
                        ,asvi.item_name
                        ,asvi.item_value_vc2
                        ,asvi.flow_id
                    from apex_sesn_valr_item asvi
                   where asvi.flow_instance = afw_07_util_pkg.nv ('SESSION')) asvi
           where     pi.ref_page = p.seqnc
                 and p.ref_aplic = a.seqnc
                 and a.numr_aplic_apex = asvi.flow_id
                 and pi.id_apex = asvi.item_id
        order by 1
                ,3
                ,5;

      vnu_numr_aplic_apex   number;
      vnu_numr_page_apex    number;
    begin
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('****************************************');
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('**Items de page en session**');

      for rec_page_item in cur_page_item
      loop
        if    vnu_numr_aplic_apex is null
           or vnu_numr_aplic_apex <> rec_page_item.numr_aplic_apex
        then
          afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Application: '
                                                    || rec_page_item.nom_aplic);
        end if;

        if    vnu_numr_page_apex is null
           or vnu_numr_page_apex <> rec_page_item.numr_page_apex
        then
          afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Page: '
                                                    || rec_page_item.nom_page);
        end if;

        vnu_numr_aplic_apex   := rec_page_item.numr_aplic_apex;
        vnu_numr_page_apex    := rec_page_item.numr_page_apex;

        afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Item: '
                                                  || rec_page_item.nom_item
                                                  || ' - '
                                                  || rec_page_item.libl_item
                                                  || ' = '
                                                  || rec_page_item.valr_item);
      end loop;
    end ecrir_page_item;

    procedure ecrir_aplic_item
    is
      cursor cur_page_item
      is
          select a.numr_aplic_apex numr_aplic_apex
                ,a.nom_formt       nom_aplic
                ,asvi.item_name    nom_item
                ,asvi.item_value_vc2 valr_item
            from vd_afw_11_aplic a
                ,(select asvi.item_id
                        ,asvi.item_name
                        ,asvi.item_value_vc2
                        ,asvi.flow_id
                    from apex_sesn_valr_item asvi
                   where asvi.flow_instance = afw_07_util_pkg.nv ('SESSION')) asvi
           where     a.numr_aplic_apex = asvi.flow_id
                 and not exists
                       (select null
                          from vd_afw_13_page_item pi
                              ,vd_afw_13_page    p
                         where     pi.ref_page = p.seqnc
                               and pi.id_apex = asvi.item_id
                               and p.ref_aplic = a.seqnc)
        order by 1
                ,3;

      vnu_numr_aplic_apex   number;
    begin
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('****************************************');
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('**Items d''application en session**');

      for rec_page_item in cur_page_item
      loop
        if    vnu_numr_aplic_apex is null
           or vnu_numr_aplic_apex <> rec_page_item.numr_aplic_apex
        then
          afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
          afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Application: '
                                                    || rec_page_item.nom_aplic);
        end if;

        vnu_numr_aplic_apex   := rec_page_item.numr_aplic_apex;

        afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Item: '
                                                  || rec_page_item.nom_item
                                                  || ' = '
                                                  || rec_page_item.valr_item);
      end loop;
    end ecrir_aplic_item;

    procedure ecrir_info_genrl
    is
    begin
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('****************************************');
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('**Informations générales**');
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);

      afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Utilisateur connecté: '
                                                || afw_12_utils_pkg.obten_nom_formt_de_code_utils (afw_07_util_pkg.v ('APP_USER'))
                                                || ' ('
                                                || afw_07_util_pkg.v ('APP_USER')
                                                || ')');
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
      afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Application: '
                                                || afw_11_aplic_pkg.obten_numr_apex_aplic ());
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
      afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Page: '
                                                || afw_13_page_pkg.obten_numr_apex_page ());
    end ecrir_info_genrl;

    procedure ecrir_mesg_ereur
    is
    begin
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('****************************************');
      afw_17_envoi_courl_pkg.ajout_ligne_corps ('**Erreur**');
      afw_17_envoi_courl_pkg.ajout_ligne_corps (null);
      afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Date: '
                                                || to_char (pre_afw_03_journ.date_heure
                                                           ,'YYYY-MM-DD HH24:MI:SS'));
      afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Travail: '
                                                || pre_afw_03_journ.travl);
      afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Explication: '
                                                || pre_afw_03_journ.expli);
      afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Erreur: '
                                                || pre_afw_03_journ.ereur);
      afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Trace: '
                                                || pre_afw_03_journ.pile_trace);
    end ecrir_mesg_ereur;
  begin
    --Sélectionner les informations de la classe d'intervention
    open cur_clas_inter;

    fetch cur_clas_inter
      into rec_clas_inter;

    close cur_clas_inter;

    --Sélectionner les informations du profil de courriel
    open cur_profl_courl;

    fetch cur_profl_courl
      into rec_profl_courl;

    close cur_profl_courl;

    creer (rec_profl_courl.servr_sortn
          ,rec_profl_courl.port_sortn
          ,rec_profl_courl.domn
          ,rec_profl_courl.nom_envoy
          ,rec_profl_courl.adres_envoy
          ,rec_profl_courl.authe_methd_sortn
          ,rec_profl_courl.authe_usagr_sortn
          ,rec_profl_courl.authe_mdp_sortn
          ,   rec_clas_inter.ref_prodt_formt
           || ': '
           || rec_clas_inter.nom);

    if rec_clas_inter.indic_avert_autr_uniq = 'N'
    then
      -- Ajouter les destinataires
      for rec_destn in cur_destn
      loop
        afw_17_envoi_courl_pkg.ajout_destn (rec_destn.nom
                                           ,rec_destn.adres
                                           ,afw_17_envoi_courl_pkg.kva_destn_uniq);
      end loop;
    else
      --Valider que l'utilisateur qui a déclenché le message est un des destinataires
      select count (1)
        into vnu_nombr_destn
        from (select 1
                from vd_afw_03_lien_clas_inter_util lciu
                    ,vd_afw_03_clas_inter           ci
                    ,vd_afw_12_utils                u
               where     lciu.ref_clas_inter = ci.seqnc
                     and ci.ref_prodt = pnu_prodt
                     and ci.code = pva_code_clas_inter
                     and lciu.ref_utils = u.seqnc
                     and lciu.date_debut_efect <= sysdate
                     and (   lciu.date_fin_efect is null
                          or sysdate < lciu.date_fin_efect)
                     and u.seqnc = afw_12_utils_pkg.obten_usagr_conct
              union all
              select 1
                from vd_afw_12_utils u
                    ,(    select lgu.ref_group
                                ,lgu.ref_utils
                            from vd_afw_12_lien_group_utils lgu
                           where     lgu.date_debut_efect <= sysdate
                                 and (   lgu.date_fin_efect is null
                                      or sysdate < lgu.date_fin_efect)
                      connect by prior lgu.ref_group_utils_lie = lgu.ref_group
                      start with lgu.ref_group in (select lciu.ref_group_utils
                                                     from vd_afw_03_lien_clas_inter_util lciu
                                                         ,vd_afw_03_clas_inter           ci
                                                    where     lciu.date_debut_efect <= sysdate
                                                          and (   lciu.date_fin_efect is null
                                                               or sysdate < lciu.date_fin_efect)
                                                          and lciu.ref_clas_inter = ci.seqnc
                                                          and ci.ref_prodt = pnu_prodt
                                                          and ci.code = pva_code_clas_inter
                                                          and lciu.ref_group_utils is not null)) lgu
               where     u.seqnc = lgu.ref_utils
                     and u.seqnc = afw_12_utils_pkg.obten_usagr_conct
                     and rownum = 1);

      if vnu_nombr_destn > 0
      then
        --Ajouter uniquement l'utilisateur qui a déclenché le message
        afw_17_envoi_courl_pkg.ajout_destn (afw_12_utils_pkg.obten_nom_formt_de_utils (afw_12_utils_pkg.obten_usagr_conct)
                                           ,afw_12_utils_pkg.obten_courl_utils (afw_12_utils_pkg.obten_usagr_conct)
                                           ,afw_17_envoi_courl_pkg.kva_destn_uniq);
      else
        -- Ajouter les destinataires
        for rec_destn in cur_destn
        loop
          afw_17_envoi_courl_pkg.ajout_destn (rec_destn.nom
                                             ,rec_destn.adres
                                             ,afw_17_envoi_courl_pkg.kva_destn_uniq);
        end loop;
      end if;
    end if;

    -- Définir le corps
    afw_17_envoi_courl_pkg.ajout_ligne_corps (   'Classe d''intervention: '
                                              || rec_clas_inter.descr);
    ecrir_mesg_ereur ();
    ecrir_info_genrl ();
    ecrir_fil_arian ();
    ecrir_contx ();
    ecrir_page_item ();
    ecrir_aplic_item ();

    --afw_17_envoi_courl_pkg.envoy ();
    afw_17_envoi_courl_pkg.placr_fil_atent ();
  end notfr_clas_inter;
end afw_03_envoi_courl_pkg;
/
