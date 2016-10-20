SET DEFINE OFF;
create or replace package body afw_04_contx_pkg
as
  contx_intrv               exception;
  fil_arian_intrv           exception;
  gbo_mode_debug   constant boolean default false;

  procedure synch_varbl (pnu_ofset_fil   in number default 0
                        ,pnu_fa_courn    in number default afw_04_fil_arian_pkg.obten_fa_courn ())
  is
    vnu_seqnc_fil_arian         number;
    vnu_seqnc_fil_arian_sourc   number;
    vva_contx_formt             vd_afw_04_contx.contx_formt%type;

    /*
    Contexte
    */
    vva_contx                   vd_afw_04_contx.contx%type;
    vva_actio                   vd_afw_04_contx.actio%type;
    vnu_seqnc_contx             vd_afw_04_contx.seqnc_contx%type;
    /*
    Contexte intermédiaire
    */
    vva_contx_inter             vd_afw_04_contx.contx_inter%type;
    vva_actio_inter             vd_afw_04_contx.actio_inter%type;
    vnu_seqnc_contx_inter       vd_afw_04_contx.seqnc_contx_inter%type;
    /*
    Contexte source
    */
    vva_contx_sourc             vd_afw_04_contx.contx_inter%type;
    vva_actio_sourc             vd_afw_04_contx.actio_inter%type;
    vnu_seqnc_contx_sourc       vd_afw_04_contx.seqnc_contx_inter%type;

    cursor cur_contx
    is
        select ctx.ref_fil_arian
              ,ctx.contx
              ,ctx.contx_formt
              ,ctx.actio
              ,ctx.seqnc_contx
              ,ctx.contx_inter
              ,ctx.actio_inter
              ,ctx.seqnc_contx_inter
          from vd_afw_04_contx   ctx
              ,vd_afw_04_fil_arian fil
         where     ctx.ref_fil_arian = fil.seqnc
               and (   ctx.indic_ignor = 'N'
                    or ctx.indic_ignor is null)
      order by fil.timst desc;

    cursor cur_sourc_contx
    is
        select ctx.ref_fil_arian
              ,ctx.contx
              ,ctx.actio
              ,ctx.seqnc_contx
          from vd_afw_04_contx   ctx
              ,vd_afw_04_fil_arian fil
         where     ctx.ref_fil_arian = fil.seqnc
               and fil.seqnc <> vnu_seqnc_fil_arian
               and (   ctx.indic_ignor = 'N'
                    or ctx.indic_ignor is null)
      --               and (   (   'X'
      --                        || ctx.contx <>    'X'
      --                                        || vva_contx)
      --                    or (   ctx.contx_inter is not null
      --                        or ctx.actio_inter is not null
      --                        or ctx.seqnc_contx_inter is not null))
      order by fil.timst desc;
  begin
    vnu_seqnc_fil_arian   := pnu_fa_courn;

    if not afw_04_fil_arian_pkg.trait_page ()
    then
      return;
    end if;

    open cur_contx;

    --Skipper les offsets (et faire la vrai lecture)
    for i in 0 .. pnu_ofset_fil
    loop
      fetch cur_contx
        into vnu_seqnc_fil_arian
            ,vva_contx
            ,vva_contx_formt
            ,vva_actio
            ,vnu_seqnc_contx
            ,vva_contx_inter
            ,vva_actio_inter
            ,vnu_seqnc_contx_inter;
    end loop;

    if cur_contx%notfound
    then
      vnu_seqnc_fil_arian   := null;
    end if;

    close cur_contx;

    afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_CONTX'
                                     ,vva_contx);
    afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_CONTX_FORMT'
                                     ,vva_contx_formt);
    afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_ACTIO'
                                     ,vva_actio);
    afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_SEQNC_CONTX'
                                     ,vnu_seqnc_contx);

    --    ete ('vva_contx', vva_contx);
    --    ete ('vva_actio', vva_actio);
    --    ete ('vnu_seqnc_contx', vnu_seqnc_contx);

    -- S'il y a un contexte intermédiaire lié au contexte actuel (A_AFW_04_CONTX), ce contexte intermédiare sera la source (A_AFW_04_SOURC_CONTX).
    if    vva_contx_inter is not null
       or vva_actio_inter is not null
       or vnu_seqnc_contx_inter is not null
    then
      afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_SOURC_CONTX'
                                       ,vva_contx_inter);
      afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_SOURC_ACTIO'
                                       ,vva_actio_inter);
      afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_SOURC_SEQNC_CONTX'
                                       ,vnu_seqnc_contx_inter);
    --      ete ('vva_contx_inter', vva_contx_inter);
    --      ete ('vva_actio_inter', vva_actio_inter);
    --      ete ('vnu_seqnc_contx_inter', vnu_seqnc_contx_inter);
    else
      -- S'il y a un contexte source, il sera la source (A_AFW_04_SOURC_CONTX). Ignorer le contexte intermédiaire lié à ce contexte source.
      open cur_sourc_contx;

      --Skipper les offsets (et faire la vrai lecture)
      for i in 0 .. pnu_ofset_fil
      loop
        fetch cur_sourc_contx
          into vnu_seqnc_fil_arian_sourc
              ,vva_contx_sourc
              ,vva_actio_sourc
              ,vnu_seqnc_contx_sourc;
      end loop;

      close cur_sourc_contx;

      afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_SOURC_CONTX'
                                       ,vva_contx_sourc);
      afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_SOURC_ACTIO'
                                       ,vva_actio_sourc);
      afw_07_util_pkg.defnr_etat_sessn ('A_AFW_04_SOURC_SEQNC_CONTX'
                                       ,vnu_seqnc_contx_sourc);
    --      ete ('vva_contx_sourc', vva_contx_sourc);
    --      ete ('vva_actio_sourc', vva_actio_sourc);
    --      ete ('vnu_seqnc_contx_sourc', vnu_seqnc_contx_sourc);
    end if;
  end synch_varbl;

  procedure synch
  is
    --pragma autonomous_transaction;
    sidf_inval                  exception;
    sspc_inval                  exception;
    scpc_inval                  exception;
    sapc_inval                  exception;
    sspi_inval                  exception;
    scpi_inval                  exception;
    sapi_inval                  exception;
    snpi_inval                  exception;
    vnu_page                    number default afw_07_util_pkg.nv ('APP_PAGE_ID');
    vnu_page_inter              number;
    vnu_seqnc_fil_arian         number;
    vnu_seqnc_fil_arian_sourc   number;
    vva_contx                   vd_afw_04_contx.contx%type;
    vva_contx_formt             vd_afw_04_contx.contx_formt%type;
    vva_actio                   vd_afw_04_contx.actio%type;
    vnu_seqnc_contx             vd_afw_04_contx.seqnc_contx%type;
    vva_contx_inter             vd_afw_04_contx.contx_inter%type;
    vva_actio_inter             vd_afw_04_contx.actio_inter%type;
    vnu_seqnc_contx_inter       vd_afw_04_contx.seqnc_contx_inter%type;
    vnu_seqnc_actue             vd_afw_04_contx.seqnc_contx%type;
    vva_nom_item_seqnc          varchar2 (30)
                                  default    'P'
                                          || to_char (vnu_page)
                                          || '_SEQNC';
    vbo_nouv_contx              boolean default false;
    vva_contx_tmp               vd_afw_04_contx.contx%type;
    vva_contx_formt_tmp         vd_afw_04_contx.contx_formt%type;
    vva_actio_tmp               vd_afw_04_contx.actio%type;
    vnu_seqnc_contx_tmp         vd_afw_04_contx.seqnc_contx%type;
    vva_contx_inter_tmp         vd_afw_04_contx.contx_inter%type;
    vva_actio_inter_tmp         vd_afw_04_contx.actio_inter%type;
    vnu_seqnc_contx_inter_tmp   vd_afw_04_contx.seqnc_contx_inter%type;
    vva_parmt_url               varchar2 (2000) default afw_07_util_pkg.obten_parmt_url ();
    vva_indic_ignor             varchar2 (1);

    cursor cur_item (pnu_seqnc_fil_arian in number)
    is
      select ce.type_elemn
            ,ce.valr_varch
            ,ce.valr_numbr
            ,ce.nom
        from vd_afw_04_contx_etend ce
       where     ce.ref_contx = pnu_seqnc_fil_arian
             and (   ce.type_alimn = 'A'
                  or ce.type_alimn = 'RMA')
             and ce.page_cible is null;

    procedure nulfr_varbl_contx
    is
    begin
      -- Nullifier les S*PC et S*PI
      afw_07_util_pkg.defnr_etat_sessn ('SCPC'
                                       ,null);
      afw_07_util_pkg.defnr_etat_sessn ('SAPC'
                                       ,null);
      afw_07_util_pkg.defnr_etat_sessn ('SSPC'
                                       ,null);
      afw_07_util_pkg.defnr_etat_sessn ('SCPI'
                                       ,null);
      afw_07_util_pkg.defnr_etat_sessn ('SAPI'
                                       ,null);
      afw_07_util_pkg.defnr_etat_sessn ('SSPI'
                                       ,null);
      afw_07_util_pkg.defnr_etat_sessn ('SNPI'
                                       ,null);
    end nulfr_varbl_contx;

    function est_dans_url (pva_varbl in varchar2)
      return boolean
    is
      vnu_pos_1             number;
      vnu_pos_2             number;
      vva_varbl_asign_url   varchar2 (2000);
    begin
      -- Recuperer les parametres assignes dans l'URL
      vnu_pos_1      :=
        instr (vva_parmt_url
              ,':'
              ,1
              ,6);

      if vnu_pos_1 > 0
      then
        vnu_pos_2      :=
          instr (vva_parmt_url
                ,':'
                ,1
                ,7);

        if vnu_pos_2 = 0
        then
          vnu_pos_2   := length (vva_parmt_url);
        end if;

        vva_varbl_asign_url      :=
             ','
          || upper (substr (vva_parmt_url
                           ,vnu_pos_1 + 1
                           ,vnu_pos_2 - vnu_pos_1 - 1))
          || ',';
      else
        vva_varbl_asign_url   := null;
      end if;

      -- Utiliser le contexte du URL s'il a ete precise
      return instr (upper (vva_varbl_asign_url)
                   ,   ','
                    || upper (pva_varbl)
                    || ',') > 0;
    end est_dans_url;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 04 Contx - Synchroniser le contexte');

    if not afw_04_fil_arian_pkg.trait_page ()
    then
      return;
    end if;

    begin
      begin
        vnu_seqnc_fil_arian   := afw_04_fil_arian_pkg.obten_fa_courn ();
      exception
        when others
        then
          raise sidf_inval;
      end;

      begin
        vnu_seqnc_contx   := afw_07_util_pkg.nv ('SSPC');
      exception
        when others
        then
          raise sspc_inval;
      end;

      begin
        vva_contx   := afw_07_util_pkg.v ('SCPC');
      exception
        when others
        then
          raise scpc_inval;
      end;

      begin
        vva_actio   := afw_07_util_pkg.v ('SAPC');
      exception
        when others
        then
          raise sapc_inval;
      end;

      begin
        vnu_seqnc_contx_inter   := afw_07_util_pkg.nv ('SSPI');
      exception
        when others
        then
          raise sspi_inval;
      end;

      begin
        vva_contx_inter   := afw_07_util_pkg.v ('SCPI');
      exception
        when others
        then
          raise scpi_inval;
      end;

      begin
        vva_actio_inter   := afw_07_util_pkg.v ('SAPI');
      exception
        when others
        then
          raise sapi_inval;
      end;

      begin
        vnu_page_inter   := afw_07_util_pkg.nv ('SNPI');
      exception
        when others
        then
          raise snpi_inval;
      end;

      begin
        select contx
              ,contx_formt
              ,actio
              ,seqnc_contx
              ,contx_inter
              ,actio_inter
              ,seqnc_contx_inter
          into vva_contx_tmp
              ,vva_contx_formt_tmp
              ,vva_actio_tmp
              ,vnu_seqnc_contx_tmp
              ,vva_contx_inter_tmp
              ,vva_actio_inter_tmp
              ,vnu_seqnc_contx_inter_tmp
          from vd_afw_04_contx
         where     ref_fil_arian = vnu_seqnc_fil_arian
               and rownum = 1;

        -- Utiliser le contexte du URL s'il a ete precise
        if est_dans_url ('SCPC')
        then
          update vd_afw_04_contx
             set contx         = vva_contx
                ,contx_formt   = vva_contx_formt
           where ref_fil_arian = vnu_seqnc_fil_arian;
        else
          vva_contx         := vva_contx_tmp;
          vva_contx_formt   := vva_contx_formt_tmp;
        end if;

        -- Utiliser l'action du URL si elle a ete precisee
        if     est_dans_url ('SAPC')
           and (   vva_actio not like 'X%'
                or vva_actio is null)
        then
          update vd_afw_04_contx
             set actio   = vva_actio
           where ref_fil_arian = vnu_seqnc_fil_arian;
        else
          vva_actio   := vva_actio_tmp;
        end if;

        -- Utiliser la sequence de contexte du URL si elle a ete precisee
        if est_dans_url ('SSPC')
        then
          update vd_afw_04_contx
             set seqnc_contx   = vnu_seqnc_contx
           where ref_fil_arian = vnu_seqnc_fil_arian;
        else
          vnu_seqnc_contx   := vnu_seqnc_contx_tmp;
        end if;

        -- Utiliser le contexte intermediaire du URL s'il a ete precise
        if est_dans_url ('SCPI')
        then
          update vd_afw_04_contx
             set contx_inter   = vva_contx_inter
           where ref_fil_arian = vnu_seqnc_fil_arian;
        else
          vva_contx_inter   := vva_contx_inter_tmp;
        end if;

        -- Utiliser l'action intermediaire du URL si elle a ete precisee
        if     est_dans_url ('SAPI')
           and (   vva_actio_inter not like 'X%'
                or vva_actio_inter is null)
        then
          update vd_afw_04_contx
             set actio_inter   = vva_actio_inter
           where ref_fil_arian = vnu_seqnc_fil_arian;
        else
          vva_actio_inter   := vva_actio_inter_tmp;
        end if;

        -- Utiliser la sequence de contexte intermediaire du URL si elle a ete precisee
        if est_dans_url ('SSPI')
        then
          update vd_afw_04_contx
             set seqnc_contx_inter   = vnu_seqnc_contx_inter
           where ref_fil_arian = vnu_seqnc_fil_arian;
        else
          vnu_seqnc_contx_inter   := vnu_seqnc_contx_inter_tmp;
        end if;
      exception
        -- Créer le contexte s'il n'existe pas
        when no_data_found
        then
          -- S'il est null, recuperer le contexte par defaut associé à la page
          if vva_contx is null
          then
            begin
              select sa.code
                into vva_contx
                from vd_afw_12_struc_aplic sa
                    ,vd_afw_13_page        pg
               where     sa.seqnc = pg.ref_struc_aplic
                     and pg.numr_apex = vnu_page
                     and pg.ref_aplic = afw_11_aplic_pkg.obten_aplic_sesn ();
            exception
              when no_data_found
              then
                vva_contx   := null;
              when others
              then
                raise;
            end;
          end if;

          -- Vider l'action si c'est un META
          if vva_actio like 'X%'
          then
            vva_actio   := null;
          end if;

          /*-- Déterminer si on doit ignorer le contexte courant
                              vva_indic_ignor := 'N';
          if    vva_actio is null
            and vnu_seqnc_contx is null
            and vva_contx_inter is null
            and vva_actio_inter is null
            and vnu_seqnc_contx_inter is null
            and not est_dans_url ('SCPC')
            and not est_dans_url ('SAPC')
            and not est_dans_url ('SSPC')
            and not est_dans_url ('SCPI')
            and not est_dans_url ('SAPI')
            and not est_dans_url ('SSPI')
          then
            -- Traiter le context à part
            -- S'il est null ou identique au dernier non-ignoré, on ignore
            if vva_contx is null then
              vva_indic_ignor := 'O';
            else
              declare
                vva_dernr_contx     vd_i_afw_04_contx.contx%type;
              begin
                select contx
                  into vva_dernr_contx
                from (select ctx.contx
                      from vd_afw_04_contx ctx,
                           vd_afw_04_fil_arian fil
                      where     ctx.ref_fil_arian = fil.seqnc
                            and (ctx.indic_ignor = 'N' or ctx.indic_ignor is null)
                      order by fil.timst desc)
                where rownum = 1;
                if upper(vva_contx) = (vva_dernr_contx) then
                  vva_indic_ignor := 'O';
                end if;
              exception
              when no_data_found then
                vva_dernr_contx := null;
              end;
            end if;
          end if;*/

          -- Déterminer si on doit récupérer le contexte précédent
          if     vnu_seqnc_contx is null
             and vva_contx_inter is null
             and vva_actio_inter is null
             and vnu_seqnc_contx_inter is null
             and not est_dans_url ('SCPC')
             and not est_dans_url ('SSPC')
             and not est_dans_url ('SCPI')
             and not est_dans_url ('SAPI')
             and not est_dans_url ('SSPI')
          then
            -- Traiter le context à part
            -- S'il est null ou identique au dernier non-ignoré, on ignore
            if vva_contx is null
            then
              vva_indic_ignor   := 'O';
            else
              declare
                vva_dernr_contx   vd_i_afw_04_contx.contx%type;
              begin
                select contx
                  into vva_dernr_contx
                  from (  select ctx.contx
                            from vd_afw_04_contx   ctx
                                ,vd_afw_04_fil_arian fil
                           where     ctx.ref_fil_arian = fil.seqnc
                                 and (   ctx.indic_ignor = 'N'
                                      or ctx.indic_ignor is null)
                        order by fil.timst desc)
                 where rownum = 1;

                if upper (vva_contx) = (vva_dernr_contx)
                then
                  vva_indic_ignor   := 'O';
                end if;
              exception
                when no_data_found
                then
                  vva_dernr_contx   := null;
              end;
            end if;
          end if;

          -- Si elle est null, recuperer la sequence depuis la variable PXX_SEQNC
          /*if vnu_seqnc_contx is null then
                                                              vnu_seqnc_contx := afw_07_util_pkg.nv (vva_nom_item_seqnc);
          end if;*/

          if vnu_page_inter is not null
          then
            vnu_seqnc_fil_arian_sourc   := afw_04_fil_arian_pkg.obten_seqnc_fa_de_page_dest (vnu_page_inter);

            if vnu_seqnc_fil_arian_sourc is not null
            then
              declare
                vnu_nombr_updat   number;
              begin
                -- Tenter l'update
                update vd_afw_04_contx
                   set contx         = vva_contx_inter
                      ,actio         = vva_actio_inter
                      ,seqnc_contx   = vnu_seqnc_contx_inter
                 where ref_fil_arian = vnu_seqnc_fil_arian_sourc;

                vnu_nombr_updat   := sql%rowcount;

                if vnu_nombr_updat = 0
                then
                  insert into vd_afw_04_contx (ref_fil_arian
                                              ,contx
                                              ,actio
                                              ,seqnc_contx)
                       values (vnu_seqnc_fil_arian_sourc
                              ,vva_contx_inter
                              ,vva_actio_inter
                              ,vnu_seqnc_contx_inter);
                end if;
              end;

              vva_contx_inter         := null;
              vva_actio_inter         := null;
              vnu_seqnc_contx_inter   := null;
            end if;
          end if;

          --TODO::TRESE
          --Pour l'instant, ne jamais ignorer
          vva_indic_ignor   := 'N';

          insert into vd_afw_04_contx (ref_fil_arian
                                      ,contx
                                      ,contx_formt
                                      ,actio
                                      ,seqnc_contx
                                      ,contx_inter
                                      ,actio_inter
                                      ,seqnc_contx_inter
                                      ,indic_ignor)
               values (vnu_seqnc_fil_arian
                      ,vva_contx
                      ,vva_contx_formt
                      ,vva_actio
                      ,vnu_seqnc_contx
                      ,vva_contx_inter
                      ,vva_actio_inter
                      ,vnu_seqnc_contx_inter
                      ,vva_indic_ignor);

          vbo_nouv_contx    := true;
        when others
        then
          raise;
      end;

      -- Synchroniser les variables
      synch_varbl;

      -- Nullifier les S*PC et S*PI
      nulfr_varbl_contx ();

      if vbo_nouv_contx
      then
        afw_07_util_pkg.reint_etat_sesn_page (vnu_page);
      end if;

      -- Verifier s'il existe un item nomme 'Px_SEQNC' ou x est le numero de page
      if afw_07_util_pkg.exist_item (vva_nom_item_seqnc)
      then
        vnu_seqnc_actue   := afw_07_util_pkg.nv (vva_nom_item_seqnc);

        -- Si la sequence de l'item est differente de la sequence du contexte
        -- vider la cache de la page
        --if (   vnu_seqnc_actue is not null
        --    or vnu_seqnc_contx is not null) and (vnu_seqnc_actue <> vnu_seqnc_contx) then
        if    (    vnu_seqnc_actue is null
               and vnu_seqnc_contx is null)
           or (vnu_seqnc_actue = vnu_seqnc_contx)
        then
          null;
        else
          if not vbo_nouv_contx
          then
            afw_07_util_pkg.reint_etat_sesn_page (vnu_page);
          end if;
        end if;

        -- Definir l'item de sequence avec la valeur du contexte
        afw_07_util_pkg.defnr_etat_sessn (vva_nom_item_seqnc
                                         ,vnu_seqnc_contx);
      end if;

      --Obtenir tous les elements de contexte etendu dont la page cible est 'O' pour les lier au contexte courant
      --trouver l'element de fil d'ariane superieur pour verifier s'il existe des

      select ref_elemn_sup
        into vnu_seqnc_fil_arian_sourc
        from vd_afw_04_fil_arian
       where seqnc = vnu_seqnc_fil_arian;

      --      delete vd_afw_04_contx_etend
      --       where ref_contx = vnu_seqnc_fil_arian;

      update vd_afw_04_contx_etend ce
         set ce.ref_contx    = vnu_seqnc_fil_arian
            ,ce.page_cible   = null
       where     ce.page_cible = 'O'
             and ce.ref_contx = vnu_seqnc_fil_arian_sourc;

      --Supprimer les elements provenant du retour d'un contexte (Assignation enfant vers parent)
      delete vd_afw_04_contx_etend ce
       where     ce.ref_contx <= vnu_seqnc_fil_arian_sourc
             and type_alimn like 'RC%';

      --Assigner les items a leur items de page lorsqu'ils sont de type d'alimentation A et RMA
      --(automatique et automatique suite au retour d'un appel modal) et de type d'element 'II (item)
      for rec_item in cur_item (vnu_seqnc_fil_arian)
      loop
        if afw_07_util_pkg.exist_item (rec_item.nom)
        then
          if rec_item.type_elemn = 'I'
          then
            if afw_07_util_pkg.exist_item (rec_item.valr_varch)
            then
              afw_07_util_pkg.defnr_etat_sessn (rec_item.nom
                                               ,afw_07_util_pkg.v (rec_item.valr_varch));
            else
              afw_07_util_pkg.defnr_etat_sessn (rec_item.nom
                                               ,null);
            end if;
          else
            afw_07_util_pkg.defnr_etat_sessn (rec_item.nom
                                             ,nvl (rec_item.valr_varch, rec_item.valr_numbr));
          end if;
        end if;
      end loop;

      -- Mettre a jour la sequence du contexte, au cas ou une affectation
      -- de contexte etendue l'aurait modifiee
      maj_seqnc_contx ();

      delete from vd_afw_04_contx_etend
            where     ref_contx = vnu_seqnc_fil_arian
                  and type_alimn like 'RM%';
    --commit;
    exception
      when sidf_inval
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000003'
                                                ,afw_04_fil_arian_pkg.obten_fa_courn ()
                                                ,pva_code_prodt   => 'AFW');
      when sspc_inval
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000004'
                                                ,'SSPC'
                                                ,afw_07_util_pkg.v ('SSPC')
                                                ,pva_code_prodt   => 'AFW');
      when scpc_inval
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000005'
                                                ,'SCPC'
                                                ,afw_07_util_pkg.v ('SCPC')
                                                ,pva_code_prodt   => 'AFW');
      when sapc_inval
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000006'
                                                ,'SAPC'
                                                ,afw_07_util_pkg.v ('SAPC')
                                                ,pva_code_prodt   => 'AFW');
      when sspi_inval
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000004'
                                                ,'SSPI'
                                                ,afw_07_util_pkg.v ('SSPI')
                                                ,pva_code_prodt   => 'AFW');
      when scpi_inval
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000005'
                                                ,'SCPI'
                                                ,afw_07_util_pkg.v ('SCPI')
                                                ,pva_code_prodt   => 'AFW');
      when sapi_inval
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000006'
                                                ,'SAPI'
                                                ,afw_07_util_pkg.v ('SAPI')
                                                ,pva_code_prodt   => 'AFW');
      when snpi_inval
      then
        afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000004'
                                                ,'SNPI'
                                                ,afw_07_util_pkg.v ('SNPI')
                                                ,pva_code_prodt   => 'AFW');
    end;
  exception
    when others
    then
      nulfr_varbl_contx ();
      raise;
  --commit;
  end synch;

  procedure maj (pnu_seqnc_contx   in afw_04_contx.seqnc_contx%type default null
                ,pva_actio         in afw_04_contx.actio%type default null
                ,pva_contx         in afw_04_contx.contx%type default null)
  is
    vnu_seqnc_fil_arian   number default afw_04_fil_arian_pkg.obten_fa_courn ();
  begin
    update vd_afw_04_contx
       set contx         = nvl (pva_contx, contx)
          ,contx_formt   = nvl (pva_contx, contx_formt)
          ,actio         = nvl (pva_actio, actio)
          ,seqnc_contx   = nvl (pnu_seqnc_contx, seqnc_contx)
     where ref_fil_arian = vnu_seqnc_fil_arian;

    if sql%rowcount = 0
    then
      raise contx_intrv;
    end if;
  end maj;

  procedure maj_seqnc_contx
  is
    vnu_seqnc_fil_arian   number default afw_04_fil_arian_pkg.obten_fa_courn ();
    vnu_page              number default afw_07_util_pkg.nv ('APP_PAGE_ID');
    vva_nom_item_seqnc    varchar2 (30)
                            default    'P'
                                    || to_char (vnu_page)
                                    || '_SEQNC';
    vnu_seqnc_contx       vd_afw_04_contx.seqnc_contx%type;
  begin
    if not afw_04_fil_arian_pkg.trait_page ()
    then
      return;
    end if;

    if afw_07_util_pkg.exist_item (vva_nom_item_seqnc)
    then
      vnu_seqnc_contx   := afw_07_util_pkg.nv (vva_nom_item_seqnc);

      --maj (vnu_seqnc_contx);
      update vd_afw_04_contx
         set seqnc_contx   = vnu_seqnc_contx
       where ref_fil_arian = vnu_seqnc_fil_arian;
    end if;
  end maj_seqnc_contx;

  procedure defnr_contx_etend (pva_nom           in varchar2
                              ,pnu_valr          in number
                              ,pva_valr          in varchar2
                              ,pva_type_alimn    in varchar2
                              ,pva_type_elemn    in varchar2
                              ,pbo_page_cible    in boolean
                              ,pva_struc_aplic   in varchar2 default null)
  is
    vnu_seqnc_fil_arian   number default afw_04_fil_arian_pkg.obten_fa_courn (); -- A_AFW_04_SEQNC_PROVN
    vva_page_cible        varchar2 (1);
    vnu_row_count         number;
  begin
    if pbo_page_cible
    then
      vva_page_cible   := 'O';
    end if;

    if pva_struc_aplic is not null
    then
      vnu_seqnc_fil_arian   := afw_04_contx_pkg.obten_seqnc_fa_contx (pva_struc_aplic);
    end if;

    update vd_afw_04_contx_etend
       set valr_numbr   = pnu_valr
          ,valr_varch   = pva_valr
          ,type_alimn   = pva_type_alimn
          ,type_elemn   = pva_type_elemn
     where     ref_contx = vnu_seqnc_fil_arian --vnu_contx_seqnc
           and upper (nom) = upper (pva_nom)
           and (   (    vva_page_cible = 'O'
                    and page_cible = 'O')
                or (    vva_page_cible is null
                    and page_cible is null));

    vnu_row_count   := sql%rowcount;

    if vnu_row_count = 0
    then
      insert into vd_afw_04_contx_etend (ref_contx
                                        ,nom
                                        ,valr_numbr
                                        ,valr_varch
                                        ,page_cible
                                        ,type_alimn
                                        ,type_elemn)
           values (vnu_seqnc_fil_arian
                  , --vnu_contx_seqnc,
                   pva_nom
                  ,pnu_valr
                  ,pva_valr
                  ,vva_page_cible
                  ,pva_type_alimn
                  ,pva_type_elemn);
    end if;
  end defnr_contx_etend;

  procedure defnr_contx_etend_numbr (pva_nom           in varchar2
                                    ,pnu_valr          in number
                                    ,pva_type_alimn    in varchar2 default 'A'
                                    ,pbo_page_cible    in boolean default true
                                    ,pva_struc_aplic   in varchar2 default null)
  is
  begin
    defnr_contx_etend (pva_nom
                      ,pnu_valr
                      ,null
                      ,pva_type_alimn
                      ,'V'
                      , -- Valeur
                       pbo_page_cible
                      ,pva_struc_aplic);
  end defnr_contx_etend_numbr;

  procedure defnr_contx_etend_varch (pva_nom           in varchar2
                                    ,pva_valr          in varchar2
                                    ,pva_type_alimn    in varchar2 default 'A'
                                    ,pbo_page_cible    in boolean default true
                                    ,pva_struc_aplic   in varchar2 default null)
  is
  begin
    defnr_contx_etend (pva_nom
                      ,null
                      ,pva_valr
                      ,pva_type_alimn
                      ,'V'
                      , -- Valeur
                       pbo_page_cible
                      ,pva_struc_aplic);
  end defnr_contx_etend_varch;

  procedure defnr_contx_etend_item (pva_nom           in varchar2
                                   ,pva_item          in varchar2
                                   ,pva_type_alimn    in varchar2 default 'A'
                                   ,pbo_page_cible    in boolean default true
                                   ,pva_struc_aplic   in varchar2 default null)
  is
  begin
    defnr_contx_etend (pva_nom
                      ,null
                      ,pva_item
                      ,pva_type_alimn
                      ,'I'
                      , -- Item
                       pbo_page_cible
                      ,pva_struc_aplic);
  end defnr_contx_etend_item;

  procedure defnr_contx_etend_contx (pva_struc_aplic   in varchar2
                                    ,pva_nom           in varchar2
                                    ,pva_valr          in varchar2 default null
                                    ,pnu_valr          in number default null
                                    ,pva_item          in varchar2 default null)
  is
  begin
    defnr_contx_etend (pva_nom
                      ,pnu_valr
                      ,case when pva_valr is not null then pva_valr else pva_item end
                      ,'RC'
                      ,case when pva_item is not null then 'I' else 'V' end
                      ,false
                      ,pva_struc_aplic);
  end defnr_contx_etend_contx;

  procedure obten_contx_etend (pva_nom    in     varchar2
                              ,pva_valr      out varchar2
                              ,pnu_valr      out number)
  is
  begin
    /*
      ete ('SIDF'
          ,afw_04_fil_arian_pkg.obten_fa_courn());
      ete ('pva_nom'
          ,pva_nom);
  */
    select valr_numbr
          ,valr_varch
      into pnu_valr
          ,pva_valr
      from vd_i_afw_04_contx_etend ce
     where     ce.ref_contx = afw_04_fil_arian_pkg.obten_fa_courn ()
           and ce.nom = pva_nom
           and page_cible is null;
  /*
      ete ('pva_valr'
          ,pva_valr);
          */
  exception
    when no_data_found
    then
      null;
    when too_many_rows
    then
      null;
  end obten_contx_etend;

  function obten_contx_etend_numbr (pva_nom in varchar2)
    return number
  is
    vva_valr   varchar2 (200);
    vnu_valr   number;
  begin
    obten_contx_etend (pva_nom
                      ,vva_valr
                      ,vnu_valr);
    return vnu_valr;
  end obten_contx_etend_numbr;

  function obten_contx_etend_varch (pva_nom in varchar2)
    return varchar2
  is
    vva_valr   varchar2 (200);
    vnu_valr   number;
  begin
    obten_contx_etend (pva_nom
                      ,vva_valr
                      ,vnu_valr);
    return vva_valr;
  end obten_contx_etend_varch;

  function verif_contx_etend_item_page (pva_nom in varchar2)
    return boolean
  is
    vnu_exist   number (1);
    vnu_sidf    vd_afw_04_fil_arian.seqnc%type := afw_04_fil_arian_pkg.obten_fa_courn ();
  begin
    select 1
      into vnu_exist
      from vd_afw_04_contx_etend ce
     where     ce.ref_contx = vnu_sidf
           and ce.nom = pva_nom;

    return true;
  exception
    when no_data_found
    then
      return false;
  end verif_contx_etend_item_page;

  procedure deplc_contx_etend (pnu_contx         in number
                              ,pnu_contx_parnt   in number)
  is
  begin
    update vd_afw_04_contx_etend ce
       set ce.ref_contx   = pnu_contx_parnt
     where     ce.page_cible = 'O'
           and ce.ref_contx = pnu_contx;
  end deplc_contx_etend;

  function obten_contx (pva_contx         in     afw_04_contx.contx%type
                       ,pva_actio         in out afw_04_contx.actio%type
                       ,pnu_seqnc_contx      out afw_04_contx.seqnc_contx%type)
    return number
  is
    vnu_seqnc_fil_arian   vd_afw_04_contx.ref_fil_arian%type;

    -- Prendre le plus recent
    cursor cur_contx (pva_contx   in     afw_04_contx.contx%type
                     ,pva_actio   in out afw_04_contx.actio%type)
    is
      select ref_fil_arian
            ,actio
            ,seqnc_contx
        from (  select ctx.ref_fil_arian
                      ,ctx.actio
                      ,ctx.seqnc_contx
                  from vd_afw_04_contx   ctx
                      ,vd_afw_04_fil_arian fil
                 where     ctx.contx = pva_contx
                       and (   pva_actio is null
                            or ctx.actio = pva_actio)
                       and fil.seqnc = ctx.ref_fil_arian
              order by fil.timst desc)
       where rownum = 1
      union all
      select ref_fil_arian
            ,actio_inter
            ,seqnc_contx_inter
        from (  select ctx.ref_fil_arian
                      ,ctx.actio_inter
                      ,ctx.seqnc_contx_inter
                  from vd_afw_04_contx   ctx
                      ,vd_afw_04_fil_arian fil
                 where     ctx.contx_inter = pva_contx
                       and (   pva_actio is null
                            or ctx.actio_inter = pva_actio)
                       and fil.seqnc = ctx.ref_fil_arian
              order by fil.timst desc)
       where rownum = 1
      order by ref_fil_arian desc;
  begin
    open cur_contx (pva_contx
                   ,pva_actio);

    fetch cur_contx
      into vnu_seqnc_fil_arian
          ,pva_actio
          ,pnu_seqnc_contx;

    close cur_contx;

    return vnu_seqnc_fil_arian;
  exception
    when no_data_found
    then
      ete ('NDF obten_contx');
      return null;
  end obten_contx;

  function cherc_contx (pva_contx   in afw_04_contx.contx%type
                       ,pva_actio   in afw_04_contx.actio%type default null)
    return number
  is
    vva_actio         vd_afw_04_contx.actio%type default pva_actio;
    vnu_seqnc_contx   vd_afw_04_contx.seqnc_contx%type;
  begin
    return obten_contx (pva_contx
                       ,vva_actio
                       ,vnu_seqnc_contx);
  end cherc_contx;

  function obten_seqnc_contx (pva_contx   in afw_04_contx.contx%type
                             ,pva_actio   in afw_04_contx.actio%type default null)
    return number
  is
    vnu_seqnc_fil_arian   vd_afw_04_contx.ref_fil_arian%type;
    vva_actio             vd_afw_04_contx.actio%type default pva_actio;
    vnu_seqnc_contx       vd_afw_04_contx.seqnc_contx%type;
  begin
    vnu_seqnc_fil_arian      :=
      obten_contx (pva_contx
                  ,vva_actio
                  ,vnu_seqnc_contx);
    return vnu_seqnc_contx;
  end obten_seqnc_contx;

  function obten_seqnc_fa_contx (pva_contx   in afw_04_contx.contx%type
                                ,pva_actio   in afw_04_contx.actio%type default null)
    return number
  is
    vnu_seqnc_fil_arian   vd_afw_04_contx.ref_fil_arian%type;
    vva_actio             vd_afw_04_contx.actio%type default pva_actio;
    vnu_seqnc_contx       vd_afw_04_contx.seqnc_contx%type;
  begin
    vnu_seqnc_fil_arian      :=
      obten_contx (pva_contx
                  ,vva_actio
                  ,vnu_seqnc_contx);
    return vnu_seqnc_fil_arian;
  end obten_seqnc_fa_contx;


  procedure defnr_seqnc_selon_contx (pva_contx         in afw_04_contx.contx%type
                                    ,pnu_seqnc_contx   in afw_04_contx.seqnc_contx%type)
  is
    vnu_seqnc_fa          afw_04_contx.ref_fil_arian%type;
    vva_actio             afw_04_contx.actio%type default null;
    vnu_seqnc_contx_tmp   afw_04_contx.seqnc_contx%type;
  begin
    vnu_seqnc_fa      :=
      obten_contx (pva_contx
                  ,vva_actio
                  ,vnu_seqnc_contx_tmp);

    if vnu_seqnc_fa is not null
    then
      update vd_afw_04_contx
         set seqnc_contx   = pnu_seqnc_contx
       where ref_fil_arian = vnu_seqnc_fa;
    end if;
  end defnr_seqnc_selon_contx;

  procedure obten_contx_etend (pva_nom     in     varchar2
                              ,pnu_seqnc   in     number
                              ,pnu_valr       out number
                              ,pva_valr       out varchar2)
  is
    vnu_seqnc_fil_arian   number default afw_04_fil_arian_pkg.obten_fa_courn (); -- A_AFW_04_SEQNC_PROVN
    vva_type_elemn        vd_afw_04_contx_etend.type_elemn%type;
    vnu_valr              vd_afw_04_contx_etend.valr_numbr%type;
    vva_valr              vd_afw_04_contx_etend.valr_varch%type;
    vva_item              vd_afw_04_contx_etend.valr_varch%type;
  begin
    -- Si une sequence de context a ete precise, utiliser celui-ci
    if pnu_seqnc is not null
    then
      vnu_seqnc_fil_arian   := pnu_seqnc;
    end if;

    -- Chercher le contexte etendu pour le nom precise
    begin
      select type_elemn
            ,valr_numbr
            ,valr_varch
        into vva_type_elemn
            ,vnu_valr
            ,vva_valr
        from vd_afw_04_contx_etend
       where     ref_contx = vnu_seqnc_fil_arian
             and nom = upper (pva_nom)
             and page_cible is null;
    exception
      when no_data_found
      then
        -- Si le contexte etendu n'existe pas, simuler un type "Valeur"
        -- avec des valeurs null (par defaut)
        vva_type_elemn   := 'V';
    end;

    -- Si c'est un item
    if vva_type_elemn = 'I'
    then
      -- Utiliser la valeur "varchar" pour le nom
      vva_item   := vva_valr;

      -- Lire la valeur de l'item s'il existe, sinon NULL
      if afw_07_util_pkg.exist_item (vva_item)
      then
        vva_valr   := afw_07_util_pkg.v (vva_item);
      else
        vva_valr   := null;
      end if;

      -- Convertir en numerique
      begin
        vnu_valr   := to_number (vva_valr);
      exception
        when invalid_number
        then
          vnu_valr   := null;
      end;
    end if;

    pnu_valr   := vnu_valr;
    pva_valr   := vva_valr;
  end obten_contx_etend;

  function nv (pva_nom     in varchar2
              ,pva_contx   in afw_04_contx.contx%type default null
              ,pva_actio   in afw_04_contx.actio%type default null)
    return number
  is
    vnu_valr          number (10);
    vva_valr          varchar2 (200);
    vnu_seqnc_contx   number (10);
  begin
    if pva_contx is not null
    then
      vnu_seqnc_contx      :=
        cherc_contx (pva_contx
                    ,pva_actio);
    else
      vnu_seqnc_contx   := null;
    end if;

    obten_contx_etend (pva_nom
                      ,vnu_seqnc_contx
                      ,vnu_valr
                      ,vva_valr);
    return vnu_valr;
  end nv;

  function v (pva_nom     in varchar2
             ,pva_contx   in afw_04_contx.contx%type default null
             ,pva_actio   in afw_04_contx.actio%type default null)
    return varchar2
  is
    vnu_valr          number (10);
    vva_valr          varchar2 (200);
    vnu_seqnc_contx   number (10);
  begin
    if pva_contx is not null
    then
      vnu_seqnc_contx      :=
        cherc_contx (pva_contx
                    ,pva_actio);
    else
      vnu_seqnc_contx   := null;
    end if;

    obten_contx_etend (pva_nom
                      ,vnu_seqnc_contx
                      ,vnu_valr
                      ,vva_valr);
    return vva_valr;
  end v;

  function genr_url_en_contx (pnu_page                in number default null
                             ,pnu_seqnc_contx         in number default null
                             ,pva_actio               in varchar2 default null
                             ,pva_contx               in varchar2 default null
                             ,pnu_seqnc_contx_inter   in number default null
                             ,pva_actio_inter         in varchar2 default null
                             ,pva_contx_inter         in varchar2 default null
                             ,pnu_numr_page_inter     in number default null
                             ,pva_reint_sidf          in varchar2 default 'N'
                             ,pva_optio_reqst         in varchar2 default null
                             ,pva_optio_clear_page    in varchar2 default null
                             ,pnu_aplic               in number default null)
    return varchar2
  is
    vva_seqnc_fil_arian         varchar2 (10) default afw_04_fil_arian_pkg.obten_fa_courn ();
    vva_nom_contx               varchar2 (4) default 'SCPC';
    vva_nom_actio               varchar2 (4) default 'SAPC';
    vva_nom_seqnc_contx         varchar2 (4) default 'SSPC';
    vva_nom_contx_inter         varchar2 (4) default 'SCPI';
    vva_nom_actio_inter         varchar2 (4) default 'SAPI';
    vva_nom_seqnc_contx_inter   varchar2 (4) default 'SSPI';
    vva_nom_numr_page_inter     varchar2 (4) default 'SNPI';
  begin
    if pva_reint_sidf = 'O'
    then
      vva_seqnc_fil_arian   := null;
    end if;

    -- Ne pas passer les variables si les valeurs sont NULL
    if pva_contx is null
    then
      vva_nom_contx   := null;
    end if;

    if pva_actio is null
    then
      vva_nom_actio   := null;
    end if;

    if pnu_seqnc_contx is null
    then
      vva_nom_seqnc_contx   := null;
    end if;

    if pva_contx_inter is null
    then
      vva_nom_contx_inter   := null;
    end if;

    if pva_actio_inter is null
    then
      vva_nom_actio_inter   := null;
    end if;

    if pnu_seqnc_contx_inter is null
    then
      vva_nom_seqnc_contx_inter   := null;
    end if;

    if pnu_numr_page_inter is null
    then
      vva_nom_numr_page_inter   := null;
    end if;

    return afw_08_url_pkg.genr_url (pnu_numr_page          => nvl (pnu_page, afw_08_url_pkg.knu_app_page_id)
                                   ,pnu_numr_aplic         => nvl (pnu_aplic, afw_08_url_pkg.knu_app_id)
                                   ,pva_nom_varbl_1        => 'SIDF'
                                   ,pva_valr_varbl_1       => vva_seqnc_fil_arian
                                   ,pva_nom_varbl_2        => vva_nom_contx
                                   ,pva_valr_varbl_2       => pva_contx
                                   ,pva_nom_varbl_3        => vva_nom_actio
                                   ,pva_valr_varbl_3       => pva_actio
                                   ,pva_nom_varbl_4        => vva_nom_seqnc_contx
                                   ,pva_valr_varbl_4       => to_char (pnu_seqnc_contx)
                                   ,pva_nom_varbl_5        => vva_nom_contx_inter
                                   ,pva_valr_varbl_5       => pva_contx_inter
                                   ,pva_nom_varbl_6        => vva_nom_actio_inter
                                   ,pva_valr_varbl_6       => pva_actio_inter
                                   ,pva_nom_varbl_7        => vva_nom_seqnc_contx_inter
                                   ,pva_valr_varbl_7       => to_char (pnu_seqnc_contx_inter)
                                   ,pva_nom_varbl_8        => vva_nom_numr_page_inter
                                   ,pva_valr_varbl_8       => pnu_numr_page_inter
                                   ,pva_optio_reqst        => pva_optio_reqst
                                   ,pva_optio_clear_page   => pva_optio_clear_page);
  end genr_url_en_contx;

  procedure retr_modl
  is
    vva_seqnc_fil_arian   varchar2 (10) default afw_04_fil_arian_pkg.obten_fa_courn ();

    cursor cur_contx_etend_rm
    is
      select etend.seqnc
            ,etend.nom
            ,etend.valr_varch
            ,etend.valr_numbr
            ,etend.type_alimn
            ,etend.type_elemn
        from vd_afw_04_contx_etend etend
            ,vd_afw_04_fil_arian   fil
       where     etend.type_alimn = 'RM'
             and etend.type_elemn = 'I'
             and etend.ref_contx = fil.ref_elemn_sup
             and fil.seqnc = vva_seqnc_fil_arian;
  begin
    -- Boucler chacun des contextes etendu 'RM' de type item
    for vcu_rm in cur_contx_etend_rm
    loop
      if afw_07_util_pkg.exist_item (vcu_rm.valr_varch)
      then
        -- Affecter la valeur automatique
        update vd_afw_04_contx_etend
           set valr_varch   = afw_07_util_pkg.v (vcu_rm.valr_varch)
              ,type_alimn   = 'RMA'
              ,type_elemn   = 'V'
         where seqnc = vcu_rm.seqnc;
      end if;
    end loop;
  end retr_modl;

  procedure valdr_contx (pnu_ref_fil_arian   in vd_i_afw_04_contx.ref_fil_arian%type
                        ,pva_contx           in vd_i_afw_04_contx.contx%type)
  is
    vnu_count   pls_integer;
  begin
    select count (1)
      into vnu_count
      from vd_i_afw_12_struc_aplic sa
          ,vd_i_afw_11_aplic       a
          ,vd_afw_04_fil_arian     fa
     where     sa.code = pva_contx
           and sa.ref_prodt = a.ref_prodt
           and a.numr_aplic_apex = fa.app_id
           and fa.seqnc = pnu_ref_fil_arian;

    if vnu_count != 1
    then
      afw_01_err_apex_pkg.lever_err_apex_code (pva_code         => 'SAF.000019'
                                              ,pva_code_prodt   => 'AFW');
    end if;
  end valdr_contx;

  procedure suprm_contx_page (pnu_page_apex in number)
  is
    vnu_seqnc   number (10);
  begin
        select fa.seqnc
          into vnu_seqnc
          from vd_afw_04_fil_arian fa
         where page = pnu_page_apex
    connect by ref_elemn_sup = prior seqnc
    start with ref_elemn_sup is null;

    update vd_i_afw_04_contx
       set contx               = null
          ,actio               = null
          ,seqnc_contx         = null
          ,contx_inter         = null
          ,actio_inter         = null
          ,seqnc_contx_inter   = null
     where ref_fil_arian = vnu_seqnc;

    delete vd_i_afw_04_contx_etend
     where ref_contx = vnu_seqnc;
  exception
    when no_data_found
    then
      ete ();
  end suprm_contx_page;
end afw_04_contx_pkg;
/
