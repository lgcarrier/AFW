SET DEFINE OFF;
create or replace package body afw_12_struc_aplic_pkg
as
  function obten_struc_aplic_formt (pnu_seqnc_struc in number)
    return varchar2
  is
    vva_struc_aplic_formt   vd_i_afw_12_struc_aplic.nom%type;
  begin
    select sa.nom
      into vva_struc_aplic_formt
      from vd_i_afw_12_struc_aplic sa
     where sa.seqnc = pnu_seqnc_struc;

    return vva_struc_aplic_formt;
  exception
    when others
    then
      return null;
  end obten_struc_aplic_formt;

  function obten_struc_aplic_formt (pva_code_struc   in varchar2
                                   ,pnu_prodt        in number default afw_11_prodt_pkg.obten_prodt_sesn)
    return varchar2
  is
    vva_struc_aplic_formt   vd_i_afw_12_struc_aplic.nom%type;
  begin
    select sa.nom
      into vva_struc_aplic_formt
      from vd_i_afw_12_struc_aplic sa
     where     sa.code = pva_code_struc
           and ref_prodt = pnu_prodt;

    return vva_struc_aplic_formt;
  exception
    when others
    then
      return null;
  end obten_struc_aplic_formt;

  procedure obten_struc_aplic_formt (pva_code_struc          in     varchar2
                                    ,pva_adjec_demns            out varchar2
                                    ,pva_struc_aplic_formt      out varchar2
                                    ,pnu_prodt               in     number default afw_11_prodt_pkg.obten_prodt_sesn)
  is
  begin
    select (select adjec_demns
              from vd_i_afw_12_struc_aplic_lang sal
             where     sal.ref_struc_aplic = sa.seqnc
                   and sal.ref_lang = afw_01_lang_pkg.obten_lang_sesn)
             adjec_demns
          ,sa.nom
      into pva_adjec_demns
          ,pva_struc_aplic_formt
      from vd_i_afw_12_struc_aplic sa
     where     sa.code = pva_code_struc
           and sa.ref_prodt = pnu_prodt;
  exception
    when others
    then
      null;
  end obten_struc_aplic_formt;

  function obten_code (pnu_seqnc in number)
    return varchar2
  is
    vva_code   varchar2 (23);
  begin
    select code
      into vva_code
      from afw_12_struc_aplic sa
     where sa.seqnc = pnu_seqnc;

    return vva_code;
  exception
    when others
    then
      return null;
  end obten_code;

  function obten_seqnc (pva_code    in varchar2
                       ,pnu_prodt   in number default afw_11_prodt_pkg.obten_prodt_sesn)
    return number
  is
    vnu_seqnc   number (10);
  begin
    select seqnc
      into vnu_seqnc
      from afw_12_struc_aplic sa
     where     sa.code = pva_code
           and sa.ref_prodt = pnu_prodt;

    return vnu_seqnc;
  exception
    when others
    then
      return null;
  end obten_seqnc;

  /*function obten_valr_formt (pnu_struc_aplic in number,
                             pnu_seqnc_struc_aplic in number,
                             pnu_elemn_desr in number default kva_elemn_titre)
    return varchar2 is
    vva_fonct                               varchar2 (4000);
    vva_nom_coln                            varchar2 (50);
    vva_nom_struc_acces                     varchar2 (50);
    vva_valr_formt                          varchar2 (4000);
    vva_schem                               varchar2 (50);
  begin
    /*select nom_packg || '.'
           || decode (pnu_elemn_desr,
                      kva_elemn_titre, nom_fonct_valr_formt,
                      kva_elemn_titre_court, nom_fonct_valr_court_formt,
                      kva_elemn_descr, nom_fonct_descr_formt)
      into vva_fonct
      from vd_i_afw_12_struc_aplic sa
     where sa.seqnc = pnu_struc_aplic;
    if vva_fonct is not null
       and pnu_seqnc_struc_aplic is not null then
      execute immediate
           'begin afw_12_struc_aplic_pkg.gva_valr_formt := '
        || vva_fonct
        || '('
        || pnu_seqnc_struc_aplic
        || '); end;';
    end if;*/

  /*    select nom_coln
                  into vva_nom_coln
        from vd_i_afw_12_atrib_struc_aplic
       where ref_dv_natr_infor = afw_14_domn_valr_pkg.obten_seqnc (
                                   'NATR_INFOR_STRUC_APLIC',
                                   decode (pnu_elemn_desr,
                                           kva_elemn_titre, 'NOM_FORMT',
                                           kva_elemn_titre_court, 'TITRE_COURT',
                                           kva_elemn_descr, 'DESCR_LONG'),
                                   'SAFP')
             and ref_struc_aplic = pnu_struc_aplic;
      select nom_struc_acces_don
        into vva_nom_struc_acces
        from vd_i_afw_12_struc_aplic
       where seqnc = pnu_struc_aplic;
      select afw_11_prodt_pkg.obten_schem ( (select ref_prodt
                                               from vd_i_afw_12_struc_aplic
                                              where seqnc = pnu_struc_aplic))
        into vva_schem
        from dual;
      execute immediate
        'select ' ||
        vva_nom_coln ||
        ' from ' ||
        vva_schem ||
        '.' ||
        vva_nom_struc_acces ||
        ' where seqnc = ' ||
        pnu_seqnc_struc_aplic ||
        ' '
                                            into vva_valr_formt;
      return vva_valr_formt;
    --return afw_12_struc_aplic_pkg.gva_valr_formt;
    exception
      when others then
        return null;
    end obten_valr_formt;*/

  procedure creer_group (pnu_ref_struc_aplic in vd_i_afw_12_struc_aplic.seqnc%type)
  is
    --TODO::CARLO
    -- Vérifier si on doit enlever le IS NULL

    cursor cur_struc_aplic (pnu_ref_struc_aplic in vd_i_afw_12_struc_aplic.seqnc%type)
    is
      select *
        from vd_i_afw_12_struc_aplic
       where    seqnc = pnu_ref_struc_aplic
             or pnu_ref_struc_aplic is null;

    vre_struc_aplic   vd_i_afw_12_struc_aplic%rowtype;

    procedure creer_group_type_acces (pva_code_type     in varchar2
                                     ,pva_nom_type      in varchar2
                                     ,pva_descr_type    in varchar2
                                     ,pva_indic_acces   in varchar2
                                     ,pva_indic_modfc   in varchar2
                                     ,pva_indic_suprs   in varchar2
                                     ,pva_indic_creat   in varchar2
                                     ,pre_struc_aplic   in vd_i_afw_12_struc_aplic%rowtype)
    is
      vnu_ref_group_utils   number;
    begin
      --begin
      -- Creer le groupe
      insert into vd_i_afw_12_group_utils (code
                                          ,nom
                                          ,descr
                                          ,ref_prodt)
           values (   pva_code_type
                   || '_'
                   || pre_struc_aplic.code
                  ,substr (   pva_nom_type
                           || ': '
                           || pre_struc_aplic.nom
                          ,1
                          ,100)
                  ,substr (   pva_descr_type
                           || ': '
                           || pre_struc_aplic.nom
                          ,1
                          ,400)
                  ,pre_struc_aplic.ref_prodt)
        returning seqnc
             into vnu_ref_group_utils;

      /*exception
      -- TODO:TRESE - Enlever apres la creation initiale des groupes pour les SA existantes
      when dup_val_on_index then
        select seqnc
          into vnu_ref_group_utils
          from vd_i_afw_12_group_utils
         where code = pva_code_type || '_' || pre_struc_aplic.code;
      end;*/

      -- Donner les droits
      insert into vd_i_afw_12_defnt_acces (ref_group_utils
                                          ,ref_struc_aplic
                                          ,indic_acces
                                          ,indic_modfc
                                          ,indic_suprs
                                          ,indic_creat)
           values (vnu_ref_group_utils
                  ,pre_struc_aplic.seqnc
                  ,pva_indic_acces
                  ,pva_indic_modfc
                  ,pva_indic_suprs
                  ,pva_indic_creat);
    end creer_group_type_acces;
  begin
    for vre_struc_aplic in cur_struc_aplic (pnu_ref_struc_aplic)
    loop
      creer_group_type_acces ('ACCES'
                             ,'Accès en lecture seule à'
                             ,'Permet d''accéder en lecture aux pages liées à la structure applicative'
                             ,'ACORD'
                             ,'REFS'
                             ,'REFS'
                             ,'REFS'
                             ,vre_struc_aplic);

      creer_group_type_acces ('MODFC'
                             ,'Accès en mise à jour à'
                             ,'Permet la mise à jour (création et modification) des pages liées à la structure applicative'
                             ,'ACORD'
                             ,'ACORD'
                             ,'REFS'
                             ,'ACORD'
                             ,vre_struc_aplic);

      creer_group_type_acces ('CONTR'
                             ,'Accès total à'
                             ,'Permet toutes les opérations (création, modification, suppression) sur les pages liées à la structure applicative'
                             ,'ACORD'
                             ,'ACORD'
                             ,'ACORD'
                             ,'ACORD'
                             ,vre_struc_aplic);
    end loop;
  end creer_group;

  function creer_struc (pva_code         in varchar2
                       ,pva_nom          in varchar2
                       ,pva_descr        in varchar2
                       ,pva_code_prodt   in varchar2)
    return number
  is
    vnu_seqnc   number (10);
  begin
    insert into vd_i_afw_12_struc_aplic (nom
                                        ,descr
                                        ,ref_prodt
                                        ,code)
         values (pva_nom
                ,pva_descr
                ,afw_11_prodt_pkg.obten_prodt (pva_code_prodt)
                ,pva_code)
      returning seqnc
           into vnu_seqnc;

    return vnu_seqnc;
  end creer_struc;

  procedure creer_struc (pva_code         in varchar2
                        ,pva_nom          in varchar2
                        ,pva_descr        in varchar2
                        ,pva_code_prodt   in varchar2)
  is
    vnu_seqnc   number (10);
  begin
    vnu_seqnc      :=
      creer_struc (pva_code
                  ,pva_nom
                  ,pva_descr
                  ,pva_code_prodt);
  end creer_struc;

  procedure suprm_struc (pnu_seqnc in number)
  is
  begin
    delete from vd_i_afw_12_struc_aplic
          where seqnc = pnu_seqnc;
  end suprm_struc;

  procedure modfr_struc (pnu_seqnc   in number
                        ,pva_code    in varchar2
                        ,pva_nom     in varchar2
                        ,pva_descr   in varchar2)
  is
  begin
    update vd_i_afw_12_struc_aplic
       set code    = pva_code
          ,nom     = pva_nom
          ,descr   = pva_descr
     where seqnc = pnu_seqnc;
  end modfr_struc;

  function obten_url_acces (pnu_seqnc_struc   in number
                           ,pnu_sspc          in number
                           ,pva_sapc          in varchar2 default null
                           ,pva_scpc          in varchar2 default null
                           , --Param à enlever plus tard, il est maintenant forcé
                            pnu_sspi          in number default null
                           ,pva_sapi          in varchar2 default null
                           ,pva_scpi          in varchar2 default null
                           ,pnu_snpi          in number default null
                           ,pva_reint_sidf    in varchar2 default 'N'
                           ,pva_valr_sess     in varchar2 default null
                           ,pva_valr_sidf     in varchar2 default null)
    return varchar2
  is
    vnu_numr_aplic_apex   number;
    vnu_numr_page_apex    number;
    vnu_sidf              number;
    vva_sidf              varchar2 (10);
    vva_url               varchar2 (4000);
    vva_scpc_force        vd_i_afw_12_struc_aplic.code%type;
    vva_mode_debg         varchar2 (3) default afw_07_util_pkg.v ('DEBUG');
  begin
    -- Obtenir l'application et la page cible
    select sa.numr_aplic_apex
          ,sp.numr_apex
          ,ssa.code
      into vnu_numr_aplic_apex
          ,vnu_numr_page_apex
          ,vva_scpc_force
      from vd_i_afw_11_aplic       sa
          ,vd_i_afw_13_page        sp
          ,vd_i_afw_12_struc_aplic ssa
     where     sa.seqnc = sp.ref_aplic
           and sp.seqnc = ssa.ref_page_forml
           and ssa.seqnc = pnu_seqnc_struc;

    if pva_reint_sidf = 'O'
    then
      vnu_sidf   := null;
    else
      vva_sidf   := pva_valr_sidf;
    end if;

    vva_url      :=
      afw_08_url_pkg.genr_url_en_contx (pnu_numr_aplic   => vnu_numr_aplic_apex
                                       ,pnu_numr_page    => vnu_numr_page_apex
                                       ,pva_sesn         => pva_valr_sess
                                       ,pva_sidf         => pva_valr_sidf
                                       ,pnu_sspc         => pnu_sspc
                                       ,pva_sapc         => pva_sapc
                                       ,pva_scpc         => vva_scpc_force
                                       ,pnu_sspi         => pnu_sspi
                                       ,pva_sapi         => pva_sapi
                                       ,pva_scpi         => pva_scpi
                                       ,pnu_snpi         => pnu_snpi
                                       ,pva_mode_debg    => vva_mode_debg);
    return vva_url;
  exception
    when others
    then
      ete ();
      return null;
  end obten_url_acces;

  function obten_url_liste (pnu_seqnc_struc   in number
                           ,pva_sapc          in varchar2 default null
                           ,pva_scpc          in varchar2 default null
                           ,pnu_sspi          in number default null
                           ,pva_sapi          in varchar2 default null
                           ,pva_scpi          in varchar2 default null
                           ,pnu_snpi          in number default null
                           ,pva_reint_sidf    in varchar2 default 'N'
                           ,pva_valr_sess     in varchar2 default null
                           ,pva_valr_sidf     in varchar2 default null)
    return varchar2
  is
    vnu_numr_aplic_apex   number;
    vnu_numr_page_apex    number;
    vnu_sidf              number;
    vva_scpc_force        vd_i_afw_12_struc_aplic.code%type;
    vva_url               varchar2 (4000);
    vva_mode_debg         varchar2 (3) default afw_07_util_pkg.v ('DEBUG');
  begin
    -- Obtenir l'application et la page cible
    select sa.numr_aplic_apex
          ,sp.numr_apex
          ,ssa.code
      into vnu_numr_aplic_apex
          ,vnu_numr_page_apex
          ,vva_scpc_force
      from vd_i_afw_11_aplic       sa
          ,vd_i_afw_13_page        sp
          ,vd_i_afw_12_struc_aplic ssa
     where     sa.seqnc = sp.ref_aplic
           and sp.seqnc = ssa.ref_page_liste
           and ssa.seqnc = pnu_seqnc_struc;

    if pva_reint_sidf = 'O'
    then
      vnu_sidf   := null;
    else
      vnu_sidf   := pva_valr_sidf;
    end if;

    vva_url      :=
      afw_08_url_pkg.genr_url_en_contx (pnu_numr_aplic   => vnu_numr_aplic_apex
                                       ,pnu_numr_page    => vnu_numr_page_apex
                                       ,pva_sesn         => pva_valr_sess
                                       ,pva_sidf         => pva_valr_sidf
                                       ,pnu_sspc         => null
                                       ,pva_sapc         => pva_sapc
                                       ,pva_scpc         => vva_scpc_force
                                       ,pnu_sspi         => pnu_sspi
                                       ,pva_sapi         => pva_sapi
                                       ,pva_scpi         => pva_scpi
                                       ,pnu_snpi         => pnu_snpi
                                       ,pva_mode_debg    => vva_mode_debg);

    return vva_url;
  exception
    when others
    then
      return null;
  end obten_url_liste;

  procedure maj_atrib_struc_aplic (pnu_struc_aplic in vd_i_afw_12_struc_aplic.seqnc%type)
  is
    vva_nom_struc_acces_don   varchar2 (30);
  begin
    update vd_i_afw_12_atrib_struc_aplic asa
       set asa.indic_valid   = 'N'
     where ref_struc_aplic = pnu_struc_aplic;

    select nom_struc_acces_don
      into vva_nom_struc_acces_don
      from vd_i_afw_12_struc_aplic
     where seqnc = pnu_struc_aplic;

    if (vva_nom_struc_acces_don is not null)
    then
      --CONAL:: Ancien merge, bogue sur la partie du bas.  ie, allait chercher le schéma SIPI_AFW
      /*merge into vd_i_afw_12_atrib_struc_aplic asa
                                         using (select column_name
                    from all_tab_columns
                   where table_name = vva_nom_struc_acces_don
                         and (owner in
                                (select aa.owner
                                   from apex_aplic aa, vd_i_afw_11_prodt p
                                  where aa.id = p.numr_aplic_apex
                                        and p.ref_systm =
                                              (select ref_systm
                                                 from vd_afw_11_prodt
                                                where seqnc =
                                                        (select ref_prodt
                                                           from vd_i_afw_12_struc_aplic
                                                          where seqnc =
                                                                  pnu_struc_aplic)))
                              or owner in
                                   (select aa.owner
                                      from apex_aplic aa, vd_i_afw_11_prodt p
                                     where 'AFW' =
                                             (select s.code
                                                from vd_i_afw_11_systm s,
                                                     vd_i_afw_11_prodt p,
                                                     vd_i_afw_12_struc_aplic sa
                                               where s.seqnc = p.ref_systm
                                                     and p.seqnc =
                                                           sa.ref_prodt
                                                     and sa.seqnc =
                                                           pnu_struc_aplic)))) atc
              on (asa.nom_coln = atc.column_name
                  and asa.ref_struc_aplic = pnu_struc_aplic)
      when matched then
        update set indic_valid   = 'O'
      when not matched then
        insert     (nom_coln,                                     --nom_fonct,
                             ref_struc_aplic)
            values (atc.column_name,                        --atc.column_name,
                                    pnu_struc_aplic);*/

      merge into vd_i_afw_12_atrib_struc_aplic asa
           using (select column_name
                    from all_tab_columns
                   where     table_name = vva_nom_struc_acces_don
                         and (   owner in (select aa.owner
                                             from apex_aplic        aa
                                                 ,vd_i_afw_11_aplic p
                                            where     aa.id = p.numr_aplic_apex
                                                  and p.ref_prodt = (select ref_prodt
                                                                       from vd_i_afw_12_struc_aplic
                                                                      where seqnc = pnu_struc_aplic))
                              or owner in (select aa.owner
                                             from apex_aplic              aa
                                                 ,vd_i_afw_11_prodt       p
                                                 ,vd_i_afw_11_aplic       ap
                                                 ,vd_i_afw_12_struc_aplic sa
                                            where     'AFW' = p.code
                                                  and p.seqnc = sa.ref_prodt
                                                  and sa.seqnc = pnu_struc_aplic
                                                  and p.seqnc = ap.ref_prodt
                                                  and aa.id = ap.numr_aplic_apex))) atc
              on (    asa.nom_coln = atc.column_name
                  and asa.ref_struc_aplic = pnu_struc_aplic)
      when matched
      then
        update set indic_valid   = 'O'
      when not matched
      then
        insert     (nom_coln
                   , --nom_fonct,
                    ref_struc_aplic)
            values (atc.column_name
                   , --atc.column_name,
                    pnu_struc_aplic);
    end if;
  end;

  procedure verfr_presn_tradc (pnu_struc_aplic number)
  is
    vnu_nombr_tradc   number;
  begin
    select count (1)
      into vnu_nombr_tradc
      from vd_afw_12_struc_aplic_lang
     where ref_struc_aplic = pnu_struc_aplic;

    if (vnu_nombr_tradc = 0)
    then
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SAF.000044'
                                                     ,pva_code_prodt   => 'AFW');
    end if;
  end;

  function obten_atrib_struc_aplic (pva_prodt              in vd_afw_11_prodt.code%type
                                   ,pva_code_struc_aplic   in vd_afw_12_struc_aplic.code%type
                                   ,pva_nom_coln_atrib     in vd_afw_12_atrib_struc_aplic.nom_coln%type)
    return vd_afw_12_atrib_struc_aplic.seqnc%type
  is
    vnu_seqnc   vd_afw_12_atrib_struc_aplic.seqnc%type;
  begin
    select asa.seqnc
      into vnu_seqnc
      from vd_afw_11_prodt             p
          ,vd_afw_12_struc_aplic       sa
          ,vd_afw_12_atrib_struc_aplic asa
     where     p.code = pva_prodt
           and p.seqnc = sa.ref_prodt
           and sa.code = pva_code_struc_aplic
           and sa.seqnc = asa.ref_struc_aplic
           and asa.nom_coln = pva_nom_coln_atrib;

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return null;
  end obten_atrib_struc_aplic;

  function obten_nom_coln_atrib (pnu_seqnc in vd_afw_12_atrib_struc_aplic.nom_coln%type)
    return vd_afw_12_atrib_struc_aplic.nom_coln%type
  is
    vva_nom_coln   vd_afw_12_atrib_struc_aplic.nom_coln%type;
  begin
    select nom_coln
      into vva_nom_coln
      from vd_afw_12_atrib_struc_aplic
     where seqnc = pnu_seqnc;

    return vva_nom_coln;
  end obten_nom_coln_atrib;

  function obten_icone_font_awesm (pnu_struc_aplic in vd_i_afw_12_struc_aplic.seqnc%type)
    return varchar2
  is
    vva_icone   vd_i_afw_12_struc_aplic.icon_font_awesm%type;
  begin
    select icon_font_awesm
      into vva_icone
      from vd_i_afw_12_struc_aplic sa
     where sa.seqnc = pnu_struc_aplic;

    return vva_icone;
  exception
    when no_data_found
    then
      return null;
  end obten_icone_font_awesm;
end afw_12_struc_aplic_pkg;
/
