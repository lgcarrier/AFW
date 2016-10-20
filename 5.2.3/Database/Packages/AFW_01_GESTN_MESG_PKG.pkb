SET DEFINE OFF;
create or replace package body afw_01_gestn_mesg_pkg
as
  function obten_seqnc_mesg (pva_numr_mesg    in varchar2
                            ,pva_code_prodt   in varchar2 default null)
    return vd_i_afw_01_mesg.seqnc%type
  is
    vnu_mesg    vd_i_afw_01_mesg.seqnc%type;
    vnu_prodt   vd_i_afw_11_prodt.seqnc%type;
  begin
    vnu_prodt   := case when pva_code_prodt is null then afw_11_prodt_pkg.obten_prodt_sesn () else afw_11_prodt_pkg.obten_prodt (pva_code_prodt) end;

    select m.seqnc
      into vnu_mesg
      from vd_i_afw_01_mesg m
     where     m.numr_mesg = upper (pva_numr_mesg)
           and m.ref_prodt = vnu_prodt;

    return vnu_mesg;
  exception
    when no_data_found
    then
      return null;
  end obten_seqnc_mesg;

  function obten_seqnc_mesg_lang_sesn (pva_numr_mesg    in varchar2
                                      ,pva_code_prodt   in varchar2 default null)
    return vd_i_afw_01_mesg_lang.seqnc%type
  is
    vnu_mesg_lang   vd_i_afw_01_mesg_lang.seqnc%type;
    vnu_prodt       vd_i_afw_11_prodt.seqnc%type;
  begin
    vnu_prodt   := case when pva_code_prodt is null then afw_11_prodt_pkg.obten_prodt_sesn () else afw_11_prodt_pkg.obten_prodt (pva_code_prodt) end;

    select seqnc
      into vnu_mesg_lang
      from vd_i_afw_01_mesg_lang
     where     ref_mesg = obten_seqnc_mesg (pva_numr_mesg
                                           ,pva_code_prodt)
           and ref_lang = afw_01_lang_pkg.obten_lang_sesn (vnu_prodt);

    return vnu_mesg_lang;
  exception
    when no_data_found
    then
      return null;
  end obten_seqnc_mesg_lang_sesn;

  procedure afich_mesg_par_numr (pva_numr_mesg      in varchar2
                                ,pva_code_prodt     in varchar2 default null
                                ,pva_valr_subst1    in varchar2 default null
                                ,pva_valr_subst2    in varchar2 default null
                                ,pva_valr_subst3    in varchar2 default null
                                ,pva_valr_subst4    in varchar2 default null
                                ,pva_valr_subst5    in varchar2 default null
                                ,pva_valr_subst6    in varchar2 default null
                                ,pva_valr_subst7    in varchar2 default null
                                ,pva_valr_subst8    in varchar2 default null
                                ,pva_valr_subst9    in varchar2 default null
                                ,pva_valr_subst10   in varchar2 default null)
  is
    vva_mesg_info   varchar2 (32767)
                      default    afw_15_htp_pkg.ouvri_bals ('div'
                                                           ,'id'
                                                           ,'afw_mesg_infor'
                                                           ,'class'
                                                           ,'ui-widget')
                              || afw_15_htp_pkg.ouvri_bals ('div'
                                                           ,'class'
                                                           ,'ui-state-highlight ui-corner-all'
                                                           ,'style'
                                                           ,'margin-bottom: 3px; padding: 0 .7em;')
                              || afw_15_htp_pkg.ouvri_bals ('p')
                              || afw_15_htp_pkg.ouvri_bals ('span'
                                                           ,'class'
                                                           ,'ui-icon ui-icon-info'
                                                           ,'style'
                                                           ,'float: left; margin-right: .3em;')
                              || afw_15_htp_pkg.fermr_bals ('span')
                              || '%CONTN%'
                              || afw_15_htp_pkg.fermr_bals ('p')
                              || afw_15_htp_pkg.fermr_bals ('div')
                              || afw_15_htp_pkg.fermr_bals ('div');

    vva_mesg_temp   varchar2 (32767);
  begin
    vva_mesg_temp      :=
      afw_01_gestn_mesg_pkg.obten_mesg_par_numr (pva_numr_mesg
                                                ,nvl (pva_code_prodt, afw_11_prodt_pkg.obten_code_prodt)
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

    if vva_mesg_temp is not null
    then
      htp.p (replace (vva_mesg_info
                     ,'%CONTN%'
                     ,vva_mesg_temp));
    end if;
  end afich_mesg_par_numr;

  function obten_mesg_par_numr (pva_numr_mesg      in varchar2
                               ,pva_code_prodt     in varchar2 default null
                               ,pva_valr_subst1    in varchar2 default null
                               ,pva_valr_subst2    in varchar2 default null
                               ,pva_valr_subst3    in varchar2 default null
                               ,pva_valr_subst4    in varchar2 default null
                               ,pva_valr_subst5    in varchar2 default null
                               ,pva_valr_subst6    in varchar2 default null
                               ,pva_valr_subst7    in varchar2 default null
                               ,pva_valr_subst8    in varchar2 default null
                               ,pva_valr_subst9    in varchar2 default null
                               ,pva_valr_subst10   in varchar2 default null)
    return varchar2
  is
    vva_retr    varchar2 (32767);
    vnu_prodt   vd_i_afw_11_prodt.seqnc%type;
    vnu_lang    vd_i_afw_01_lang.seqnc%type;
  begin
    vnu_prodt   := case when pva_code_prodt is null then afw_11_prodt_pkg.obten_prodt_sesn () else afw_11_prodt_pkg.obten_prodt (pva_code_prodt) end;
    vnu_lang    := afw_01_lang_pkg.obten_lang_sesn (vnu_prodt);

    select mesg
      into vva_retr
      from vd_i_afw_01_mesg_lang mes
     where     mes.ref_mesg = obten_seqnc_mesg (pva_numr_mesg
                                               ,pva_code_prodt)
           and mes.ref_lang = vnu_lang;

    vva_retr      :=
      replace (vva_retr
              ,'%1%'
              ,pva_valr_subst1);
    vva_retr      :=
      replace (vva_retr
              ,'%2%'
              ,pva_valr_subst2);
    vva_retr      :=
      replace (vva_retr
              ,'%3%'
              ,pva_valr_subst3);
    vva_retr      :=
      replace (vva_retr
              ,'%4%'
              ,pva_valr_subst4);
    vva_retr      :=
      replace (vva_retr
              ,'%5%'
              ,pva_valr_subst5);
    vva_retr      :=
      replace (vva_retr
              ,'%6%'
              ,pva_valr_subst6);
    vva_retr      :=
      replace (vva_retr
              ,'%7%'
              ,pva_valr_subst7);
    vva_retr      :=
      replace (vva_retr
              ,'%8%'
              ,pva_valr_subst8);
    vva_retr      :=
      replace (vva_retr
              ,'%9%'
              ,pva_valr_subst9);
    vva_retr      :=
      replace (vva_retr
              ,'%10%'
              ,pva_valr_subst10);

    return vva_retr;
  exception
    when no_data_found
    then
      return    'Le message '
             || pva_numr_mesg
             || ' n''est pas défini dans le système de gestion des messages d''erreur';
  end obten_mesg_par_numr;

  function obten_mesg (pnu_seqnc_mesg     in number
                      ,pva_valr_subst1    in varchar2 default null
                      ,pva_valr_subst2    in varchar2 default null
                      ,pva_valr_subst3    in varchar2 default null
                      ,pva_valr_subst4    in varchar2 default null
                      ,pva_valr_subst5    in varchar2 default null
                      ,pva_valr_subst6    in varchar2 default null
                      ,pva_valr_subst7    in varchar2 default null
                      ,pva_valr_subst8    in varchar2 default null
                      ,pva_valr_subst9    in varchar2 default null
                      ,pva_valr_subst10   in varchar2 default null)
    return varchar2
  is
    vva_numr_mesg   vd_i_afw_01_mesg.numr_mesg%type;
    vnu_ref_prodt   vd_i_afw_01_mesg.ref_prodt%type;
  begin
    select numr_mesg
          ,ref_prodt
      into vva_numr_mesg
          ,vnu_ref_prodt
      from vd_i_afw_01_mesg
     where seqnc = pnu_seqnc_mesg;

    return obten_mesg_par_numr (vva_numr_mesg
                               ,afw_11_prodt_pkg.obten_code_prodt (vnu_ref_prodt)
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
  exception
    when no_data_found
    then
      return 'Le message n''est pas défini dans le système de gestion des messages d''erreur';
  end obten_mesg;

  function obten_proch_numr (pva_catgr in varchar2)
    return varchar2
  is
    vva_catrg        varchar2 (3)
                       default substr (   pva_catgr
                                       || '___'
                                      ,1
                                      ,3);
    vnu_dernr_numr   number;
  begin
    begin
      select to_number (substr (numr_mesg
                               ,5))
        into vnu_dernr_numr
        from (select max (numr_mesg) numr_mesg
                from vd_i_afw_01_mesg
               where numr_mesg like
                          vva_catrg
                       || '.%')
       where rownum = 1;
    exception
      when no_data_found
      then
        vnu_dernr_numr   := 0;
    end;

    return    vva_catrg
           || '.'
           || to_char (nvl (vnu_dernr_numr, 0) + 1
                      ,'FM000000');
  end obten_proch_numr;

  function obten_list_mesg_formt (pva_liste in varchar2)
    return varchar2
  is
    vtb_liste   apex_application_global.vc_arr2;
    vva_mesg    varchar2 (32767);
  begin
    vtb_liste   := afw_07_util_pkg.string_to_table (pva_liste);

    if vtb_liste.count () != 0
    then
      for i in vtb_liste.first () .. vtb_liste.last ()
      loop
        vva_mesg      :=
             vva_mesg
          || obten_mesg_par_numr (vtb_liste (i))
          || '<br />';
      end loop;
    end if;

    return substr (vva_mesg
                  ,1
                  ,length (vva_mesg) - 6);
  end obten_list_mesg_formt;

  procedure creer_mesg_aide_lang (pnu_page    in number
                                 ,pnu_lang    in number
                                 ,pnu_prodt   in number
                                 ,pva_catgr   in varchar2)
  is
    --Curseur des items de pages qui n'ont pas de message d'aide de définis
    cursor cur_item
    is
      select pi.seqnc
            ,pi.type_item
            ,pi.ref_mesg_aide
        from vd_i_afw_13_page_item pi
       where pi.ref_page = pnu_page;

    cursor cur_coln_ir
    is
      select irc.seqnc
            ,'RAPRT'
            ,irc.ref_mesg_aide
        from vd_i_afw_13_page_ir      ir
            ,vd_i_afw_13_page_ir_coln irc
       where     ir.seqnc = irc.ref_page_ir
             and ir.ref_page = pnu_page;

    vva_proch_numr_mesg     varchar2 (20);
    vnu_mesg                number (10);
    vnu_prodt               number (10) default pnu_prodt;
    vnu_ref_dv_regn_piltb   number (10);
    vbo_regn_piltb          boolean default false;
    vbo_page_item           boolean default false;
    vbo_page_ir_coln        boolean default false;
    vbo_regn_piltb_lang     boolean default false;
    vbo_page_item_lang      boolean default false;
    vbo_page_ir_coln_lang   boolean default false;
    vbo_retrn               boolean default false;
  begin
    if pva_catgr is not null
    then
      --Obtenir le dv d'une region d'aide de page
      vnu_ref_dv_regn_piltb      :=
        afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REGN_PILTB'
                                         ,'AIDE_PAGE');

      --Vérifier l'existance d'une regn_piltb de type 'AIDE_PAGE'
      declare
        vnu_regn_piltb   number (10);
      begin
        select seqnc
          into vnu_regn_piltb
          from vd_i_afw_13_regn_piltb rp
         where     rp.ref_page = pnu_page
               and rp.ref_dv_type_regn_piltb = vnu_ref_dv_regn_piltb;

        vbo_regn_piltb_lang      :=
          genr_lang_mesg (vnu_regn_piltb
                         ,pnu_lang
                         ,'PAGE');
      exception
        --S'il n'y a aucune présence d'aide de page
        when no_data_found
        then
          --Insérer l'aide de page
          vva_proch_numr_mesg   := obten_proch_numr (pva_catgr);

          insert into vd_i_afw_13_regn_piltb (code
                                             ,nom
                                             ,ref_page
                                             ,ref_dv_type_regn_piltb)
               values ('AIDE_PAGE'
                      ,vva_proch_numr_mesg
                      ,pnu_page
                      ,vnu_ref_dv_regn_piltb)
            returning seqnc
                 into vnu_mesg;

          vbo_regn_piltb        :=
            genr_lang_mesg (vnu_mesg
                           ,pnu_lang
                           ,'PAGE');
      end;

      for rec_item in cur_item
      loop
        declare
          vnu_mesg_aide   number (10);
        begin
          select seqnc
            into vnu_mesg_aide
            from vd_i_afw_01_mesg
           where seqnc = rec_item.ref_mesg_aide;

          vbo_retrn      :=
            genr_lang_mesg (vnu_mesg_aide
                           ,pnu_lang
                           ,'ITEM');

          if     vbo_page_item_lang <> true
             and vbo_retrn
          then
            vbo_page_item_lang   := true;
          end if;
        exception
          when no_data_found
          then
            --Obtenir la prochaine valeur du numr_mesg
            vva_proch_numr_mesg   := obten_proch_numr (pva_catgr);

            --créer le message
            insert into vd_i_afw_01_mesg (numr_mesg
                                         ,ref_prodt
                                         ,type_mesg)
                 values (vva_proch_numr_mesg
                        ,vnu_prodt
                        ,'A')
              returning seqnc
                   into vnu_mesg;

            --créer un enregistrement du mesg selon la langue
            --NOTE: Il doit y avoir un mesg (texte) pour inserer dans cette table. Demander à bp
            vbo_retrn             :=
              genr_lang_mesg (vnu_mesg
                             ,pnu_lang
                             ,'ITEM');

            --lier le message à l'item courant
            update vd_i_afw_13_page_item
               set ref_mesg_aide   = vnu_mesg
             where seqnc = rec_item.seqnc;

            if     vbo_page_item <> true
               and vbo_retrn
            then
              vbo_page_item   := true;
            end if;
        end;
      end loop;

      for rec_coln_ir in cur_coln_ir
      loop
        declare
          vnu_mesg_aide   number (10);
        begin
          select seqnc
            into vnu_mesg_aide
            from vd_i_afw_01_mesg
           where seqnc = rec_coln_ir.ref_mesg_aide;

          vbo_retrn      :=
            genr_lang_mesg (vnu_mesg_aide
                           ,pnu_lang
                           ,'RAPRT');

          if     vbo_page_ir_coln_lang <> true
             and vbo_retrn
          then
            vbo_page_ir_coln_lang   := true;
          end if;
        exception
          when no_data_found
          then
            --Obtenir la prochaine valeur du numr_mesg
            vva_proch_numr_mesg   := obten_proch_numr (pva_catgr);

            --créer le message
            insert into vd_i_afw_01_mesg (numr_mesg
                                         ,ref_prodt
                                         ,type_mesg)
                 values (vva_proch_numr_mesg
                        ,vnu_prodt
                        ,'A')
              returning seqnc
                   into vnu_mesg;

            --créer un enregistrement du mesg selon la langue
            vbo_retrn             :=
              genr_lang_mesg (vnu_mesg
                             ,pnu_lang
                             ,'RAPRT');

            --lier le message à l'item courant
            update vd_i_afw_13_page_ir_coln
               set ref_mesg_aide   = vnu_mesg
             where seqnc = rec_coln_ir.seqnc;

            if     vbo_page_ir_coln <> true
               and vbo_retrn
            then
              vbo_page_ir_coln   := true;
            end if;
        end;
      end loop;

      --Ajouter les mesg informatifs sur la génération de mesg.
      if vbo_regn_piltb_lang
      then
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('MES.000003'
                                                       ,pva_code_prodt   => 'AFW');
      end if;

      if vbo_regn_piltb
      then
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('MES.000004'
                                                       ,pva_code_prodt   => 'AFW');
      end if;

      if vbo_page_item_lang
      then
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('MES.000005'
                                                       ,pva_code_prodt   => 'AFW');
      end if;

      if vbo_page_item
      then
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('MES.000006'
                                                       ,pva_code_prodt   => 'AFW');
      end if;

      if vbo_page_ir_coln_lang
      then
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('MES.000007'
                                                       ,pva_code_prodt   => 'AFW');
      end if;

      if vbo_page_ir_coln
      then
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('MES.000008'
                                                       ,pva_code_prodt   => 'AFW');
      end if;

      --Lorsque traitement terminé, update du prefix des mesg de la page
      update vd_i_afw_13_page
         set prefx_mesg   = pva_catgr
       where seqnc = pnu_page;
    else
      afw_01_err_apex_pkg.lever_err_apex_code ('MES.000009'
                                              ,pva_code_prodt   => 'AFW');
    end if;
  end creer_mesg_aide_lang;

  function genr_lang_mesg (pnu_mesg   in number
                          ,pnu_lang   in number
                          ,pva_mode   in varchar2)
    return boolean
  is
    vnu_lang   number (10);
  begin
    --Vérifier d'abord si le mesg existe dans la langue demandée
    if pva_mode in ('ITEM'
                   ,'RAPRT')
    then
      select ref_lang
        into vnu_lang
        from vd_i_afw_01_mesg_lang
       where     ref_lang = pnu_lang
             and ref_mesg = pnu_mesg;
    elsif pva_mode = 'PAGE'
    then
      select ref_lang
        into vnu_lang
        from vd_i_afw_13_regn_piltb_lang
       where     ref_regn_piltb = pnu_mesg
             and ref_lang = pnu_lang;
    end if;

    return false;
  exception
    when no_data_found
    then
      if pva_mode = 'ITEM'
      then
        insert into vd_i_afw_01_mesg_lang (ref_lang
                                          ,ref_mesg)
             values (pnu_lang
                    ,pnu_mesg);
      elsif pva_mode = 'RAPRT'
      then
        insert into vd_i_afw_01_mesg_lang (ref_lang
                                          ,ref_mesg)
             values (pnu_lang
                    ,pnu_mesg);
      elsif pva_mode = 'PAGE'
      then
        insert into vd_i_afw_13_regn_piltb_lang (ref_regn_piltb
                                                ,ref_lang)
             values (pnu_mesg
                    ,pnu_lang);
      end if;

      return true;
  end;

  function obten_mesg_aide_page_item (pnu_sidf           in number
                                     ,pnu_item_id_apex   in number
                                     ,pnu_lang           in number)
    return varchar2
  is
    vva_mesg   varchar2 (4000);
  begin
    select ml.mesg
      into vva_mesg
      from afw_12_sesn           s
          ,vd_i_afw_04_fil_arian fa
          ,vd_afw_11_prodt       pr
          ,vd_afw_11_aplic       ap
          ,vd_i_afw_13_page      pa
          ,vd_i_afw_13_page_item pi
          ,vd_i_afw_01_mesg      me
          ,vd_i_afw_01_mesg_lang ml
     where     fa.seqnc = pnu_sidf
           and ap.numr_aplic_apex = fa.app_id
           and pa.ref_aplic = ap.seqnc
           and ap.ref_prodt = pr.seqnc
           and pa.numr_apex = fa.page
           and s.id_sesn = fa.session_id
           and ml.ref_lang = s.ref_lang
           and pi.ref_page = pa.seqnc
           and pi.id_apex = pnu_item_id_apex
           and pi.ref_mesg_aide = me.seqnc
           and ml.ref_mesg = me.seqnc;

    --Si le mesg est existant, mais que le champ mesg est vide, lever un mesg d'exception.
    if trim (vva_mesg) is null
    then
      vva_mesg      :=
        afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('MES.000001'
                                                  ,'AFW');
    end if;

    return vva_mesg;
  exception
    when no_data_found
    then
      return afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('MES.000001'
                                                       ,'AFW');
  end obten_mesg_aide_page_item;

  procedure obten_aide_page_item (pnu_sidf           in number
                                 ,pnu_item_id_apex   in number
                                 ,pnu_lang           in number default null)
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('h1');
    afw_15_htp_pkg.ecrir ('Aide page item'
                         ,false);
    afw_15_htp_pkg.fermr_bals ('h1');

    afw_15_htp_pkg.ecrir (afw_01_gestn_mesg_pkg.obten_mesg_aide_page_item (pnu_sidf
                                                                          ,pnu_item_id_apex
                                                                          ,pnu_lang));
  end obten_aide_page_item;

  function obten_nombr_item (pnu_page        in number
                            ,pnu_lang        in number
                            ,pva_type_item   in varchar2)
    return number
  is
    vnu_nombr   number;
  begin
    select count (1)
      into vnu_nombr
      from vd_afw_01_mesg_aide ma
     where     ma.ref_page = pnu_page
           and ma.ref_lang = pnu_lang
           and ma.type_item = pva_type_item;

    return vnu_nombr;
  end obten_nombr_item;

  function creer_mesg (pva_catgr_numr_mesg   in varchar2
                      ,pva_texte_mesg        in vd_i_afw_01_mesg_lang.mesg%type
                      ,pva_type_mesg         in vd_i_afw_01_mesg.type_mesg%type
                      ,pnu_prodt             in vd_i_afw_01_mesg.ref_prodt%type default afw_11_prodt_pkg.obten_prodt_sesn
                      ,pnu_lang              in vd_i_afw_01_mesg_lang.ref_lang%type default afw_01_lang_pkg.obten_lang_sesn)
    return vd_i_afw_01_mesg.seqnc%type
  is
    vnu_mesg              vd_i_afw_01_mesg.seqnc%type;
    vva_catgr_numr_mesg   varchar2 (3);
  begin
    vva_catgr_numr_mesg   := nvl (pva_catgr_numr_mesg, 'GEN');

    insert into vd_i_afw_01_mesg (numr_mesg
                                 ,ref_prodt
                                 ,type_mesg
                                 ,dnr_ref_prodt)
         values (afw_01_gestn_mesg_pkg.obten_proch_numr (vva_catgr_numr_mesg)
                ,pnu_prodt
                ,pva_type_mesg
                ,pnu_prodt)
      returning seqnc
           into vnu_mesg;

    insert into vd_i_afw_01_mesg_lang (mesg
                                      ,ref_lang
                                      ,ref_mesg
                                      ,dnr_ref_prodt)
         values (pva_texte_mesg
                ,pnu_lang
                ,vnu_mesg
                ,pnu_prodt);

    return vnu_mesg;
  end creer_mesg;

  procedure creer_mesg (pva_catgr_numr_mesg   in varchar2
                       ,pva_texte_mesg        in vd_i_afw_01_mesg_lang.mesg%type
                       ,pva_type_mesg         in vd_i_afw_01_mesg.type_mesg%type
                       ,pnu_prodt             in vd_i_afw_01_mesg.ref_prodt%type default afw_11_prodt_pkg.obten_prodt_sesn
                       ,pnu_lang              in vd_i_afw_01_mesg_lang.ref_lang%type default afw_01_lang_pkg.obten_lang_sesn)
  is
    vnu_mesg   vd_i_afw_01_mesg.seqnc%type;
  begin
    vnu_mesg      :=
      creer_mesg (pva_catgr_numr_mesg
                 ,pva_texte_mesg
                 ,pva_type_mesg
                 ,pnu_prodt
                 ,pnu_lang);
  end creer_mesg;
end afw_01_gestn_mesg_pkg;
/
