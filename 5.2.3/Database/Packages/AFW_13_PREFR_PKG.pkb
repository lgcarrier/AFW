SET DEFINE OFF;
create or replace package body afw_13_prefr_pkg
as
  procedure sauvg_prefr (pnu_ref_prefr   in number
                        ,pva_valr        in varchar2)
  is
    vva_type_insta    vd_afw_13_prefr.ref_dv_type_insta_organ%type;
    vva_indic_contx   vd_afw_13_prefr.indic_contx%type;
    vnu_ref_utils     number default null;
    vnu_ref_sesn      number default null;
    vnu_ref_contx     number default null;
  begin
    select pref.ref_dv_type_insta_organ
          ,pref.indic_contx
      into vva_type_insta
          ,vva_indic_contx
      from vd_afw_13_prefr pref
     where pref.seqnc = pnu_ref_prefr;

    -- Alimenter les références selon le type d'instanciation
    case vva_type_insta
      when 'UTILS'
      then
        vnu_ref_utils   := afw_12_utils_pkg.obten_usagr_conct ();

        -- S'assurer qu'on trouve l'utilisateur, sinon arrêter ici
        if vnu_ref_utils is null
        then
          return;
        end if;
      when 'SESN'
      then
        -- S'assurer qu'on trouve la session, sinon arrêter ici
        vnu_ref_sesn   := afw_07_util_pkg.nv ('SESSION');

        if vnu_ref_sesn is null
        then
          return;
        end if;
      else
        null;
    end case;

    if vva_indic_contx = 'O'
    then
      -- Lier au contexte
      select max (tc.seqnc)
        into vnu_ref_contx
        from vd_afw_12_struc_aplic tc
       where     tc.code = afw_07_util_pkg.v ('A_AFW_04_CONTX')
             and ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn ();
    end if;

    merge into vd_afw_13_insta_prefr ip
         using (select pnu_ref_prefr ref_prefr
                      ,vnu_ref_utils ref_utils
                      ,vnu_ref_sesn  ref_sesn
                      ,pva_valr      valr
                      ,vnu_ref_contx ref_struc_aplic
                  from dual) nouv
            on (    ip.ref_prefr = nouv.ref_prefr
                and (   ip.ref_utils = nouv.ref_utils
                     or (    ip.ref_utils is null
                         and nouv.ref_utils is null))
                and (   ip.ref_sesn = nouv.ref_sesn
                     or (    ip.ref_sesn is null
                         and nouv.ref_sesn is null))
                and (   ip.ref_struc_aplic = nouv.ref_struc_aplic
                     or (    ip.ref_struc_aplic is null
                         and nouv.ref_struc_aplic is null)))
    when matched
    then
      update set ip.valr   = nouv.valr
    when not matched
    then
      insert     (ip.ref_prefr
                 ,ip.ref_utils
                 ,ip.ref_sesn
                 ,ip.ref_struc_aplic
                 ,ip.valr)
          values (nouv.ref_prefr
                 ,nouv.ref_utils
                 ,nouv.ref_sesn
                 ,nouv.ref_struc_aplic
                 ,nouv.valr);
  end sauvg_prefr;

  function charg_prefr (pnu_ref_prefr   in     number
                       ,pva_valr           out varchar2)
    return boolean
  is
    vva_type_insta         vd_afw_13_prefr.ref_dv_type_insta_organ%type;
    vva_indic_contx        vd_afw_13_prefr.indic_contx%type;
    vva_valr_insta         vd_afw_13_prefr.ref_dv_valr_insta_organ%type;
    vva_forml_valr_insta   vd_afw_13_prefr.forml_valr_insta%type;
    vnu_ref_utils          number default null;
    vnu_ref_sesn           number default null;
    vnu_ref_contx          number default null;
  begin
    select pref.ref_dv_type_insta_organ
          ,pref.indic_contx
          ,pref.ref_dv_valr_insta_organ
          ,pref.forml_valr_insta
      into vva_type_insta
          ,vva_indic_contx
          ,vva_valr_insta
          ,vva_forml_valr_insta
      from vd_afw_13_prefr pref
     where pref.seqnc = pnu_ref_prefr;

    -- Alimenter les références selon le type d'instanciation
    case vva_type_insta
      when 'UTILS'
      then
        vnu_ref_utils   := afw_12_utils_pkg.obten_usagr_conct ();

        -- S'assurer qu'on trouve l'utilisateur, sinon arrêter ici
        if vnu_ref_utils is null
        then
          return false;
        end if;
      when 'SESN'
      then
        -- S'assurer qu'on trouve la session, sinon arrêter ici
        vnu_ref_sesn   := afw_07_util_pkg.nv ('SESSION');

        if vnu_ref_sesn is null
        then
          return false;
        end if;
      else
        null;
    end case;

    if vva_indic_contx = 'O'
    then
      -- Lier au contexte
      select max (tc.seqnc)
        into vnu_ref_contx
        from vd_afw_12_struc_aplic tc
       where     tc.code = afw_07_util_pkg.v ('A_AFW_04_CONTX')
             and ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn ();
    end if;

    begin
      select ip.valr
        into gva_valr
        from vd_afw_13_insta_prefr ip
       where     ip.ref_prefr = pnu_ref_prefr
             and (   ip.ref_utils = vnu_ref_utils
                  or (    ip.ref_utils is null
                      and vnu_ref_utils is null))
             and (   ip.ref_sesn = vnu_ref_sesn
                  or (    ip.ref_sesn is null
                      and vnu_ref_sesn is null))
             and (   ip.ref_struc_aplic = vnu_ref_contx
                  or (    ip.ref_struc_aplic is null
                      and vnu_ref_contx is null));
    exception
      when no_data_found
      then
        -- Dans le cas de la valeur de préférence seulement,
        -- ne pas retourner null, conserver la valeur actuel de l'item
        if vva_valr_insta = 'VALR_PREFR'
        then
          return false;
        end if;

        gva_valr   := null;
    end;

    case vva_valr_insta
      when 'VALR_PREFR'
      then
        pva_valr   := gva_valr;
      when 'VALR_FIXE'
      then
        pva_valr      :=
          replace (vva_forml_valr_insta
                  ,'#PREFERENCE#'
                  ,gva_valr);
      --TODO:TRESE exécuter la formule via afw_05_forml...
      /*when 'PL/SQL' then
                    pva_valr := gva_valr;*/
      else
        return false;
    end case;

    return true;
  end charg_prefr;

  procedure sauvg_prefr_page (pnu_ref_aplic        in number default null
                             ,pnu_numr_page_apex   in number default null)
  is
    vnu_ref_aplic        number default nvl (pnu_ref_aplic, afw_11_aplic_pkg.obten_aplic_sesn ());
    vnu_numr_page_apex   number default nvl (pnu_numr_page_apex, afw_07_util_pkg.nv ('APP_PAGE_ID'));
    vva_valr             vd_afw_13_insta_prefr.valr%type;

    -- TODO:TRESE Ajouter le 2e champ de formule pour la condition de sauvegarde
    cursor cur_prefr
    is
      select pref.seqnc
            ,pref.ref_dv_condt_sauvg_organ condt_type
            ,pref.forml_condt_sauvg        condt_expre_1
            ,null                          condt_expre_2
            ,pi.nom_apex
        from vd_afw_13_prefr     pref
            ,vd_afw_13_page_item pi
            ,vd_afw_13_page      p
       where     p.ref_aplic = vnu_ref_aplic
             and p.numr_apex = vnu_numr_page_apex
             and pi.ref_page = p.seqnc
             and pref.ref_item = pi.seqnc;
  begin
    -- Boucler les préférences d'item pour la page demandée
    for rec_prefr in cur_prefr
    loop
      -- Tester s'il faut sauvegarder la préférence
      if apex_condt.standard_condition (rec_prefr.condt_type
                                       ,rec_prefr.condt_expre_1
                                       ,rec_prefr.condt_expre_2)
      then
        vva_valr   := afw_07_util_pkg.v (rec_prefr.nom_apex);
        sauvg_prefr (rec_prefr.seqnc
                    ,vva_valr);
      end if;
    end loop;
  end sauvg_prefr_page;

  procedure charg_prefr_page (pnu_ref_aplic        in number default null
                             ,pnu_numr_page_apex   in number default null)
  is
    vnu_ref_aplic        number default nvl (pnu_ref_aplic, afw_11_aplic_pkg.obten_aplic_sesn ());
    vnu_numr_page_apex   number default nvl (pnu_numr_page_apex, afw_07_util_pkg.nv ('APP_PAGE_ID'));

    -- TODO:TRESE Ajouter le 2e champ de formule pour la condition de sauvegarde
    cursor cur_prefr
    is
      select pref.seqnc
            ,pref.ref_dv_condt_utils_organ condt_type
            ,pref.forml_condt_utils        condt_expre_1
            ,null                          condt_expre_2
            ,pi.nom_apex
        from vd_afw_13_prefr     pref
            ,vd_afw_13_page_item pi
            ,vd_afw_13_page      p
       where     p.ref_aplic = vnu_ref_aplic
             and p.numr_apex = vnu_numr_page_apex
             and pi.ref_page = p.seqnc
             and pref.ref_item = pi.seqnc;

    vva_valr             vd_afw_13_insta_prefr.valr%type;
  begin
    -- Boucler les préférences d'item pour la page demandée
    for rec_prefr in cur_prefr
    loop
      -- Tester s'il faut charger la préférence
      if apex_condt.standard_condition (rec_prefr.condt_type
                                       ,rec_prefr.condt_expre_1
                                       ,rec_prefr.condt_expre_2)
      then
        if charg_prefr (rec_prefr.seqnc
                       ,vva_valr)
        then
          afw_07_util_pkg.defnr_etat_sesn (rec_prefr.nom_apex
                                          ,vva_valr);
        end if;
      end if;
    end loop;
  end charg_prefr_page;

  function obten_boutn_actio_prefr
    return varchar2
  is
    vva_icon          varchar2 (50) default 'fa fa-user';
    vva_titre         varchar2 (50) default 'Préférences utilisateur';
    vva_boutn_actio   varchar2 (4000);
  begin
    vva_boutn_actio      :=
         afw_15_htp_pkg.ouvri_bals ('span'
                                   ,'class'
                                   ,'btn'
                                   ,'title'
                                   ,vva_titre)
      || afw_15_htp_pkg.ouvri_bals ('i'
                                   ,'class'
                                   ,vva_icon)
      || afw_15_htp_pkg.fermr_bals ('i')
      || afw_15_htp_pkg.fermr_bals ('span');

    return vva_boutn_actio;
  end obten_boutn_actio_prefr;
end afw_13_prefr_pkg;
/
