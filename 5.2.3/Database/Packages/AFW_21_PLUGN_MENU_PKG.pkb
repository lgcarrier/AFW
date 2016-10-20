SET DEFINE OFF;
create or replace package body afw_21_plugn_menu_pkg
as
  function obten_enreg_confg_plugn (pnu_numr_apex_regn in number)
    return typ_rec_confg_plugn
  is
    cursor cur_plugn_menu
    is
      select pm.seqnc
            ,ref_dv_type_menu_code
            ,ref_dv_orien_menu_code
            ,ref_dv_coulr_theme_code
            ,ref_dv_coulr_princ_code
            ,ref_dv_formt_menu_code
            ,ref_menu
        from vd_afw_21_plugn_menu pm
            ,apex_regn            ar
       where     ar.attribute_01 = pm.code
             and ar.id = pnu_numr_apex_regn
             and ar.flow_id in (select numr_aplic_apex
                                  from vd_afw_11_aplic
                                 where ref_prodt = pm.ref_prodt) --                and afw_12_menu_pkg.obten_menu_actif is null
                                                                --             or afw_12_menu_pkg.obten_menu_actif is not null
                                                                --                and afw_12_menu_pkg.obten_menu_actif = pm.seqnc
  ;

    rec_confg_plugn   typ_rec_confg_plugn;
  begin
    open cur_plugn_menu;

    fetch cur_plugn_menu
      into rec_confg_plugn;

    close cur_plugn_menu;

    return rec_confg_plugn;
  end obten_enreg_confg_plugn;

  function obten_enreg_confg_plugn_item (pnu_plugn_menu   in number
                                        ,pnu_item_menu    in number)
    return typ_rec_confg_plugn_item
  is
    rec_confg_plugn_item   typ_rec_confg_plugn_item;

    cursor cur_plugn_item_menu
    is
      select pim.seqnc
            ,clas_css_racn
            ,clas_css_elemn
            ,etend_nombr_coln
            ,ref_item_menu
            ,ref_plugn_menu
            ,ref_dv_align_valr_organ
        from vd_afw_21_plugn_item_menu pim
       where     pim.ref_plugn_menu = pnu_plugn_menu
             and pim.ref_item_menu = pnu_item_menu;
  begin
    open cur_plugn_item_menu;

    fetch cur_plugn_item_menu
      into rec_confg_plugn_item;

    close cur_plugn_item_menu;

    return rec_confg_plugn_item;
  end obten_enreg_confg_plugn_item;

  function obten_plugn_menu (pva_code_prodt   in vd_i_afw_11_prodt.code%type
                            ,pva_code_menu    in vd_i_afw_21_plugn_menu.code%type)
    return number
  is
    vnu_seqnc   vd_i_afw_21_plugn_menu.seqnc%type;
  begin
    select seqnc
      into vnu_seqnc
      from vd_afw_21_plugn_menu
     where     ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt)
           and code = pva_code_menu;

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return null;
  end obten_plugn_menu;

  function genr_reqt_sql (pty_rec_confg_plugn in typ_rec_confg_plugn)
    return varchar2
  is
    vva_reqt   varchar2 (4000);
  begin
    vva_reqt      :=
         'select seqnc,
                        libl label,
                        afw_13_menu_pkg.obten_url_cible(im.seqnc) target,
                        afw_13_menu_pkg.obten_etat_libl(im.seqnc) is_current
                   from vd_afw_13_item_menu im
                  where ref_menu = '
      || pty_rec_confg_plugn.ref_menu
      || '
                    and afw_13_menu_pkg.verfr_droit_acces(im.seqnc) = 1
                    and afw_13_menu_pkg.trait_condt_afich(im.seqnc)
                    and im.ref_item_menu is null
               order by im.ordre_presn';

    return vva_reqt;
  end genr_reqt_sql;

  procedure maj_plugn_item_menu (pnu_plugn_menu in number)
  is
  begin
    delete from vd_i_afw_21_plugn_item_menu pim
          where     not exists
                      (select 1
                         from vd_i_afw_13_item_menu im
                        where im.seqnc = pim.ref_item_menu)
                and pim.ref_plugn_menu = pnu_plugn_menu;

    merge into vd_i_afw_21_plugn_item_menu dest
         using (           select level niv_item
                                 ,im.seqnc ref_item_menu
                                 ,pnu_plugn_menu ref_plugn_menu
                             from vd_i_afw_13_item_menu im
                            where ref_menu = (select ref_menu
                                                from vd_i_afw_21_plugn_menu pm
                                               where pm.seqnc = pnu_plugn_menu)
                       start with im.ref_item_menu is null
                       connect by prior seqnc = ref_item_menu
                order siblings by im.ordre_presn) sourc
            on (    sourc.ref_item_menu = dest.ref_item_menu
                and sourc.ref_plugn_menu = dest.ref_plugn_menu)
    when matched
    then
      update set dest.niv_item   = sourc.niv_item
    when not matched
    then
      insert     (ref_item_menu
                 ,ref_plugn_menu
                 ,niv_item)
          values (sourc.ref_item_menu
                 ,sourc.ref_plugn_menu
                 ,sourc.niv_item);
  end maj_plugn_item_menu;

  procedure creer_entet (pva_encap_menu   in varchar2
                        ,pva_coulr_menu   in varchar2
                        ,pva_mode         in varchar2 default 'COLN')
  is
  begin
    creer_sectn (pva_encap_menu
                ,case when pva_mode = 'COMPL' then pva_coulr_menu else null end);

    creer_liste_desrd (   'menu'
                       || case
                            when pva_mode = 'COLN'
                            then
                                 ' '
                              || pva_coulr_menu
                            else
                              null
                          end);
  end creer_entet;

  procedure fermr_entet
  is
  begin
    fermr_liste_desrd;
    fermr_sectn;
  end fermr_entet;

  procedure creer_sectn (pva_id      in varchar2 default null
                        ,pva_clas    in varchar2 default null
                        ,pva_align   in varchar2 default null)
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('div'
                              ,case when pva_id is not null then 'id' else null end
                              ,pva_id
                              ,case when pva_clas is not null then 'class' else null end
                              ,   pva_clas
                               || case
                                    when pva_align is not null
                                    then
                                         ' '
                                      || pva_align
                                    else
                                      null
                                  end);
  end creer_sectn;

  procedure fermr_sectn
  is
  begin
    afw_15_htp_pkg.fermr_bals ('div');
  end fermr_sectn;

  procedure creer_liste (pva_clas in varchar2 default null)
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('li'
                              ,case when pva_clas is not null then 'class' else null end
                              ,pva_clas);
  end creer_liste;

  procedure fermr_liste
  is
  begin
    afw_15_htp_pkg.fermr_bals ('li');
  end fermr_liste;

  procedure creer_liste_desrd (pva_clas in varchar2 default null)
  is
  begin
    afw_15_htp_pkg.ouvri_bals ('ul'
                              ,case when pva_clas is not null then 'class' else null end
                              ,pva_clas);
  end creer_liste_desrd;

  procedure fermr_liste_desrd
  is
  begin
    afw_15_htp_pkg.fermr_bals ('ul');
  end fermr_liste_desrd;

  procedure ecrir (pva_libl        in varchar2
                  ,pva_type_bals   in varchar2 default 'a'
                  ,pva_clas        in varchar2 default null
                  ,pva_url_cible   in varchar2 default null)
  is
  begin
    afw_15_htp_pkg.ouvri_bals (pva_type_bals
                              ,case when pva_clas is not null then 'class' else null end
                              ,pva_clas
                              ,case when pva_url_cible is not null then 'href' else null end
                              ,pva_url_cible);
    afw_15_htp_pkg.ecrir (pva_libl);
    afw_15_htp_pkg.fermr_bals (pva_type_bals);
  end ecrir;

  function obten_clas_css_elemn (pnu_plugn_item_menu in number)
    return varchar2
  is
    vva_clas               varchar2 (60);
    vnu_etend_nombr_coln   number (3);
    vnu_coln_item          number (3);
    vva_align              varchar2 (60);
  begin
    select etend_nombr_coln
          ,coln_item
          ,ref_dv_align_valr_organ
      into vnu_etend_nombr_coln
          ,vnu_coln_item
          ,vva_align
      from vd_afw_21_plugn_item_menu
     where seqnc = pnu_plugn_item_menu;

    if vnu_etend_nombr_coln between 1 and 6
    then
      vva_clas      :=
           vva_clas
        || 'col_'
        || vnu_etend_nombr_coln;

      if vnu_coln_item = 1
      then
        vva_clas      :=
             vva_clas
          || ' firstcolumn';
      end if;
    end if;

    return vva_clas;
  end obten_clas_css_elemn;

  function obten_clas_css_racn (pnu_plugn_item_menu in number)
    return varchar2
  is
  begin
    return obten_contn (pnu_plugn_item_menu);
  end obten_clas_css_racn;

  procedure genr_elemn_no_drop (pva_libl        in varchar2
                               ,pva_url_cible   in varchar2 default null)
  is
  begin
    creer_liste ('nodrop');
    ecrir (pva_libl
          ,pva_url_cible   => pva_url_cible);
    fermr_liste;
  end genr_elemn_no_drop;

  procedure creer_elemn_drop (pva_libl         in varchar2
                             ,pva_url_cible    in varchar2 default null
                             ,pva_clas_liste   in varchar2 default null
                             ,pva_align        in varchar2 default null)
  is
  begin
    creer_liste (   case when pva_clas_liste like '%fullwidth' then 'fullwidth ' else null end
                 || case
                      when pva_align is not null
                      then
                        substr (pva_align
                               ,7)
                      else
                        null
                    end);
    ecrir (pva_libl
          ,pva_clas        => 'drop'
          ,pva_url_cible   => pva_url_cible);
  end creer_elemn_drop;

  procedure fermr_elemn_drop
  is
  begin
    fermr_liste;
  end fermr_elemn_drop;

  procedure creer_contn_item (pty_rec_plugn_item in typ_rec_confg_plugn_item)
  is
  begin
    creer_sectn (null
                ,pty_rec_plugn_item.clas_css_elemn);
  end creer_contn_item;

  procedure fermr_contn_item (pty_rec_plugn_item in typ_rec_confg_plugn_item)
  is
  begin
    fermr_sectn;
  end fermr_contn_item;

  procedure genr_tabl (pty_rec_plugn_item in typ_rec_confg_plugn_item)
  is
    cursor cur_item_menu
    is
        select seqnc
              ,null                                     niv
              ,forml_libl
              ,afw_13_menu_pkg.obten_url_cible (im.seqnc) url_cible
              ,null                                     est_actif
          from vd_afw_13_item_menu im
         where im.seqnc = pty_rec_plugn_item.ref_item_menu
      order by ordre_presn;
  begin
    if afw_13_menu_pkg.verfr_enfan_exist (pty_rec_plugn_item.ref_item_menu)
    then
      creer_liste_desrd;

      for rec_im in cur_item_menu
      loop
        creer_liste;

        ecrir (rec_im.forml_libl
              ,pva_url_cible   => rec_im.url_cible);

        genr_tabl (obten_enreg_confg_plugn_item (pty_rec_plugn_item.ref_plugn_menu
                                                ,rec_im.seqnc));

        fermr_liste;
      end loop;

      fermr_liste_desrd;
    end if;
  end genr_tabl;

  function obten_contn (pnu_plugn_item_menu in number)
    return varchar2
  is
    vva_contn   varchar2 (60);
  begin
    select ref_dv_contn_im_valr_organ
      into vva_contn
      from vd_afw_21_plugn_item_menu
     where seqnc = pnu_plugn_item_menu;

    return vva_contn;
  end obten_contn;

  function obten_align (pnu_plugn_item_menu in number)
    return varchar2
  is
    vva_align   varchar2 (60);
  begin
    select ref_dv_align_valr_organ
      into vva_align
      from vd_afw_21_plugn_item_menu
     where seqnc = pnu_plugn_item_menu;

    return vva_align;
  end obten_align;

  function obten_formt_menu (pnu_plugn_menu in number)
    return varchar2
  is
    vva_formt   varchar2 (60);
  begin
    select afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_formt_menu)
      into vva_formt
      from vd_afw_21_plugn_menu
     where seqnc = pnu_plugn_menu;

    return vva_formt;
  end obten_formt_menu;

  function obten_coulr_menu (pnu_plugn_menu in number)
    return varchar2
  is
    vva_coulr   varchar2 (60);
  begin
    select afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_coulr_princ)
      into vva_coulr
      from vd_afw_21_plugn_menu
     where seqnc = pnu_plugn_menu;

    return vva_coulr;
  end obten_coulr_menu;

  function obten_usagr_formt_sesn
    return varchar2
  is
    vva_utils         varchar2 (200);
    vnu_utils_conct   number (10) default afw_12_utils_pkg.obten_usagr_conct;
  begin
    if afw_12_utils_pkg.obten_code_utils (vnu_utils_conct) = 'AFW_ADMIN'
    then
      vva_utils   := 'Administrateur AFW';
    else
      vva_utils   := afw_12_utils_pkg.obten_nom_formt (vnu_utils_conct);
    end if;

    return vva_utils;
  end obten_usagr_formt_sesn;
end afw_21_plugn_menu_pkg;
/
