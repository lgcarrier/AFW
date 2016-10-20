SET DEFINE OFF;
create or replace package body afw_12_arbre_pkg
as
  gnu_sesn   number default afw_12_sesn_pkg.obten_sesn;

  function obten_arbre (pnu_numr_apex_regn in number)
    return vd_i_afw_12_arbre.seqnc%type
  is
    vnu_arbre   vd_i_afw_12_arbre.seqnc%type;
  begin
    select a.seqnc
      into vnu_arbre
      from vd_i_afw_12_arbre a
     where     a.ref_sesn = gnu_sesn
           and a.id_apex_regn = pnu_numr_apex_regn;

    return vnu_arbre;
  exception
    when others
    then
      return null;
  end obten_arbre;

  function obten_arbre_noeud (pnu_arbre   in number
                             ,pva_noeud   in varchar2)
    return number
  is
    vnu_arbre_noeud   vd_i_afw_12_arbre_noeud.seqnc%type;
  begin
    select an.seqnc
      into vnu_arbre_noeud
      from vd_i_afw_12_arbre_noeud an
     where     an.ref_arbre = pnu_arbre
           and an.noeud_ouver = pva_noeud;

    return vnu_arbre_noeud;
  exception
    when others
    then
      return null;
  end obten_arbre_noeud;

  procedure initl_arbre (pnu_numr_apex_regn in number)
  is
    vnu_arbre         vd_i_afw_12_arbre.seqnc%type;
    rec_confg_plugn   afw_21_plugn_arbre_pkg.typ_rec_confg_plugn default afw_21_plugn_arbre_pkg.obten_enreg_confg_plugn (pnu_numr_apex_regn);
  begin
    vnu_arbre   := obten_arbre (pnu_numr_apex_regn);

    if vnu_arbre is null
    then
      insert into vd_i_afw_12_arbre (id_apex_regn
                                    ,noeud_actif
                                    ,ref_sesn)
           values (pnu_numr_apex_regn
                  ,afw_07_util_pkg.v (rec_confg_plugn.item_noeud)
                  ,gnu_sesn);
    else
      update vd_i_afw_12_arbre
         set noeud_actif   = afw_07_util_pkg.v (rec_confg_plugn.item_noeud)
       where seqnc = vnu_arbre;
    end if;
  end initl_arbre;

  procedure ajout_liste_noeud (pnu_numr_apex_regn   in number
                              ,pta_liste_noeud      in tab_noeud
                              ,pnu_utils            in vd_i_afw_12_utils.seqnc%type default null
                              ,pnu_sesn             in vd_i_afw_12_sesn.id_sesn%type default null)
  is
    vnu_arbre         vd_i_afw_12_arbre.seqnc%type;
    vnu_indic_courn   pls_integer;
  begin
    vnu_arbre   := obten_arbre (pnu_numr_apex_regn);

    if pta_liste_noeud.count () <> 0
    then
      vnu_indic_courn   := pta_liste_noeud.first ();

      while vnu_indic_courn is not null
      loop
        if obten_arbre_noeud (vnu_arbre
                             ,pta_liste_noeud (vnu_indic_courn))
             is null
        then
          insert into vd_i_afw_12_arbre_noeud (ref_arbre
                                              ,noeud_ouver)
               values (vnu_arbre
                      ,pta_liste_noeud (vnu_indic_courn));
        end if;

        vnu_indic_courn   := pta_liste_noeud.next (vnu_indic_courn);
      end loop;
    end if;
  end ajout_liste_noeud;

  procedure fermr_liste_noeud (pnu_numr_apex_regn   in number
                              ,pta_liste_noeud      in tab_noeud
                              ,pnu_utils            in vd_i_afw_12_utils.seqnc%type default null
                              ,pnu_sesn             in vd_i_afw_12_sesn.id_sesn%type default null)
  is
    vnu_arbre         vd_afw_12_arbre.seqnc%type;
    vnu_indic_courn   pls_integer;
  begin
    if pta_liste_noeud.count () <> 0
    then
      vnu_arbre         := obten_arbre (pnu_numr_apex_regn);

      vnu_indic_courn   := pta_liste_noeud.first ();

      while vnu_indic_courn is not null
      loop
        delete vd_afw_12_arbre_noeud
         where     ref_arbre = vnu_arbre
               and noeud_ouver = pta_liste_noeud (vnu_indic_courn);

        vnu_indic_courn   := pta_liste_noeud.next (vnu_indic_courn);
      end loop;
    end if;
  end fermr_liste_noeud;

  procedure ouvri_noeud (pnu_numr_apex_regn   in number
                        ,pva_noeud            in varchar2
                        ,pnu_utils            in vd_i_afw_12_utils.seqnc%type default null
                        ,pnu_sesn             in vd_i_afw_12_sesn.id_sesn%type default null)
  is
    vnu_arbre   vd_afw_12_arbre.seqnc%type;
  begin
    if pva_noeud is not null
    then
      vnu_arbre   := obten_arbre (pnu_numr_apex_regn);

      if obten_arbre_noeud (vnu_arbre
                           ,pva_noeud)
           is null
      then
        insert into vd_i_afw_12_arbre_noeud (ref_arbre
                                            ,noeud_ouver)
             values (vnu_arbre
                    ,pva_noeud);
      end if;
    end if;
  end ouvri_noeud;

  procedure fermr_noeud (pnu_numr_apex_regn   in number
                        ,pva_noeud            in varchar2
                        ,pnu_utils            in vd_i_afw_12_utils.seqnc%type default null
                        ,pnu_sesn             in vd_i_afw_12_sesn.id_sesn%type default null)
  is
    vnu_arbre   vd_afw_12_arbre.seqnc%type;
  begin
    vnu_arbre   := obten_arbre (pnu_numr_apex_regn);

    delete vd_afw_12_arbre_noeud
     where     ref_arbre = vnu_arbre
           and noeud_ouver = pva_noeud;
  end fermr_noeud;


  function verfr_presn (pnu_numr_apex_regn in number)
    return boolean
  is
    vbo_presn   boolean := false;
    vnu_exist   number;
  begin
    select count (nombr)
      into vnu_exist
      from (select 1 nombr
              from vd_i_afw_12_arbre a
             where     a.ref_sesn = gnu_sesn
                   and a.id_apex_regn = pnu_numr_apex_regn
            union all
            select 1 nombr
              from vd_i_afw_12_arbre_noeud an
                  ,vd_i_afw_12_arbre       a
             where     a.id_apex_regn = pnu_numr_apex_regn
                   and an.ref_arbre = a.seqnc
                   and a.ref_sesn = gnu_sesn);

    if vnu_exist > 0
    then
      vbo_presn   := true;
    end if;

    return vbo_presn;
  exception
    when others
    then
      return false;
  end verfr_presn;

  function verfr_presn_sesn
    return boolean
  is
    vbo_presn   boolean default false;
    vnu_exist   number;
  begin
    select count (1)
      into vnu_exist
      from vd_i_afw_12_arbre a
     where a.ref_sesn = gnu_sesn;

    if vnu_exist > 0
    then
      vbo_presn   := true;
    end if;

    return vbo_presn;
  exception
    when others
    then
      return false;
  end verfr_presn_sesn;

  function obten_indic_rafrc (pnu_numr_apex_regn in number)
    return vd_i_afw_12_arbre.indic_rafrc%type
  is
    vva_indic_rafrc   vd_i_afw_12_arbre.indic_rafrc%type;
  begin
    select a.indic_rafrc
      into vva_indic_rafrc
      from vd_i_afw_12_arbre a
     where     a.ref_sesn = gnu_sesn
           and a.id_apex_regn = pnu_numr_apex_regn;

    return vva_indic_rafrc;
  exception
    when no_data_found
    then
      return 'O';
    when others
    then
      return null;
  end obten_indic_rafrc;

  procedure forcr_rafrc (pnu_numr_apex_regn   in number
                        ,pnu_utils            in number default null)
  is
  begin
    update vd_i_afw_12_arbre a
       set a.indic_rafrc   = 'O'
     where     a.id_apex_regn = pnu_numr_apex_regn
           and (   pnu_utils is null
                or exists
                     (select null
                        from vd_i_afw_12_sesn  s
                            ,vd_i_afw_12_utils u
                       where     s.id_sesn = a.ref_sesn
                             and u.code_utils = s.app_user
                             and u.seqnc = pnu_utils));
  end forcr_rafrc;

  procedure rafrc_efect (pnu_numr_apex_regn   in number
                        ,pnu_utils            in number default null)
  is
  begin
    update vd_i_afw_12_arbre a
       set a.indic_rafrc   = 'N'
     where     a.id_apex_regn = pnu_numr_apex_regn
           and (   pnu_utils is null
                or exists
                     (select null
                        from vd_i_afw_12_sesn  s
                            ,vd_i_afw_12_utils u
                       where     s.id_sesn = a.ref_sesn
                             and u.code_utils = s.app_user
                             and u.seqnc = pnu_utils));
  end rafrc_efect;

  function obten_noeud_actif
    return varchar2
  is
  begin
    return afw_07_sesn_pkg.obten_valr_sesn (afw_21_plugn_arbre_pkg.kva_s_noeud_actif);
  end obten_noeud_actif;
end afw_12_arbre_pkg;
/
