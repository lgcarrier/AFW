SET DEFINE OFF;
create or replace package body afw_12_secrt_pkg
as
  gbo_super_utils            boolean default null;
  gbo_admin_prodt            boolean default null;
  gva_code_admin             varchar2 (23);
  gbo_code_admin_selct       boolean default false;
  gva_nom_item               varchar2 (30) default null;
  gva_opert_en_cours_verfc   varchar2 (30);
  gva_code_utils_actue       varchar2 (200);
  gva_code_domn_actue        varchar2 (200);

  type typ_rec_droit is record
  (
    indic_acces                     varchar2 (1)
   ,indic_creat                     varchar2 (1)
   ,indic_modfc                     varchar2 (1)
   ,indic_suprs                     varchar2 (1)
   ,indic_utils_creat_seulm         varchar2 (1)
   ,indic_struc_group_creat_seulm   varchar2 (1)
  );

  cache_absen                exception;

  function obten_cle_acces (pva_code_struc_aplic        in varchar2
                           ,pbo_indic_acces             in boolean default null
                           ,pbo_indic_creat             in boolean default null
                           ,pbo_indic_modfc             in boolean default null
                           ,pbo_indic_suprs             in boolean default null
                           ,pnu_seqnc_membr_struc_lie   in number
                           ,pnu_prodt                   in number
                           ,pnu_utils                   in number)
    return varchar2
  is
    vva_cle_initl   varchar2 (500);
  begin
    vva_cle_initl      :=
         '-'
      || pva_code_struc_aplic
      || '-';

    if pbo_indic_acces
    then
      vva_cle_initl      :=
           vva_cle_initl
        || 'O-';
    else
      vva_cle_initl      :=
           vva_cle_initl
        || 'N-';
    end if;

    if pbo_indic_creat
    then
      vva_cle_initl      :=
           vva_cle_initl
        || 'O-';
    else
      vva_cle_initl      :=
           vva_cle_initl
        || 'N-';
    end if;

    if pbo_indic_modfc
    then
      vva_cle_initl      :=
           vva_cle_initl
        || 'O-';
    else
      vva_cle_initl      :=
           vva_cle_initl
        || 'N-';
    end if;

    if pbo_indic_suprs
    then
      vva_cle_initl      :=
           vva_cle_initl
        || 'O-';
    else
      vva_cle_initl      :=
           vva_cle_initl
        || 'N-';
    end if;

    if pnu_seqnc_membr_struc_lie is not null
    then
      vva_cle_initl      :=
           vva_cle_initl
        || pnu_seqnc_membr_struc_lie
        || '-';
    else
      vva_cle_initl      :=
           vva_cle_initl
        || 'X-';
    end if;

    if pnu_seqnc_membr_struc_lie is not null
    then
      vva_cle_initl      :=
           vva_cle_initl
        || pnu_seqnc_membr_struc_lie
        || '-';
    else
      vva_cle_initl      :=
           vva_cle_initl
        || 'X-';
    end if;

    if pnu_utils is not null
    then
      vva_cle_initl      :=
           vva_cle_initl
        || pnu_utils
        || '-';
    else
      vva_cle_initl      :=
           vva_cle_initl
        || 'X-';
    end if;

    return vva_cle_initl;
  end obten_cle_acces;

  function obten_reslt_cache (pva_code_struc_aplic        in varchar2
                             ,pbo_indic_acces             in boolean default null
                             ,pbo_indic_creat             in boolean default null
                             ,pbo_indic_modfc             in boolean default null
                             ,pbo_indic_suprs             in boolean default null
                             ,pnu_seqnc_membr_struc_lie   in number
                             ,pnu_prodt                   in number
                             ,pnu_utils                   in number)
    return boolean
  is
    cursor cur_cache (pnu_sesn   in number default afw_08_url_pkg.knu_sesn
                     ,pva_cle    in varchar2 default obten_cle_acces (pva_code_struc_aplic
                                                                     ,pbo_indic_acces
                                                                     ,pbo_indic_creat
                                                                     ,pbo_indic_modfc
                                                                     ,pbo_indic_suprs
                                                                     ,pnu_seqnc_membr_struc_lie
                                                                     ,pnu_prodt
                                                                     ,pnu_utils))
    is
      select indic_verfc_reus
        from vd_i_afw_12_cache_droit_acces cds
       where     cds.ref_sesn = pnu_sesn
             and cds.cle_acces = pva_cle;

    vva_verfc_reus   varchar2 (1);
  begin
    --ete('Vérification en cache de la sécurité');

    open cur_cache;

    fetch cur_cache
      into vva_verfc_reus;

    close cur_cache;

    if vva_verfc_reus = 'O'
    then
      return true;
    elsif vva_verfc_reus = 'N'
    then
      return false;
    end if;

    --Si on est encore ici, c'est que l'occurence n'a pas été trouvée
    raise cache_absen;
  end obten_reslt_cache;

  procedure defnr_reslt_cache (pva_code_struc_aplic        in varchar2
                              ,pbo_indic_acces             in boolean default null
                              ,pbo_indic_creat             in boolean default null
                              ,pbo_indic_modfc             in boolean default null
                              ,pbo_indic_suprs             in boolean default null
                              ,pnu_seqnc_membr_struc_lie   in number
                              ,pnu_prodt                   in number
                              ,pnu_utils                   in number
                              ,pva_indic_verfc_reus        in varchar2)
  is
    pragma autonomous_transaction;
    vva_cle   varchar2 (100)
                default obten_cle_acces (pva_code_struc_aplic
                                        ,pbo_indic_acces
                                        ,pbo_indic_creat
                                        ,pbo_indic_modfc
                                        ,pbo_indic_suprs
                                        ,pnu_seqnc_membr_struc_lie
                                        ,pnu_prodt
                                        ,pnu_utils);
  begin
    insert into vd_i_afw_12_cache_droit_acces (ref_sesn
                                              ,cle_acces
                                              ,indic_verfc_reus)
         values (afw_08_url_pkg.knu_sesn
                ,vva_cle
                ,pva_indic_verfc_reus);

    commit;
  end defnr_reslt_cache;

  function defnr_nom_item (pva_nom_item in varchar2)
    return boolean
  is
  begin
    gva_nom_item   := pva_nom_item;
    return true;
  end defnr_nom_item;

  function obten_nom_item_courn
    return varchar2
  is
  begin
    return gva_nom_item;
  end obten_nom_item_courn;

  function verif_presn_super_utils
    return boolean
  is
  begin
    if gbo_super_utils is null
    then
      gbo_super_utils      :=
        verfr_presn_utils_group ('SUPER_UTILS'
                                ,true);
    end if;

    return gbo_super_utils;
  end verif_presn_super_utils;

  function obten_group_admin_sesn
    return varchar2
  is
  begin
    if not gbo_code_admin_selct
    then
      gbo_code_admin_selct   := true;

      select gu.code
        into gva_code_admin
        from vd_afw_11_prodt       p
            ,vd_afw_12_group_utils gu
       where     p.seqnc = afw_11_prodt_pkg.obten_prodt_sesn ()
             and p.ref_group_utils_admin = gu.seqnc;
    end if;

    return gva_code_admin;
  exception
    when no_data_found
    then
      return null;
  end obten_group_admin_sesn;

  function verif_presn_group_admin (pva_group in varchar2)
    return boolean
  is
    vva_ignor   varchar2 (1);
  begin
    if pva_group is null
    then
      if gbo_admin_prodt is null
      then
        gbo_admin_prodt   := verfr_presn_utils_group (obten_group_admin_sesn ());
      end if;

      return gbo_admin_prodt;
    else
      begin
        select indic_ignor_group_admin
          into vva_ignor
          from vd_afw_12_group_utils gu
         where     gu.code = pva_group
               and gu.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn ();

        if vva_ignor = 'O'
        then
          return false;
        else
          return verfr_presn_utils_group (obten_group_admin_sesn ()
                                         ,true);
        end if;
      exception
        when no_data_found
        then
          return verfr_presn_utils_group (obten_group_admin_sesn ()
                                         ,true);
      end;
    end if;
  end verif_presn_group_admin;

  function verfr_presn_utils_group (pva_group         in varchar2
                                   ,pbo_ignor_super   in boolean default false
                                   ,pnu_utils         in number default afw_12_utils_pkg.obten_usagr_conct ())
    return boolean
  is
    vnu_utils         number (10) default pnu_utils;
    vnu_presn_utils   pls_integer default 0;
    vnu_group_lie     number (10);
    vda_date          date default sysdate;

    --obtenir la hierarchie de groupes
    cursor cur_group_lies (pva_group_initl in varchar2)
    is
          select distinct (ref_group) group_lie
            from vd_afw_12_lien_group_utils lgu
                ,(select seqnc
                    from vd_afw_12_group_utils
                   where code = pva_group_initl) group_initl
      connect by     lgu.ref_group_utils_lie = prior lgu.ref_group
                 and lgu.date_debut_efect <= vda_date
                 and (   lgu.date_fin_efect >= vda_date
                      or lgu.date_fin_efect is null)
                 and (   lgu.ref_domn = afw_12_domn_pkg.obten_domn_sesn
                      or afw_12_domn_pkg.obten_domn_sesn is null) -- AJOUT_CONAL
      start with     lgu.ref_group_utils_lie = group_initl.seqnc
                 and lgu.ref_utils is null
                 and lgu.date_debut_efect <= vda_date
                 and (   lgu.date_fin_efect >= vda_date
                      or lgu.date_fin_efect is null);

    --Verifier la presence dans le groupe
    cursor cur_presn_group (pnu_group in number)
    is
      select 1
        from vd_afw_12_group_utils      gu
            ,vd_afw_12_lien_group_utils lgu
       where     lgu.ref_utils = vnu_utils
             and lgu.ref_group = gu.seqnc
             and gu.seqnc = pnu_group
             and (   lgu.ref_domn = afw_12_domn_pkg.obten_domn_sesn
                  or afw_12_domn_pkg.obten_domn_sesn is null) -- AJOUT_CONAL
             and lgu.date_debut_efect <= vda_date
             and (   lgu.date_fin_efect >= vda_date
                  or lgu.date_fin_efect is null)
             and rownum = 1;

    vva_group_admin   varchar2 (23);
  begin
    if not pbo_ignor_super
    then
      if verif_presn_super_utils
      then
        return true;
      end if;

      if pva_group != 'SUPER_UTILS'
      then
        vva_group_admin   := obten_group_admin_sesn ();

        if vva_group_admin is not null
        then
          if pva_group != vva_group_admin
          then
            if verif_presn_group_admin (pva_group)
            then
              return true;
            end if;
          end if;
        end if;
      end if;
    end if;

    begin
      select 1
        into vnu_presn_utils
        from vd_afw_12_group_utils      gu
            ,vd_afw_12_lien_group_utils lgu
       where     lgu.ref_utils = vnu_utils
             and lgu.ref_group = gu.seqnc
             and gu.code = pva_group
             and (   lgu.ref_domn = afw_12_domn_pkg.obten_domn_sesn
                  or afw_12_domn_pkg.obten_domn_sesn is null) -- AJOUT_CONAL
             and lgu.date_debut_efect <= vda_date
             and (   lgu.date_fin_efect >= vda_date
                  or lgu.date_fin_efect is null)
             and rownum = 1;
    exception
      when no_data_found
      then
        null;
    end;

    if vnu_presn_utils != 1
    then
      --verifier dans les groupes lies si present
      for rec_group_lie in cur_group_lies (pva_group)
      loop
        open cur_presn_group (rec_group_lie.group_lie);

        fetch cur_presn_group
          into vnu_presn_utils;

        close cur_presn_group;

        if vnu_presn_utils = 1
        then
          exit;
        end if;
      end loop;
    end if;

    return vnu_presn_utils = 1;
  exception
    when others
    then
      return false;
  end verfr_presn_utils_group;

  function verfr_presn_utils_group_numbr (pva_group         in varchar2
                                         ,pbo_ignor_super   in boolean default false
                                         ,pnu_utils         in number default afw_12_utils_pkg.obten_usagr_conct ())
    return number
    deterministic
  is
  begin
    if verfr_presn_utils_group (pva_group
                               ,pbo_ignor_super
                               ,pnu_utils) = true
    then
      return 1;
    else
      return 0;
    end if;
  end verfr_presn_utils_group_numbr;

  function verfc_droit_acces (pva_code_struc_aplic        in varchar2
                             ,pbo_indic_acces             in boolean default null
                             ,pbo_indic_creat             in boolean default null
                             ,pbo_indic_modfc             in boolean default null
                             ,pbo_indic_suprs             in boolean default null
                             ,pnu_seqnc_membr_struc_lie   in number
                             ,pnu_prodt                   in number default afw_11_prodt_pkg.obten_prodt_sesn
                             ,pnu_utils                   in number default afw_12_utils_pkg.obten_usagr_conct)
    return boolean
  is
    type typ_acces is record
    (
      valr_parmt         boolean
     ,valr_defnt_acces   pls_integer
    );

    type typ_tab_acces is table of typ_acces
      index by varchar2 (5);

    var_type_acces          typ_tab_acces;
    vbo_acces_courn         boolean default false;
    vnu_utils_sesn          number (10) default pnu_utils;
    vnu_seqnc_struc_admin   number (10);
    vnu_presn               pls_integer;
    vva_type_acces_courn    varchar2 (5) default 'ACCES';
    vnu_utils_membr_struc   number (10);
    vda_date                date default sysdate;

    cursor cur_utils_lie
    is
      select 1
        from vd_i_afw_12_membr_struc ms
       where     ms.ref_utils = vnu_utils_sesn
             and ms.seqnc = pnu_seqnc_membr_struc_lie
             and rownum < 2;

    cursor cur_membr_meme_struc
    is
      select 1
        from vd_i_afw_12_membr_struc ms
       where     ms.ref_utils = vnu_utils_sesn
             and ms.ref_struc_admin = vnu_seqnc_struc_admin
             and rownum = 1;

    cursor cur_membr_struc_globl
    is
      select 1
        from vd_i_afw_12_membr_struc ms
            ,(    select ls.ref_struc_admin
                    from vd_i_afw_12_lien_struc ls
              connect by     prior ls.ref_struc_admin = ls.ref_struc_lie
                         and ls.date_debut_efect <= vda_date
                         and (   ls.date_fin_efect >= vda_date
                              or ls.date_fin_efect is null)
              start with     ls.ref_struc_admin = vnu_seqnc_struc_admin
                         and ls.date_debut_efect <= vda_date
                         and (   ls.date_fin_efect >= vda_date
                              or ls.date_fin_efect is null)
              union all
                  select ls.ref_struc_lie
                    from vd_i_afw_12_lien_struc ls
              connect by     ls.ref_struc_admin = prior ls.ref_struc_lie
                         and ls.date_debut_efect <= vda_date
                         and (   ls.date_fin_efect >= vda_date
                              or ls.date_fin_efect is null)
              start with     ls.ref_struc_admin = vnu_seqnc_struc_admin
                         and ls.date_debut_efect <= vda_date
                         and (   ls.date_fin_efect >= vda_date
                              or ls.date_fin_efect is null)) hierc
       where     hierc.ref_struc_admin = ms.ref_struc_admin
             and ms.ref_utils = vnu_utils_sesn
             and rownum = 1;

    cursor cur_membr_struc_supr
    is
      select 1
        from vd_i_afw_12_membr_struc ms
            ,(    select ls.ref_struc_admin
                    from vd_i_afw_12_lien_struc ls
              connect by     prior ls.ref_struc_admin = ls.ref_struc_lie
                         and ls.date_debut_efect <= vda_date
                         and (   ls.date_fin_efect >= vda_date
                              or ls.date_fin_efect is null)
              start with     ls.ref_struc_admin in (select distinct (ms.ref_struc_admin)
                                                      from vd_i_afw_12_membr_struc ms
                                                     where     ms.ref_utils = vnu_utils_sesn
                                                           and ms.date_debut_efect <= vda_date
                                                           and (   ms.date_fin_efect >= vda_date
                                                                or ms.date_fin_efect is null))
                         and ls.date_debut_efect <= vda_date
                         and (   ls.date_fin_efect >= vda_date
                              or ls.date_fin_efect is null)) hierc
       where     hierc.ref_struc_admin = ms.ref_struc_admin
             and ms.ref_utils = vnu_utils_membr_struc
             and rownum = 1
             and ms.date_debut_efect <= vda_date
             and (   ms.date_fin_efect >= vda_date
                  or ms.date_fin_efect is null);

    cursor cur_membr_struc_infr
    is
      select 1
        from vd_i_afw_12_membr_struc ms
            ,(    select ls.ref_struc_lie ref_struc_admin
                    from vd_i_afw_12_lien_struc ls
              connect by     ls.ref_struc_admin = prior ls.ref_struc_lie
                         and ls.date_debut_efect <= vda_date
                         and (   ls.date_fin_efect >= vda_date
                              or ls.date_fin_efect is null)
              start with     ls.ref_struc_admin = (select distinct (ms.ref_struc_admin)
                                                     from vd_i_afw_12_membr_struc ms
                                                    where     ms.ref_utils = vnu_utils_sesn
                                                          and ms.date_debut_efect <= vda_date
                                                          and (   ms.date_fin_efect >= vda_date
                                                               or ms.date_fin_efect is null))
                         and ls.date_debut_efect <= vda_date
                         and (   ls.date_fin_efect >= vda_date
                              or ls.date_fin_efect is null)
              union all
              (select vnu_seqnc_struc_admin
                 from dual)) hierc
       where     hierc.ref_struc_admin = ms.ref_struc_admin
             and ms.ref_utils = vnu_utils_membr_struc
             and rownum = 1
             and ms.date_debut_efect <= vda_date
             and (   ms.date_fin_efect >= vda_date
                  or ms.date_fin_efect is null);

    cursor cur_defnt_acces (vva_defnt_access in varchar2)
    is
      select indic_acces
            ,indic_creat
            ,indic_modfc
            ,indic_suprs
        from vd_i_afw_12_defnt_acces
       where ref_struc_aplic = (select seqnc
                                  from vd_i_afw_12_struc_aplic
                                 where     code = pva_code_struc_aplic
                                       and ref_prodt = pnu_prodt);

    cursor cur_acces_struc_infr_supr (
      pva_type_acces_en_cours   in varchar2)
    is
      select type_acces
        from (select distinct
                     (decode (vva_type_acces_courn,  'ACCES', indic_acces,  'CREAT', indic_creat,  'MODFC', indic_modfc,  'SUPRS', indic_suprs)) type_acces
                from vd_i_afw_12_defnt_acces da
               where     exists
                           (select 1
                              from vd_i_afw_12_group_utils      gu
                                  ,vd_i_afw_12_lien_group_utils lgu
                             where     gu.seqnc = da.ref_group_utils
                                   and gu.seqnc = lgu.ref_group
                                   and lgu.ref_utils = vnu_utils_sesn
                                   and (   lgu.ref_domn = afw_12_domn_pkg.obten_domn_sesn
                                        or afw_12_domn_pkg.obten_domn_sesn is null) -- AJOUT_CONAL
                                   and lgu.date_debut_efect <= vda_date
                                   and (   lgu.date_fin_efect >= vda_date
                                        or lgu.date_fin_efect is null))
                     and da.ref_struc_aplic = (select tlpa.seqnc
                                                 from vd_i_afw_12_struc_aplic tlpa
                                                where     tlpa.code = pva_code_struc_aplic
                                                      and tlpa.ref_prodt = pnu_prodt))
       where type_acces in ('ACSIN'
                           ,'ACSSU');

    procedure alimt_seqnc_struc
    is
    begin
      select ms.ref_struc_admin
        into vnu_seqnc_struc_admin
        from vd_i_afw_12_membr_struc ms
       where ms.seqnc = pnu_seqnc_membr_struc_lie;
    end alimt_seqnc_struc;

    procedure alimt_seqnc_utils_membr_struc
    is
    begin
      select ref_utils
        into vnu_utils_membr_struc
        from vd_i_afw_12_membr_struc ms
       where ms.seqnc = pnu_seqnc_membr_struc_lie;
    end alimt_seqnc_utils_membr_struc;

    procedure sauvg_cache (pva_cache in varchar2)
    is
    begin
      defnr_reslt_cache (pva_code_struc_aplic
                        ,pbo_indic_acces
                        ,pbo_indic_creat
                        ,pbo_indic_modfc
                        ,pbo_indic_suprs
                        ,pnu_seqnc_membr_struc_lie
                        ,pnu_prodt
                        ,pnu_utils
                        ,pva_cache);
    end sauvg_cache;
  begin
    --Vérifier si n'a pas déjà été calculé
    begin
      return obten_reslt_cache (pva_code_struc_aplic
                               ,pbo_indic_acces
                               ,pbo_indic_creat
                               ,pbo_indic_modfc
                               ,pbo_indic_suprs
                               ,pnu_seqnc_membr_struc_lie
                               ,pnu_prodt
                               ,pnu_utils);
    exception
      when cache_absen
      then
        null;
    end;

    --Vérifier l'activation de la struc aplic dans le domaine via les fonctions
    if     not afw_12_fonct_pkg.verif_activ_fonct_domn (pva_code_struc_aplic)
       and afw_12_fonct_pkg.verfr_fonct_domn_exist (pva_code_struc_aplic)
    then
      sauvg_cache ('N');
      return false;
    end if;

    if verif_presn_super_utils
    then
      gbo_super_utils   := true;
      sauvg_cache ('O');
      return true;
    end if;

    if verif_presn_group_admin (null)
    then
      sauvg_cache ('O');
      return true;
    end if;

    --Obtenir la rangee de securite

    begin
      vbo_acces_courn                       := true;

      select nvl (max (decode (indic_acces,  'REFS', 1,  'ACUCS', 2,  'ACSTI', 3,  'ACSIN', 4,  'ACSSU', 4,  'ACSTG', 5,  'ACORD', 6)), 0) type_acces
            ,nvl (max (decode (indic_creat,  'REFS', 1,  'ACUCS', 2,  'ACSTI', 3,  'ACSIN', 4,  'ACSSU', 4,  'ACSTG', 5,  'ACORD', 6)), 0) type_creat
            ,nvl (max (decode (indic_modfc,  'REFS', 1,  'ACUCS', 2,  'ACSTI', 3,  'ACSIN', 4,  'ACSSU', 4,  'ACSTG', 5,  'ACORD', 6)), 0) type_modfc
            ,nvl (max (decode (indic_suprs,  'REFS', 1,  'ACUCS', 2,  'ACSTI', 3,  'ACSIN', 4,  'ACSSU', 4,  'ACSTG', 5,  'ACORD', 6)), 0) type_suprs
        into var_type_acces ('ACCES').valr_defnt_acces
            ,var_type_acces ('CREAT').valr_defnt_acces
            ,var_type_acces ('MODFC').valr_defnt_acces
            ,var_type_acces ('SUPRS').valr_defnt_acces
        from vd_i_afw_12_defnt_acces da
       where     exists
                   (select 1 -- AJOUT_CONAL --CONAL, pas trop certain,  Ressemble bcp au select de la vue VS_GROUP_LIE_UTILS_CONCT
                      from (    select distinct (ref_group_utils_lie) seqnc_group
                                  from vd_afw_12_lien_group_utils lgu
                            connect by     prior lgu.ref_group_utils_lie = lgu.ref_group
                                       and ref_utils is null
                                       and lgu.date_debut_efect <= vda_date
                                       and (   lgu.date_fin_efect >= vda_date
                                            or lgu.date_fin_efect is null)
                            start with     lgu.ref_group in (select distinct ref_group
                                                               from vd_afw_12_lien_group_utils lgu2
                                                              where     lgu2.ref_utils = vnu_utils_sesn
                                                                    and lgu2.date_debut_efect <= vda_date
                                                                    and (   lgu2.date_fin_efect >= vda_date
                                                                         or lgu2.date_fin_efect is null))
                                       and lgu.ref_utils is null
                                       and lgu.date_debut_efect <= vda_date
                                       and (   lgu.date_fin_efect >= vda_date
                                            or lgu.date_fin_efect is null)
                            union
                            select distinct ref_group
                              from vd_afw_12_lien_group_utils lgu2
                             where     lgu2.ref_utils = vnu_utils_sesn
                                   and lgu2.date_debut_efect <= vda_date
                                   and (   lgu2.date_fin_efect >= vda_date
                                        or lgu2.date_fin_efect is null)) gu
                     where gu.seqnc_group = da.ref_group_utils)
             and da.ref_struc_aplic = (select tlpa.seqnc
                                         from vd_afw_12_struc_aplic tlpa
                                        where     tlpa.code = pva_code_struc_aplic
                                              and tlpa.ref_prodt = pnu_prodt);

      var_type_acces ('ACCES').valr_parmt   := pbo_indic_acces;
      var_type_acces ('CREAT').valr_parmt   := pbo_indic_creat;
      var_type_acces ('MODFC').valr_parmt   := pbo_indic_modfc;
      var_type_acces ('SUPRS').valr_parmt   := pbo_indic_suprs;
    exception
      when others
      then
        vbo_acces_courn   := false;
    end;

    while vbo_acces_courn
    loop
      --verifier les acces selon cette rangee
      if     var_type_acces (vva_type_acces_courn).valr_parmt
         and vbo_acces_courn
      then
        vbo_acces_courn   := var_type_acces (vva_type_acces_courn).valr_defnt_acces > 1;

        if vbo_acces_courn
        then
          if var_type_acces (vva_type_acces_courn).valr_defnt_acces = 2
          then --'ACUCS'
            --Acces si utilisateur creation seulement
            --ok si le membre de structure recu en parametre correspond a l'utilisateur en session
            open cur_utils_lie;

            fetch cur_utils_lie
              into vnu_presn;

            close cur_utils_lie;

            vbo_acces_courn   := nvl (vnu_presn, 0) = 1;
          elsif var_type_acces (vva_type_acces_courn).valr_defnt_acces = 3
          then --'ACSTI'
            --Acces si structure immediate
            --ok si l'utilisateur recu en param est dans la meme structure immediate
            if pnu_seqnc_membr_struc_lie is null
            then
              sauvg_cache ('N');
              return false;
            end if;

            --determiner si presence dans la structure
            alimt_seqnc_struc;

            open cur_membr_meme_struc;

            fetch cur_membr_meme_struc
              into vnu_presn;

            close cur_membr_meme_struc;

            vbo_acces_courn   := nvl (vnu_presn, 0) = 1;
          elsif var_type_acces (vva_type_acces_courn).valr_defnt_acces = 4
          then --ACSIN, ACSSU
            if pnu_seqnc_membr_struc_lie is null
            then
              sauvg_cache ('N');
              return false;
            end if;

            alimt_seqnc_struc;

            --Obtenir les elements
            for rec_acces_struc_infr_supr in cur_acces_struc_infr_supr (vva_type_acces_courn)
            loop
              alimt_seqnc_utils_membr_struc;

              if rec_acces_struc_infr_supr.type_acces = 'ACSIN'
              then
                open cur_membr_struc_infr;

                fetch cur_membr_struc_infr
                  into vnu_presn;

                close cur_membr_struc_infr;
              elsif rec_acces_struc_infr_supr.type_acces = 'ACSSU'
              then
                open cur_membr_struc_supr;

                fetch cur_membr_struc_supr
                  into vnu_presn;

                close cur_membr_struc_supr;
              end if;

              vbo_acces_courn   := nvl (vnu_presn, 0) = 1;
              exit when not (vbo_acces_courn);
            end loop;
          elsif var_type_acces (vva_type_acces_courn).valr_defnt_acces = 5
          then --globale
            --Acces si structure globale
            --ok si l'utilisateur recu en param est dans la meme structure globale
            if pnu_seqnc_membr_struc_lie is null
            then
              sauvg_cache ('N');
              return false;
            end if;

            --determiner si presence dans la structure globale
            alimt_seqnc_struc;

            open cur_membr_struc_globl;

            fetch cur_membr_struc_globl
              into vnu_presn;

            close cur_membr_struc_globl;

            vbo_acces_courn   := nvl (vnu_presn, 0) = 1;
          elsif var_type_acces (vva_type_acces_courn).valr_defnt_acces = 6
          then --ACORD
            null;
          end if;
        end if;
      end if;

      vva_type_acces_courn   := var_type_acces.next (vva_type_acces_courn);
      exit when vva_type_acces_courn is null;
    end loop;

    if vbo_acces_courn
    then
      sauvg_cache ('O');
    else
      sauvg_cache ('N');
    end if;

    return vbo_acces_courn;
  end verfc_droit_acces;

  function verfc_droit_acces_numrq (pva_code_struc_aplic        in varchar2
                                   ,pva_indic_acces             in varchar2 default null
                                   ,pva_indic_creat             in varchar2 default null
                                   ,pva_indic_modfc             in varchar2 default null
                                   ,pva_indic_suprs             in varchar2 default null
                                   ,pnu_seqnc_membr_struc_lie   in number default null
                                   ,pnu_prodt                   in number default afw_11_prodt_pkg.obten_prodt_sesn
                                   ,pnu_utils                   in number default afw_12_utils_pkg.obten_usagr_conct)
    return number
  is
  begin
    if verfc_droit_acces (pva_code_struc_aplic
                         ,pva_indic_acces = 'O'
                         ,pva_indic_creat = 'O'
                         ,pva_indic_modfc = 'O'
                         ,pva_indic_suprs = 'O'
                         ,pnu_seqnc_membr_struc_lie
                         ,pnu_prodt
                         ,pnu_utils)
    then
      return 1;
    else
      return 0;
    end if;
  end verfc_droit_acces_numrq;

  function verfc_droit_acces_schem_apex (pbo_indic_acces   in boolean default null
                                        ,pbo_indic_creat   in boolean default null
                                        ,pbo_indic_modfc   in boolean default null
                                        ,pbo_indic_suprs   in boolean default null)
    return boolean
  is
    vva_code_struc_aplic   vd_i_afw_12_struc_aplic.code%type;
  begin
    if verif_presn_super_utils
    then
      return true;
    end if;

    if vva_code_struc_aplic is null
    then
      select sa.code
        into vva_code_struc_aplic
        from vd_i_afw_13_page        pag
            ,vd_i_afw_11_aplic       ap
            ,vd_i_afw_12_struc_aplic sa
            ,vd_i_afw_11_prodt       pro
       where     sa.seqnc = pag.ref_struc_aplic
             and pag.seqnc = afw_13_page_pkg.obten_page_sesn
             and pag.ref_aplic = ap.seqnc
             and ap.ref_prodt = pro.seqnc
             and pro.seqnc = afw_11_prodt_pkg.obten_prodt_sesn;
    end if;

    return verfc_droit_acces (vva_code_struc_aplic
                             ,pbo_indic_acces
                             ,pbo_indic_creat
                             ,pbo_indic_modfc
                             ,pbo_indic_suprs
                             ,afw_07_util_pkg.v (   'P'
                                                 || afw_07_util_pkg.nv ('APP_PAGE_ID')
                                                 || '_REF_MEMBR_STRUC'));
  exception
    when others
    then
      --TODO::CARLO
      /*afw_03_journ_pkg.ecrir_journ (
                    'Erreur dans l''evaluation des autorisation apex');*/
      return false;
  end verfc_droit_acces_schem_apex;

  function verf_presn_opert_item (pnu_utils   in number
                                 ,pva_item    in varchar2)
    return boolean
  is
    vnu_page    number default afw_07_util_pkg.nv ('APP_PAGE_ID');
    vnu_app     number default afw_07_util_pkg.nv ('APP_ID');
    vnu_presn   number (1);
    vda_date    date default sysdate;
  begin
    if verif_presn_super_utils
    then
      return true;
    end if;

    select count (1)
      into vnu_presn
      from vd_afw_12_defnt_acces da
          ,vd_afw_13_page_item   pi
          ,vd_afw_13_page        pa
          ,vd_afw_11_aplic       ap
          ,(    select distinct (ref_group) seqnc_group -- AJOUT_CONAL  --CONAL MEME CHOSE ICI (Réutiliser la vue)
                  from vd_i_afw_12_lien_group_utils lgu
            connect by     lgu.ref_group_utils_lie = prior lgu.ref_group
                       and (   level != 1
                            or (    level = 1
                                and ref_utils is null))
                       and lgu.date_debut_efect <= vda_date
                       and (   lgu.date_fin_efect >= vda_date
                            or lgu.date_fin_efect is null)
            start with     lgu.ref_group_utils_lie in (select distinct ref_group
                                                         from vd_i_afw_12_lien_group_utils lgu2
                                                        where     lgu2.ref_utils = pnu_utils
                                                              and lgu2.date_debut_efect <= vda_date
                                                              and (   lgu2.date_fin_efect >= vda_date
                                                                   or lgu2.date_fin_efect is null))
                       and lgu.ref_utils is null
                       and lgu.date_debut_efect <= vda_date
                       and (   lgu.date_fin_efect >= vda_date
                            or lgu.date_fin_efect is null)
            union
            select distinct ref_group
              from vd_i_afw_12_lien_group_utils lgu2
             where     lgu2.ref_utils = pnu_utils
                   and lgu2.date_debut_efect <= vda_date
                   and (   lgu2.date_fin_efect >= vda_date
                        or lgu2.date_fin_efect is null)) gu
     where     ap.numr_aplic_apex = vnu_app
           and ap.seqnc = pa.ref_aplic
           and pa.numr_apex = vnu_page
           and pa.seqnc = pi.ref_page
           and pi.ref_opert = da.ref_opert
           and da.ref_group_utils = gu.seqnc_group
           and da.indic_acces = 'ACORD'
           and pi.nom_apex = pva_item
           and rownum = 1;

    return vnu_presn = 1;
  end verf_presn_opert_item;

  function verfr_presn_group_utils (pva_code_group in varchar2)
    return boolean
  is
    vnu_presn   number (1);
  begin
    if verif_presn_super_utils
    then
      return true;
    end if;

    select count (1)
      into vnu_presn
      from vd_afw_12_group_utils group_utils
     where     rownum = 1
           and group_utils.code = pva_code_group
           and group_utils.seqnc = any (select gu.seqnc_group
                                          from vs_group_lie_utils_conct_all gu);

    return vnu_presn = 1;
  end verfr_presn_group_utils;

  function verfr_presn_opert_utils (pva_code_opert in varchar2)
    return boolean
  is
    vnu_presn   number (1);
  begin
    if verif_presn_super_utils
    then
      return true;
    end if;

    defnr_opert_en_cours_verfc (pva_code_opert);

    select count (1)
      into vnu_presn
      from vs_group_lie_utils_conct_all group_utils
     where     rownum = 1
           and group_utils.seqnc_group = any (select group_opert.seqnc_group
                                                from vs_group_lie_opert_verfc group_opert);

    return vnu_presn = 1;
  end verfr_presn_opert_utils;

  function verif_si_conct
    return boolean
  is
  begin
    if     afw_12_utils_pkg.obten_usagr_conct () is not null
       and upper (afw_07_util_pkg.v ('APP_USER')) != 'NOBODY'
    then
      return true;
    else
      return false;
    end if;
  exception
    when others
    then
      return false;
  end verif_si_conct;

  function verif_acces_liste_navgt (pnu_afw_13_elemn_liste_navgt in number)
    return boolean
  is
    vva_code   varchar2 (23);
  begin
    select max (sa.code)
      into vva_code
      from (select to_number (aa.do_substitutions (ln.page))  numr_apex
                  ,to_number (aa.do_substitutions (ln.aplic)) numr_aplic_apex
                  ,ap.ref_prodt
              from vd_afw_13_liste_navgt ln
                  ,vd_afw_13_page        p1
                  ,vd_afw_11_aplic       ap
             where     ln.seqnc = pnu_afw_13_elemn_liste_navgt
                   and ln.ref_page = p1.seqnc
                   and ap.seqnc = p1.ref_aplic) cible
          ,vd_afw_12_struc_aplic sa
          ,vd_afw_13_page        p
     where     cible.ref_prodt = sa.ref_prodt
           and cible.numr_apex = p.numr_apex
           and cible.numr_aplic_apex = p.app_id_formt
           and sa.seqnc = p.ref_struc_aplic;

    if vva_code is not null
    then
      return verfc_droit_acces (vva_code
                               ,true
                               ,null
                               ,null
                               ,null
                               ,null);
    else
      return true;
    end if;
  exception
    when others
    then
      return false;
  end verif_acces_liste_navgt;

  function verif_apart_group_non_conct (pva_group              in varchar2
                                       ,pva_utils              in varchar2
                                       ,pva_resdr_sous_group   in varchar2 default 'N')
    return boolean
  is
    vnu_presn   pls_integer;
  begin
    select count (1)
      into vnu_presn
      from vd_i_afw_12_utils            u
          ,vd_i_afw_12_group_utils      gu
          ,vd_i_afw_12_lien_group_utils lgu
     where     lgu.date_debut_efect <= sysdate
           and (   lgu.date_fin_efect >= sysdate
                or lgu.date_fin_efect is null)
           and lgu.ref_utils = u.seqnc
           and (   lgu.ref_domn = afw_12_domn_pkg.obten_domn_sesn
                or afw_12_domn_pkg.obten_domn_sesn is null) -- AJOUT_CONAL
           and lgu.ref_group = gu.seqnc
           and gu.code = pva_group
           and u.code_utils = upper (pva_utils)
           and rownum = 1;

    return vnu_presn = 1;
  end;

  function verif_admin_prodt
    return number
  is
    vva_group_admin   varchar2 (23);
  begin
    begin
      select gu.code
        into vva_group_admin
        from vd_afw_11_prodt       pr
            ,vd_afw_12_group_utils gu
       where     pr.seqnc = afw_11_prodt_pkg.obten_prodt_sesn ()
             and pr.ref_group_utils_admin = gu.seqnc;

      return verfr_presn_utils_group_numbr (vva_group_admin);
    exception
      when no_data_found
      then
        return 0;
    end;
  end verif_admin_prodt;

  function obten_opert_en_cours_verfc
    return varchar2
  is
  begin
    return gva_opert_en_cours_verfc;
  end obten_opert_en_cours_verfc;

  procedure defnr_opert_en_cours_verfc (pva_opert in varchar2)
  is
  begin
    gva_opert_en_cours_verfc   := pva_opert;
  end defnr_opert_en_cours_verfc;

  procedure defnr_code_utils (pva_code_utils in varchar2)
  is
  begin
    gva_code_utils_actue   := pva_code_utils;
  end defnr_code_utils;

  procedure defnr_code_domn (pva_code_domn in varchar2)
  is
  begin
    gva_code_domn_actue   := pva_code_domn;
  end defnr_code_domn;

  function obten_code_utils
    return varchar2
  is
  begin
    return gva_code_utils_actue;
  end obten_code_utils;

  function obten_code_domn
    return varchar2
  is
  begin
    return gva_code_domn_actue;
  end obten_code_domn;
end afw_12_secrt_pkg;
/
