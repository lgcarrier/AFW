SET DEFINE OFF;
create or replace package body afw_01_err_apex_pkg
is
  gnu_versn_orcl   number (3) default 102;

  /*
  Obtenir une erreur, toujours en ordre, selon la présence d'un occurence par :
  1- Page, table/colonne/contrainte et erreur, par application;
  2- Page et erreur, par application
  3- Page, par application
  4- Table/colonne/contrainte et erreur, par application
  5- Erreur, par application
  6- Table/colonne/contrainte et erreur
  7- Erreur
  8- Générique à l'application
  9- Générique
  */
  cursor cur_1 (pnu_err_code    in number
               ,pva_contr_err   in varchar2
               ,pnu_page        in number
               ,pva_table       in varchar2 default null
               ,pva_coln        in varchar2 default null
               ,pnu_versn       in number default afw_07_util_pkg.obten_versn_sesn
               ,pnu_prodt       in number default afw_11_prodt_pkg.obten_prodt_sesn)
  is
    select mel.ref_numr_mesg
          ,mel.seqnc
      from afw_01_code_err_oracl  ceo
          ,vd_afw_01_mesg_err_lie mel
     where     mel.ref_code_err_oracl = ceo.seqnc
           and ceo.err_code = pnu_err_code
           and (   mel.nom_contr = pva_contr_err
                or pva_contr_err is null)
           and (   mel.nom_table = pva_table
                or pva_table is null)
           and (   mel.nom_coln = pva_coln
                or pva_coln is null)
           and mel.page = pnu_page
           and mel.ref_prodt = pnu_prodt
           and mel.type_liais = 1;

  cursor cur_2 (pnu_err_code   in number
               ,pnu_page       in number
               ,pnu_versn      in number default afw_07_util_pkg.obten_versn_sesn
               ,pnu_prodt      in number default afw_11_prodt_pkg.obten_prodt_sesn)
  is
    select mel.ref_numr_mesg
          ,mel.seqnc
      from afw_01_code_err_oracl  ceo
          ,vd_afw_01_mesg_err_lie mel
     where     mel.ref_code_err_oracl = ceo.seqnc
           and ceo.err_code = pnu_err_code
           and mel.page = pnu_page
           and mel.ref_prodt = pnu_prodt
           and mel.type_liais = 2;

  cursor cur_3 (pnu_page    in number
               ,pnu_prodt   in number default afw_11_prodt_pkg.obten_prodt_sesn)
  is
    select mel.ref_numr_mesg
          ,mel.seqnc
      from vd_afw_01_mesg_err_lie mel
     where     mel.page = pnu_page
           and mel.ref_prodt = pnu_prodt
           and mel.type_liais = 3;

  cursor cur_4 (pnu_err_code    in number
               ,pva_contr_err   in varchar2
               ,pva_table       in varchar2 default null
               ,pva_coln        in varchar2 default null
               ,pnu_versn       in number default afw_07_util_pkg.obten_versn_sesn
               ,pnu_prodt       in number default afw_11_prodt_pkg.obten_prodt_sesn)
  is
    select mel.ref_numr_mesg
          ,mel.seqnc
      from afw_01_code_err_oracl  ceo
          ,vd_afw_01_mesg_err_lie mel
     where     mel.ref_code_err_oracl = ceo.seqnc
           and ceo.err_code = pnu_err_code
           and (   mel.nom_contr = pva_contr_err
                or pva_contr_err is null)
           and (   mel.nom_table = pva_table
                or pva_table is null)
           and (   mel.nom_coln = pva_coln
                or pva_coln is null)
           and mel.ref_prodt = pnu_prodt
           and mel.type_liais = 4;

  cursor cur_5 (pnu_err_code   in number
               ,pnu_versn      in number default afw_07_util_pkg.obten_versn_sesn
               ,pnu_prodt      in number default afw_11_prodt_pkg.obten_prodt_sesn)
  is
    select mel.ref_numr_mesg
          ,mel.seqnc
      from afw_01_code_err_oracl  ceo
          ,vd_afw_01_mesg_err_lie mel
     where     mel.ref_code_err_oracl = ceo.seqnc
           and ceo.err_code = pnu_err_code
           and mel.ref_prodt = pnu_prodt
           and mel.type_liais = 5;

  cursor cur_6 (pnu_err_code    in number
               ,pva_contr_err   in varchar2
               ,pva_table       in varchar2 default null
               ,pva_coln        in varchar2 default null
               ,pnu_versn       in number default afw_07_util_pkg.obten_versn_sesn)
  is
    select mel.ref_numr_mesg
          ,mel.seqnc
      from afw_01_code_err_oracl  ceo
          ,vd_afw_01_mesg_err_lie mel
     where     mel.ref_code_err_oracl = ceo.seqnc
           and ceo.err_code = pnu_err_code
           and (   mel.nom_contr = pva_contr_err
                or pva_contr_err is null)
           and (   mel.nom_table = pva_table
                or pva_table is null)
           and (   mel.nom_coln = pva_coln
                or pva_coln is null)
           and mel.type_liais = 6;

  cursor cur_7 (pnu_err_code   in number
               ,pnu_versn      in number default afw_07_util_pkg.obten_versn_sesn)
  is
    select mel.ref_numr_mesg
          ,mel.seqnc
      from afw_01_code_err_oracl  ceo
          ,vd_afw_01_mesg_err_lie mel
     where     mel.ref_code_err_oracl = ceo.seqnc
           and ceo.err_code = pnu_err_code
           and mel.nom_contr is null
           and mel.nom_table is null
           and mel.nom_coln is null
           and mel.type_liais = 7;

  cursor cur_8 (pnu_prodt in number default afw_11_prodt_pkg.obten_prodt_sesn)
  is
    select mel.ref_numr_mesg
          ,mel.seqnc
      from vd_afw_01_mesg_err_lie mel
     where     mel.nom_contr is null
           and mel.ref_code_err_oracl is null
           and mel.nom_table is null
           and mel.nom_coln is null
           and mel.ref_prodt = pnu_prodt
           and mel.type_liais = 8;

  cursor cur_9
  is
    select mel.ref_numr_mesg
          ,mel.seqnc
      from vd_afw_01_mesg_err_lie mel
     where     mel.nom_contr is null
           and mel.page is null
           and mel.ref_code_err_oracl is null
           and mel.nom_table is null
           and mel.nom_coln is null
           and mel.type_liais = 9;

  function trait_page (pnu_page_id in number default null)
    return boolean
  is
    vnu_page_id       number default nvl (pnu_page_id, afw_07_util_pkg.nv ('APP_PAGE_ID'));
    vva_indic_trait   varchar2 (1);
  begin
    begin
      select aap.indic_prise_charg_afw01
        into vva_indic_trait
        from vd_afw_13_page  aap
            ,vd_afw_11_aplic a
       where     aap.ref_aplic = a.seqnc
             and a.seqnc = afw_11_aplic_pkg.obten_aplic_sesn ()
             and aap.numr_apex = vnu_page_id;

      if vva_indic_trait = 'N'
      then
        return false;
      else
        return true;
      end if;
    exception
      when no_data_found
      then
        return true;
    end;
  end trait_page;

  function obten_text_mesg (pva_numr_mesg_err   in varchar2
                           ,pnu_cas_cursr       in number
                           ,pnu_seqnc_mel       in number
                           ,pva_nom_contr       in varchar2
                           ,pva_nom_table       in varchar2
                           ,pva_nom_coln        in varchar2)
    return varchar2
  is
    vva_info_mesg_en_err   varchar2 (100) default null;
    vbo_afich_err_code     boolean default obten_afich_err_code;
  begin
    if vbo_afich_err_code
    then
      vva_info_mesg_en_err      :=
           pva_numr_mesg_err
        || '('
        || pnu_cas_cursr
        || ') : ';
    end if;

    return    vva_info_mesg_en_err
           || afw_01_gestn_mesg_pkg.obten_mesg_par_numr (pva_numr_mesg_err
                                                        ,null
                                                        ,pva_nom_contr
                                                        ,pva_nom_table
                                                        ,pva_nom_coln);
  end obten_text_mesg;

  procedure tratr_mesg (pva_mesg    in out varchar2
                       ,pnu_longr      out number)
  is
    vnu_debut_ora    pls_integer default 1;
    vva_mesg_final   varchar2 (32767);
    vnu_debut_temp   pls_integer;
    vnu_fin_temp     pls_integer;
    --variables pour les curseurs
    vva_contr_err    varchar2 (30);
    vnu_err_oracle   number (5);
    vva_nom_table    varchar2 (30);
    vva_nom_col      varchar2 (30);
    vnu_page         number default nv ('APP_PAGE_ID');
    vnu_cas_err      pls_integer;
    vva_info_suplm   varchar2 (500);
    vva_numr_err     afw_01_mesg.numr_mesg%type;
    vnu_seqnc_mel    afw_01_mesg_err_lie.seqnc%type;
  begin
    -- Restaurer les guillemets qui peuvent avoir été échappés
    pva_mesg      :=
      replace (pva_mesg
              ,'&quot;'
              ,'"');
    --trouver l'erreur en cours
    vnu_debut_ora      :=
        instr (pva_mesg
              ,'ORA-')
      + 4;

    if vnu_debut_ora = 4
    then
      --Vérifier si erreur de checksum
      if instr (pva_mesg
               ,'index_i') > 0
      then
        pva_mesg      :=
          afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000102'
                                                    ,'AFW');
      else
        return;
      end if;
    else
      vnu_err_oracle      :=
        to_number (substr (pva_mesg
                          ,vnu_debut_ora
                          ,5));
    end if;

    if vnu_err_oracle in (20001
                         ,20505
                         ,20876)
    then
      --Erreur Apex, chercher plus loin
      vnu_debut_ora      :=
          instr (pva_mesg
                ,'ORA-'
                ,vnu_debut_ora + 1)
        + 4;
      vnu_err_oracle      :=
        to_number (substr (pva_mesg
                          ,vnu_debut_ora
                          ,5));
    end if;

    --Gérer l'erreur
    case
      when vnu_err_oracle = 1
      then
        --ORA-00001: violation de contrainte unique (PWS_UTIL.PWS_CODE_ERREUR_ORACLE_PK)
        --trouver le nom de la contrainte, entre le . et la )
        vnu_debut_temp      :=
            instr (pva_mesg
                  ,'.'
                  ,vnu_debut_ora)
          + 1;
        vnu_fin_temp      :=
          instr (pva_mesg
                ,')'
                ,vnu_debut_ora);
        vva_contr_err      :=
          substr (pva_mesg
                 ,vnu_debut_temp
                 ,vnu_fin_temp - vnu_debut_temp);
      when vnu_err_oracle = 1400
      then
        --ORA-01400: impossible d'insérer NULL dans ("PWS_UTIL"."TEST_ERR"."UN")
        --On a besoin du nom de la table et du nom de la colonne
        vnu_debut_temp      :=
            instr (pva_mesg
                  ,'.'
                  ,vnu_debut_ora + 1)
          + 2;
        vnu_fin_temp      :=
            instr (pva_mesg
                  ,'.'
                  ,vnu_debut_temp)
          - 2;
        vva_nom_table      :=
          substr (pva_mesg
                 ,vnu_debut_temp
                 ,vnu_fin_temp - vnu_debut_temp + 1);
        vnu_debut_temp   := vnu_fin_temp + 4;
        vnu_fin_temp      :=
            instr (pva_mesg
                  ,')'
                  ,vnu_debut_temp)
          - 2;
        vva_nom_col      :=
          substr (pva_mesg
                 ,vnu_debut_temp
                 ,vnu_fin_temp - vnu_debut_temp + 1);
      when vnu_err_oracle = 1407
      then
        --ORA-01407: impossible de mettre à jour ("PWS_UTIL"."TEST_ERR"."DEUX") avec NULL
        vnu_debut_temp      :=
            instr (pva_mesg
                  ,'.'
                  ,vnu_debut_ora + 1)
          + 2;
        vnu_fin_temp      :=
            instr (pva_mesg
                  ,'.'
                  ,vnu_debut_temp)
          - 2;
        vva_nom_table      :=
          substr (pva_mesg
                 ,vnu_debut_temp
                 ,vnu_fin_temp - vnu_debut_temp + 1);
        vnu_debut_temp   := vnu_fin_temp + 4;
        vnu_fin_temp      :=
            instr (pva_mesg
                  ,')'
                  ,vnu_debut_temp)
          - 2;
        vva_nom_col      :=
          substr (pva_mesg
                 ,vnu_debut_temp
                 ,vnu_fin_temp - vnu_debut_temp + 1);
      when vnu_err_oracle = 2291
      then
        --ORA-02291: violation de contrainte d'intégrité (PWS_UTIL.TEST_ERR_ENF_FK) - clé parent introuvable
        vnu_debut_temp      :=
            instr (pva_mesg
                  ,'.'
                  ,vnu_debut_ora)
          + 1;
        vnu_fin_temp      :=
          instr (pva_mesg
                ,')'
                ,vnu_debut_ora);
        vva_contr_err      :=
          substr (pva_mesg
                 ,vnu_debut_temp
                 ,vnu_fin_temp - vnu_debut_temp);
      when vnu_err_oracle = 2292
      then
        --ORA-02292: violation de contrainte (PWS_UTIL.TEST_ERR_ENF_FK) d'intégrité - enregistrement fils existant
        vnu_debut_temp      :=
            instr (pva_mesg
                  ,'.'
                  ,vnu_debut_ora)
          + 1;
        vnu_fin_temp      :=
          instr (pva_mesg
                ,')'
                ,vnu_debut_ora);
        vva_contr_err      :=
          substr (pva_mesg
                 ,vnu_debut_temp
                 ,vnu_fin_temp - vnu_debut_temp);
      when vnu_err_oracle = 2290
      then
        --ORA-02290: violation de contraintes (PWS_UTIL.TEST_CK) de vérification
        vnu_debut_temp      :=
            instr (pva_mesg
                  ,'.'
                  ,vnu_debut_ora)
          + 1;
        vnu_fin_temp      :=
          instr (pva_mesg
                ,')'
                ,vnu_debut_ora);
        vva_contr_err      :=
          substr (pva_mesg
                 ,vnu_debut_temp
                 ,vnu_fin_temp - vnu_debut_temp);
      when vnu_err_oracle = 20507
      then
        --ORA-20507: Invalid numeric value #:# for column COLUMN_NAME
        vva_nom_col      :=
          upper (substr (pva_mesg
                        ,  instr (pva_mesg
                                 ,' '
                                 ,-1
                                 ,1)
                         + 1));
      when vnu_err_oracle in (1438
                             ,1861
                             ,1841
                             ,12899)
      then
        --ORA-01438: valeur incohérente avec la précision indiquée pour cette colonne
        --ORA-12899: valeur trop grande pour la colonne "PWS_UTIL"."TEST_ERR"."UN" (réelle : 201, maximum : 200)
        null;
      when vnu_err_oracle = 20503
      then
        --MESSAGE= Les données ont été modifiées par un autre utilisateur. Veuillez les rafraîchir en appuyant sur la touche "F5".
        pva_mesg      :=
          afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000102'
                                                    ,'AFW');
      when vnu_err_oracle in (20998
                             ,20999)
      then
        --20998 Levé par LEVER_ERR_APEX_CODE et le message contient code :: message.
        vnu_fin_temp      :=
            instr (pva_mesg
                  ,'ORA-06512'
                  ,vnu_debut_ora + 1)
          - 1;

        if vnu_fin_temp > 0
        then
          pva_mesg      :=
            substr (pva_mesg
                   ,vnu_debut_ora + 7
                   ,vnu_fin_temp - vnu_debut_ora - 6);
        else
          pva_mesg      :=
            substr (pva_mesg
                   ,vnu_debut_ora + 7);
        end if;
      when vnu_err_oracle between 20000 and 20997
      then
        --trouver la fin avec ORA-06512
        vnu_fin_temp      :=
            instr (pva_mesg
                  ,'ORA-06512'
                  ,vnu_debut_ora + 1)
          - 1;
        pva_mesg      :=
          substr (pva_mesg
                 ,vnu_debut_ora + 7
                 ,vnu_fin_temp - vnu_debut_ora - 6);
      when vnu_err_oracle = 6550
      then
        null;
      when vnu_err_oracle is not null
      then
        --trouver la fin avec ORA-06512
        vnu_fin_temp      :=
            instr (pva_mesg
                  ,'ORA-06512'
                  ,vnu_debut_ora + 1)
          - 1;
        pva_mesg      :=
          substr (pva_mesg
                 ,vnu_debut_ora + 7
                 ,vnu_fin_temp - vnu_debut_ora - 6);
      else
        null;
    end case;

    if vnu_err_oracle is not null
    then
      if    vnu_err_oracle not between 20000 and 20999
         or vnu_err_oracle = 20507
      then
        vnu_cas_err   := 1;

        open cur_1 (vnu_err_oracle
                   ,vva_contr_err
                   ,vnu_page
                   ,vva_nom_table
                   ,vva_nom_col);

        fetch cur_1
          into vva_numr_err
              ,vnu_seqnc_mel;

        close cur_1;

        if vva_numr_err is null
        then
          vnu_cas_err   := 2;

          open cur_2 (vnu_err_oracle
                     ,vnu_page);

          fetch cur_2
            into vva_numr_err
                ,vnu_seqnc_mel;

          close cur_2;
        end if;

        if vva_numr_err is null
        then
          vnu_cas_err   := 3;

          open cur_3 (vnu_page);

          fetch cur_3
            into vva_numr_err
                ,vnu_seqnc_mel;

          close cur_3;
        end if;

        if vva_numr_err is null
        then
          vnu_cas_err   := 4;

          open cur_4 (vnu_err_oracle
                     ,vva_contr_err
                     ,vva_nom_table
                     ,vva_nom_col);

          fetch cur_4
            into vva_numr_err
                ,vnu_seqnc_mel;

          close cur_4;
        end if;

        if vva_numr_err is null
        then
          vnu_cas_err   := 5;

          open cur_5 (vnu_err_oracle);

          fetch cur_5
            into vva_numr_err
                ,vnu_seqnc_mel;

          close cur_5;
        end if;

        if vva_numr_err is null
        then
          vnu_cas_err   := 6;

          open cur_6 (vnu_err_oracle
                     ,vva_contr_err
                     ,vva_nom_table
                     ,vva_nom_col);

          fetch cur_6
            into vva_numr_err
                ,vnu_seqnc_mel;

          close cur_6;
        end if;

        if vva_numr_err is null
        then
          vnu_cas_err   := 7;

          open cur_7 (vnu_err_oracle);

          fetch cur_7
            into vva_numr_err
                ,vnu_seqnc_mel;

          close cur_7;
        end if;

        if vva_numr_err is null
        then
          vnu_cas_err   := 8;

          vva_info_suplm      :=
               afw_15_htp_pkg.ouvri_bals ('a'
                                         ,'href'
                                         ,   'http://ora-'
                                          || trim (   to_char (vnu_err_oracle
                                                              ,'00000')
                                                   || '')
                                          || '.ora-code.com'
                                         ,'target'
                                         ,'_blank')
            || 'ORA-'
            || trim (   to_char (vnu_err_oracle
                                ,'00000')
                     || '')
            || afw_15_htp_pkg.fermr_bals ('a');

          --MESSAGE= Erreur ORACLE %1%
          vva_info_suplm      :=
            afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000105'
                                                      ,pva_valr_subst1   => vva_info_suplm
                                                      ,pva_code_prodt    => 'AFW');

          if vva_contr_err is not null
          then
            --MESSAGE= , contrainte : %1%
            vva_info_suplm      :=
                 vva_info_suplm
              || afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000106'
                                                           ,pva_valr_subst1   => vva_contr_err
                                                           ,pva_code_prodt    => 'AFW');
          end if;

          if vva_nom_table is not null
          then
            --MESSAGE= , table : %1%
            vva_info_suplm      :=
                 vva_info_suplm
              || afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000107'
                                                           ,pva_valr_subst1   => vva_nom_table
                                                           ,pva_code_prodt    => 'AFW');
          end if;

          if vva_nom_col is not null
          then
            --MESSAGE= , colonne : %1%
            vva_info_suplm      :=
                 vva_info_suplm
              || afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000108'
                                                           ,pva_valr_subst1   => vva_nom_col
                                                           ,pva_code_prodt    => 'AFW');
          end if;

          open cur_8 ();

          fetch cur_8
            into vva_numr_err
                ,vnu_seqnc_mel;

          close cur_8;
        end if;

        if vva_numr_err is null
        then
          vnu_cas_err   := 9;

          open cur_9 ();

          fetch cur_9
            into vva_numr_err
                ,vnu_seqnc_mel;

          close cur_9;
        end if;

        if vva_numr_err is null
        then
          if vva_numr_err != 6550
          then
            --MESSAGE= L'erreur n'a pas pu être gérée par le système de gestion des messages d'erreur.<br/><blockquote>%1%</blockquote>
            vva_mesg_final      :=
              afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000109'
                                                        ,pva_valr_subst1   => pva_mesg
                                                        ,pva_code_prodt    => 'AFW');
          end if;
        else
          --Obtenir le message d'erreur et effectuer les substitutions
          vva_mesg_final      :=
            obten_text_mesg (vva_numr_err
                            ,vnu_cas_err
                            ,vnu_seqnc_mel
                            ,vva_contr_err
                            ,vva_nom_table
                            ,vva_nom_col);
        end if;

        if     vnu_cas_err >= 8
           and obten_afich_err_code
        then
          vva_mesg_final      :=
               vva_mesg_final
            || '('
            || vva_info_suplm
            || ')';
        end if;

        pva_mesg      := vva_mesg_final;
      end if;
    end if;

    pnu_longr   := length (pva_mesg);
  end tratr_mesg;

  function obten_afich_err_code (pnu_prodt in number default null)
    return boolean
  is
    vva_indic_afich   varchar2 (1);
  begin
    select indic_afich_err_code
      into vva_indic_afich
      from vd_i_afw_11_prodt
     where seqnc = nvl (pnu_prodt, afw_11_prodt_pkg.obten_prodt_sesn);

    return (vva_indic_afich = 'O');
  end obten_afich_err_code;

  procedure gerer_err_apex (thepage in out nocopy htp.htbuf_arr)
  is
    vcl_page_apex           clob;
    vcl_page_apex2          clob;
    vnu_err_debut           number;
    vnu_err_fin             number;
    vva_mesg                varchar2 (32767);
    vnu_long                number;
    vnu_indic_thepage_err   pls_integer;
    vnu_indic_x_ignor       pls_integer;
    vbo_err                 boolean default false;
    vva_var_3_lign          varchar2 (768);
    vnu_indic_temp          number;
    vnu_max_itert_clob      pls_integer;
    vbo_afw_err             boolean;
  begin
    if not trait_page ()
    then
      return;
    end if;

    for i in 1 ..
             least (20
                   ,thepage.count ())
    loop
      if thepage.exists (i)
      then
        vbo_afw_err      :=
             thepage (i) like '%<!-- :$:AFW%'
          or thepage (i) like '%-ERR:$: -->%';

        if vbo_afw_err
        then
          vnu_indic_thepage_err   := i;
          exit;
        end if;
      end if;
    end loop;

    if vbo_afw_err
    then
      if afw_07_util_pkg.exist_item ('A_AFW_04_SUR_SOUMS')
      then
        afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_SUR_SOUMS'
                                         ,null);
      end if;

      dbms_lob.createtemporary (vcl_page_apex
                               ,true);

      for i in vnu_indic_thepage_err .. thepage.count ()
      loop
        if thepage.exists (i)
        then
          dbms_lob.writeappend (vcl_page_apex
                               ,length (thepage (i))
                               ,thepage (i));
        end if;
      end loop;

      --Déterminer le début de la section d'erreurs
      vnu_err_debut      :=
        dbms_lob.instr (vcl_page_apex
                       ,'<div class="ErrorPageMessage">');

      if vnu_err_debut = 0
      then
        vnu_err_debut      :=
          dbms_lob.instr (vcl_page_apex
                         ,'<div id="afw_mesg_err"');
      end if;

      vnu_err_debut      :=
          dbms_lob.instr (vcl_page_apex
                         ,'>'
                         ,vnu_err_debut)
        + 1;
      vnu_err_fin      :=
          dbms_lob.instr (vcl_page_apex
                         ,'</div'
                         ,vnu_err_debut)
        - 1;

      if vnu_err_debut is not null
      then
        dbms_lob.createtemporary (vcl_page_apex2
                                 ,true);


        dbms_lob.copy (vcl_page_apex2
                      ,vcl_page_apex
                      ,vnu_err_debut - 1);
        --gérer le message
        vva_mesg             :=
          dbms_lob.substr (vcl_page_apex
                          ,vnu_err_fin - vnu_err_debut + 1
                          ,vnu_err_debut);

        -- Si débug, tracer le message complet et la page complete
        if gbo_mode_debug
        then
          ete (afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000110'
                                                         ,pva_code_prodt   => 'AFW')
              ,vva_mesg
              ,vcl_page_apex);
        end if;

        tratr_mesg (vva_mesg
                   ,vnu_long);
        dbms_lob.writeappend (vcl_page_apex2
                             ,vnu_long
                             ,vva_mesg);
        dbms_lob.copy (vcl_page_apex2
                      ,vcl_page_apex
                      ,dbms_lob.getlength (vcl_page_apex) - vnu_err_fin
                      ,dbms_lob.getlength (vcl_page_apex2) + 1
                      ,vnu_err_fin + 1);
        --Générer la nouvelle page web
        vnu_max_itert_clob   := floor (dbms_lob.getlength (vcl_page_apex2) / 64) + 1;

        for i in 1 .. vnu_max_itert_clob
        loop
          thepage (i - 1 + vnu_indic_thepage_err)      :=
            dbms_lob.substr (vcl_page_apex2
                            ,64
                            , (i - 1) * 64 + 1);
        end loop;

        --vider le reste de l'array pour pas avoir des affaires en double
        thepage.delete (vnu_max_itert_clob + vnu_indic_thepage_err
                       ,thepage.count ());

        dbms_lob.freetemporary (vcl_page_apex2);
      end if;

      dbms_lob.freetemporary (vcl_page_apex);
    end if;
  exception
    when others
    then
      afw_03_journ_pkg.ecrir_journ ('Erreur dans la gestion des erreurs APEX');
      afw_03_journ_pkg.ecrir_journ (sqlerrm);
      afw_03_journ_pkg.ecrir_journ (dbms_utility.format_error_backtrace ());
  end gerer_err_apex;

  procedure lever_err_apex_mesg (pva_mesg in varchar2)
  is
  begin
    raise_application_error (-20999
                            ,pva_mesg);
  end lever_err_apex_mesg;

  procedure lever_err_apex_code (pva_code           in varchar2
                                ,pva_valr_subst1    in varchar2 default null
                                ,pva_valr_subst2    in varchar2 default null
                                ,pva_valr_subst3    in varchar2 default null
                                ,pva_valr_subst4    in varchar2 default null
                                ,pva_valr_subst5    in varchar2 default null
                                ,pva_valr_subst6    in varchar2 default null
                                ,pva_valr_subst7    in varchar2 default null
                                ,pva_valr_subst8    in varchar2 default null
                                ,pva_valr_subst9    in varchar2 default null
                                ,pva_valr_subst10   in varchar2 default null
                                ,pva_code_prodt     in varchar2 default null
                                ,pbo_afich_code     in boolean default obten_afich_err_code)
  is
    vva_mesg   varchar2 (4000);
  begin
    vva_mesg      :=
      afw_01_gestn_mesg_pkg.obten_mesg_par_numr (pva_code
                                                ,pva_code_prodt
                                                ,pva_valr_subst1
                                                ,pva_valr_subst2
                                                ,pva_valr_subst3
                                                ,pva_valr_subst4
                                                ,pva_valr_subst5
                                                ,pva_valr_subst6
                                                ,pva_valr_subst7
                                                ,pva_valr_subst8
                                                ,pva_valr_subst9
                                                ,pva_valr_subst10);

    raise_application_error (-20998
                            ,   case
                                  when pbo_afich_code
                                  then
                                       pva_code
                                    || ' :: '
                                  else
                                    null
                                end
                             || vva_mesg);
  end lever_err_apex_code;

  procedure lever_err_apex_systm_code (pva_code           in varchar2
                                      ,pva_valr_subst1    in varchar2 default null
                                      ,pva_valr_subst2    in varchar2 default null
                                      ,pva_valr_subst3    in varchar2 default null
                                      ,pva_valr_subst4    in varchar2 default null
                                      ,pva_valr_subst5    in varchar2 default null
                                      ,pva_valr_subst6    in varchar2 default null
                                      ,pva_valr_subst7    in varchar2 default null
                                      ,pva_valr_subst8    in varchar2 default null
                                      ,pva_valr_subst9    in varchar2 default null
                                      ,pva_valr_subst10   in varchar2 default null
                                      ,pva_code_systm     in varchar2 default null
                                      ,pbo_afich_code     in boolean default obten_afich_err_code)
  is
    vva_mesg   varchar2 (4000);
  begin
    vva_mesg      :=
      afw_01_gestn_mesg_pkg.obten_mesg_par_numr (pva_code
                                                ,pva_code_systm
                                                ,pva_valr_subst1
                                                ,pva_valr_subst2
                                                ,pva_valr_subst3
                                                ,pva_valr_subst4
                                                ,pva_valr_subst5
                                                ,pva_valr_subst6
                                                ,pva_valr_subst7
                                                ,pva_valr_subst8
                                                ,pva_valr_subst9
                                                ,pva_valr_subst10);
    raise_application_error (-20998
                            ,   case
                                  when pbo_afich_code
                                  then
                                       pva_code
                                    || ' :: '
                                  else
                                    null
                                end
                             || vva_mesg);
  end lever_err_apex_systm_code;

  procedure lever_err_apex (pnu_seqnc          in number default null
                           ,pva_valr_subst1    in varchar2 default null
                           ,pva_valr_subst2    in varchar2 default null
                           ,pva_valr_subst3    in varchar2 default null
                           ,pva_valr_subst4    in varchar2 default null
                           ,pva_valr_subst5    in varchar2 default null
                           ,pva_valr_subst6    in varchar2 default null
                           ,pva_valr_subst7    in varchar2 default null
                           ,pva_valr_subst8    in varchar2 default null
                           ,pva_valr_subst9    in varchar2 default null
                           ,pva_valr_subst10   in varchar2 default null
                           ,pbo_afich_code     in boolean default obten_afich_err_code)
  is
    vva_numr_mesg   vd_i_afw_01_mesg.numr_mesg%type;
    vnu_ref_prodt   vd_i_afw_01_mesg.ref_prodt%type;
  begin
    select numr_mesg
          ,ref_prodt
      into vva_numr_mesg
          ,vnu_ref_prodt
      from vd_i_afw_01_mesg
     where seqnc = pnu_seqnc;

    lever_err_apex_code (vva_numr_mesg
                        ,pva_valr_subst1
                        ,pva_valr_subst2
                        ,pva_valr_subst3
                        ,pva_valr_subst4
                        ,pva_valr_subst5
                        ,pva_valr_subst6
                        ,pva_valr_subst7
                        ,pva_valr_subst8
                        ,pva_valr_subst9
                        ,pva_valr_subst10
                        ,vnu_ref_prodt
                        ,pbo_afich_code);
  exception
    when no_data_found
    then
      raise_application_error (-20998
                              ,'Une erreur inconnue est survenue.');
  end lever_err_apex;

  function obten_mesg_infor_sucs
    return varchar2
  is
    cursor cur_mesg_info
    is
        select mi.text_mesg
              ,mi.seqnc
          from vd_afw_01_mesg_lang ml
              ,vd_afw_01_mesg_infor mi
         where     (   ml.type_mesg = 'I'
                    or ml.type_mesg is null)
               and ml.seqnc(+) = mi.ref_mesg_lang
      order by mi.seqnc;

    vva_mesg   varchar2 (32767);
  begin
    --    ete ('obten_mesg_infor_sucs');

    for rec_mesg_info in cur_mesg_info
    loop
      vva_mesg      :=
           vva_mesg
        || '<br />'
        || rec_mesg_info.text_mesg;
    --      ete ('seqnc', rec_mesg_info.seqnc);
    end loop;

    vva_mesg      :=
      substr (vva_mesg
             ,length ('<br />') + 1);

    --    ete ('session', afw_07_util_pkg.nv ('APP_SESSION'));
    --    ete ('utilisateur', afw_12_utils_pkg.obten_usagr_conct);

    delete vd_afw_01_mesg_infor mi
     where    mi.ref_mesg_lang is null
           or exists
                (select null
                   from vd_afw_01_mesg_lang ml
                  where     (   ml.type_mesg = 'I'
                             or ml.type_mesg is null)
                        and ml.seqnc = mi.ref_mesg_lang);

    --    ete ('sql%rowcount', sql%rowcount);
    --    ete ('vva_mesg', vva_mesg);

    return vva_mesg;
  exception
    when others
    then
      ete ();
  end obten_mesg_infor_sucs;

  function obten_mesg_infor_aide
    return varchar2
  is
    cursor cur_mesg_info
    is
        select mi.text_mesg
              ,mi.seqnc
          from vd_afw_01_mesg_lang ml
              ,vd_afw_01_mesg_infor mi
         where     ml.type_mesg = 'A'
               and ml.seqnc(+) = mi.ref_mesg_lang
      order by mi.seqnc;

    vva_mesg   varchar2 (32767);
  begin
    --    ete ('obten_mesg_infor_aide');

    for rec_mesg_info in cur_mesg_info
    loop
      vva_mesg      :=
           vva_mesg
        || '<br />'
        || rec_mesg_info.text_mesg;
    --      ete ('seqnc', rec_mesg_info.seqnc);
    end loop;

    vva_mesg      :=
      substr (vva_mesg
             ,length ('<br />') + 1);

    --    ete ('session', afw_07_util_pkg.nv ('APP_SESSION'));
    --    ete ('utilisateur', afw_12_utils_pkg.obten_usagr_conct);

    delete vd_afw_01_mesg_infor mi
     where    mi.ref_mesg_lang is null
           or exists
                (select null
                   from vd_afw_01_mesg_lang ml
                  where     ml.type_mesg = 'A'
                        and ml.seqnc = mi.ref_mesg_lang);

    --    ete ('sql%rowcount', sql%rowcount);
    --    ete ('vva_mesg', vva_mesg);

    return vva_mesg;
  exception
    when others
    then
      ete ();
  end obten_mesg_infor_aide;

  function obten_mesg_infor_ereur
    return varchar2
  is
    cursor cur_mesg_info
    is
        select mi.text_mesg
          from vd_afw_01_mesg_lang ml
              ,vd_afw_01_mesg_infor mi
         where     ml.type_mesg in ('E'
                                   ,'C')
               and ml.seqnc = mi.ref_mesg_lang
      order by mi.seqnc;

    vva_mesg   varchar2 (32767);
  begin
    for rec_mesg_info in cur_mesg_info
    loop
      vva_mesg      :=
           vva_mesg
        || '<br />'
        || rec_mesg_info.text_mesg;
    end loop;

    vva_mesg      :=
      substr (vva_mesg
             ,7);

    delete vd_afw_01_mesg_infor mi
     where exists
             (select null
                from vd_afw_01_mesg_lang ml
               where     ml.type_mesg in ('E'
                                         ,'C')
                     and ml.seqnc = mi.ref_mesg_lang);

    return vva_mesg;
  end obten_mesg_infor_ereur;

  function obten_mesg_infor_avert
    return varchar2
  is
    cursor cur_mesg_info
    is
        select mi.text_mesg
          from vd_afw_01_mesg_lang ml
              ,vd_afw_01_mesg_infor mi
         where     ml.type_mesg in ('W')
               and ml.seqnc = mi.ref_mesg_lang
      order by mi.seqnc;

    vva_mesg   varchar2 (32767);
  begin
    for rec_mesg_info in cur_mesg_info
    loop
      vva_mesg      :=
           vva_mesg
        || '<br />'
        || rec_mesg_info.text_mesg;
    end loop;

    vva_mesg      :=
      substr (vva_mesg
             ,7);

    delete vd_afw_01_mesg_infor mi
     where exists
             (select null
                from vd_afw_01_mesg_lang ml
               where     ml.type_mesg in ('W')
                     and ml.seqnc = mi.ref_mesg_lang);

    return vva_mesg;
  end obten_mesg_infor_avert;

  procedure afich_mesg_infor_apex
  is
    vva_mesg_sucs    varchar2 (32767);
    vva_mesg_aide    varchar2 (32767);
    vva_mesg_avert   varchar2 (32767);
    vva_mesg_ereur   varchar2 (32767);
  begin
    vva_mesg_sucs    := obten_mesg_infor_sucs;

    if vva_mesg_sucs is not null
    then
      afw_15_htp_pkg.ecrir (afw_07_util_pkg.multi_replc (afw_13_page_pkg.obten_modl_mesg_sucs
                                                        ,'#SUCCESS_MESSAGE#'
                                                        ,vva_mesg_sucs)
                           ,false);
    end if;

    vva_mesg_aide    := obten_mesg_infor_aide;

    if vva_mesg_aide is not null
    then
      afw_15_htp_pkg.ecrir (afw_07_util_pkg.multi_replc (afw_13_page_pkg.obten_modl_mesg_sucs
                                                        ,'#SUCCESS_MESSAGE#'
                                                        ,vva_mesg_aide
                                                        ,'alert-success'
                                                        ,'alert-info')
                           ,false);
    end if;

    vva_mesg_avert   := obten_mesg_infor_avert;

    if vva_mesg_avert is not null
    then
      afw_15_htp_pkg.ecrir (afw_07_util_pkg.multi_replc (afw_13_page_pkg.obten_modl_mesg_ereur
                                                        ,'#MESSAGE#'
                                                        ,vva_mesg_avert
                                                        ,'alert-danger'
                                                        ,'alert-warning')
                           ,false);
    end if;

    vva_mesg_ereur   := obten_mesg_infor_ereur;

    if vva_mesg_ereur is not null
    then
      afw_15_htp_pkg.ecrir (afw_07_util_pkg.multi_replc (afw_13_page_pkg.obten_modl_mesg_ereur
                                                        ,'#MESSAGE#'
                                                        ,vva_mesg_ereur)
                           ,false);
    end if;
  exception
    when others
    then
      ete ();
  end afich_mesg_infor_apex;

  procedure ajout_mesg_infor_sesn_mesg (pva_mesg in varchar2)
  is
  begin
    insert into vd_i_afw_01_mesg_infor mi (text_mesg)
         values (pva_mesg);
  end ajout_mesg_infor_sesn_mesg;

  procedure ajout_mesg_infor_sesn_code (pva_code_mesg      in varchar2
                                       ,pva_valr_subst1    in varchar2 default null
                                       ,pva_valr_subst2    in varchar2 default null
                                       ,pva_valr_subst3    in varchar2 default null
                                       ,pva_valr_subst4    in varchar2 default null
                                       ,pva_valr_subst5    in varchar2 default null
                                       ,pva_valr_subst6    in varchar2 default null
                                       ,pva_valr_subst7    in varchar2 default null
                                       ,pva_valr_subst8    in varchar2 default null
                                       ,pva_valr_subst9    in varchar2 default null
                                       ,pva_valr_subst10   in varchar2 default null
                                       ,pva_code_prodt     in varchar2 default null)
  is
  begin
    insert into vd_i_afw_01_mesg_infor mi (text_mesg
                                          ,ref_mesg_lang)
         values (afw_01_gestn_mesg_pkg.obten_mesg_par_numr (pva_code_mesg
                                                           ,pva_code_prodt
                                                           ,pva_valr_subst1
                                                           ,pva_valr_subst2
                                                           ,pva_valr_subst3
                                                           ,pva_valr_subst4
                                                           ,pva_valr_subst5
                                                           ,pva_valr_subst6
                                                           ,pva_valr_subst7
                                                           ,pva_valr_subst8
                                                           ,pva_valr_subst9
                                                           ,pva_valr_subst10)
                ,afw_01_gestn_mesg_pkg.obten_seqnc_mesg_lang_sesn (pva_code_mesg
                                                                  ,pva_code_prodt));
  end ajout_mesg_infor_sesn_code;

  procedure ajout_mesg_infor_sesn_sys_code (pva_code_mesg      in varchar2
                                           ,pva_valr_subst1    in varchar2 default null
                                           ,pva_valr_subst2    in varchar2 default null
                                           ,pva_valr_subst3    in varchar2 default null
                                           ,pva_valr_subst4    in varchar2 default null
                                           ,pva_valr_subst5    in varchar2 default null
                                           ,pva_valr_subst6    in varchar2 default null
                                           ,pva_valr_subst7    in varchar2 default null
                                           ,pva_valr_subst8    in varchar2 default null
                                           ,pva_valr_subst9    in varchar2 default null
                                           ,pva_valr_subst10   in varchar2 default null
                                           ,pva_code_systm     in varchar2 default null)
  is
  begin
    insert into vd_i_afw_01_mesg_infor mi (text_mesg
                                          ,ref_mesg_lang)
         values (afw_01_gestn_mesg_pkg.obten_mesg_par_numr (pva_code_mesg
                                                           ,pva_code_systm
                                                           ,pva_valr_subst1
                                                           ,pva_valr_subst2
                                                           ,pva_valr_subst3
                                                           ,pva_valr_subst4
                                                           ,pva_valr_subst5
                                                           ,pva_valr_subst6
                                                           ,pva_valr_subst7
                                                           ,pva_valr_subst8
                                                           ,pva_valr_subst9
                                                           ,pva_valr_subst10)
                ,afw_01_gestn_mesg_pkg.obten_seqnc_mesg_lang_sesn (pva_code_mesg
                                                                  ,pva_code_systm));
  end ajout_mesg_infor_sesn_sys_code;

  procedure ajout_mesg_infor_utils_mesg (pva_mesg    in varchar2
                                        ,pnu_utils   in number)
  is
  begin
    insert into vd_i_afw_01_mesg_infor mi (text_mesg
                                          ,ref_utils)
         values (pva_mesg
                ,pnu_utils);
  end ajout_mesg_infor_utils_mesg;

  procedure ajout_mesg_infor_utils_code (pva_code_mesg      in varchar2
                                        ,pnu_utils          in number
                                        ,pva_valr_subst1    in varchar2 default null
                                        ,pva_valr_subst2    in varchar2 default null
                                        ,pva_valr_subst3    in varchar2 default null
                                        ,pva_valr_subst4    in varchar2 default null
                                        ,pva_valr_subst5    in varchar2 default null
                                        ,pva_valr_subst6    in varchar2 default null
                                        ,pva_valr_subst7    in varchar2 default null
                                        ,pva_valr_subst8    in varchar2 default null
                                        ,pva_valr_subst9    in varchar2 default null
                                        ,pva_valr_subst10   in varchar2 default null
                                        ,pva_code_prodt     in varchar2 default null)
  is
  begin
    insert into vd_i_afw_01_mesg_infor mi (text_mesg
                                          ,ref_utils
                                          ,ref_mesg_lang)
         values (afw_01_gestn_mesg_pkg.obten_mesg_par_numr (pva_code_mesg
                                                           ,pva_code_prodt
                                                           ,pva_valr_subst1
                                                           ,pva_valr_subst2
                                                           ,pva_valr_subst3
                                                           ,pva_valr_subst4
                                                           ,pva_valr_subst5
                                                           ,pva_valr_subst6
                                                           ,pva_valr_subst7
                                                           ,pva_valr_subst8
                                                           ,pva_valr_subst9
                                                           ,pva_valr_subst10)
                ,pnu_utils
                ,afw_01_gestn_mesg_pkg.obten_seqnc_mesg_lang_sesn (pva_code_mesg
                                                                  ,pva_code_prodt));
  end ajout_mesg_infor_utils_code;

  function gestn_mesg_err_apex (p_error in apex_error.t_error)
    return apex_error.t_error_result
  is
    ver_reslt     apex_error.t_error_result;
    vva_message   varchar2 (32767) default p_error.ora_sqlerrm;
    vnu_longr     number default 32767;
  --vva_sourc_url   varchar2 (4000);
  begin
    --prendre exemple sur l'exemple dans le package apex_error (APEX_040200.WWV_FLOW_ERROR)
    if gbo_mode_debug
    then
      ete ('p_error.message'
          ,p_error.message);
      ete ('p_error.additional_info'
          ,p_error.additional_info);
      ete ('p_error.display_location'
          ,p_error.display_location);
      ete ('p_error.association_type'
          ,p_error.association_type);
      ete ('p_error.page_item_name'
          ,p_error.page_item_name);
      ete ('p_error.apex_error_code'
          ,p_error.apex_error_code);
      ete ('p_error.ora_sqlerrm'
          ,p_error.ora_sqlerrm);
      ete ('p_error.error_backtrace'
          ,p_error.error_backtrace);
    end if;

    if instr (vva_message
             ,'WWV_FLOW_PAGE_SUBMISSIONS_PK') > 0
    then
      --(Erreur ORACLE ORA-00001, contrainte : WWV_FLOW_PAGE_SUBMISSIONS_PK)
      vva_message      :=
        afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000111'
                                                  ,pva_code_prodt   => 'AFW');
      vnu_longr   := length (vva_message);
    /* elsif instr (
             vva_message,
             'ERR-3331') >
             0 then
      --(Erreur ORACLE ORA-00001, contrainte : WWV_FLOW_PAGE_SUBMISSIONS_PK)
      --TODO::CARLO
      --Gérer le message avec AFW (ne pas le hardcoder) SIE.xxxx dans AFW
      vva_sourc_url   := v ('A_AFW_04_SOURC_URL');

      vva_message      :=
           'Vous ne pouvez pas soumettre ce formulaire à plusieurs reprises (attention de ne pas double-cliquer sur les boutons).'
        || case
             when vva_sourc_url is not null
             then
                  ' <a href="'
               || vva_sourc_url
               || '">Veuillez retourner à la page précédente.</a>'
             else
               null
           end;

      vnu_longr       := length (vva_message);*/



    --    elsif p_error.apex_error_code = 'WWV_FLOW.FIND_ITEM_ID_ERR'
    --    then
    --      vva_message   := p_error.message;
    --      vnu_longr     := length (vva_message);
    else
      tratr_mesg (vva_message
                 ,vnu_longr);
    end if;

    ver_reslt                    := apex_error.init_error_result (p_error => p_error);

    ver_reslt.message            := vva_message;

    ver_reslt.additional_info    := null;

    --  ete ('ver_reslt.display_location', ver_reslt.display_location);
    --  ete ('vva_message', vva_message);

    ver_reslt.display_location      :=
      case when ver_reslt.display_location = apex_error.c_on_error_page then apex_error.c_inline_in_notification else ver_reslt.display_location end;

    ver_reslt.page_item_name     := p_error.page_item_name;
    ver_reslt.column_alias       := p_error.column_alias;

    return ver_reslt;
  end gestn_mesg_err_apex;
begin
  gbo_mode_debug   := false;
end afw_01_err_apex_pkg;
/
