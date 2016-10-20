SET DEFINE OFF;
create or replace package body afw_13_page_pkg
as
  gva_afw_13_liste_navgt_excls   varchar2 (200);
  gbo_list_afich                 boolean default true;
  gbo_forcr_afich_list_nagvt     boolean default false;
  gbo_cachr_list                 boolean default false;
  gva_indic_migrt                varchar2 (1) default 'N';

  procedure maj_pages_refrt_apex (pnu_ref_aplic in number default null)
  is
    vva_page_apex   varchar2 (200);
    vva_nom_apex    varchar2 (200);
    vnu_cnt         pls_integer;
    vnu_aplic       pls_integer;
  begin
    -- Suppression des pages supprimées

    delete vd_i_afw_13_page dest
     where     not exists
                 (select null
                    from apex_page         ap
                        ,apex_aplic        aa
                        ,vd_i_afw_11_aplic a
                   where     ap.flow_id = aa.id
                         and aa.id = a.numr_aplic_apex
                         and ap.id = dest.numr_apex
                         and a.seqnc = dest.ref_aplic)
           and (   dest.ref_aplic = pnu_ref_aplic
                or pnu_ref_aplic is null);

    --Création des pages
    merge into afw_13_page dest
         using (select a.seqnc aplic
                      ,ap.id   numr_page_apex
                      ,ap.name nom
                  from apex_page         ap
                      ,apex_aplic        aa
                      ,vd_i_afw_11_aplic a
                 where     ap.flow_id = aa.id
                       and aa.id = a.numr_aplic_apex
                       and (   a.seqnc = pnu_ref_aplic
                            or pnu_ref_aplic is null)) sourc
            on (    sourc.numr_page_apex = dest.numr_apex
                and dest.ref_aplic = sourc.aplic)
    when matched
    then
      update set dest.nom   = sourc.nom
    when not matched
    then
      insert     (numr_apex
                 ,nom
                 ,ref_aplic
                 ,dnr_ref_aplic)
          values (sourc.numr_page_apex
                 ,sourc.nom
                 ,sourc.aplic
                 ,sourc.aplic);

    -- Mettre à jour la traduction des pages
    insert into afw_13_page_lang (ref_page
                                 ,ref_lang
                                 ,nom
                                 ,dnr_ref_aplic)
      select p.seqnc
            ,l.seqnc
            ,p.nom
            ,pr.seqnc
        from vd_i_afw_13_page  p
            ,vd_i_afw_11_aplic pr
            ,apex_aplic        aa
            ,vd_i_afw_01_lang  l
       where     not exists
                   (select null
                      from vd_i_afw_13_page_lang pl
                     where pl.ref_page = p.seqnc)
             and p.ref_aplic = pr.seqnc
             and pr.numr_aplic_apex = aa.id
             and upper (aa.flow_language) = l.code;

    update vd_i_afw_11_aplic
       set date_dernr_maj_refrn_apex   = sysdate
     where (   seqnc = pnu_ref_aplic
            or pnu_ref_aplic is null);
  exception
    when others
    then
      raise;
  end maj_pages_refrt_apex;

  procedure maj_page_refrt_apex (pnu_page in number)
  is
    vva_page_apex     varchar2 (200);
    vva_nom_apex      varchar2 (200);
    vnu_seqnc_afich   number (10, 2);
    vnu_cnt           pls_integer;
    vnu_aplic         pls_integer;
    vnu_ref_aplic     number (10);
  begin
    select ref_aplic
          ,numr_apex
      into vnu_ref_aplic
          ,vva_page_apex
      from vd_i_afw_13_page p
     where p.seqnc = pnu_page;

    -- Mettre a jour les noms avant de lancer les suppressions
    update vd_i_afw_13_page_item sourc
       set nom_apex      =
             (select itm.name
                from apex_item_page itm
               where itm.id = sourc.id_apex)
     where     exists
                 (select null
                    from apex_item_page itm
                   where     itm.id = sourc.id_apex
                         and itm.name <> sourc.nom_apex)
           and ref_page = pnu_page;

    update vd_i_afw_13_page_item sourc
       set nom_apex      =
             (select itm.button_name
                from apex_boutn_page itm
               where itm.id = sourc.id_apex)
     where     exists
                 (select null
                    from apex_boutn_page itm
                   where     itm.id = sourc.id_apex
                         and itm.button_name <> sourc.nom_apex)
           and ref_page = pnu_page;

    -- Effectuer les suppressions d'items qui n'existent plus
    delete vd_i_afw_13_page_item sourc
     where     not exists
                 (select 1
                    from apex_item_page    itm
                        ,vd_i_afw_13_page  pag
                        ,vd_i_afw_11_aplic pro
                   where     pag.seqnc = sourc.ref_page
                         and pro.seqnc = pag.ref_aplic
                         and itm.name = sourc.nom_apex
                         and itm.flow_step_id = pag.numr_apex
                         and itm.flow_id = pro.numr_aplic_apex)
           and type_item = 'ITEM'
           and ref_page = pnu_page;

    delete vd_i_afw_13_page_item sourc
     where     not exists
                 (select 1
                    from apex_boutn_page   b
                        ,vd_i_afw_13_page  pag
                        ,vd_i_afw_11_aplic pro
                   where     pag.seqnc = sourc.ref_page
                         and pro.seqnc = pag.ref_aplic
                         and b.button_name = sourc.nom_apex
                         and b.flow_step_id = pag.numr_apex
                         and b.flow_id = pro.numr_aplic_apex)
           and type_item = 'BOUTN'
           and ref_page = pnu_page;

    --mettre à jour la table des items
    merge into afw_13_page_item dest
         using (select p.seqnc                                                       ref_page
                      ,itm.id                                                        id_apex
                      ,itm.name                                                      nom_apex
                      ,nvl (itm.prompt
                           ,   '['
                            || itm.name
                            || ']')
                         libl
                      ,'ITEM'                                                        type_item
                      ,case when itm.source_type = 'DB_COLUMN' then 'O' else 'N' end indic_rechr
                      ,pro.seqnc                                                     ref_aplic
                  from apex_item_page    itm
                      ,apex_page         pag
                      ,apex_aplic        app
                      ,vd_i_afw_13_page  p
                      ,vd_i_afw_11_aplic pro
                 where     pag.flow_id = app.id
                       and itm.flow_step_id = pag.id
                       and itm.flow_id = app.id
                       and p.seqnc = pnu_page
                       and p.numr_apex = pag.id
                       and pro.seqnc = p.ref_aplic
                       and app.id = pro.numr_aplic_apex) sourc
            on (    sourc.ref_page = dest.ref_page
                and dest.nom_apex = sourc.nom_apex
                and dest.type_item = sourc.type_item)
    when matched
    then
      update set dest.id_apex   = sourc.id_apex
                ,dest.libl      = sourc.libl
    when not matched
    then
      insert     (ref_page
                 ,id_apex
                 ,nom_apex
                 ,libl
                 ,indic_rechr
                 ,dnr_ref_aplic)
          values (sourc.ref_page
                 ,sourc.id_apex
                 ,sourc.nom_apex
                 ,sourc.libl
                 ,sourc.indic_rechr
                 ,sourc.ref_aplic);

    --Assurer que les boutons sont "uniques"
    begin
      select id
            ,button_name
            ,cnt
            ,flow_id
        into vva_page_apex
            ,vva_nom_apex
            ,vnu_cnt
            ,vnu_aplic
        from (  select pag.id
                      ,b.button_name
                      ,count (1) cnt
                      ,pag.flow_id
                  from apex_boutn_page b
                      ,apex_page       pag
                      ,apex_aplic      app
                      ,vd_i_afw_13_page p
                      ,vd_i_afw_11_aplic pro
                 where     pag.flow_id = app.id
                       and b.flow_step_id = pag.id
                       and b.flow_id = app.id
                       and app.id = pro.numr_aplic_apex
                       and p.seqnc = pnu_page
                       and pro.seqnc = p.ref_aplic
              group by pag.id
                      ,b.button_name
                      ,pag.flow_id
                having count (1) > 1)
       where rownum = 1;

      afw_01_err_apex_pkg.lever_err_apex_code ('SAF.000028'
                                              ,vva_nom_apex
                                              ,vva_page_apex
                                              ,vnu_aplic
                                              ,pva_code_prodt   => 'AFW');
    exception
      when no_data_found
      then
        null;
    end;

    --Créer les boutons
    merge into afw_13_page_item dest
         using (select p.seqnc            ref_page
                      ,b.id               id_apex
                      ,b.button_name      nom_apex
                      ,b.button_image_alt libl
                      ,'BOUTN'            type_item
                      ,pro.seqnc          ref_aplic
                  from apex_boutn_page   b
                      ,apex_page         pag
                      ,apex_aplic        app
                      ,vd_i_afw_13_page  p
                      ,vd_i_afw_11_aplic pro
                 where     pag.flow_id = app.id
                       and b.flow_step_id = pag.id
                       and b.flow_id = app.id
                       and p.seqnc = pnu_page
                       and p.numr_apex = pag.id
                       and pro.seqnc = p.ref_aplic
                       and app.id = pro.numr_aplic_apex) sourc
            on (    sourc.ref_page = dest.ref_page
                and dest.nom_apex = sourc.nom_apex
                and dest.type_item = sourc.type_item)
    when matched
    then
      update set dest.libl   = sourc.libl
    when not matched
    then
      insert     (ref_page
                 ,nom_apex
                 ,id_apex
                 ,libl
                 ,type_item
                 ,dnr_ref_aplic)
          values (sourc.ref_page
                 ,sourc.nom_apex
                 ,sourc.id_apex
                 ,sourc.libl
                 ,'BOUTN'
                 ,sourc.ref_aplic);

    if gva_indic_migrt = 'N'
    then
      --Supprimer les interactive
      delete vd_i_afw_13_page_ir pi
       where     pi.ref_page = pnu_page
             and not exists
                   (select 1
                      from apex_ir           ir
                          ,vd_i_afw_13_page  p
                          ,vd_i_afw_11_aplic pro
                     where     ir.flow_id = pro.numr_aplic_apex
                           and ir.name = pi.libl_regn
                           and pro.seqnc = p.ref_aplic
                           and ir.page_id = p.numr_apex
                           and p.seqnc = pi.ref_page);

      --Créer les interactives
      merge into vd_i_afw_13_page_ir dest
           using (select p.seqnc      ref_page
                        ,ar.plug_name libl_regn
                        ,ir.id        id_apex
                        ,pro.seqnc    ref_aplic
                    from apex_ir           ir
                        ,apex_regn         ar
                        ,vd_i_afw_13_page  p
                        ,vd_i_afw_11_aplic pro
                   where     ir.flow_id = pro.numr_aplic_apex
                         and ir.page_id = p.numr_apex
                         and pro.seqnc = p.ref_aplic
                         and p.seqnc = pnu_page
                         and ir.region_id = ar.id) sourc
              on (    sourc.ref_page = dest.ref_page
                  and sourc.libl_regn = dest.libl_regn)
      when matched
      then
        update set dest.id_apex   = sourc.id_apex
      when not matched
      then
        insert     (ref_page
                   ,libl_regn
                   ,id_apex
                   ,dnr_ref_aplic)
            values (sourc.ref_page
                   ,sourc.libl_regn
                   ,sourc.id_apex
                   ,sourc.ref_aplic);
    end if;

    --Supprimer les colonnes d'interactive report
    --NOTE: Ne pas se fier au ID qui peut ne pas ¿tre bon (ex: apr¿s une migration)
    --NOTE 2 : se fier au id pour le moment, ¿ tester en migration (avec un mode migration)

    delete vd_i_afw_13_page_ir_coln pic
     where     exists
                 (select 1
                    from vd_i_afw_13_page_ir pi
                        ,vd_i_afw_13_page    p
                   where     p.seqnc = pnu_page
                         and pi.ref_page = p.seqnc
                         and pi.seqnc = pic.ref_page_ir)
           and not exists
                 (select 1
                    from apex_ir_coln        aic
                        ,apex_ir             ai
                        ,vd_i_afw_13_page_ir pi
                        ,vd_i_afw_13_page    p
                        ,vd_i_afw_11_aplic   pr
                   where     aic.worksheet_id = ai.id
                         and aic.db_column_name = pic.coln_table
                         and ai.flow_id = pr.numr_aplic_apex
                         and ai.page_id = p.numr_apex
                         and pi.seqnc = pic.ref_page_ir
                         and p.seqnc = pi.ref_page
                         and pr.seqnc = p.ref_aplic);

    --Cr¿er les colonnes d'interactive report
    merge into vd_i_afw_13_page_ir_coln dest
         using (select pi.seqnc           ref_page_ir
                      ,aic.db_column_name coln_table
                      ,aic.display_order  ordre_afich
                      ,aic.column_label   libl
                      ,aic.id             id_apex
                      ,pr.seqnc           ref_aplic
                  from apex_ir_coln        aic
                      ,apex_ir             ai
                      ,vd_i_afw_11_aplic   pr
                      ,vd_i_afw_13_page_ir pi
                      ,vd_i_afw_13_page    p
                 where     aic.worksheet_id = ai.id
                       and ai.flow_id = pr.numr_aplic_apex
                       and ai.page_id = p.numr_apex
                       and p.numr_apex = ai.page_id
                       and pi.id_apex = aic.worksheet_id
                       and p.seqnc = pnu_page
                       and pi.ref_page = p.seqnc
                       and pr.seqnc = p.ref_aplic) sourc
            on (    sourc.ref_page_ir = dest.ref_page_ir
                and sourc.coln_table = dest.coln_table)
    when matched
    then
      update set dest.libl          = sourc.libl
                ,dest.ordre_afich   = sourc.ordre_afich
                ,id_apex            = sourc.id_apex
    when not matched
    then
      insert     (ref_page_ir
                 ,ordre_afich
                 ,libl
                 ,coln_table
                 ,id_apex
                 ,dnr_ref_aplic)
          values (sourc.ref_page_ir
                 ,sourc.ordre_afich
                 ,sourc.libl
                 ,sourc.coln_table
                 ,sourc.id_apex
                 ,sourc.ref_aplic);

    --ajouter les items rajout¿s dans la pages dans les cas de lecture seule
    if not afw_13_condt_piltb_pkg.vbo_en_charg
    then
      insert into vd_i_afw_13_lien_condt_piltb (ref_page_item
                                               ,ref_condt_piltb
                                               ,indic_lectr_seul
                                               ,dnr_ref_aplic)
        select pi.seqnc
              ,cls1.seqnc
              ,'N'
              ,p.ref_aplic
          from vd_i_afw_13_page_item   pi
              ,vd_i_afw_13_page        p
              ,vd_i_afw_13_condt_piltb cls1
         where     p.seqnc = pi.ref_page
               and cls1.ref_page = p.seqnc
               and p.seqnc = pnu_page
               and not exists
                     (select 1
                        from vd_i_afw_13_lien_condt_piltb lls
                            ,vd_i_afw_13_condt_piltb      cls
                       where     lls.ref_page_item = pi.seqnc
                             and cls.seqnc = lls.ref_condt_piltb
                             and cls.ref_page = p.seqnc);
    end if;

    --TODO CARLO
    --Pour toutes traduction
    --pour chaque page
    --assurer que les traductions sont là (si existe, ne rien faire, sinon, la créer)
    insert into vd_i_afw_13_page_lang (ref_page
                                      ,nom
                                      ,ref_lang
                                      ,dnr_ref_aplic)
      select pa2.seqnc
            ,ap.name
            ,l.seqnc
            ,apl.seqnc
        from vd_afw_11_prodt      p
            ,vd_afw_11_prodt_lang pl
            ,vd_afw_01_lang       l
            ,apex_tradc           at
            ,apex_aplic           aa
            ,apex_page            ap
            ,vd_afw_11_aplic      apl
            ,vd_afw_13_page       pa2
       where     pl.ref_prodt = p.seqnc
             and pa2.seqnc = pnu_page
             and l.seqnc = pl.ref_lang
             and apl.ref_prodt = p.seqnc
             and at.primary_language_flow_id = apl.numr_aplic_apex
             and upper (at.translation_flow_language_code) = l.code
             and aa.id = at.translation_flow_id
             and aa.id = ap.flow_id
             and trunc (ap.id) not in (select pa.numr_apex
                                         from vd_afw_13_page      pa
                                             ,vd_afw_13_page_lang pal
                                        where     pa.ref_aplic = apl.seqnc
                                              and pal.ref_page = pa.seqnc
                                              and pal.ref_lang = l.seqnc)
             and trunc (ap.id) = pa2.numr_apex
             and pa2.ref_aplic = p.seqnc;

    update vd_i_afw_13_page
       set date_dernr_maj_refrn_apex   = sysdate
     where seqnc = pnu_page;
  exception
    when others
    then
      afw_03_journ_pkg.ecrir_journ (null
                                   ,null
                                   ,null
                                   ,true);
      raise;
  end maj_page_refrt_apex;

  procedure maj_table_a_partr_refrt_apex (pnu_ref_aplic     in number default null
                                         ,pva_indic_migrt   in varchar2 default 'N')
  is
    vva_page_apex   varchar2 (200);
    vva_nom_apex    varchar2 (200);
    vnu_cnt         pls_integer;
    vnu_aplic       pls_integer;

    cursor cur_page
    is
      select p.seqnc
        from vd_i_afw_13_page p
       where (   p.ref_aplic = pnu_ref_aplic
              or pnu_ref_aplic is null);
  begin
    gva_indic_migrt   := pva_indic_migrt;
    maj_pages_refrt_apex (pnu_ref_aplic);

    for rec_page in cur_page
    loop
      maj_page_refrt_apex (rec_page.seqnc);
    end loop;
  end maj_table_a_partr_refrt_apex;

  function obten_lectr_seul
    return boolean
  is
  begin
    if true
    then
      return true;
    end if;
  end obten_lectr_seul;

  function obten_afich
    return boolean
  is
  begin
    return null;
  end obten_afich;

  procedure defn_contx_exect_page
  is
  begin
    null;
  end defn_contx_exect_page;

  function genr_elemn_liste_navgt
    return varchar2
  is
    cva_ocurn_optio   constant varchar2 (45) default '<li><a href="%link%">%icon%%libl%</a></li>';
    cva_link          constant varchar2 (45) default 'f?p=%page%:%sesn%:::RP:%varbl1%:%valr1%';
    vnu_page                   number (10) default afw_07_util_pkg.nv ('APP_PAGE_ID');
    vnu_sesn                   number default afw_07_util_pkg.nv ('APP_SESSION');
    vnu_app                    number default afw_07_util_pkg.nv ('APP_ID');

    cursor cur_list
    is
      select sln.libl
            ,page
            ,aplic
            ,sspc
            ,sapc
            ,sspi
            ,sapi
            ,code
            ,seqnc
            ,css_icone_boots
            , (ordre_presn) ordre_presn
            ,null           ref_domn
        from vd_i_afw_13_liste_navgt sln
       where     ref_page = (select seqnc
                               from vd_i_afw_13_page p
                              where     p.numr_apex = vnu_page
                                    and p.ref_aplic = afw_11_aplic_pkg.obten_aplic_sesn)
             and ref_domn is null
      union all
      select sln.libl
            ,page
            ,aplic
            ,sspc
            ,sapc
            ,sspi
            ,sapi
            ,code
            ,seqnc
            ,css_icone_boots
            , (ordre_presn + 100) ordre_presn
            , --TODO CONAL (ajouter à la fin des listes navigation produit
             ref_domn
        from vd_i_afw_13_liste_navgt sln
       where     ref_page = (select seqnc
                               from vd_i_afw_13_page p
                              where     p.numr_apex = vnu_page
                                    and p.ref_aplic = afw_11_aplic_pkg.obten_aplic_sesn)
             and ref_domn = afw_12_domn_pkg.obten_domn_sesn
      order by ordre_presn asc;

    vva_optio_courn            varchar2 (32767);
    vva_optio                  varchar2 (500);
    vbo_exist                  boolean default false;
    vva_excls                  varchar2 (200)
                                 default    ':'
                                         || gva_afw_13_liste_navgt_excls
                                         || ':';
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 13 Page - Générer la liste de navigation');

    if gbo_forcr_afich_list_nagvt
    then
      gbo_list_afich   := true;
    elsif gbo_cachr_list
    then
      gbo_list_afich   := false;
    elsif afw_07_util_pkg.exist_item (   'P'
                                      || afw_07_util_pkg.nv ('APP_PAGE_ID')
                                      || '_SEQNC')
    then
      gbo_list_afich      :=
        afw_07_util_pkg.nv (   'P'
                            || afw_07_util_pkg.nv ('APP_PAGE_ID')
                            || '_SEQNC')
          is not null;
    end if;

    if gbo_list_afich
    then
      for rec_list in cur_list
      loop
        if instr (vva_excls
                 ,   ':'
                  || rec_list.code
                  || ':') = 0
        then
          -- Valider le droit d'accès
          if    afw_12_secrt_pkg.verif_acces_liste_navgt (rec_list.seqnc)
             or rec_list.ref_domn is not null
          then
            vbo_exist   := true;
            vva_optio   := cva_link;
            vva_optio      :=
              replace (vva_optio
                      ,'%sesn%'
                      ,vnu_sesn);

            if rec_list.page like '%:%'
            then
              vva_optio      :=
                replace (vva_optio
                        ,'%page%'
                        ,rec_list.page);
            else
              vva_optio      :=
                replace (vva_optio
                        ,'%page%'
                        ,   nvl (rec_list.aplic, vnu_app)
                         || ':'
                         || rec_list.page);
            end if;

            if rec_list.sapi is not null
            then
              vva_optio      :=
                replace (vva_optio
                        ,'%varbl1%'
                        ,'%varbl1%,SAPI');
              vva_optio      :=
                replace (vva_optio
                        ,'%valr1%'
                        ,   '%valr1%,'
                         || rec_list.sapi);
            end if;

            if rec_list.sspi is not null
            then
              vva_optio      :=
                replace (vva_optio
                        ,'%varbl1%'
                        ,'%varbl1%,SSPI');
              vva_optio      :=
                replace (vva_optio
                        ,'%valr1%'
                        ,   '%valr1%,'
                         || rec_list.sspi);
            end if;

            if rec_list.sapc is not null
            then
              vva_optio      :=
                replace (vva_optio
                        ,'%varbl1%'
                        ,'%varbl1%,SAPC');
              vva_optio      :=
                replace (vva_optio
                        ,'%valr1%'
                        ,   '%valr1%,'
                         || rec_list.sapc);
            end if;

            if rec_list.sspc is not null
            then
              vva_optio      :=
                replace (vva_optio
                        ,'%varbl1%'
                        ,'%varbl1%,SSPC');
              vva_optio      :=
                replace (vva_optio
                        ,'%valr1%'
                        ,   '%valr1%,'
                         || rec_list.sspc);
            end if;

            vva_optio      :=
              replace (vva_optio
                      ,'%varbl1%'
                      ,'SIDF');
            vva_optio      :=
              replace (vva_optio
                      ,'%valr1%'
                      ,afw_04_fil_arian_pkg.obten_fa_courn ());

            vva_optio      :=
              replace (cva_ocurn_optio
                      ,'%link%'
                      ,vva_optio);

            vva_optio      :=
              replace (vva_optio
                      ,'%icon%'
                      ,   '<i class="fa '
                       || nvl (rec_list.css_icone_boots, 'fa-external-link')
                       || '"></i> ');

            vva_optio      :=
              replace (vva_optio
                      ,'%libl%'
                      ,rec_list.libl);


            vva_optio_courn      :=
                 vva_optio_courn
              || vva_optio;
          end if;
        end if;
      end loop;

      if vbo_exist
      then
        --batir un lien courant
        /* vva_optio   := replace (cva_link, '%app%', vnu_app);
         vva_optio   := replace (vva_optio, '%sesn%', vnu_sesn);
         vva_optio   := replace (vva_optio, '%page%', vnu_page);
         vva_optio   := replace (vva_optio, '%varbl1%', 'SIDF');
         vva_optio   :=
            replace (vva_optio, '%valr1%', afw_04_fil_arian_pkg.obten_fa_courn());
         vva_optio   := replace (cva_ocurn_optio, '%link%', vva_optio);
         vva_optio   :=
            replace (vva_optio, '%libl%', ' - Naviguer vers - ');
         vva_optio_courn :=
               vva_optio
            || vva_optio_courn;*/
        vva_optio_courn      :=
             '<li class="divider"></li>'
          || vva_optio_courn;
      end if;

      return aa.do_substitutions (vva_optio_courn);
    else
      return null;
    end if;
  end genr_elemn_liste_navgt;

  procedure ajout_exclu_liste_navgt (pva_code_elemn_navgt in varchar2)
  is
    vva_exclu   varchar2 (200) default afw_07_util_pkg.v ('A_AFW_13_LISTE_NAVGT_EXCLS');
  begin
    if gva_afw_13_liste_navgt_excls is null
    then
      gva_afw_13_liste_navgt_excls   := pva_code_elemn_navgt;
    else
      gva_afw_13_liste_navgt_excls      :=
           gva_afw_13_liste_navgt_excls
        || ':'
        || pva_code_elemn_navgt;
    end if;
  end ajout_exclu_liste_navgt;

  procedure reint_exclu_liste_navgt
  is
  begin
    gva_afw_13_liste_navgt_excls   := null;
    gbo_list_afich                 := true;
  end reint_exclu_liste_navgt;

  procedure cachr_liste_navgt
  is
  begin
    gbo_cachr_list   := true;
  end cachr_liste_navgt;

  procedure forcr_afich_liste_navgt
  is
  begin
    gbo_forcr_afich_list_nagvt   := true;
  end forcr_afich_liste_navgt;

  procedure tradc_raprt_intrc
  is
    vnu_page    number (10) default afw_07_util_pkg.nv ('APP_PAGE_ID');
    vnu_app     number default afw_07_util_pkg.nv ('APP_ID');
    vnu_exist   number;
  begin
    select 1
      into vnu_exist
      from vd_afw_11_aplic   p
          ,vd_afw_13_page    pa
          ,vd_afw_13_page_ir pi
     where     p.numr_aplic_apex = vnu_app
           and p.seqnc = pa.ref_aplic
           and pa.numr_apex = vnu_page
           and pa.seqnc = pi.ref_page;

    htp.p ('<script>
             $().ready(function() {
               $("label[for=''apexir_NUM_ROWS'']").text("Rangées");
             });
           </script>');
  exception
    when no_data_found
    then
      null;
  end tradc_raprt_intrc;

  function obten_titre_page_lang
    return varchar2
  is
    vva_nom               vd_i_afw_13_page_lang.nom%type;
    vva_item_page_titre   vd_i_afw_13_page_lang.nom%type
                            := afw_07_util_pkg.v (   'P'
                                                  || afw_07_util_pkg.v ('APP_PAGE_ID')
                                                  || '_PAGE_TITRE');
  begin
    if vva_item_page_titre is not null
    then
      return vva_item_page_titre;
    else
      select pl.nom
        into vva_nom
        from vd_i_afw_13_page_lang pl
            ,vd_i_afw_13_page      p
       where     p.seqnc = afw_13_page_pkg.obten_page_sesn
             and pl.ref_page = p.seqnc
             and pl.ref_lang = afw_01_lang_pkg.obten_lang_sesn ();
    end if;

    return vva_nom;
  exception
    when no_data_found
    then
      return null;
  end obten_titre_page_lang;

  function obten_page_sesn
    return number
  is
    vnu_seqnc_page   vd_i_afw_13_page.seqnc%type;
  begin
    select p.seqnc
      into vnu_seqnc_page
      from vd_i_afw_13_page p
     where     p.numr_apex = afw_07_util_pkg.v ('APP_PAGE_ID')
           and p.ref_aplic = afw_11_aplic_pkg.obten_aplic_sesn;

    return vnu_seqnc_page;
  exception
    when others
    then
      raise;
  end obten_page_sesn;

  function obten_page_zero_sesn
    return number
  is
    vnu_seqnc_page   vd_i_afw_13_page.seqnc%type;
  begin
    select p.seqnc
      into vnu_seqnc_page
      from vd_i_afw_13_page p
     where     p.numr_apex = 0
           and p.ref_aplic = afw_11_aplic_pkg.obten_aplic_sesn;

    return vnu_seqnc_page;
  end;

  function obten_struc_aplic (pnu_page in number)
    return number
  is
    vnu_struc   number (10);
  begin
    select ref_struc_aplic
      into vnu_struc
      from vd_i_afw_13_page p
     where p.seqnc = pnu_page;

    return vnu_struc;
  exception
    when no_data_found
    then
      return null;
  end obten_struc_aplic;

  function obten_numr_apex_page (pnu_page in number default null)
    return number
  is
    vnu_numr_apex   vd_i_afw_13_page.numr_apex%type;
  begin
    select p.numr_apex
      into vnu_numr_apex
      from vd_i_afw_13_page p
     where p.seqnc = nvl (pnu_page, obten_page_sesn);

    return vnu_numr_apex;
  exception
    when no_data_found
    then
      return null;
  end obten_numr_apex_page;

  function obten_info_extra (pnu_app_id        in number
                            ,pnu_app_page_id   in number)
    return typ_info_extra
  is
    rec_info_extra    typ_info_extra;

    cursor cur_procs_fetch
    is
      select ap.process_sql_clob info_fetch
        from apex_procs ap
       where     flow_id = pnu_app_id
             and flow_step_id = pnu_app_page_id
             and process_type = 'DML_FETCH_ROW';

    rec_procs_fetch   cur_procs_fetch%rowtype;

    subtype typ_arr_info is apex_application_global.vc_arr2;

    var_info          typ_arr_info;
    -- (1) : ["F|"]Schema|"#OWNER#"
    -- (2) : Table ou vue
    -- (3) : Item s¿quence 1
    -- (4) : Colonne s¿quence 1
    -- (5) : Item s¿quence 2
    -- (6) : Colonne s¿quence 2

    vva_schem_tmp     varchar2 (32);

    function obten_info (pnu_index in number)
      return varchar2
    is
    begin
      if var_info.exists (pnu_index)
      then
        return var_info (pnu_index);
      else
        return null;
      end if;
    end;
  begin
    open cur_procs_fetch;

    fetch cur_procs_fetch
      into rec_procs_fetch;

    close cur_procs_fetch;

    if rec_procs_fetch.info_fetch is not null
    then
      -- Extraire les infos de fetch du clob
      var_info                     := afw_07_util_pkg.string_to_table (rec_procs_fetch.info_fetch);
      vva_schem_tmp                := obten_info (1);
      rec_info_extra.va_table      := obten_info (2);
      rec_info_extra.va_item_pk1   := obten_info (3);
      rec_info_extra.va_coln_pk1   := obten_info (4);
      rec_info_extra.va_item_pk2   := obten_info (5);
      rec_info_extra.va_coln_pk2   := obten_info (6);

      -- Ajuster le sch¿ma
      if vva_schem_tmp like 'F|%'
      then
        rec_info_extra.va_cache   := 'FETCH';
        rec_info_extra.va_schem      :=
          substr (vva_schem_tmp
                 ,3);
      else
        rec_info_extra.va_cache   := 'DISPL';
        rec_info_extra.va_schem   := vva_schem_tmp;
      end if;

      if rec_info_extra.va_schem = '#OWNER#'
      then
        rec_info_extra.va_schem   := null;
      end if;
    end if;

    return rec_info_extra;
  end obten_info_extra;

  function obten_info_extra (pnu_ref_page number default null)
    return typ_info_extra
  is
    vnu_app_id        number;
    vnu_app_page_id   number;
  begin
    if pnu_ref_page is null
    then
      vnu_app_id        := afw_07_util_pkg.nv ('APP_ID');
      vnu_app_page_id   := afw_07_util_pkg.nv ('APP_PAGE_ID');
    else
      select p.app_id_formt
            ,p.numr_apex
        into vnu_app_id
            ,vnu_app_page_id
        from vd_afw_13_page p
       where p.seqnc = pnu_ref_page;
    end if;

    return obten_info_extra (vnu_app_id
                            ,vnu_app_page_id);
  end obten_info_extra;

  function exist_info_extra (pnu_app_id        in number
                            ,pnu_app_page_id   in number)
    return boolean
  is
    rec_info_extra   typ_info_extra
                       default obten_info_extra (pnu_app_id
                                                ,pnu_app_page_id);
  begin
    return (rec_info_extra.va_table is not null);
  end exist_info_extra;

  function exist_info_extra (pnu_ref_page number default null)
    return boolean
  is
    rec_info_extra   typ_info_extra default obten_info_extra (pnu_ref_page);
  begin
    return (rec_info_extra.va_table is not null);
  end exist_info_extra;

  function exist_info_extra_va (pnu_ref_page number default null)
    return varchar2
  is
  begin
    return case when exist_info_extra (pnu_ref_page) then 'O' else 'N' end;
  end exist_info_extra_va;

  function obten_page_rechr (pnu_ref_page number default null)
    return number
  is
    vnu_ref_page_rechr   number;
  begin
    if pnu_ref_page is null
    then
      select ref_page_rechr
        into vnu_ref_page_rechr
        from vd_i_afw_13_page
       where seqnc = obten_page_sesn ();
    else
      select ref_page_rechr
        into vnu_ref_page_rechr
        from vd_i_afw_13_page
       where seqnc = pnu_ref_page;
    end if;

    if vnu_ref_page_rechr is not null
    then
      if exist_info_extra (vnu_ref_page_rechr)
      then
        return vnu_ref_page_rechr;
      end if;
    end if;

    return null;
  exception
    when no_data_found
    then
      return null;
  end obten_page_rechr;

  function est_page_rechr (pnu_ref_page in number)
    return boolean
  is
    vnu_exist   number default 0;
  begin
    -- Consid¿rer que la page est une page de recherche si au moins 1 page
    -- l'utilise comme page de recherche
    select max (1)
      into vnu_exist
      from vd_i_afw_13_page
     where ref_page_rechr = pnu_ref_page;

    return (vnu_exist = 1);
  end est_page_rechr;

  function obten_opert_dml (pva_reqt in varchar2 default null)
    return varchar2
  is
    vnu_app_id        number default afw_07_util_pkg.nv ('APP_ID');
    vnu_app_page_id   number default afw_07_util_pkg.nv ('APP_PAGE_ID');
    vva_reqt          varchar2 (100) default upper (nvl (pva_reqt, afw_07_util_pkg.v ('REQUEST')));
    vva_actio         varchar2 (10);
  begin
    case
      when vva_reqt in ('INSERT'
                       ,'CREATE'
                       ,'CREATE_AGAIN'
                       ,'CREATEAGAIN')
      then
        return 'I';
      when vva_reqt like '%CREATE%'
      then
        return 'I';
      when vva_reqt in ('SAVE'
                       ,'APPLY CHANGES'
                       ,'UPDATE'
                       ,'UPDATE ROW'
                       ,'CHANGE'
                       ,'APPLY')
      then
        return 'U';
      when vva_reqt like 'APPLY%CHANGES%'
      then
        return 'U';
      when vva_reqt like 'GET_NEXT%'
      then
        return 'U';
      when vva_reqt like 'GET_PREV%'
      then
        return 'U';
      when vva_reqt like '%SAVE%'
      then
        return 'U';
      when vva_reqt in ('DELETE'
                       ,'REMOVE'
                       ,'DELETE ROW'
                       ,'DROP'
                       ,'MULTI_ROW_DELETE')
      then
        return 'D';
      else
        begin
          select upper (database_action)
            into vva_actio
            from apex_boutn_page
           where     flow_id = vnu_app_id
                 and flow_step_id = vnu_app_page_id
                 and upper (button_name) = vva_reqt;

          return substr (vva_actio
                        ,1
                        ,1);
        exception
          when no_data_found
          then
            return null;
        end;
    end case;
  end obten_opert_dml;

  function est_opert_inser (pva_reqt in varchar2 default null)
    return boolean
  is
  begin
    return nvl (obten_opert_dml (pva_reqt), '.') = 'I';
  end est_opert_inser;

  function est_opert_updat (pva_reqt in varchar2 default null)
    return boolean
  is
  begin
    return nvl (obten_opert_dml (pva_reqt), '.') = 'U';
  end est_opert_updat;

  function est_opert_delt (pva_reqt in varchar2 default null)
    return boolean
  is
  begin
    return nvl (obten_opert_dml (pva_reqt), '.') = 'D';
  end est_opert_delt;

  function est_opert_inser_va (pva_reqt in varchar2 default null)
    return varchar2
  is
  begin
    return case when obten_opert_dml (pva_reqt) = 'I' then 'O' else 'N' end;
  end est_opert_inser_va;

  function est_opert_updat_va (pva_reqt in varchar2 default null)
    return varchar2
  is
  begin
    return case when obten_opert_dml (pva_reqt) = 'U' then 'O' else 'N' end;
  end est_opert_updat_va;

  function est_opert_delt_va (pva_reqt in varchar2 default null)
    return varchar2
  is
  begin
    return case when obten_opert_dml (pva_reqt) = 'D' then 'O' else 'N' end;
  end est_opert_delt_va;

  procedure chang_modl_page (pnu_numr_apex     in number
                            ,pnu_page_apex     in number
                            ,pnu_templ_initl   in number
                            ,pnu_templ_final   in number)
  is
    cursor cur_page_item
    is
      select id
        from apex_item_page
       where     flow_id = pnu_numr_apex
             and flow_step_id = pnu_page_apex
             and item_field_template = pnu_templ_initl;
  begin
    for rec_page_item in cur_page_item
    loop
      afw_13_page_item_pkg.chang_modl_page_item (rec_page_item.id
                                                ,pnu_templ_final);
    end loop;
  end chang_modl_page;

  function obten_mesg_sucs_specf
    return varchar2
  is
    vnu_mesg   number (10);
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select ref_mesg_sucs_specf
      into vnu_mesg
      from vd_i_afw_13_page
     where seqnc = obten_page_sesn;

    if vnu_mesg is not null
    then
      vva_mesg   := afw_01_gestn_mesg_pkg.obten_mesg (vnu_mesg);
    else
      vva_mesg   := afw_11_prodt_pkg.obten_mesg_sucs_prodt;
    end if;

    return vva_mesg;
  end obten_mesg_sucs_specf;

  function obten_mesg_echec_specf
    return varchar2
  is
    vnu_mesg   number (10);
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select ref_mesg_echec_specf
      into vnu_mesg
      from vd_i_afw_13_page
     where seqnc = obten_page_sesn;

    if vnu_mesg is not null
    then
      vva_mesg   := afw_01_gestn_mesg_pkg.obten_mesg (vnu_mesg);
    else
      vva_mesg   := afw_11_prodt_pkg.obten_mesg_echec_prodt;
    end if;

    return vva_mesg;
  end obten_mesg_echec_specf;

  function obten_mesg_fetch_specf
    return varchar2
  is
    vnu_mesg   number (10);
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select ref_mesg_fetch_specf
      into vnu_mesg
      from vd_i_afw_13_page
     where seqnc = obten_page_sesn;

    if vnu_mesg is not null
    then
      vva_mesg   := afw_01_gestn_mesg_pkg.obten_mesg (vnu_mesg);
    else
      vva_mesg   := afw_11_prodt_pkg.obten_mesg_fetch_prodt;
    end if;

    return vva_mesg;
  end obten_mesg_fetch_specf;

  function obten_mesg_range_suprm_specf
    return varchar2
  is
    vnu_mesg   number (10);
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select ref_mesg_range_suprm_specf
      into vnu_mesg
      from vd_i_afw_13_page
     where seqnc = obten_page_sesn;

    if vnu_mesg is not null
    then
      vva_mesg   := afw_01_gestn_mesg_pkg.obten_mesg (vnu_mesg);
    else
      vva_mesg   := afw_11_prodt_pkg.obten_mesg_suprm_prodt;
    end if;

    return vva_mesg;
  end obten_mesg_range_suprm_specf;

  function obten_mesg_range_modf_specf
    return varchar2
  is
    vnu_mesg   number (10);
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select ref_mesg_range_modf_specf
      into vnu_mesg
      from vd_i_afw_13_page
     where seqnc = obten_page_sesn;

    if vnu_mesg is not null
    then
      vva_mesg   := afw_01_gestn_mesg_pkg.obten_mesg (vnu_mesg);
    else
      vva_mesg   := afw_11_prodt_pkg.obten_mesg_modf_prodt;
    end if;

    return vva_mesg;
  end obten_mesg_range_modf_specf;

  function obten_mesg_range_inser_specf
    return varchar2
  is
    vnu_mesg   number (10);
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select ref_mesg_range_inser_specf
      into vnu_mesg
      from vd_i_afw_13_page
     where seqnc = obten_page_sesn;

    if vnu_mesg is not null
    then
      vva_mesg   := afw_01_gestn_mesg_pkg.obten_mesg (vnu_mesg);
    else
      vva_mesg   := afw_11_prodt_pkg.obten_mesg_inser_prodt;
    end if;

    return vva_mesg;
  end obten_mesg_range_inser_specf;

  function obten_mesg_aucun_don_trouv
    return varchar2
  is
    vnu_mesg   number (10);
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select ref_mesg_aucun_don_trouv
      into vnu_mesg
      from vd_i_afw_13_page
     where seqnc = obten_page_sesn;

    if vnu_mesg is not null
    then
      vva_mesg   := afw_01_gestn_mesg_pkg.obten_mesg (vnu_mesg);
    else
      vva_mesg   := afw_11_prodt_pkg.obten_mesg_aucun_don_prodt;
    end if;

    return vva_mesg;
  end obten_mesg_aucun_don_trouv;

  function obten_mesg_trop_don_trouv
    return varchar2
  is
    vnu_mesg   number (10);
    vva_mesg   vd_i_afw_01_mesg_lang.mesg%type;
  begin
    select ref_mesg_trop_don_trouv
      into vnu_mesg
      from vd_i_afw_13_page
     where seqnc = obten_page_sesn;

    if vnu_mesg is not null
    then
      vva_mesg   := afw_01_gestn_mesg_pkg.obten_mesg (vnu_mesg);
    else
      vva_mesg   := afw_11_prodt_pkg.obten_mesg_trop_don_prodt;
    end if;

    return vva_mesg;
  end obten_mesg_trop_don_trouv;

  function obten_mesg_confr_suprs
    return varchar2
  is
    vnu_numr_page         number (10);
    vnu_struc_aplic       number (10);
    vva_code_mesg_suprs   varchar2 (10);
    vva_nom_struc_aplic   vd_afw_12_struc_aplic.nom%type;
    vva_adjec_demns       vd_afw_12_struc_aplic_lang.adjec_demns%type;
    vva_code_prodt        vd_i_afw_11_prodt.code%type default null;
  begin
    begin
      select p.ref_struc_aplic
            ,p.ref_code_mesg_suprs_specf
        into vnu_struc_aplic
            ,vva_code_mesg_suprs
        from vd_afw_13_page p
       where p.seqnc = afw_13_page_pkg.obten_page_sesn;
    exception
      when no_data_found
      then
        vnu_struc_aplic       := null;
        vva_code_mesg_suprs   := null;
    end;

    if vva_code_mesg_suprs is null
    then
      if vnu_struc_aplic is not null
      then
        begin
          select sal.nom
                ,sal.adjec_demns
                ,sa.ref_code_mesg_err_suprs
            into vva_nom_struc_aplic
                ,vva_adjec_demns
                ,vva_code_mesg_suprs
            from vd_afw_12_struc_aplic_lang sal
                ,vd_afw_12_struc_aplic      sa
           where     sal.ref_struc_aplic = sa.seqnc
                 and sal.ref_lang = afw_01_lang_pkg.obten_lang_sesn ()
                 and sa.seqnc = vnu_struc_aplic;

          if vva_code_mesg_suprs is null
          then
            vva_code_mesg_suprs   := 'SIE.000104';
            vva_code_prodt        := 'AFW';
          end if;
        exception
          when no_data_found
          then
            --struc aplic sans traduction
            vva_code_mesg_suprs   := 'SIE.000103';
            vva_code_prodt        := 'AFW';
        end;
      else
        --pas de struc aplic
        vva_code_mesg_suprs   := 'SIE.000103';
        vva_code_prodt        := 'AFW';
      end if;
    end if;

    if vva_adjec_demns is not null
    then
      vva_nom_struc_aplic      :=
           vva_adjec_demns
        || ' '
        || vva_nom_struc_aplic;
    end if;

    --Escaper la chaine, c'est du javascript quand meme!
    return afw_07_util_pkg.echap_text_js (afw_01_gestn_mesg_pkg.obten_mesg_par_numr (vva_code_mesg_suprs
                                                                                    ,vva_code_prodt
                                                                                    ,lower (vva_nom_struc_aplic)));
  end obten_mesg_confr_suprs;

  procedure defnr_item_aplic_apex
  is
  begin
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_MESG_SUCS_SPECF'
                                    ,obten_mesg_sucs_specf);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_MESG_ECHEC_SPECF'
                                    ,obten_mesg_echec_specf);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_LIEN_EDITN_RAPRT'
                                    ,obten_lien_editn_raprt);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_PAGE_TITRE'
                                    ,obten_titre_page_lang);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_MESG_IMPOS_FETCH'
                                    ,obten_mesg_fetch_specf);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_MESG_RANGE_SUPRM'
                                    ,obten_mesg_range_suprm_specf);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_MESG_RANGE_MODF'
                                    ,obten_mesg_range_modf_specf);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_MESG_RANGE_INSER'
                                    ,obten_mesg_range_inser_specf);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_MESG_AUCUN_DON_TROUV'
                                    ,obten_mesg_aucun_don_trouv);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_MESG_TROP_DON_TROUV'
                                    ,obten_mesg_trop_don_trouv);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_13_MESG_CONFR_SUPRS'
                                    ,obten_mesg_confr_suprs);
  end defnr_item_aplic_apex;


  function obten_icone_editn
    return varchar2
  is
  begin
    return    afw_15_htp_pkg.ouvri_bals ('span'
                                        ,'class'
                                        ,'afw_13_lien_editn_raprt fa-stack fa-lg icon-only'
                                        ,'data-toggle'
                                        ,'tooltip'
                                        ,'title'
                                        ,afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('GEN.100064'
                                                                                   ,pva_code_prodt   => 'AFW'))
           || afw_15_htp_pkg.ouvri_bals ('i'
                                        ,'class'
                                        ,'fa fa-circle fa-stack-2x')
           || afw_15_htp_pkg.fermr_bals ('i')
           || afw_15_htp_pkg.ouvri_bals ('i'
                                        ,'class'
                                        ,'fa fa-pencil fa-stack-1x fa-inverse')
           || afw_15_htp_pkg.fermr_bals ('i')
           || afw_15_htp_pkg.fermr_bals ('span');
  end obten_icone_editn;

  function obten_icone_consl
    return varchar2
  is
  begin
    return    afw_15_htp_pkg.ouvri_bals ('span'
                                        ,'class'
                                        ,'afw_13_lien_editn_raprt fa-stack fa-lg icon-only'
                                        ,'data-toggle'
                                        ,'tooltip'
                                        ,'title'
                                        ,afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('GEN.100065'
                                                                                   ,pva_code_prodt   => 'AFW'))
           || afw_15_htp_pkg.ouvri_bals ('i'
                                        ,'class'
                                        ,'fa fa-circle fa-stack-2x')
           || afw_15_htp_pkg.fermr_bals ('i')
           || afw_15_htp_pkg.ouvri_bals ('i'
                                        ,'class'
                                        ,'fa fa-info fa-stack-1x')
           || afw_15_htp_pkg.fermr_bals ('i')
           || afw_15_htp_pkg.fermr_bals ('span');
  end obten_icone_consl;

  function obten_lien_editn_raprt
    return varchar2
  is
    vva_lien   varchar2 (4000);
  begin
    if    afw_12_secrt_pkg.verfc_droit_acces_schem_apex (null
                                                        ,true
                                                        ,null
                                                        ,null)
       or afw_12_secrt_pkg.verfc_droit_acces_schem_apex (null
                                                        ,null
                                                        ,true
                                                        ,null)
       or afw_12_secrt_pkg.verfc_droit_acces_schem_apex (null
                                                        ,null
                                                        ,null
                                                        ,true)
    then
      vva_lien   := obten_icone_editn ();
    else
      vva_lien   := obten_icone_consl ();
    end if;

    return vva_lien;
  exception
    when others
    then
      raise;
  end obten_lien_editn_raprt;

  function obten_modl_mesg_sucs (pnu_page    in number default null
                                ,pnu_aplic   in number default afw_11_aplic_pkg.obten_aplic_sesn)
    return varchar2
  is
    vva_modl_mesg_sucs   apex_flow_templ.success_message%type;
  begin
    begin
      select aft.success_message
        into vva_modl_mesg_sucs
        from apex_page        ap
            ,apex_flow_templ  aft
            ,apex_inter_utils aiu
       where     ap.id = obten_numr_apex_page (pnu_page)
             and ap.flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
             and aft.id = ap.step_template
             and aiu.flow_id = ap.flow_id
             and aiu.theme_id = aft.theme_id;
    exception
      when no_data_found
      then
        select aft.success_message
          into vva_modl_mesg_sucs
          from apex_aplic       aa
              ,apex_aplic_theme aat
              ,apex_flow_templ  aft
              ,apex_inter_utils aiu
         where     aa.id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
               and aa.id = aat.flow_id
               and aat.default_page_template = aft.id
               and aiu.flow_id = aat.flow_id
               and aiu.theme_id = aat.theme_id;
    end;

    return vva_modl_mesg_sucs;
  end obten_modl_mesg_sucs;

  function obten_modl_mesg_ereur (pnu_page    in number default null
                                 ,pnu_aplic   in number default afw_11_aplic_pkg.obten_aplic_sesn)
    return varchar2
  is
    vva_modl_mesg_ereur   apex_flow_templ.message%type;
  begin
    begin
      select aft.message
        into vva_modl_mesg_ereur
        from apex_page        ap
            ,apex_flow_templ  aft
            ,apex_inter_utils aiu
       where     ap.id = obten_numr_apex_page (pnu_page)
             and ap.flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
             and aft.id = ap.step_template
             and aiu.flow_id = ap.flow_id
             and aiu.theme_id = aft.theme_id;
    exception
      when no_data_found
      then
        select aft.message
          into vva_modl_mesg_ereur
          from apex_aplic       aa
              ,apex_aplic_theme aat
              ,apex_flow_templ  aft
              ,apex_inter_utils aiu
         where     aa.id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
               and aa.id = aat.flow_id
               and aat.default_page_template = aft.id
               and aiu.flow_id = aat.flow_id
               and aiu.theme_id = aat.theme_id;
    end;

    return vva_modl_mesg_ereur;
  end obten_modl_mesg_ereur;

  function obten_nom_modl_page (pnu_page    in number default null
                               ,pnu_aplic   in number default afw_11_aplic_pkg.obten_aplic_sesn)
    return varchar2
  is
    vva_nom_modl   apex_flow_templ.name%type;
  begin
    begin
      select aft.name
        into vva_nom_modl
        from apex_page        ap
            ,apex_flow_templ  aft
            ,apex_inter_utils aiu
       where     ap.id = obten_numr_apex_page (pnu_page)
             and ap.flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
             and aft.id = ap.step_template
             and aiu.flow_id = ap.flow_id
             and aiu.theme_id = aft.theme_id;
    exception
      when no_data_found
      then
        select aft.name
          into vva_nom_modl
          from apex_aplic       aa
              ,apex_aplic_theme aat
              ,apex_flow_templ  aft
              ,apex_inter_utils aiu
         where     aa.id = afw_11_aplic_pkg.obten_numr_apex_aplic (pnu_aplic)
               and aa.id = aat.flow_id
               and aat.default_page_template = aft.id
               and aiu.flow_id = aat.flow_id
               and aiu.theme_id = aat.theme_id;
    end;

    return vva_nom_modl;
  end obten_nom_modl_page;

  function obten_page_ir (pnu_page in number)
    return number
  is
    cursor cur_page_ir
    is
      select seqnc
        from vd_i_afw_13_page_ir ir
       where ir.ref_page = pnu_page;

    vnu_nombr_trouv   number (3) default 0;
    vnu_seqnc         number (10);
  begin
    for rec_page_ir in cur_page_ir
    loop
      vnu_nombr_trouv   := vnu_nombr_trouv + 1;
      vnu_seqnc         := rec_page_ir.seqnc;
    end loop;

    if vnu_nombr_trouv = 1
    then
      return vnu_seqnc;
    else
      return null;
    end if;
  end obten_page_ir;

  procedure reint_soums_page (pnu_numr_apex_aplic   in number
                             ,pnu_numr_apex_page    in number
                             ,pnu_sesn              in number default afw_12_sesn_pkg.obten_sesn)
  is
  begin
    delete apex_soums_page asp
     where     asp.flow_id = pnu_numr_apex_aplic
           and asp.page_id = pnu_numr_apex_page
           and asp.session_id = pnu_sesn;
  end reint_soums_page;

  function obten_page (pnu_numr_page_apex    in vd_i_afw_13_page.numr_apex%type
                      ,pnu_numr_aplic_apex   in vd_i_afw_11_aplic.numr_aplic_apex%type)
    return vd_i_afw_13_page.seqnc%type
  is
    vnu_page   vd_i_afw_13_page.seqnc%type;
  begin
    select p.seqnc
      into vnu_page
      from vd_i_afw_13_page  p
          ,vd_i_afw_11_aplic a
     where     p.ref_aplic = a.seqnc
           and p.numr_apex = pnu_numr_page_apex
           and a.numr_aplic_apex = pnu_numr_aplic_apex;

    return vnu_page;
  exception
    when no_data_found
    then
      return null;
  end obten_page;

  function obten_icone_font_awesm (pnu_page in vd_i_afw_13_page.seqnc%type default obten_page_sesn)
    return varchar2
  is
    vva_icone   varchar2 (200);
  begin
    vva_icone   := afw_12_struc_aplic_pkg.obten_icone_font_awesm (obten_struc_aplic (pnu_page));

    if vva_icone is not null
    then
      vva_icone      :=
           'fa '
        || vva_icone;
    end if;

    return vva_icone;
  exception
    when others
    then
      ete ();
      raise;
  end obten_icone_font_awesm;

  function exist_tutrl (pnu_page in vd_afw_13_page.seqnc%type default afw_13_page_pkg.obten_page_sesn)
    return boolean
  is
    vnu_exist   number;
    vbo_exist   boolean default false;
  begin
    select count (*)
      into vnu_exist
      from vd_afw_13_etape_tutrl et
     where et.ref_page = pnu_page;

    if vnu_exist > 0
    then
      vbo_exist   := true;
    end if;

    return vbo_exist;
  end exist_tutrl;
end afw_13_page_pkg;
/
