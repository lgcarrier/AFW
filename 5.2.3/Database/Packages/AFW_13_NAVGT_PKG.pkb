SET DEFINE OFF;
create or replace package body afw_13_navgt_pkg
as
  exc_err_extra           exception;
  gva_indic_extra_total   varchar2 (2);
  gva_indic_extra_termn   varchar2 (1);
  gnu_tail_tabl_extra     number (10);
  gnu_nombr_rang_extra    number (10);
  gnu_navgt               number (10);
  gnu_numr_elemn          number (10);
  gnu_numr_elemn_rechr    number (10);
  gnu_sspc                number (10) default afw_07_util_pkg.nv ('A_AFW_04_SEQNC_CONTX');
  gnu_ref_ir              number (10);
  gnu_rpts_id             number;
  gva_sql                 varchar2 (32767);
  gva_filtr_persn         varchar2 (32767);
  gbo_rempl_filtr_auto    boolean default false;
  gbo_mode_rechr          boolean default false;

  function obten_type_don_coln (pva_schem   in varchar2
                               ,pva_table   in varchar2
                               ,pva_coln    in varchar2)
    return varchar2
  is
    vva_type_don   all_tab_cols.data_type%type;
  begin
    select data_type
      into vva_type_don
      from all_tab_cols
     where     owner = nvl (pva_schem
                           ,sys_context ('USERENV'
                                        ,'CURRENT_SCHEMA'))
           and table_name = upper (pva_table)
           and column_name = pva_coln;

    return vva_type_don;
  exception
    when no_data_found
    then
      return null;
  end;

  procedure defnr_varbl_afw_04
  is
    vva_nom_item_seqnc   varchar2 (30)
                           default    'P'
                                   || to_char (afw_08_url_pkg.knu_app_page_id)
                                   || '_SEQNC';
    vnu_seqnc_actue      number default afw_07_util_pkg.nv ('A_AFW_04_SEQNC_CONTX');
  begin
    if nvl (vnu_seqnc_actue, 0) <> nvl (gnu_sspc, 0)
    then
      -- Definir l'item de sequence avec la valeur du contexte
      afw_07_util_pkg.defnr_etat_sessn (vva_nom_item_seqnc
                                       ,gnu_sspc);

      afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_SEQNC_CONTX'
                                       ,gnu_sspc);

      afw_04_contx_pkg.maj_seqnc_contx ();
    end if;
  end defnr_varbl_afw_04;

  function obten_rang
    return typ_tab_navgt_elemt
    pipelined
  is
    var_infor_coln   afw_07_sql_pkg.typ_arr_infor_coln;
    vnu_cursr        number;
    vre_rang         typ_rec_elemn;
    vnu_i            pls_integer default 1;
    vbo_doit_sortr   boolean default gnu_nombr_rang_extra > 0;
    vbo_exit_progr   boolean default false;
  begin
    if gva_sql is not null
    then
      begin
        vnu_cursr      :=
          afw_07_sql_pkg.ouvri_selct (gnu_ref_ir
                                     ,gnu_rpts_id
                                     ,gva_sql
                                     ,var_infor_coln
                                     ,chr (10));
      exception
        when others
        then
          afw_03_journ_pkg.ecrir_journ (gva_sql
                                       ,null
                                       ,'SAF_N1'
                                       ,false);
          raise exc_err_extra;
      end;

      if var_infor_coln.first () is not null
      then
        -- Extraire la valeur de la séquence pour chaque rangée
        vre_rang.indic_courn   := 'N';

        while afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                              ,var_infor_coln)
        loop
          vre_rang.seqnc   := var_infor_coln (1).nu_valr_numbr;

          if vnu_i > gnu_nombr_rang_extra
          then
            vre_rang.rn   := vnu_i;

            if    vre_rang.seqnc = gnu_sspc
               or vnu_i = gnu_numr_elemn_rechr
            then
              vre_rang.indic_courn   := 'O';
              pipe row (vre_rang);
              vre_rang.indic_courn   := 'N';
              gnu_numr_elemn         := vnu_i;
              vbo_doit_sortr         := true;
            else
              pipe row (vre_rang);
            end if;

            if vbo_doit_sortr
            then
              if gnu_tail_tabl_extra != 0
              then
                --if vnu_i / gnu_tail_tabl_extra = floor(vnu_i / gnu_tail_tabl_extra) then
                if mod (vnu_i
                       ,gnu_tail_tabl_extra) = 0
                then
                  vbo_exit_progr   := true;
                  exit;
                end if;
              end if;
            end if;
          end if;

          vnu_i            := vnu_i + 1;
        end loop;

        if not (vbo_exit_progr)
        then
          gva_indic_extra_termn   := 'O';
        end if;
      end if;

      -- Fermer le curseur
      afw_07_sql_pkg.fermr_selct (vnu_cursr);
    end if;
  end obten_rang;

  function obten_tout_rang
    return typ_tab_navgt_elemt
    pipelined
  is
    var_infor_coln   afw_07_sql_pkg.typ_arr_infor_coln;
    vnu_cursr        number;
    vre_rang         typ_rec_elemn;
    vnu_i            pls_integer default 1;
  begin
    if gva_sql is not null
    then
      begin
        vnu_cursr      :=
          afw_07_sql_pkg.ouvri_selct (gnu_ref_ir
                                     ,gnu_rpts_id
                                     ,gva_sql
                                     ,var_infor_coln
                                     ,chr (10));
      exception
        when others
        then
          afw_03_journ_pkg.ecrir_journ (gva_sql
                                       ,null
                                       ,'SAF_N1'
                                       ,false);
          raise exc_err_extra;
      end;

      if var_infor_coln.first () is not null
      then
        -- Extraire la valeur de la séquence pour chaque rangée
        vre_rang.indic_courn   := 'N';

        while afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                              ,var_infor_coln)
        loop
          vre_rang.seqnc   := var_infor_coln (1).nu_valr_numbr;

          if vnu_i > gnu_nombr_rang_extra
          then
            vre_rang.rn   := vnu_i;

            if    vre_rang.seqnc = gnu_sspc
               or vnu_i = gnu_numr_elemn_rechr
            then
              gnu_numr_elemn         := vnu_i;
              vre_rang.indic_courn   := 'O';
              pipe row (vre_rang);
              vre_rang.indic_courn   := 'N';
            else
              pipe row (vre_rang);
            end if;
          end if;

          vnu_i            := vnu_i + 1;
        end loop;
      end if;

      gva_indic_extra_termn   := 'O';
      -- Fermer le curseur
      afw_07_sql_pkg.fermr_selct (vnu_cursr);
    end if;
  end obten_tout_rang;

  procedure extra_proch_enreg
  is
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Début de l''extraction des enregistrements');

    if gva_indic_extra_termn = 'N'
    then
      gva_sql   := afw_13_navgt_noyau_pkg.obten_sql (gnu_navgt);

      if gnu_ref_ir is not null
      then
        afw_04_contx_pkg.synch_varbl (1);
      end if;

      if    gva_indic_extra_total = 'O'
         or gnu_numr_elemn_rechr < 0
      then
        /*insert into afw_13_navgt_elemn (numr_elemn,
                                                          indic_courn,
                                        seqnc_elemn,
                                        ref_navgt)
          select   rn,
                   indic_courn,
                   seqnc,
                   gnu_navgt
            from   table (afw_13_navgt_pkg.obten_tout_rang ());
        gnu_nombr_rang_extra := gnu_nombr_rang_extra + sql%rowcount;
        */

        for rec_elemn_navgt in (select rn
                                      ,seqnc
                                      ,indic_courn
                                  from table (afw_13_navgt_pkg.obten_tout_rang ()))
        loop
          afw_13_navgt_noyau_pkg.ajout_elemn_navgt (gnu_navgt
                                                   ,rec_elemn_navgt.rn
                                                   ,rec_elemn_navgt.seqnc
                                                   ,rec_elemn_navgt.indic_courn);
          gnu_nombr_rang_extra   := gnu_nombr_rang_extra + 1;
        end loop;
      else
        /*insert into afw_13_navgt_elemn (numr_elemn,
                                                                indic_courn,
                                        seqnc_elemn,
                                        ref_navgt)
          select   rn,
                   indic_courn,
                   seqnc,
                   gnu_navgt
            from   table (afw_13_navgt_pkg.obten_rang ());
        gnu_nombr_rang_extra := gnu_nombr_rang_extra + sql%rowcount;
        */

        for rec_elemn_navgt in (select rn
                                      ,seqnc
                                      ,indic_courn
                                  from table (afw_13_navgt_pkg.obten_rang ()))
        loop
          afw_13_navgt_noyau_pkg.ajout_elemn_navgt (gnu_navgt
                                                   ,rec_elemn_navgt.rn
                                                   ,rec_elemn_navgt.seqnc
                                                   ,rec_elemn_navgt.indic_courn);
          gnu_nombr_rang_extra   := gnu_nombr_rang_extra + 1;
        end loop;
      end if;

      if gnu_ref_ir is not null
      then
        afw_04_contx_pkg.synch_varbl ();
      end if;
    else
      afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Aucun enregistrements à extraire');
    end if;

    afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Fin de l''extraction des enregistrements');
  exception
    when others
    then
      afw_04_contx_pkg.synch_varbl ();
  end extra_proch_enreg;

  procedure creer_contx_navgt (pva_selct      in varchar2
                              ,pnu_ref_page   in number default null)
  is
    vnu_page    number default pnu_ref_page;
    vnu_prodt   number;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Création d''un contexte de navigation');

    if vnu_page is null
    then
      vnu_page   := afw_13_page_pkg.obten_page_sesn ();
    end if;

    --Déterminer les valeurs de pilotage pour l'extraction
    begin
      gva_indic_extra_total   := afw_13_navgt_noyau_pkg.obten_indic_extra_total (vnu_page);
      gnu_tail_tabl_extra     := afw_13_navgt_noyau_pkg.obten_tail_tabl_extra (vnu_page);

      if gva_indic_extra_total = 'O'
      then
        gnu_tail_tabl_extra   := 10;
      end if;
    exception
      when no_data_found
      then
        null;
    end;

    if    gva_indic_extra_total = 'HE'
       or gva_indic_extra_total is null
    then
      --L'obtenir à partir de l'application
      vnu_prodt               := afw_11_prodt_pkg.obten_prodt_sesn ();

      gva_indic_extra_total   := afw_13_navgt_noyau_pkg.obten_indic_extra_total_prodt (vnu_prodt);
      gnu_tail_tabl_extra     := afw_13_navgt_noyau_pkg.obten_tail_tabl_extra_prodt (vnu_prodt);
    end if;

    gnu_nombr_rang_extra    := 0;
    gva_indic_extra_termn   := 'N';

    gnu_navgt               :=
      afw_13_navgt_noyau_pkg.creer_navgt (gva_indic_extra_total
                                         ,gva_indic_extra_termn
                                         ,gnu_nombr_rang_extra
                                         ,pva_selct
                                         ,gnu_tail_tabl_extra
                                         ,gnu_rpts_id
                                         ,gnu_ref_ir);
  end creer_contx_navgt;

  procedure creer_contx_navgt_ir
  is
    vva_selct         varchar2 (32767);
    vnu_aplic_avant   number default afw_07_util_pkg.nv ('A_AFW_04_SOURC_NUMR_APLIC');
    vnu_page_avant    number default afw_07_util_pkg.nv ('A_AFW_04_SOURC_NUMR_PAGE');
    vnu_page          number;
  begin
    --On peut créer si on arrive d'une page avec un état interactif
    gnu_ref_ir      :=
      afw_13_raprt_inter_pkg.obten_ir_page (vnu_page_avant
                                           ,null
                                           ,vnu_aplic_avant);

    if gnu_ref_ir is not null
    then
      afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Création d''un contexte de navigation IR');

      gnu_rpts_id      :=
        afw_13_raprt_inter_pkg.obten_repts_courn (vnu_page_avant
                                                 ,null
                                                 ,vnu_aplic_avant);
      vva_selct      :=
        afw_13_raprt_inter_pkg.obten_selct_rpts (gnu_rpts_id
                                                ,true
                                                ,'SEQNC');

      if vva_selct is not null
      then
        creer_contx_navgt (vva_selct);
      end if;
    end if;
  end creer_contx_navgt_ir;

  procedure maj_contx_exect_selon_modfc
  is
  begin
    afw_13_navgt_noyau_pkg.maj_navgt (gnu_navgt
                                     ,gva_indic_extra_total
                                     ,gva_indic_extra_termn
                                     ,gnu_nombr_rang_extra
                                     ,gnu_rpts_id
                                     ,gnu_ref_ir);

    afw_13_navgt_noyau_pkg.defnr_elemn_courn_sspc (gnu_sspc);
  end maj_contx_exect_selon_modfc;

  function obten_sspc_numr_elemn (pnu_numr               in number
                                 ,pbo_defnr_numr_elemn   in boolean default false)
    return number
  is
    vnu_seqnc   number;
  begin
    if pbo_defnr_numr_elemn
    then
      vnu_seqnc      :=
        afw_13_navgt_noyau_pkg.obten_sspc_numr_elemn (gva_indic_extra_termn
                                                     ,pnu_numr
                                                     ,gnu_numr_elemn);
    else
      vnu_seqnc      :=
        afw_13_navgt_noyau_pkg.obten_sspc_numr_elemn (gva_indic_extra_termn
                                                     ,pnu_numr);
    end if;

    return vnu_seqnc;
  end;

  procedure alimn_contx_exect
  is
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Alimenter contexte d''execution');

    -- Ne continuer que si on a un sspc ou qu'on a demandé un numéro d'élément
    if    gnu_sspc is not null
       or gnu_numr_elemn_rechr is not null
    then
      gnu_numr_elemn   := null;

      --déterminer si le contexte de navigation existe déjà
      if gnu_navgt is null
      then
        if not afw_13_navgt_noyau_pkg.obten_navgt_courn (gnu_navgt
                                                        ,gva_indic_extra_total
                                                        ,gva_indic_extra_termn
                                                        ,gnu_nombr_rang_extra
                                                        ,gnu_tail_tabl_extra
                                                        ,gnu_rpts_id
                                                        ,gnu_ref_ir)
        then
          afw_13_navgt_noyau_pkg.suprm_navgt_courn ();
        end if;
      end if;

      if gnu_navgt is null
      then
        creer_contx_navgt_ir ();
      end if;

      if gnu_navgt is not null
      then
        --Déterminer si besoin d'extraire
        begin
          if gnu_numr_elemn_rechr is not null
          then
            gnu_sspc   := obten_sspc_numr_elemn (gnu_numr_elemn_rechr);

            if gnu_sspc is null
            then
              -- Éviter un select pour rien
              raise no_data_found;
            end if;
          end if;

          gnu_numr_elemn   := afw_13_navgt_noyau_pkg.obten_numr_elemn_sspc (gnu_sspc);

          if gnu_numr_elemn is null
          then
            raise no_data_found;
          end if;
        exception
          when no_data_found
          then
            extra_proch_enreg ();
        end;

        --Déterminer si besoin d'extraire encore plus
        if     gnu_numr_elemn is not null
           and gnu_numr_elemn >= gnu_nombr_rang_extra
        then
          extra_proch_enreg ();
        end if;

        -- Déterminer le sspc si on ne l'a pas encore trouvé
        if     gnu_numr_elemn_rechr is not null
           and gnu_sspc is null
        then
          gnu_sspc      :=
            obten_sspc_numr_elemn (gnu_numr_elemn_rechr
                                  ,true);
        end if;

        if    gnu_sspc is null
           or gnu_numr_elemn is null
        then
          -- On ne trouve pas l'élément demandé
          gnu_navgt   := null;
        else
          defnr_varbl_afw_04 ();

          maj_contx_exect_selon_modfc;
        end if;
      end if;
    else
      afw_13_navgt_noyau_pkg.suprm_navgt_courn ();
    end if;
  end alimn_contx_exect;

  function obten_sspc (pnu_ofset        in number default 1
                      ,pbo_enreg_limt   in boolean default false)
    return number
  is
    vnu_seqnc   number (10);
  begin
    -- cause probleme en mode debug car insere du code HTML dans du code javascript
    --afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Obtention du prochain sspc');

    if pnu_ofset = 0
    then
      return gnu_sspc;
    else
      if not pbo_enreg_limt
      then
        -- enregistrement précédent
        -- enregistrement suivant
        vnu_seqnc   := obten_sspc_numr_elemn (gnu_numr_elemn + pnu_ofset);
      else
        -- premier enregistrement
        -- dernier enregistrement
        if pnu_ofset < 0
        then
          vnu_seqnc   := obten_sspc_numr_elemn (1);
        else
          if gva_indic_extra_termn = 'N'
          then
            vnu_seqnc   := null;
          else
            vnu_seqnc   := obten_sspc_numr_elemn (-1);
          end if;
        end if;
      end if;

      return vnu_seqnc;
    end if;
  end obten_sspc;

  function obten_valr_formt (pnu_seqnc_elemn in number)
    return varchar2
  is
    vva_valr_formt    varchar2 (200);
    vnu_struc_aplic   number (10);
  begin
    if pnu_seqnc_elemn is null
    then
      return 'Dernier enregistrement';
    end if;

    vnu_struc_aplic   := afw_13_page_pkg.obten_struc_aplic (afw_13_page_pkg.obten_page_sesn ());

    if vnu_struc_aplic is not null
    then
      vva_valr_formt      :=
        afw_12_struc_aplic_cu_pkg.obten_valr_formt (vnu_struc_aplic
                                                   ,pnu_seqnc_elemn);
    end if;

    return vva_valr_formt;
  end obten_valr_formt;

  function obten_url_seqnc (pnu_seqnc in number)
    return varchar2
  is
  begin
    return afw_04_contx_pkg.genr_url_en_contx (afw_08_url_pkg.knu_app_page_id
                                              ,pnu_seqnc);
  end;

  function obten_url_suivn
    return varchar2
  is
  begin
    return obten_url_seqnc (obten_sspc ());
  end obten_url_suivn;

  function obten_url_precd
    return varchar2
  is
  begin
    return obten_url_seqnc (obten_sspc (-1));
  end obten_url_precd;

  function obten_url_dernr (pva_indic_extra_termn in varchar2)
    return varchar2
  is
    vva_url   varchar2 (4000);
  begin
    if gva_indic_extra_termn = 'O'
    then
      return obten_url_seqnc (obten_sspc (1
                                         ,true));
    else
      return afw_04_contx_pkg.genr_url_en_contx (afw_08_url_pkg.knu_app_page_id
                                                ,null
                                                ,'XDE');
    end if;
  end obten_url_dernr;

  function obten_url_premr
    return varchar2
  is
    vva_url   varchar2 (4000);
  begin
    return obten_url_seqnc (obten_sspc (-1
                                       ,true));
  end obten_url_premr;

  procedure initl_navgt (pva_sql in varchar2 default null)
  is
  begin
    null;
  end initl_navgt;

  procedure defnr_varbl_sesn
  is
    vva_selct_liste   varchar2 (32000);
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Définition des variables de session');

    if     gnu_navgt is not null
       and gnu_numr_elemn is not null
    then
      vva_selct_liste   := '<select onchange="location.href=this.options[selectedIndex].value;">';

      for i in greatest (gnu_numr_elemn - nvl (gnu_tail_tabl_extra, 10)
                        ,1) ..
               least (gnu_numr_elemn + nvl (gnu_tail_tabl_extra, 10)
                     ,gnu_nombr_rang_extra)
      loop
        vva_selct_liste      :=
             vva_selct_liste
          || '<option value="'
          || obten_url_seqnc (obten_sspc_numr_elemn (i))
          || '"'
          || case when i = gnu_numr_elemn then ' selected' else null end
          || '>'
          || i
          || '</option>';
      end loop;

      vva_selct_liste      :=
           vva_selct_liste
        || '</select>';

      if gva_indic_extra_termn = 'N'
      then
        afw_07_util_pkg.defnr_etat_sessn ('A_AFW_13_PAGNT_NAVGT'
                                         ,   vva_selct_liste
                                          || ' / '
                                          || gnu_nombr_rang_extra
                                          || ' (...)');
      else
        afw_07_util_pkg.defnr_etat_sessn ('A_AFW_13_PAGNT_NAVGT'
                                         ,   vva_selct_liste
                                          || ' / '
                                          || gnu_nombr_rang_extra);
      end if;
    else
      afw_07_util_pkg.defnr_etat_sessn ('A_AFW_13_PAGNT_NAVGT'
                                       ,null);
    end if;
  end defnr_varbl_sesn;

  procedure defnr_contx_navgt
  is
    vva_navgt   varchar2 (1);
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 13 Navgt - Définir le contexte de navigation');

    select p.indic_prise_charg_afw13_navgt
      into vva_navgt
      from vd_afw_13_page p
     where p.seqnc = afw_13_page_pkg.obten_page_sesn ();

    if     vva_navgt = 'O'
       and afw_21_plugn_navgt_enreg_pkg.valdr_plugn_activ
    then
      if gnu_numr_elemn_rechr = -1
      then
        afw_07_util_pkg.ajout_info_debug ('Naviguer vers le dernier enregistrement');
      end if;

      alimn_contx_exect ();

      defnr_varbl_sesn ();
    end if;
  exception
    when exc_err_extra
    then
      afw_03_journ_pkg.ecrir_journ (gva_sql
                                   ,null
                                   ,'SAF_N1'
                                   ,false);
      afw_19_fonct_pkg.desct_fonct ('NAVGT_PREMR_ENREG');
      afw_19_fonct_pkg.desct_fonct ('NAVGT_ENREG_SUIVN');
      afw_19_fonct_pkg.desct_fonct ('NAVGT_ENREG_PRECD');
      afw_19_fonct_pkg.desct_fonct ('NAVGT_DERNR_ENREG');
    when others
    then
      afw_03_journ_pkg.ecrir_journ (gva_sql
                                   ,null
                                   ,'SAF_N1'
                                   ,false);
      afw_19_fonct_pkg.desct_fonct ('NAVGT_PREMR_ENREG');
      afw_19_fonct_pkg.desct_fonct ('NAVGT_ENREG_SUIVN');
      afw_19_fonct_pkg.desct_fonct ('NAVGT_ENREG_PRECD');
      afw_19_fonct_pkg.desct_fonct ('NAVGT_DERNR_ENREG');
  end defnr_contx_navgt;

  function obten_numr_courn
    return number
  is
  begin
    return gnu_numr_elemn;
  end obten_numr_courn;

  procedure obten_premr_enreg
  is
  begin
    gnu_numr_elemn_rechr   := 1;
  end obten_premr_enreg;

  procedure obten_dernr_enreg
  is
  begin
    gnu_numr_elemn_rechr   := -1;
  end obten_dernr_enreg;

  function verfr_presn_navgt
    return boolean
  is
  begin
    return gnu_navgt is not null;
  end;

  function formt_filtr_varch (pva_coln   in varchar2
                             ,pva_valr   in varchar2)
    return varchar2
  is
    vva_valr         varchar2 (32000) default pva_valr;
    vva_opert        varchar2 (10) default '=';
    vbo_opert_like   boolean default false;
  begin
    begin
      --Extraire l'opérateur si un est précisé
      if substr (vva_valr
                ,1
                ,2) in ('<='
                       ,'>='
                       ,'<>'
                       ,'!='
                       ,'^=')
      then
        vva_opert      :=
          substr (vva_valr
                 ,1
                 ,2);
        vva_valr      :=
          substr (vva_valr
                 ,3);
      elsif substr (vva_valr
                   ,1
                   ,1) in ('='
                          ,'<'
                          ,'>'
                          ,'!'
                          ,'#')
      then
        vva_opert      :=
          substr (vva_valr
                 ,1
                 ,1);
        vva_valr      :=
          substr (vva_valr
                 ,2);
      else
        --Traiter comme un "like"
        vva_opert        := ' like ';
        vbo_opert_like   := true;

        --Ajouter des % chaque côté s'il n'y en a pas déjà au moins 1
        if instr (vva_valr
                 ,'%') = 0
        then
          vva_valr      :=
               '%'
            || vva_valr
            || '%';
        end if;
      end if;

      --Standardiser l'opérateur
      if vva_opert in ('!'
                      ,'<>'
                      ,'^='
                      ,'#')
      then
        vva_opert   := '!=';
      end if;

      if vva_valr is null
      then
        -- Recherche de is null ou is not null
        if vva_opert = '='
        then
          vva_opert   := ' is ';
        elsif vva_opert = '!='
        then
          vva_opert   := ' is not ';
        end if;
      end if;
    exception
      when others
      then
        vva_valr   := null;
    end;

    if     vbo_opert_like
       and pva_coln is not null
    then
      return    'upper('
             || pva_coln
             || ')'
             || vva_opert
             || afw_07_sql_util_pkg.v (upper (vva_valr));
    else
      return    pva_coln
             || vva_opert
             || afw_07_sql_util_pkg.v (vva_valr);
    end if;
  end;

  function formt_filtr_numbr (pva_coln    in varchar2
                             ,pva_valr    in varchar2
                             ,pva_formt   in varchar2 default null)
    return varchar2
  is
    vva_valr    varchar2 (32000) default pva_valr;
    vnu_valr    number;
    vva_opert   varchar2 (10) default '=';
  begin
    begin
      --Extraire l'opérateur si un est précisé
      if substr (vva_valr
                ,1
                ,2) in ('<='
                       ,'>='
                       ,'<>'
                       ,'!='
                       ,'^=')
      then
        vva_opert      :=
          substr (vva_valr
                 ,1
                 ,2);
        vva_valr      :=
          substr (vva_valr
                 ,3);
      elsif substr (vva_valr
                   ,1
                   ,1) in ('='
                          ,'<'
                          ,'>'
                          ,'!'
                          ,'#')
      then
        vva_opert      :=
          substr (vva_valr
                 ,1
                 ,1);
        vva_valr      :=
          substr (vva_valr
                 ,2);
      end if;

      --Standardiser l'opérateur
      if vva_opert in ('!'
                      ,'<>'
                      ,'^='
                      ,'#')
      then
        vva_opert   := '!=';
      end if;

      if vva_valr is null
      then
        vnu_valr   := null;

        -- Recherche de is null ou is not null
        if vva_opert = '='
        then
          vva_opert   := ' is ';
        elsif vva_opert = '!='
        then
          vva_opert   := ' is not ';
        end if;
      else
        if pva_formt is not null
        then
          vnu_valr      :=
            to_number (vva_valr
                      ,pva_formt);
        else
          vnu_valr   := to_number (vva_valr);
        end if;
      end if;
    exception
      when others
      then
        vnu_valr   := null;
    end;

    return    pva_coln
           || vva_opert
           || afw_07_sql_util_pkg.nv (vnu_valr);
  end;

  function formt_filtr_date (pva_coln    in varchar2
                            ,pva_valr    in varchar2
                            ,pva_formt   in varchar2 default null)
    return varchar2
  is
    vva_valr    varchar2 (32000) default pva_valr;
    vda_valr    date;
    vva_opert   varchar2 (10) default '=';
  begin
    begin
      --Extraire l'opérateur si un est précisé
      if substr (vva_valr
                ,1
                ,2) in ('<='
                       ,'>='
                       ,'<>'
                       ,'!='
                       ,'^=')
      then
        vva_opert      :=
          substr (vva_valr
                 ,1
                 ,2);
        vva_valr      :=
          substr (vva_valr
                 ,3);
      elsif substr (vva_valr
                   ,1
                   ,1) in ('='
                          ,'<'
                          ,'>'
                          ,'!'
                          ,'#')
      then
        vva_opert      :=
          substr (vva_valr
                 ,1
                 ,1);
        vva_valr      :=
          substr (vva_valr
                 ,2);
      end if;

      --Standardiser l'opérateur
      if vva_opert in ('!'
                      ,'<>'
                      ,'^='
                      ,'#')
      then
        vva_opert   := '!=';
      end if;

      if vva_valr is null
      then
        vda_valr   := null;

        -- Recherche de is null ou is not null
        if vva_opert = '='
        then
          vva_opert   := ' is ';
        elsif vva_opert = '!='
        then
          vva_opert   := ' is not ';
        end if;
      else
        if pva_formt is not null
        then
          vda_valr      :=
            to_date (vva_valr
                    ,pva_formt);
        else
          vda_valr   := to_date (vva_valr);
        end if;
      end if;
    exception
      when others
      then
        vda_valr   := null;
    end;

    return    pva_coln
           || vva_opert
           || afw_07_sql_util_pkg.dv (vda_valr);
  end;

  procedure ajout_filtr_rechr (pva_nouv_filtr         in varchar2
                              ,pbo_rempl_filtr_auto   in boolean default false)
  is
  begin
    gva_filtr_persn      :=
         gva_filtr_persn
      || ' and '
      || pva_nouv_filtr;

    if pbo_rempl_filtr_auto
    then
      gbo_rempl_filtr_auto   := true;
    end if;
  end;

  procedure trait_mode_rechr
  is
    vnu_ref_page_courn   number;
  begin
    if afw_07_util_pkg.v ('REQUEST') = 'AFW_13_RECHR_FORML'
    then
      vnu_ref_page_courn   := afw_13_page_pkg.obten_page_sesn ();

      -- S'assurer que la page est une page de recherche valide
      if afw_13_page_pkg.est_page_rechr (vnu_ref_page_courn)
      then
        gbo_mode_rechr   := true;

        -- Simuler un mode création
        gnu_sspc         := null;

        afw_07_util_pkg.reint_etat_sesn_page (afw_07_util_pkg.nv ('APP_PAGE_ID'));

        defnr_varbl_afw_04 ();
      end if;
    end if;
  end;

  /*procedure anulr_mode_rechr
                          is
  begin
    gbo_mode_rechr := false;
    -- Aller en mode création
    gnu_sspc := null;
    afw_07_util_pkg.reint_etat_sesn_page (afw_07_util_pkg.nv('APP_PAGE_ID'));
    defnr_varbl_afw_04 ();
  end;*/

  function est_en_mode_rechr
    return boolean
  is
  begin
    return gbo_mode_rechr;
  end;

  function est_en_mode_rechr_va
    return varchar2
  is
  begin
    return case when gbo_mode_rechr then 'O' else 'N' end;
  end;

  procedure script_mode_rechr
  is
    rec_info_extra   afw_13_page_pkg.typ_info_extra;
    var_item_rechr   afw_13_navgt_noyau_pkg.typ_arr_item_rechr;
  begin
    if gbo_mode_rechr
    then
      rec_info_extra   := afw_13_page_pkg.obten_info_extra ();

      htp.p ('<script type="text/javascript">');
      htp.p ('<!-- ');
      htp.p ('function afw_13_rechr_init_item (nom_item, actif) {');
      htp.p ('  var obj = afw.jQuery("#" + nom_item);');
      htp.p ('  ');
      htp.p ('  if (actif) {');
      htp.p ('    afw.jQuery(obj)');
      htp.p ('      .addClass("afw_13_item_rechr")');
      htp.p ('      .attr("readonly", "")');
      htp.p ('    ;');
      htp.p ('    ');
      htp.p ('    if (afw.jQuery("#" + nom_item + "_HIDDENVALUE").length == 0)');
      htp.p ('      afw.jQuery(obj).attr("disabled", "");');
      htp.p ('    if (afw.jQuery(obj).attr("tagName") == "SELECT") {');
      htp.p ('      var valr_null = afw.jQuery("option[value=''%null%'']",obj);');
      htp.p ('      if (afw.jQuery(valr_null).length == 0) {');
      htp.p ('        afw.jQuery("option:first", obj).before ("<option value=\"%null%\">- Tous -</option>");');
      htp.p ('      }');
      htp.p ('      else {');
      htp.p ('        afw.jQuery(valr_null).text ("- Tous -");');
      htp.p ('      }');
      htp.p ('      afw.jQuery("option[value!=''%null%'']",obj).each(function () {afw.jQuery(this).val("=" + afw.jQuery(this).val());});');
      htp.p ('      afw.jQuery(obj).val ("%null%");');
      htp.p ('      afw.jQuery(obj).attr ("onchange", "");');
      htp.p ('    }');
      htp.p ('    else if (afw.jQuery(obj).attr("type") != "hidden") {');
      htp.p ('      afw.jQuery(obj).val ("").attr("maxlength","4000");');
      htp.p ('    }');
      htp.p ('  }');
      htp.p ('  else {');
      htp.p ('    afw.jQuery(obj)');
      htp.p ('      .addClass("afw_13_rechr_desct")');
      htp.p ('      .attr("readOnly", "true")');
      htp.p ('    ;');
      htp.p ('    afw.jQuery("[id^=''" + nom_item + "'']").attr("disabled", true);');
      htp.p ('  }');
      htp.p ('}');
      htp.p ('');
      htp.p ('function afw_13_rechr_init () {');
      htp.p ('  window.orig_doSubmit = doSubmit;');
      htp.p ('  doSubmit = function () {orig_doSubmit ("AFW_13_RECHR_FORML");};');
      htp.p ('  ');
      var_item_rechr      :=
        afw_13_navgt_noyau_pkg.obten_item_rechr (afw_13_page_pkg.obten_page_sesn ()
                                                ,rec_info_extra.va_schem
                                                ,rec_info_extra.va_table
                                                ,'O');

      if var_item_rechr.first () is not null
      then
        for i in var_item_rechr.first () .. var_item_rechr.last ()
        loop
          htp.p (   '  afw_13_rechr_init_item ("'
                 || var_item_rechr (i).nom_item
                 || '",'
                 || case when var_item_rechr (i).indic_rechr = 'O' then 'true' else 'false' end
                 || ');');
        end loop;
      end if;

      htp.p ('  ');
      htp.p ('}');
      htp.p ('');
      htp.p ('afw.jQuery().ready(function () {afw_13_rechr_init();});');
      htp.p ('// -->');
      htp.p ('</script>');
    /*htp.p (
                        '<input type="hidden" id="p" name="p" value="' ||
      afw_11_prodt_pkg.obten_numr_apex_prodt(afw_11_prodt_pkg.obten_prodt('SAF')) ||
      ':AFW_13_RECHR' ||
      ':' || afw_07_util_pkg.nv('SESSION') ||
      '" />'
    );*/
    end if;
  end;

  procedure efect_rechr
  is
    /*vnu_app_id        number default afw_07_util_pkg.nv('APP_ID');
                vnu_app_page_id   number default afw_07_util_pkg.nv('APP_PAGE_ID');*/

    vnu_count        number;
    rec_info_extra   afw_13_page_pkg.typ_info_extra;
    vnu_ref_page     number;
    vva_where        varchar2 (4000);
    vva_sql          varchar2 (4000);
    var_item_rechr   afw_13_navgt_noyau_pkg.typ_arr_item_rechr;
  begin
    rec_info_extra   := afw_13_page_pkg.obten_info_extra ();

    begin
      vnu_ref_page   := afw_13_page_pkg.obten_page_sesn ();
    exception
      when no_data_found
      then
        vnu_ref_page   := null;
    end;

    if rec_info_extra.va_table is not null
    then
      if not gbo_rempl_filtr_auto
      then
        vva_where   := null;

        var_item_rechr      :=
          afw_13_navgt_noyau_pkg.obten_item_rechr (vnu_ref_page
                                                  ,rec_info_extra.va_schem
                                                  ,rec_info_extra.va_table);

        if var_item_rechr.first () is not null
        then
          for i in var_item_rechr.first () .. var_item_rechr.last ()
          loop
            -- Vérifier le type de données
            var_item_rechr (i).type_don      :=
              obten_type_don_coln (rec_info_extra.va_schem
                                  ,rec_info_extra.va_table
                                  ,var_item_rechr (i).nom_coln);

            if lower (var_item_rechr (i).valr_rechr) = '%null%'
            then
              var_item_rechr (i).valr_rechr   := null;
            end if;

            if     var_item_rechr (i).valr_rechr is not null
               and var_item_rechr (i).type_don in ('VARCHAR2'
                                                  ,'NUMBER'
                                                  ,'DATE'
                                                  ,'CLOB')
            then
              if vva_where is null
              then
                vva_where   := ' where ';
              else
                vva_where      :=
                     vva_where
                  || ' and ';
              end if;

              -- Traiter comme un varchar2
              if var_item_rechr (i).type_don = 'CLOB'
              then
                var_item_rechr (i).type_don   := 'VARCHAR2';
              end if;

              case var_item_rechr (i).type_don
                when 'VARCHAR2'
                then
                  vva_where      :=
                       vva_where
                    || formt_filtr_varch (   'r$.'
                                          || var_item_rechr (i).nom_coln
                                         ,var_item_rechr (i).valr_rechr);
                when 'NUMBER'
                then
                  vva_where      :=
                       vva_where
                    || formt_filtr_numbr (   'r$.'
                                          || var_item_rechr (i).nom_coln
                                         ,var_item_rechr (i).valr_rechr
                                         ,var_item_rechr (i).formt);
                when 'DATE'
                then
                  vva_where      :=
                       vva_where
                    || formt_filtr_date (   'r$.'
                                         || var_item_rechr (i).nom_coln
                                        ,var_item_rechr (i).valr_rechr
                                        ,var_item_rechr (i).formt);
              end case;
            end if;
          end loop;
        end if;
      end if;

      if vva_where is null
      then
        vva_where   := ' where 1=1';
      end if;

      vva_where      :=
           vva_where
        || gva_filtr_persn;

      vva_sql       :=
           'select r$.'
        || rec_info_extra.va_coln_pk1
        || case
             when rec_info_extra.va_coln_pk2 is not null
             then
                  ', r$'
               || rec_info_extra.va_coln_pk2
             else
               null
           end
        || ' from '
        || case
             when rec_info_extra.va_schem is not null
             then
                  rec_info_extra.va_schem
               || '.'
             else
               null
           end
        || rec_info_extra.va_table
        || ' r$'
        || vva_where;

      gnu_ref_ir    := null;
      gnu_rpts_id   := null;

      creer_contx_navgt (vva_sql);
      obten_premr_enreg ();
      alimn_contx_exect ();

      if gnu_sspc is null
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('RCH.000001'
                                                ,pva_code_prodt   => 'AFW');
      end if;
    else
      -- Pas de processus fetch, ne rien faire
      null;
    end if;

    afw_07_util_pkg.reint_etat_sesn_page (afw_07_util_pkg.nv ('APP_PAGE_ID'));

    afw_08_url_pkg.redrg_page_postn (afw_04_contx_pkg.genr_url_en_contx (afw_07_util_pkg.nv ('APP_PAGE_ID')));
  /*exception
                    when others then
    raise;*/
  end;
