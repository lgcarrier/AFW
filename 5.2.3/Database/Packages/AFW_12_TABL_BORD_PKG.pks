SET DEFINE OFF;
create or replace package afw_12_tabl_bord_pkg
is
  /* Obtention d'une séquence de Tableau de bord depuis code */
  function obten_seqnc_tabl_bord (pva_code_tabl_bord in vd_i_afw_37_tabl_bord.code%type)
    return vd_i_afw_37_tabl_bord.seqnc%type;

  /* Obtention du nombre de groupe pour un tableau de bord utilisateur */
  function obten_nombr_group_utils (pnu_seqnc_tabl_bord in vd_i_afw_37_tabl_bord.seqnc%type)
    return number;

  /* Insertion / Mise à jour d'un groupe de gadget */
  procedure gerer_group_gadgt_utils (pnu_ref_utils_demdr   in     vd_i_afw_12_utils.seqnc%type
                                    ,pnu_ref_tabl_bord     in     vd_i_afw_37_tabl_bord.seqnc%type
                                    ,pva_nom               in     vd_i_afw_12_group_gadgt_utils.nom%type
                                    ,pva_indic_systm       in     vd_i_afw_12_group_gadgt_utils.indic_systm%type
                                    ,pnu_seqnc             in out vd_i_afw_12_group_gadgt_utils.seqnc%type);

  /* Créer le groupe de gadgets par défaut */
  function creer_group_gadgt_utils_deft (pnu_ref_tabl_bord in vd_i_afw_37_tabl_bord.seqnc%type)
    return vd_i_afw_12_group_gadgt_utils.seqnc%type;

  /* Supprimer un groupe de gadgets */
  procedure suprm_group_gadgt_utils (pnu_seqnc in vd_i_afw_12_group_gadgt_utils.seqnc%type);

  /* Configuration des groupes de gadgets */
  procedure defnr_group_confg_gril (pnu_ref_group   in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                   ,pcl_confg       in clob);

  procedure defnr_group_confg_gadgt (pnu_ref_group   in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                    ,pcl_confg       in clob);

  /* Retrouver les configurations de groupes de gadgets */
  function obten_group_confg_gril (pnu_ref_group in vd_i_afw_12_group_gadgt_utils.seqnc%type)
    return clob;

  function obten_group_confg_gadgt (pnu_ref_group in vd_i_afw_12_group_gadgt_utils.seqnc%type)
    return clob;

  /* Vérifier mode admin groupe */
  function obten_mode_admin (pnu_ref_group in vd_i_afw_12_group_gadgt_utils.seqnc%type)
    return boolean;

  /* Vérifier accès/existence à un groupe */
  function obten_acces_group (pnu_ref_group in vd_i_afw_12_group_gadgt_utils.seqnc%type)
    return boolean;

  /* Gestion des droits d'un groupe */
  procedure ajout_group_gadgt_group_utils (pnu_ref_group         in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                          ,pnu_ref_group_utils   in vd_i_afw_12_group_utils.seqnc%type);

  procedure suprm_group_gadgt_group_utils (pnu_ref_group         in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                          ,pnu_ref_group_utils   in vd_i_afw_12_group_utils.seqnc%type);

  procedure ajout_group_gadgt_utils (pnu_ref_group   in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                    ,pnu_ref_utils   in vd_i_afw_12_group_utils.seqnc%type);

  procedure suprm_group_gadgt_utils (pnu_ref_group   in vd_i_afw_12_group_gadgt_utils.seqnc%type
                                    ,pnu_ref_utils   in vd_i_afw_12_group_utils.seqnc%type);

  /* Insertion / Mise à jour de l'instance de gadget */
  procedure gerer_gadgt_utils (pnu_ref_tabl_bord           in     vd_i_afw_37_tabl_bord.seqnc%type
                              ,pnu_ref_group_gadgt_utils   in     vd_i_afw_12_group_gadgt_utils.seqnc%type
                              ,pnu_ref_gadgt               in     vd_i_afw_37_gadgt.seqnc%type
                              ,pva_nom                     in     vd_i_afw_12_lien_gadgt_utils.nom%type
                              ,pva_descr                   in     vd_i_afw_12_lien_gadgt_utils.descr%type
                              ,pnu_seqnc                   in out vd_i_afw_12_lien_gadgt_utils.seqnc%type);

  /* Supprimer l'instance du gadget */
  procedure suprm_gadgt_utils (pnu_seqnc in vd_i_afw_12_lien_gadgt_utils.seqnc%type);

  /* Persister l'instance du gadget (Retire numéro de session temporaire) */
  procedure perst_gadgt_utils (pnu_seqnc in vd_i_afw_12_lien_gadgt_utils.seqnc%type);

  /* Obtenir le nombre de paramètres pour un gadget */
  function obten_nombr_parmt_gadgt (pnu_srqnc_gadgt in vd_i_afw_37_gadgt.seqnc%type)
    return number;

  /* Insertion / Mise à jour d'un paramètre d'instance de gadget */
  procedure gerer_parmt_gadgt_utils (pnu_ref_lien_gadgt_utils         in     vd_i_afw_12_lien_gadgt_utils_p.ref_lien_gadgt_utils%type
                                    ,pnu_ref_gadgt_parmt              in     vd_i_afw_12_lien_gadgt_utils_p.ref_gadgt_parmt%type
                                    ,pnu_ref_dv_forml_don             in     vd_i_afw_12_lien_gadgt_utils_p.ref_dv_forml_don%type
                                    ,pnu_ref_lien_gadgt_parmt_racrc   in     vd_i_afw_12_lien_gadgt_utils_p.ref_lien_gadgt_parmt_racrc%type
                                    ,pnu_ref_gadgt_parmt_racrc        in     vd_i_afw_12_lien_gadgt_utils_p.ref_gadgt_parmt_racrc%type
                                    ,pva_forml_don                    in     vd_i_afw_12_lien_gadgt_utils_p.forml_don%type
                                    ,pnu_seqnc                        in out vd_i_afw_12_lien_gadgt_utils_p.seqnc%type);

  /* Supprimer un paramètre d'instance de gadget */
  procedure suprm_parmt_gadgt_utils (pnu_seqnc in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type);

  /* Vérification du nombre de paramètres obligatoires qui n'ont pas de valeur */
  function obten_nombr_parmt_oblig_vide (pnu_seqnc in vd_i_afw_12_lien_gadgt_utils.seqnc%type)
    return number;

  /* Fonction qui permettent de retrouver les données de paramètres */
  function obten_row_lgup (pnu_seqnc_lgup       in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type
                          ,pva_forml_don_code   in varchar2 default null)
    return vd_i_afw_12_lien_gadgt_utils_p%rowtype;

  function obten_seqnc_lgup (pnu_seqnc_lgu          in vd_i_afw_12_lien_gadgt_utils.seqnc%type
                            ,pva_gadgt_parmt_code   in vd_i_afw_37_gadgt_parmt.code%type)
    return number;

  /* Fonctions d'obtention de formules de données */
  function obten_forml_gpr (pnu_seqnc_gpr vd_i_afw_37_gadgt_parmt_racrc.seqnc%type)
    return vd_i_afw_37_gadgt_parmt_racrc.forml_don%type;

  function obten_forml_lgpr (pnu_seqnc_gpr vd_i_afw_37_lien_gadgt_parmt_r.seqnc%type)
    return vd_i_afw_37_lien_gadgt_parmt_r.forml_don%type;

  function obten_nom_gpr (pnu_seqnc_gpr vd_i_afw_37_gadgt_parmt_racrc.seqnc%type)
    return vd_i_afw_37_gadgt_parmt_racrc.nom%type;

  function obten_nom_lgpr (pnu_seqnc_gpr vd_i_afw_37_lien_gadgt_parmt_r.seqnc%type)
    return vd_i_afw_37_lien_gadgt_parmt_r.nom%type;

  function obten_nom_parmt_dynmq (pnu_seqnc_lgup in vd_i_afw_12_lien_gadgt_utils_p.seqnc%type)
    return vd_i_afw_37_gadgt_parmt_racrc.nom%type;

  /* Procédure permettant d'obtenir de l'information sur la Domaine Valeur d'un paramètre liste */
  procedure obten_infor_dv_parmt (pnu_seqnc_lgup       in     vd_i_afw_12_lien_gadgt_utils.seqnc%type
                                 ,pnu_ref_domn_valr       out vd_i_afw_14_domn_valr.seqnc%type
                                 ,pva_code_domn_valr      out vd_i_afw_14_domn_valr.code%type
                                 ,pva_enonc_sourc         out vd_i_afw_14_domn_valr.enonc_sourc%type);
end afw_12_tabl_bord_pkg;
/
