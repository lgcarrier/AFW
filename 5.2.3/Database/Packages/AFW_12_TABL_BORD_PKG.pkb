SET DEFINE OFF;
create or replace package body afw_12_tabl_bord_pkg
is
  function obten_seqnc_tabl_bord (pva_code_tabl_bord in vd_i_afw_37_tabl_bord.code%type)
    return vd_i_afw_37_tabl_bord.seqnc%type
  is
    vnu_result   vd_i_afw_37_tabl_bord.seqnc%type;
  begin
    select seqnc
      into vnu_result
      from vd_i_afw_37_tabl_bord
     where code = pva_code_tabl_bord;

    return vnu_result;
  exception
    when no_data_found
    then
      return null;
  end obten_seqnc_tabl_bord;

  function obten_nombr_group_utils (pnu_seqnc_tabl_bord in vd_i_afw_37_tabl_bord.seqnc%type)
    return number
  is
    pnu_result   number;
  begin
    select count (*)
      into pnu_result
      from vs_afw_12_group_gadgt_utils ggu
     where ggu.ref_tabl_bord = pnu_seqnc_tabl_bord;

    return pnu_result;
  end obten_nombr_group_utils;

  procedure gerer_group_gadgt_utils (pnu_ref_utils_demdr   in     vd_i_afw_12_utils.seqnc%type
                                    ,pnu_ref_tabl_bord     in     vd_i_afw_37_tabl_bord.seqnc%type
                                    ,pva_nom               in     vd_i_afw_12_group_gadgt_utils.nom%type
                                    ,pva_indic_systm       in     vd_i_afw_12_group_gadgt_utils.indic_systm%type
                                    ,pnu_seqnc             in out vd_i_afw_12_group_gadgt_utils.seqnc%type)
  is
  begin
    if pnu_seqnc is null
    then
      insert into vd_i_afw_12_group_gadgt_utils (ref_utils
                                                ,ref_utils_demdr
                                                ,ref_tabl_bord
                                                ,nom
                                                ,indic_systm)
           values (afw_12_utils_pkg.obten_usagr_conct ()
                  ,pnu_ref_utils_demdr
                  ,pnu_ref_tabl_bord
                  ,pva_nom
                  ,nvl (pva_indic_systm, 'N'))
        returning seqnc
             into pnu_seqnc;
    else
      update vd_i_afw_12_group_gadgt_utils
         set ref_utils         = afw_12_utils_pkg.obten_usagr_conct ()
            ,ref_utils_demdr   = pnu_ref_utils_demdr
            ,ref_tabl_bord     = pnu_ref_tabl_bord
            ,nom               = pva_nom
            ,indic_systm       = nvl (pva_indic_systm, 'N')
       where seqnc = pnu_seqnc;
    end if;
  exception
    when dup_val_on_index
    then
      select seqnc
        into pnu_seqnc
        from vd_i_afw_12_group_gadgt_utils
       where     ref_utils = afw_12_utils_pkg.obten_usagr_conct ()
             and (   (ref_utils_demdr = pnu_ref_utils_demdr)
                  or (    ref_utils_demdr is null
                      and pnu_ref_utils_demdr is null))
             and ref_tabl_bord = pnu_ref_tabl_bord
             and nom = pva_nom;
  end gerer_group_gadgt_utils;

  function creer_group_gadgt_utils_deft (pnu_ref_tabl_bord in vd_i_afw_37_tabl_bord.seqnc%type)
    return vd_i_afw_12_group_gadgt_utils.seqnc%type
  is
    vnu_seqnc   vd_i_afw_12_group_gadgt_utils.seqnc%type := null;
    vnu_nom     vd_i_afw_12_group_gadgt_utils.nom%type := null;
  begin
    --On retrouve le nom de groupe par défaut pour le tableau de bord.
    select nom_group_deft
      into vnu_nom
      from vd_i_afw_37_tabl_bord
     where seqnc = pnu_ref_tabl_bord;

    gerer_group_gadgt_utils (pnu_ref_utils_demdr   => afw_12_utils_pkg.obten_usagr_conct ()
                            ,pnu_ref_tabl_bord     => pnu_ref_tabl_bord
                            ,pva_nom               => vnu_nom
                            ,pva_indic_systm       => null
                            ,pnu_seqnc             => vnu_seqnc);
    return vnu_seqnc;
  end creer_group_gadgt_utils_deft;

  procedure suprm_group_gadgt_utils (pnu_seqnc in vd_i_afw_12_group_gadgt_utils.seqnc%type)
  is
  begin
    delete from vd_i_afw_12_group_gadgt_utils
          where     seqnc = pnu_seqnc
                and ref_utils = afw_12_utils_pkg.obten_usagr_conct ();
  end suprm_group_gadgt_utils;

  procedure defnr_group_confg_gril (pnu_ref_group   in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                   ,pcl_confg       in clob)
  is
  begin
    update vd_i_afw_12_group_gadgt_utils ggu
       set ggu.confg_gril   = pcl_confg
     where ggu.seqnc = pnu_ref_group;
  end defnr_group_confg_gril;

  procedure defnr_group_confg_gadgt (pnu_ref_group   in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                    ,pcl_confg       in clob)
  is
  begin
    update vd_i_afw_12_group_gadgt_utils ggu
       set ggu.confg_gadgt   = pcl_confg
     where ggu.seqnc = pnu_ref_group;
  end defnr_group_confg_gadgt;

  function obten_group_confg_gril (pnu_ref_group in vd_i_afw_12_group_gadgt_utils.seqnc%type)
    return clob
  is
    vcl_result   clob;
  begin
    select ggu.confg_gril
      into vcl_result
      from vd_i_afw_12_group_gadgt_utils ggu
     where ggu.seqnc = pnu_ref_group;

    return vcl_result;
  exception
    when no_data_found
    then
      return vcl_result;
  end obten_group_confg_gril;

  function obten_group_confg_gadgt (pnu_ref_group in vd_i_afw_12_group_gadgt_utils.seqnc%type)
    return clob
  is
    vcl_result   clob;
  begin
    select ggu.confg_gadgt
      into vcl_result
      from vd_i_afw_12_group_gadgt_utils ggu
     where ggu.seqnc = pnu_ref_group;

    return vcl_result;
  exception
    when no_data_found
    then
      return vcl_result;
  end obten_group_confg_gadgt;

  function obten_mode_admin (pnu_ref_group in vd_i_afw_12_group_gadgt_utils.seqnc%type)
    return boolean
  is
    vva_temp   char (1);
  begin
    select null
      into vva_temp
      from vd_afw_12_group_gadgt_utils ggu
     where     ggu.seqnc = pnu_ref_group
           and ggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct ();

    return true;
  exception
    when no_data_found
    then
      return false;
  end obten_mode_admin;

  function obten_acces_group (pnu_ref_group in vd_i_afw_12_group_gadgt_utils.seqnc%type)
    return boolean
  is
    vch_temp   char (1);
  begin
    select null
      into vch_temp
      from vs_afw_12_group_gadgt_utils
     where seqnc = pnu_ref_group;

    return true;
  exception
    when no_data_found
    then
      return false;
  end obten_acces_group;

  procedure ajout_group_gadgt_group_utils (pnu_ref_group         in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                          ,pnu_ref_group_utils   in vd_i_afw_12_group_utils.seqnc%type)
  is
  begin
    if obten_mode_admin (pnu_ref_group)
    then
      insert into vd_i_afw_12_lien_gr_gadgt_gr_u lgggu (ref_group_gadgt_utils
                                                       ,ref_group_utils)
           values (pnu_ref_group
                  ,pnu_ref_group_utils);
    end if;
  end ajout_group_gadgt_group_utils;

  procedure suprm_group_gadgt_group_utils (pnu_ref_group         in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                          ,pnu_ref_group_utils   in vd_i_afw_12_group_utils.seqnc%type)
  is
  begin
    if obten_mode_admin (pnu_ref_group)
    then
      delete vd_i_afw_12_lien_gr_gadgt_gr_u lgggu
       where     ref_group_gadgt_utils = pnu_ref_group
             and ref_group_utils = pnu_ref_group_utils;
    end if;
  end suprm_group_gadgt_group_utils;

  procedure ajout_group_gadgt_utils (pnu_ref_group   in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                    ,pnu_ref_utils   in vd_i_afw_12_group_utils.seqnc%type)
  is
  begin
    if obten_mode_admin (pnu_ref_group)
    then
      insert into vd_i_afw_12_lien_gr_gadgt_gr_u lgggu (ref_group_gadgt_utils
                                                       ,ref_utils)
           values (pnu_ref_group
                  ,pnu_ref_utils);
    end if;
  end ajout_group_gadgt_utils;

  procedure suprm_group_gadgt_utils (pnu_ref_group   in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                    ,pnu_ref_utils   in vd_i_afw_12_group_utils.seqnc%type)
  is
  begin
    if obten_mode_admin (pnu_ref_group)
    then
      delete vd_i_afw_12_lien_gr_gadgt_gr_u lgggu
       where     ref_group_gadgt_utils = pnu_ref_group
             and ref_utils = pnu_ref_utils;
    end if;
  end suprm_group_gadgt_utils;

  procedure gerer_gadgt_utils (pnu_ref_tabl_bord           in     vd_i_afw_37_tabl_bord.seqnc%type
                              ,pnu_ref_group_gadgt_utils   in     vd_i_afw_12_group_gadgt_utils.seqnc%type
                              ,pnu_ref_gadgt               in     vd_i_afw_37_gadgt.seqnc%type
                              ,pva_nom                     in     vd_i_afw_12_lien_gadgt_utils.nom%type
                              ,pva_descr                   in     vd_i_afw_12_lien_gadgt_utils.descr%type
                              ,pnu_seqnc                   in out vd_i_afw_12_lien_gadgt_utils.seqnc%type)
  is
    vbl_valdt   boolean := true;
  begin
   <<bloc_validation>>
    declare
      vre_gadgt     vd_i_afw_37_gadgt%rowtype;
      mauvs_prodt   exception;
      acces_intrd   exception;
    begin
      select *
        into vre_gadgt
        from vd_i_afw_37_gadgt
       where seqnc = pnu_ref_gadgt;

      --Validation du bon produit.
      if vre_gadgt.ref_prodt <> afw_11_prodt_pkg.obten_prodt_sesn
      then
        raise mauvs_prodt;
      end if;

      --Validation des accès.
      if     vre_gadgt.ref_struc_aplic is not null
         and afw_12_secrt_pkg.verfc_droit_acces_numrq (afw_12_struc_aplic_pkg.obten_code (vre_gadgt.ref_struc_aplic)
                                                      ,'O') <> 1
      then
        raise acces_intrd;
      end if;
    exception
      when others
      then
        vbl_valdt   := false;
        ete ();
    end bloc_validation;

    if vbl_valdt
    then
      if pnu_seqnc is null
      then
        insert into vd_i_afw_12_lien_gadgt_utils (ref_group_gadgt_utils
                                                 ,ref_gadgt
                                                 ,nom
                                                 ,descr
                                                 ,ref_sesn)
             values (pnu_ref_group_gadgt_utils
                    ,pnu_ref_gadgt
                    ,pva_nom
                    ,pva_descr
                    ,afw_12_sesn_pkg.obten_sesn ())
          returning seqnc
               into pnu_seqnc;
      else
        update vd_i_afw_12_lien_gadgt_utils
           set ref_group_gadgt_utils   = pnu_ref_group_gadgt_utils
              ,ref_gadgt               = pnu_ref_gadgt
              ,nom                     = pva_nom
              ,descr                   = pva_descr
              ,ref_sesn                = afw_12_sesn_pkg.obten_sesn ()
         where seqnc = pnu_seqnc;
      end if;
    end if;
  end gerer_gadgt_utils;

  procedure suprm_gadgt_utils (pnu_seqnc in vd_i_afw_12_lien_gadgt_utils.seqnc%type)
  is
  begin
    delete from vd_i_afw_12_lien_gadgt_utils
          where     seqnc = pnu_seqnc
                and ref_group_gadgt_utils in (select ggu.seqnc
                                                from vd_i_afw_12_group_gadgt_utils ggu
                                               where ggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct ());
  end suprm_gadgt_utils;

  procedure perst_gadgt_utils (pnu_seqnc in vd_i_afw_12_lien_gadgt_utils.seqnc%type)
  is
  begin
    update vd_i_afw_12_lien_gadgt_utils
       set ref_sesn   = null
     where     seqnc = pnu_seqnc
           and ref_group_gadgt_utils in (select ggu.seqnc
                                           from vd_i_afw_12_group_gadgt_utils ggu
                                          where ggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct ());
  end perst_gadgt_utils;

  function obten_nombr_parmt_gadgt (pnu_srqnc_gadgt in vd_i_afw_37_gadgt.seqnc%type)
    return number
  is
    vnu_result   number;
  begin
    select count (*)
      into vnu_result
      from vd_afw_37_gadgt_parmt
     where ref_gadgt = pnu_srqnc_gadgt;

    return vnu_result;
  end obten_nombr_parmt_gadgt;

  /* Insertion / Mise à jour d'un paramètre d'instance de gadget */
  procedure gerer_parmt_gadgt_utils (pnu_ref_lien_gadgt_utils         in     vd_i_afw_12_lien_gadgt_utils_p.ref_lien_gadgt_utils%type
                                    ,pnu_ref_gadgt_parmt              in     vd_i_afw_12_lien_gadgt_utils_p.ref_gadgt_parmt%type
                                    ,pnu_ref_dv_forml_don             in     vd_i_afw_12_lien_gadgt_utils_p.ref_dv_forml_don%type
                                    ,pnu_ref_lien_gadgt_parmt_racrc   in     vd_i_afw_12_lien_gadgt_utils_p.ref_lien_gadgt_parmt_racrc%type
                                    ,pnu_ref_gadgt_parmt_racrc        in     vd_i_afw_12_lien_gadgt_utils_p.ref_gadgt_parmt_racrc%type
                                    ,pva_forml_don                    in     vd_i_afw_12_lien_gadgt_utils_p.forml_don%type
                                    ,pnu_seqnc                        in out vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
  is
    row_parmt      vd_i_afw_12_lien_gadgt_utils_p%rowtype;
    double_racrc   exception;
    aucune_valr    exception;
  begin
    -- Validations
    if     pnu_ref_lien_gadgt_parmt_racrc is not null
       and pnu_ref_gadgt_parmt_racrc is not null
    then
      raise double_racrc;
    end if;

    if     pnu_ref_dv_forml_don is null
       and pnu_ref_lien_gadgt_parmt_racrc is null
       and pnu_ref_gadgt_parmt_racrc is null
    then
      raise aucune_valr;
    end if;

    --Gestion des valeurs.
    row_parmt.ref_lien_gadgt_utils   := pnu_ref_lien_gadgt_utils;
    row_parmt.ref_gadgt_parmt        := pnu_ref_gadgt_parmt;
    row_parmt.ref_dv_forml_don       := pnu_ref_dv_forml_don;

    if afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don) = 'DYNMQ'
    then
      row_parmt.ref_lien_gadgt_parmt_racrc   := pnu_ref_lien_gadgt_parmt_racrc;
      row_parmt.ref_gadgt_parmt_racrc        := pnu_ref_gadgt_parmt_racrc;
    else
      row_parmt.ref_lien_gadgt_parmt_racrc   := null;
      row_parmt.ref_gadgt_parmt_racrc        := null;
    end if;

    if afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don) in ('AVANC'
                                                                       ,'STATC')
    then
      row_parmt.forml_don   := pva_forml_don;
    else
      row_parmt.forml_don   := null;
    end if;

    --Traitement des valeurs
    if pnu_seqnc is null
    then
      insert into vd_i_afw_12_lien_gadgt_utils_p (ref_lien_gadgt_utils
                                                 ,ref_gadgt_parmt
                                                 ,ref_dv_forml_don
                                                 ,ref_lien_gadgt_parmt_racrc
                                                 ,ref_gadgt_parmt_racrc
                                                 ,forml_don)
           values (row_parmt.ref_lien_gadgt_utils
                  ,row_parmt.ref_gadgt_parmt
                  ,row_parmt.ref_dv_forml_don
                  ,row_parmt.ref_lien_gadgt_parmt_racrc
                  ,row_parmt.ref_gadgt_parmt_racrc
                  ,row_parmt.forml_don)
        returning seqnc
             into pnu_seqnc;
    else
      update vd_i_afw_12_lien_gadgt_utils_p
         set ref_lien_gadgt_utils         = row_parmt.ref_lien_gadgt_utils
            ,ref_gadgt_parmt              = row_parmt.ref_gadgt_parmt
            ,ref_dv_forml_don             = row_parmt.ref_dv_forml_don
            ,ref_lien_gadgt_parmt_racrc   = row_parmt.ref_lien_gadgt_parmt_racrc
            ,ref_gadgt_parmt_racrc        = row_parmt.ref_gadgt_parmt_racrc
            ,forml_don                    = row_parmt.forml_don
       where seqnc = pnu_seqnc;
    end if;
  exception
    when double_racrc
    then
      raise;
    when aucune_valr
    then
      raise;
  end gerer_parmt_gadgt_utils;

  procedure suprm_parmt_gadgt_utils (pnu_seqnc in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
  is
  begin
    delete from vd_i_afw_12_lien_gadgt_utils_p lgup
          where     lgup.seqnc = pnu_seqnc
                and exists
                      (select null
                         from vd_i_afw_12_lien_gadgt_utils lgu
                        where     lgu.seqnc = lgup.ref_lien_gadgt_utils
                              and ref_group_gadgt_utils in (select ggu.seqnc
                                                              from vd_i_afw_12_group_gadgt_utils ggu
                                                             where ggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct ()));
  end suprm_parmt_gadgt_utils;

  function obten_nombr_parmt_oblig_vide (pnu_seqnc in vd_i_afw_12_lien_gadgt_utils.seqnc%type)
    return number
  is
    vnu_result   number;
  begin
    select count (*)
      into vnu_result
      from vs_afw_12_parmt_gadgt_utils
     where     lgu_seqnc = pnu_seqnc
           and indic_oblig = 'O'
           and (   lgup_seqnc is null
                or (    lgup_forml_don is null
                    and lgup_gadgt_parmt_racrc is null
                    and lgup_lien_gadgt_parmt_racrc is null));

    return vnu_result;
  end obten_nombr_parmt_oblig_vide;

  function obten_row_lgup (pnu_seqnc_lgup       in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type
                          ,pva_forml_don_code   in varchar2 default null)
    return vd_i_afw_12_lien_gadgt_utils_p%rowtype
  is
    row_parmt   vd_i_afw_12_lien_gadgt_utils_p%rowtype := null;
  begin
    select lgup.*
      into row_parmt
      from vd_i_afw_12_lien_gadgt_utils_p lgup
          ,vd_i_afw_12_lien_gadgt_utils   lgu
          ,vd_i_afw_37_gadgt_parmt        gp
     where     lgup.seqnc = pnu_seqnc_lgup
           and lgu.seqnc = lgup.ref_lien_gadgt_utils
           and ref_group_gadgt_utils in (select ggu.seqnc
                                           from vd_i_afw_12_group_gadgt_utils ggu
                                          where (   afw_12_utils_pkg.obten_usagr_conct () in (ggu.ref_utils
                                                                                             ,ggu.ref_utils_demdr)
                                                 or exists
                                                      (select null
                                                         from vd_afw_12_lien_gr_gadgt_gr_u lgggu
                                                        where        lgggu.ref_group_gadgt_utils = ggu.seqnc
                                                                 and lgggu.ref_group_utils = any (select seqnc_group
                                                                                                    from vs_group_lie_utils_conct)
                                                              or exists
                                                                   (select null
                                                                      from vd_afw_12_lien_gr_gadgt_gr_u lgggu
                                                                     where     lgggu.ref_group_gadgt_utils = ggu.seqnc
                                                                           and lgggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct ()))))
           and gp.seqnc = lgup.ref_gadgt_parmt
           and (   pva_forml_don_code is null
                or afw_14_domn_valr_pkg.obten_code (gp.ref_dv_type_don) = pva_forml_don_code);

    return row_parmt;
  end;


  function obten_forml_gpr (pnu_seqnc_gpr vd_i_afw_37_gadgt_parmt_racrc.seqnc%type)
    return vd_i_afw_37_gadgt_parmt_racrc.forml_don%type
  is
    vva_result   vd_i_afw_37_gadgt_parmt_racrc.forml_don%type;
  begin
    select forml_don
      into vva_result
      from vd_i_afw_37_gadgt_parmt_racrc
     where seqnc = pnu_seqnc_gpr;

    return vva_result;
  exception
    when no_data_found
    then
      ete ('Formule de donnée GPR introuvée.');
      return null;
  end obten_forml_gpr;

  function obten_forml_lgpr (pnu_seqnc_gpr vd_i_afw_37_lien_gadgt_parmt_r.seqnc%type)
    return vd_i_afw_37_lien_gadgt_parmt_r.forml_don%type
  is
    vnu_ref_gpr   vd_i_afw_37_lien_gadgt_parmt_r.ref_gadgt_parmt_racrc%type;
    vva_result    vd_i_afw_37_lien_gadgt_parmt_r.forml_don%type;
  begin
    select ref_gadgt_parmt_racrc
          ,forml_don
      into vnu_ref_gpr
          ,vva_result
      from vd_i_afw_37_lien_gadgt_parmt_r
     where seqnc = pnu_seqnc_gpr;

    if vnu_ref_gpr is not null
    then
      vva_result   := obten_forml_gpr (vnu_ref_gpr);
    end if;

    return vva_result;
  exception
    when no_data_found
    then
      ete ('Formule de donnée LGPR introuvée.');
      return null;
  end obten_forml_lgpr;

  function obten_nom_gpr (pnu_seqnc_gpr vd_i_afw_37_gadgt_parmt_racrc.seqnc%type)
    return vd_i_afw_37_gadgt_parmt_racrc.nom%type
  is
    vva_result   vd_i_afw_37_gadgt_parmt_racrc.forml_don%type;
  begin
    select nom
      into vva_result
      from vd_i_afw_37_gadgt_parmt_racrc
     where seqnc = pnu_seqnc_gpr;

    return vva_result;
  exception
    when no_data_found
    then
      ete ('Formule de donnée GPR introuvée.');
      return null;
  end obten_nom_gpr;

  function obten_nom_lgpr (pnu_seqnc_gpr vd_i_afw_37_lien_gadgt_parmt_r.seqnc%type)
    return vd_i_afw_37_lien_gadgt_parmt_r.nom%type
  is
    vnu_ref_gpr   vd_i_afw_37_lien_gadgt_parmt_r.ref_gadgt_parmt_racrc%type;
    vva_result    vd_i_afw_37_lien_gadgt_parmt_r.nom%type;
  begin
    select ref_gadgt_parmt_racrc
          ,nom
      into vnu_ref_gpr
          ,vva_result
      from vd_i_afw_37_lien_gadgt_parmt_r
     where seqnc = pnu_seqnc_gpr;

    if vnu_ref_gpr is not null
    then
      vva_result   := obten_nom_gpr (vnu_ref_gpr);
    end if;

    return vva_result;
  exception
    when no_data_found
    then
      ete ('Formule de donnée LGPR introuvée.');
      return null;
  end obten_nom_lgpr;

  function obten_seqnc_lgup (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                            ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return number
  is
    pnu_result        vd_i_afw_12_lien_gadgt_utils_p.seqnc%type := null;
    pva_indic_oblig   vd_i_afw_37_gadgt_parmt.indic_oblig%type := null;
  begin
    select lgup.seqnc
          ,gp.indic_oblig
      into pnu_result
          ,pva_indic_oblig
      from vd_i_afw_12_lien_gadgt_utils lgu
           inner join vd_i_afw_37_gadgt gad on gad.seqnc = lgu.ref_gadgt
           inner join vd_i_afw_37_gadgt_parmt gp on gp.ref_gadgt = gad.seqnc
           left outer join vd_i_afw_12_lien_gadgt_utils_p lgup
             on     lgup.ref_gadgt_parmt = gp.seqnc
                and lgup.ref_lien_gadgt_utils = lgu.seqnc
     where     lgu.seqnc = pnu_seqnc_lgu
           and ref_group_gadgt_utils in (select ggu.seqnc
                                           from vd_i_afw_12_group_gadgt_utils ggu
                                          where (   afw_12_utils_pkg.obten_usagr_conct () in (ggu.ref_utils
                                                                                             ,ggu.ref_utils_demdr)
                                                 or exists
                                                      (select null
                                                         from vd_afw_12_lien_gr_gadgt_gr_u lgggu
                                                        where        lgggu.ref_group_gadgt_utils = ggu.seqnc
                                                                 and lgggu.ref_group_utils = any (select seqnc_group
                                                                                                    from vs_group_lie_utils_conct)
                                                              or exists
                                                                   (select null
                                                                      from vd_afw_12_lien_gr_gadgt_gr_u lgggu
                                                                     where     lgggu.ref_group_gadgt_utils = ggu.seqnc
                                                                           and lgggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct ()))))
           and gp.code = pva_gadgt_parmt_code;

    if     pnu_result is null
       and pva_indic_oblig = 'O'
    then
      raise value_error;
    end if;

    return pnu_result;
  end obten_seqnc_lgup;

  function obten_nom_parmt_dynmq (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return vd_i_afw_37_gadgt_parmt_racrc.nom%type
  is
    row_parmt    vd_i_afw_12_lien_gadgt_utils_p%rowtype := afw_12_tabl_bord_pkg.obten_row_lgup (pnu_seqnc_lgup);
    vva_result   vd_i_afw_37_gadgt_parmt_racrc.nom%type := null;
  begin
    if afw_14_domn_valr_pkg.obten_code (row_parmt.ref_dv_forml_don) = 'DYNMQ'
    then
      if row_parmt.ref_lien_gadgt_parmt_racrc is not null
      then
        vva_result   := afw_12_tabl_bord_pkg.obten_nom_lgpr (row_parmt.ref_lien_gadgt_parmt_racrc);
      elsif row_parmt.ref_gadgt_parmt_racrc is not null
      then
        vva_result   := afw_12_tabl_bord_pkg.obten_nom_gpr (row_parmt.ref_gadgt_parmt_racrc);
      end if;
    end if;

    return vva_result;
  end obten_nom_parmt_dynmq;

  procedure obten_infor_dv_parmt (pnu_seqnc_lgup       in     vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                 ,pnu_ref_domn_valr       out vd_i_afw_14_domn_valr.seqnc%type
                                 ,pva_code_domn_valr      out vd_i_afw_14_domn_valr.code%type
                                 ,pva_enonc_sourc         out vd_i_afw_14_domn_valr.enonc_sourc%type)
  is
  begin
    select dv.seqnc ref_domn_valr
          ,dv.code
          ,dv.enonc_sourc
      into pnu_ref_domn_valr
          ,pva_code_domn_valr
          ,pva_enonc_sourc
      from vd_i_afw_12_lien_gadgt_utils_p lgup
          ,vd_i_afw_37_gadgt_parmt        gp
          ,vd_i_afw_14_domn_valr          dv
     where     lgup.seqnc = pnu_seqnc_lgup
           and gp.seqnc = lgup.ref_gadgt_parmt
           and dv.seqnc = gp.ref_domn_valr;
  end obten_infor_dv_parmt;
end afw_12_tabl_bord_pkg;
/