/*procedure acept_rechr
      is
  vva_nom         varchar2(100);
  vva_valr        varchar2(32000);
begin
  afw_07_util_pkg.defnr_etat_sessn ('SESSION', afw_reprt_noyau_pkg.gnu_sesn);
  select app_user
    into vva_valr
    from vd_afw_12_sesn;
  afw_07_util_pkg.defnr_etat_sessn ('APP_USER', vva_valr);
  while afw_reprt_noyau_pkg.obten_parmt (vva_nom, vva_valr) loop
    afw_07_util_pkg.defnr_etat_sessn (upper(vva_nom), vva_valr);
  end loop;
  afw_07_util_pkg.defnr_etat_sessn ('APP_ID', afw_07_util_pkg.v('PFLOWID'));
  afw_07_util_pkg.defnr_etat_sessn ('APP_PAGE_ID', afw_07_util_pkg.v('PFLOWSTEPID'));
  gnu_page_courn := afw_07_util_pkg.nv('PFLOWSTEPID');
  efect_rechr ();
  afw_08_url_pkg.redrg_page_postn (
    'f?p=' ||
    afw_07_util_pkg.v('APP_ID') || ':' ||
    afw_07_util_pkg.v('APP_PAGE_ID') || ':' ||
    afw_07_util_pkg.v('SESSION')
  );
exception
when others then
  raise;
end;*/

end afw_13_navgt_pkg;
/
