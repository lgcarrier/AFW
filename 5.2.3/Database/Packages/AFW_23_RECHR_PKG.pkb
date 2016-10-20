SET DEFINE OFF;
create or replace package body afw_23_rechr_pkg
as
  type typ_rec_mot is record
  (
    mot         varchar2 (100)
   ,seqnc_mot   number (10)
  );

  type typ_tab_mot is table of typ_rec_mot
    index by pls_integer;

  type typ_rec_reslt_trouv is record
  (
    vnu_seqnc   number (10)
   ,vva_atrib   varchar2 (100)
  );

  type typ_tab_reslt is table of typ_rec_reslt_trouv
    index by pls_integer;

  procedure purgr_rechr (pnu_utils   in number default null
                        ,pnu_rechr   in number default null)
  is
  begin
    if pnu_utils is not null
    then
      if pnu_rechr is not null
      then
        delete from vd_afw_23_rechr cascade
              where     seqnc = pnu_rechr
                    and ref_utils = pnu_utils;
      --TODO: LAVVA corriger les autres traitements de la procédure
      --else
      --delete from vd_afw_23_rechr cascade
      -- where  ref_utils = pnu_utils;
      end if;
    --else
    --effacement de toutes les recherches
    --delete from vd_afw_23_rechr cascade;
    end if;
  end purgr_rechr;

  function obten_enonc_rechr (pnu_rechr in number)
    return varchar2
  is
    vva_enonc_rechr   varchar (30);

    cursor cur_enonc_rechr
    is
      select mot
            ,seqnc
        from vd_afw_23_enonc_rechr
       where ref_rechr = pnu_rechr;
  begin
    for rec_enonc_rechr in cur_enonc_rechr
    loop
      vva_enonc_rechr      :=
           vva_enonc_rechr
        || ' '
        || rec_enonc_rechr.mot
        || ' ';
    end loop;

    return vva_enonc_rechr;
  end obten_enonc_rechr;

  function calcl_pertn_ligne_rechr (pnu_rechr               in number
                                   ,pnu_seqnc_struc_aplic   in number)
    return number
  is
    vnu_pertn_calcl   number (5, 2);

    cursor cur_detl_reslt_rechr
    is
        select drr.dnr_pertn
          from vd_afw_23_detl_reslt_rechr drr
         where     drr.ref_rechr = pnu_rechr
               and drr.ref_seqnc_struc_aplic = pnu_seqnc_struc_aplic
      order by dnr_pertn desc;
  begin
    for rec_detl_reslt in cur_detl_reslt_rechr
    loop
      if vnu_pertn_calcl is null
      then
        vnu_pertn_calcl   := rec_detl_reslt.dnr_pertn;
      else
        if vnu_pertn_calcl = 100
        then
          exit;
        end if;

        --On utilise la plus grande pertinence, et on ajoute le prorata des pertinences trouves
        --des résultats subséquents selon le manque à gagner entre la pertinence actuelle et 100%
        vnu_pertn_calcl   := vnu_pertn_calcl + ( (rec_detl_reslt.dnr_pertn * (100 - vnu_pertn_calcl)) / 100);
      end if;
    end loop;

    return vnu_pertn_calcl;
  end calcl_pertn_ligne_rechr;

  procedure creer_ocurn_reslt_rechr (pnu_rechr in number)
  is
    vva_libl_struc_aplic        varchar2 (4000);
    vva_libl_struc_aplic_html   varchar2 (4000);
    vva_lien                    varchar2 (100);
    --vva_mot                     varchar2 (30);
    vva_surbr                   varchar2 (100) default 'style="background-color:yellow;"';
    vnu_struc                   number (10) default 0;
    vnu_numr_aplic_apex         number (10) default null;
    vnu_page_apex               number (10) default null;

    cursor cur_reslt_rechr
    is
        select rr.seqnc
              ,rr.dnr_ref_struc_aplic
              ,rr.ref_seqnc_struc_aplic
              ,rr.ref_aplic_modl_rechr
          from vd_afw_23_reslt_rechr rr
         where rr.ref_rechr = pnu_rechr
      order by dnr_ref_struc_aplic;

    vnu_seqnc_reslt             number (10);
    vnu_ref_struc_aplic         number (10);
    vnu_seqnc_struc_aplic       number (10);
    vnu_aplic_modl_rechr        number (10);
    vnu_decmp                   number (4);
    vnu_pertn                   number (5, 2);
    vnu_atrib                   number (10);
  begin
    insert into vd_afw_23_reslt_rechr (ref_seqnc_struc_aplic
                                      ,ref_aplic_modl_rechr
                                      ,dnr_ref_struc_aplic
                                      ,ref_rechr)
      select distinct drr.ref_seqnc_struc_aplic
                     ,damr.ref_aplic_modl_rechr
                     ,amr.ref_struc_aplic_rechr
                     ,pnu_rechr
        from vd_afw_23_detl_reslt_rechr   drr
            ,vd_afw_23_detl_aplic_modl_re damr
            ,vd_afw_23_aplic_modl_rechr   amr
       where     drr.ref_rechr = pnu_rechr
             and damr.seqnc = drr.ref_detl_aplic_modl_rechr
             and amr.seqnc = damr.ref_aplic_modl_rechr;


    open cur_reslt_rechr;

    loop
      fetch cur_reslt_rechr
        into vnu_seqnc_reslt
            ,vnu_ref_struc_aplic
            ,vnu_seqnc_struc_aplic
            ,vnu_aplic_modl_rechr;

      exit when cur_reslt_rechr%notfound;


      vnu_pertn                   :=
        calcl_pertn_ligne_rechr (pnu_rechr
                                ,vnu_seqnc_struc_aplic);



      select amr.ref_atrib_struc_aplic_afich
        into vnu_atrib
        from vd_afw_23_aplic_modl_rechr amr
       where amr.seqnc = vnu_aplic_modl_rechr;

      vva_lien                    :=
        afw_12_struc_aplic_pkg.obten_url_acces (pnu_seqnc_struc   => vnu_ref_struc_aplic
                                               ,pnu_sspc          => vnu_seqnc_struc_aplic
                                               ,pva_valr_sess     => '&SESSION.'
                                               ,pva_valr_sidf     => '#SIDF#');

      vva_libl_struc_aplic        :=
        afw_12_struc_aplic_cu_pkg.obten_valr_atrib_formt (vnu_atrib
                                                         ,vnu_seqnc_struc_aplic);
      --TODO: LAVVA: Surbrillance
      /* if vva_libl_struc_aplic_html is null then
                          vva_libl_struc_aplic_html :=
          replace (vva_libl_struc_aplic,
                   vva_mot,
                   '<span ' || vva_surbr || '>' || vva_mot || '</span>');
      else
        vva_libl_struc_aplic_html :=
          replace (vva_libl_struc_aplic_html,
                   vva_mot,
                   '<span ' || vva_surbr || '>' || vva_mot || '</span>');
      end if;*/
      vva_libl_struc_aplic_html   := vva_libl_struc_aplic;

      select count (rr.seqnc)
        into vnu_decmp
        from vd_afw_23_reslt_rechr rr
       where     rr.ref_rechr = pnu_rechr
             and rr.dnr_ref_struc_aplic = vnu_ref_struc_aplic;

      --Update des dnr des résultats
      update vd_afw_23_reslt_rechr rr
         set rr.dnr_decmp_reslt             = vnu_decmp
            ,rr.dnr_libl_struc_aplic        = vva_libl_struc_aplic
            ,rr.dnr_libl_struc_aplic_html   = vva_libl_struc_aplic_html
            ,rr.dnr_lien                    = vva_lien
            ,rr.dnr_pertn                   = vnu_pertn
       where     rr.ref_rechr = pnu_rechr
             and rr.dnr_ref_struc_aplic = vnu_ref_struc_aplic
             and rr.ref_seqnc_struc_aplic = vnu_seqnc_struc_aplic;

      --Update ref_reslt_rechr
      update vd_afw_23_detl_reslt_rechr drr
         set drr.ref_reslt_rechr   = vnu_seqnc_reslt
       where     drr.ref_rechr = pnu_rechr
             and drr.ref_seqnc_struc_aplic = vnu_seqnc_struc_aplic;
    end loop;

    close cur_reslt_rechr;
  end creer_ocurn_reslt_rechr;

  function est_date (pda_date in varchar)
    return date
  is
  begin
    return to_date (pda_date
                   ,'YYYY-MM-DD');
  exception
    when others
    then
      return null;
  end est_date;

  function est_nombr (pva_nombr in varchar2)
    return number
  is
  begin
    return to_char (pva_nombr
                   ,'9999999');
  exception
    when others
    then
      return null;
  end est_nombr;

  function rechr_mot (pnu_rechr                   in number
                     ,pnu_detl_aplic_modl_rechr   in number
                     ,pnu_enonc_rechr             in number
                     ,pnu_nombr_max_reslt            number)
    return number
  is
    vva_nom_atrib         varchar2 (30);
    vva_opert             varchar2 (10);
    vva_code              varchar2 (30);
    vva_enonc_gauch       varchar2 (200);
    vva_enonc_droit       varchar2 (200);
    vva_nom_struc_acces   varchar2 (30);
    vva_mot               varchar2 (100);
    vnu_pertn             number (3);
    vva_sql               varchar2 (32767);
    vnu_nombr_restl       pls_integer;
  begin
    select pr.opert
          ,pr.code
          ,pr.enonc_plsql_gauch
          ,pr.enonc_plsql_droit
          ,asa.nom_coln
          ,sa.nom_struc_acces_don
          ,damr.pertn
      into vva_opert
          ,vva_code
          ,vva_enonc_gauch
          ,vva_enonc_droit
          ,vva_nom_atrib
          ,vva_nom_struc_acces
          ,vnu_pertn
      from vd_afw_23_patrn_rechr        pr
          ,vd_afw_23_detl_aplic_modl_re damr
          ,vd_afw_12_atrib_struc_aplic  asa
          ,vd_afw_12_struc_aplic        sa
     where     pr.seqnc = damr.ref_patrn_rechr
           and damr.seqnc = pnu_detl_aplic_modl_rechr
           and damr.ref_atrib_struc_aplic = asa.seqnc
           and asa.ref_struc_aplic = sa.seqnc;

    --Obtenir le mot
    select mot
      into vva_mot
      from vd_afw_23_enonc_rechr en
     where en.seqnc = pnu_enonc_rechr;

    vva_sql           := 'insert into vd_afw_23_detl_reslt_rechr(ref_rechr,ref_enonc_rechr,ref_detl_aplic_modl_rechr, ref_seqnc_struc_aplic) ';
    vva_sql           :=
         vva_sql
      || 'select :pnu_rechr, :pnu_enonc_rechr, :pnu_detl_aplic_modl_rechr, sa.seqnc ';
    vva_sql           :=
         vva_sql
      || ' from '
      || vva_nom_struc_acces
      || ' sa ';

    --Batir le filtre de recherche gauche (la référence à la colonne recherchée)
    vva_sql           :=
         vva_sql
      || 'where '
      || replace (vva_enonc_gauch
                 ,'#-VG-#'
                 ,   'sa.'
                  || vva_nom_atrib)
      || ' ';

    --Batir le filtre de recherche droit (la référence au mot saisi)
    vva_sql           :=
         vva_sql
      || vva_opert
      || ' '
      || replace (vva_enonc_droit
                 ,'#-VD-#'
                 ,':vva_mot')
      || ' ';

    --Batir la non existence dans la table de résultats
    vva_sql           :=
         vva_sql
      || 'and not exists(select 1 from vd_afw_23_detl_reslt_rechr drr where  drr.ref_rechr = :pnu_rechr and ';
    vva_sql           :=
         vva_sql
      || 'drr.ref_detl_aplic_modl_rechr = :pnu_detl_aplic_modl_rechr and drr.ref_enonc_rechr = :pnu_enonc_rechr and drr.ref_seqnc_struc_aplic = sa.seqnc) ';

    --Batir le nombre maximal de rangées trouvées
    vva_sql           :=
         vva_sql
      || 'and rownum <= :pnu_nombr_max_reslt ';

    --Exécuter la recherche
    if    (    vva_code = 'NOMBR'
           and est_nombr (vva_mot) is not null)
       or (    vva_nom_struc_acces = 'VD_TELPH'
           and est_nombr (vva_mot) is not null)
       or (    vva_code = 'DATE'
           and est_date (vva_mot) is not null)
       or     vva_code not in ('NOMBR'
                              ,'DATE')
          and vva_nom_struc_acces != 'VD_TELPH'
    then
      execute immediate vva_sql
        using pnu_rechr
             ,pnu_enonc_rechr
             ,pnu_detl_aplic_modl_rechr
             ,vva_mot
             ,pnu_rechr
             ,pnu_detl_aplic_modl_rechr
             ,pnu_enonc_rechr
             ,pnu_nombr_max_reslt;
    end if;

    --update du dnr_pertn
    update vd_afw_23_detl_reslt_rechr
       set dnr_pertn   = vnu_pertn
     where     ref_rechr = pnu_rechr
           and ref_detl_aplic_modl_rechr = pnu_detl_aplic_modl_rechr
           and ref_enonc_rechr = pnu_enonc_rechr;

    vnu_nombr_restl   := sql%rowcount;

    return vnu_nombr_restl;
  end rechr_mot;

  procedure exect_rechr (pva_valr_rechr   in varchar2
                        ,pnu_modl         in number default 25820)
  is
    vta_mot           typ_tab_mot;
    vnu_utils         number (10);
    vda_date_jour     date;
    vnu_seqnc_rechr   number (10);
    vnu_modl_rechr    number (10) default pnu_modl;
    vnu_nombr_mot     number (2);
    vnu_reslt_trouv   number (10);
    vnu_postn         number (3);
    vva_valr_rechr    varchar2 (1000);
    vnu_aplic         number (10);
    vva_schem_rechr   varchar2 (10);
    vva_schem_courn   varchar2 (10);

    --Curseur des détails d'aplication du modèle de recherche
    cursor cur_detl_aplic_modl (pnu_aplic_modl_rechr in number)
    is
        select damr.seqnc
              ,damr.ref_aplic_modl_rechr
              ,damr.ref_atrib_struc_aplic
              ,damr.ref_patrn_rechr
              ,damr.ordre_exect
              ,damr.pertn
          from vd_afw_23_detl_aplic_modl_re damr
         where damr.ref_aplic_modl_rechr = pnu_aplic_modl_rechr
      order by damr.pertn desc;

    --Curseur des application du modèle de recherche
    cursor cur_aplic_modl
    is
      select amd.seqnc
            ,amd.ref_modl_rechr
            ,amd.ref_struc_aplic_rechr
            ,amd.nombr_maxim_reslt
        from vd_afw_23_aplic_modl_rechr amd
       where amd.ref_modl_rechr = pnu_modl;
  begin
    --Enlever les espaces à la fin de l'énoncé afin de s'assurer que celui-ci ne soit pas seulement des espaces
    vva_valr_rechr   := trim (pva_valr_rechr);

    if vva_valr_rechr is not null
    then
      vnu_utils       := afw_12_utils_pkg.obten_usagr_conct;
      vda_date_jour   := sysdate;

      insert into vd_afw_23_rechr (ref_utils
                                  ,date_exect
                                  ,ref_modl_rechr)
           values (vnu_utils
                  ,vda_date_jour
                  ,vnu_modl_rechr)
        returning seqnc
             into vnu_seqnc_rechr;

      vnu_nombr_mot   := 0;

      while vva_valr_rechr is not null
      loop
        vnu_postn       :=
          instr (vva_valr_rechr
                ,' ');

        --Gérer le cas d'un seul mot restant (donc pas d'espace)
        if     length (vva_valr_rechr) > 0
           and vnu_postn = 0
        then
          vnu_postn   := length (vva_valr_rechr) + 1;
        end if;

        vnu_nombr_mot   := vnu_nombr_mot + 1;

        vta_mot (vnu_nombr_mot).mot      :=
          substr (vva_valr_rechr
                 ,1
                 ,vnu_postn - 1);

        -- Creer l'occurence enonc_rechr
        insert into vd_afw_23_enonc_rechr (ref_rechr
                                          ,mot
                                          ,ordre_apart)
             values (vnu_seqnc_rechr
                    ,vta_mot (vnu_nombr_mot).mot
                    ,vnu_nombr_mot)
          returning seqnc
               into vta_mot (vnu_nombr_mot).seqnc_mot;

        vva_valr_rechr      :=
          trim (substr (vva_valr_rechr
                       ,vnu_postn + 1));
      end loop;

      --S'assurer qu'il y ai un mot
      if vta_mot.count > 0
      then
        for i in vta_mot.first () .. vta_mot.last ()
        loop
          for rec_aplic_modl in cur_aplic_modl
          loop
            vnu_reslt_trouv   := 0;

            for rec_detl_aplic in cur_detl_aplic_modl (rec_aplic_modl.seqnc)
            loop
              select pg.ref_aplic
                into vnu_aplic
                from vd_afw_13_page        pg
                    ,vd_afw_12_struc_aplic sa
               where     sa.seqnc = rec_aplic_modl.ref_struc_aplic_rechr
                     and pg.seqnc = sa.ref_page_liste
                     and rownum = 1;

              --Obtenir le schema de la recherche
              vva_schem_rechr   := afw_11_aplic_pkg.obten_schem (vnu_aplic);

              execute immediate
                   'alter session set current_schema = '
                || vva_schem_rechr;

              if vnu_reslt_trouv < rec_aplic_modl.nombr_maxim_reslt
              then
                --Effectuer la recherche
                vnu_reslt_trouv      :=
                    vnu_reslt_trouv
                  + rechr_mot (vnu_seqnc_rechr
                              ,rec_detl_aplic.seqnc
                              ,vta_mot (i).seqnc_mot
                              ,rec_aplic_modl.nombr_maxim_reslt - vnu_reslt_trouv);
              else
                --Arrêter la recherche si le nombre de résultat trouvé atteind le nombre maximum de résultat
                exit;
              end if;
            end loop;
          end loop;
        end loop;

        creer_ocurn_reslt_rechr (vnu_seqnc_rechr);
        --Remmettre le schema actif de la session
        vva_schem_courn   := afw_11_aplic_pkg.obten_schem (afw_11_aplic_pkg.obten_aplic_sesn);

        execute immediate
             'alter session set current_schema = '
          || vva_schem_courn;
      end if;
    end if;
  exception
    when others
    then
      raise;
  end exect_rechr;

  procedure exect_rechr_apex (pva_valr_rechr in varchar2)
  is
    vnu_modl_rechr   number (10);
    vnu_seqnc_domn   number (10);
  --vnu_systm number(10);

  begin
    vnu_seqnc_domn   := afw_12_domn_pkg.obten_domn_sesn;

    select seqnc
      into vnu_modl_rechr
      from vd_afw_23_modl_rechr
     where     ref_domn = vnu_seqnc_domn
           and code like '%DEFT';

    if vnu_modl_rechr is not null
    then
      --Lancer la recherche
      exect_rechr (pva_valr_rechr
                  ,vnu_modl_rechr);
    end if;
  end exect_rechr_apex;

  function obten_enonc_rechr_formt (pnu_rechr in number)
    return varchar2
  is
    vva_mot_courn   varchar2 (30);
    vva_mot_retr    varchar2 (200);

    cursor cur_mot
    is
      select mot
        from vd_i_afw_23_enonc_rechr er
       where er.ref_rechr = pnu_rechr;
  begin
    open cur_mot;

    fetch cur_mot
      into vva_mot_courn;

    while cur_mot%found
    loop
      if vva_mot_retr is null
      then
        vva_mot_retr      :=
             '"'
          || vva_mot_courn
          || '"';
      else
        vva_mot_retr      :=
             vva_mot_retr
          || ', "'
          || vva_mot_courn
          || '"';
      end if;

      fetch cur_mot
        into vva_mot_courn;
    end loop;

    close cur_mot;

    return vva_mot_retr;
  end obten_enonc_rechr_formt;

  function obten_prodt_rechr (pnu_rechr in number)
    return number
  is
    vnu_prodt   number (10);
  begin
    select mr.ref_prodt
      into vnu_prodt
      from vd_afw_23_rechr      r
          ,vd_afw_23_modl_rechr mr
     where     r.seqnc = pnu_rechr
           and mr.seqnc = r.ref_modl_rechr
           and rownum = 1;

    return vnu_prodt;
  exception
    when no_data_found
    then
      return null;
  end;

  function obten_lien_formt (pva_lien_non_formt in varchar2)
    return varchar2
  is
  begin
    return afw_07_util_pkg.multi_replc (pva_lien_non_formt
                                       ,'&SESSION.'
                                       ,afw_08_url_pkg.knu_sesn
                                       ,'#SIDF#'
                                       ,afw_08_url_pkg.knu_sidf);
  end obten_lien_formt;

  procedure ajout_modl_rechr_domn (pnu_modl_rechr_sourc   in vd_afw_23_modl_rechr.seqnc%type
                                  ,pnu_domn_cible         in vd_afw_12_domn.seqnc%type)
  is
    cursor cur_aplic_modl_rechr
    is
      select seqnc
            ,ref_modl_rechr
            ,ref_struc_aplic_rechr
            ,ref_struc_aplic_lien
            ,nombr_maxim_reslt
            ,ref_atrib_struc_aplic_afich
        from vd_afw_23_aplic_modl_rechr amr
       where amr.ref_modl_rechr = pnu_modl_rechr_sourc;

    cursor cur_detl_amr (pnu_amr in number)
    is
      select seqnc
            ,ref_aplic_modl_rechr
            ,ref_atrib_struc_aplic
            ,ref_patrn_rechr
            ,ordre_exect
            ,pertn
        from vd_afw_23_detl_aplic_modl_re damr
       where damr.ref_aplic_modl_rechr = pnu_amr;

    vnu_seqnc         vd_afw_23_modl_rechr.seqnc%type;
    vnu_seqnc_aplic   vd_afw_23_aplic_modl_rechr.seqnc%type;
  begin
    vnu_seqnc   := afw_23_modl_rechr_seq.nextval;

    insert into vd_afw_23_modl_rechr (seqnc
                                     ,code
                                     ,ref_domn
                                     ,nom
                                     ,descr
                                     ,ref_prodt
                                     ,dnr_ref_prodt)
      select vnu_seqnc
            ,code
            ,pnu_domn_cible
            ,nom
            ,descr
            ,ref_prodt
            ,dnr_ref_prodt
        from vd_afw_23_modl_rechr
       where seqnc = pnu_modl_rechr_sourc;

    for rec_amr in cur_aplic_modl_rechr
    loop
      vnu_seqnc_aplic   := afw_23_aplic_modl_rechr_seq.nextval;

      insert into vd_afw_23_aplic_modl_rechr (seqnc
                                             ,ref_modl_rechr
                                             ,ref_struc_aplic_rechr
                                             ,ref_struc_aplic_lien
                                             ,nombr_maxim_reslt
                                             ,ref_atrib_struc_aplic_afich)
        select vnu_seqnc_aplic
              ,vnu_seqnc
              ,ref_struc_aplic_rechr
              ,ref_struc_aplic_lien
              ,nombr_maxim_reslt
              ,ref_atrib_struc_aplic_afich
          from vd_afw_23_aplic_modl_rechr
         where seqnc = rec_amr.seqnc;

      for rec_damr in cur_detl_amr (rec_amr.seqnc)
      loop
        insert into vd_afw_23_detl_aplic_modl_re (ref_aplic_modl_rechr
                                                 ,ref_atrib_struc_aplic
                                                 ,ref_patrn_rechr
                                                 ,ordre_exect
                                                 ,pertn)
          select vnu_seqnc_aplic
                ,ref_atrib_struc_aplic
                ,ref_patrn_rechr
                ,ordre_exect
                ,pertn
            from vd_afw_23_detl_aplic_modl_re
           where seqnc = rec_damr.seqnc;
      end loop;
    end loop;
  end ajout_modl_rechr_domn;
end afw_23_rechr_pkg;
/
