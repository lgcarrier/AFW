DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_ATRIB_MODL_COMNC;

create or replace force view apexframework.vd_i_afw_01_atrib_modl_comnc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_modl_comnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_modl_comnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_atrib_modl_comnc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_CODE_ERR_ORACL;

create or replace force view apexframework.vd_i_afw_01_code_err_oracl
(
  seqnc
 ,err_code
 ,utils_creat
 ,date_creat
 ,date_modfc
 ,utils_modfc
 ,libl
)
as
  select seqnc
        ,err_code
        ,utils_creat
        ,date_creat
        ,date_modfc
        ,utils_modfc
        ,libl
    from afw_01_code_err_oracl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_CONFG_EVENM_NOTFB;

create or replace force view apexframework.vd_i_afw_01_confg_evenm_notfb
(
  seqnc
 ,ref_type_comnc
 ,objet
 ,titre_mesg
 ,mesg_sms
 ,mesg
 ,ref_evenm_notfb
 ,nom
 ,descr
 ,ref_domn
 ,ref_compt_twili
 ,ref_profl_courl
 ,indic_deft
 ,indic_envoi_difr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_type_comnc
        ,objet
        ,titre_mesg
        ,mesg_sms
        ,mesg
        ,ref_evenm_notfb
        ,nom
        ,descr
        ,ref_domn
        ,ref_compt_twili
        ,ref_profl_courl
        ,indic_deft
        ,indic_envoi_difr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_confg_evenm_notfb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_DESTN;

create or replace force view apexframework.vd_i_afw_01_destn
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_atrib_struc_aplic
 ,descr
 ,dnr_ref_prodt
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_atrib_struc_aplic
        ,descr
        ,dnr_ref_prodt
    from afw_01_destn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_DESTN_CONFG_EN;

create or replace force view apexframework.vd_i_afw_01_destn_confg_en
(
  seqnc
 ,ref_dv_natr_destn
 ,ref_confg_evenm_notfb
 ,ref_destn
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_creat
 ,ref_reslt_destn
 ,ref_atrib_sa_nom_formt
 ,ref_atrib_sa_adres_destn
)
as
  select seqnc
        ,ref_dv_natr_destn
        ,ref_confg_evenm_notfb
        ,ref_destn
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,date_creat
        ,ref_reslt_destn
        ,ref_atrib_sa_nom_formt
        ,ref_atrib_sa_adres_destn
    from afw_01_destn_confg_evenm_notfb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_ELEMN_CONFG_EN;

create or replace force view apexframework.vd_i_afw_01_elemn_confg_en
(
  seqnc
 ,ref_confg_evenm_notfb
 ,code
 ,ident_acces
 ,ident_acces_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,formt
)
as
  select seqnc
        ,ref_confg_evenm_notfb
        ,code
        ,ident_acces
        ,ident_acces_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,formt
    from afw_01_elemn_confg_evenm_notfb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_EVENM_NOTFB;

create or replace force view apexframework.vd_i_afw_01_evenm_notfb
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_struc_aplic
        ,dnr_ref_prodt
    from afw_01_evenm_notfb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_HIERC_APLIC;

create or replace force view apexframework.vd_i_afw_01_hierc_aplic
(
  seqnc
 ,ref_evenm_notfb
 ,aplic_prior
 ,ref_atrib_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_evenm_notfb
        ,aplic_prior
        ,ref_atrib_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_01_hierc_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_LANG;

create or replace force view apexframework.vd_i_afw_01_lang
(
  seqnc
 ,code
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_lang;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_LANG_LANG;

create or replace force view apexframework.vd_i_afw_01_lang_lang
(
  seqnc
 ,ref_lang
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_lang_cible
)
as
  select seqnc
        ,ref_lang
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_lang_cible
    from afw_01_lang_lang;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_MESG;

create or replace force view apexframework.vd_i_afw_01_mesg
(
  seqnc
 ,numr_mesg
 ,ref_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,descr
 ,type_mesg
 ,dnr_ref_prodt
)
as
  select seqnc
        ,numr_mesg
        ,ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,descr
        ,type_mesg
        ,dnr_ref_prodt
    from afw_01_mesg;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_MESG_ERR_LIE;

create or replace force view apexframework.vd_i_afw_01_mesg_err_lie
(
  seqnc
 ,nom_table
 ,nom_coln
 ,nom_contr
 ,page
 ,comnt
 ,ref_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_liais
 ,ref_mesg
 ,dnr_ref_prodt
 ,ref_code_err_oracl
)
as
  select seqnc
        ,nom_table
        ,nom_coln
        ,nom_contr
        ,page
        ,comnt
        ,ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_liais
        ,ref_mesg
        ,dnr_ref_prodt
        ,ref_code_err_oracl
    from afw_01_mesg_err_lie;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_MESG_INFOR;

create or replace force view apexframework.vd_i_afw_01_mesg_infor
(
  seqnc
 ,text_mesg
 ,utils_creat
 ,date_creat
 ,sess_id
 ,ref_utils
 ,ref_mesg_lang
)
as
  select seqnc
        ,text_mesg
        ,utils_creat
        ,date_creat
        ,sess_id
        ,ref_utils
        ,ref_mesg_lang
    from afw_01_mesg_infor;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_MESG_LANG;

create or replace force view apexframework.vd_i_afw_01_mesg_lang
(
  seqnc
 ,mesg
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_lang
 ,ref_mesg
 ,dnr_ref_prodt
)
as
  select seqnc
        ,mesg
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_lang
        ,ref_mesg
        ,dnr_ref_prodt
    from afw_01_mesg_lang;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_MESG_TRADC_APEX;

create or replace force view apexframework.vd_i_afw_01_mesg_tradc_apex
(
  seqnc
 ,nom
 ,text
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_lang
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,nom
        ,text
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_lang
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_01_mesg_tradc_apex;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_MODL_AFICH_NOTFC;

create or replace force view apexframework.vd_i_afw_01_modl_afich_notfc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,coulr_texte
 ,tail_texte
 ,coulr_titre
 ,tail_titre
 ,temps_afich
 ,ref_resrc_icon
 ,ref_formt_resrc_icon
 ,ref_ocurn_resrc_icon
 ,ref_domn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_type_comnc
 ,ref_modl_comnc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,coulr_texte
        ,tail_texte
        ,coulr_titre
        ,tail_titre
        ,temps_afich
        ,ref_resrc_icon
        ,ref_formt_resrc_icon
        ,ref_ocurn_resrc_icon
        ,ref_domn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_type_comnc
        ,ref_modl_comnc
    from afw_01_modl_afich_notfc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_MODL_COMNC;

create or replace force view apexframework.vd_i_afw_01_modl_comnc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_type_comnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_systm
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_type_comnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_systm
        ,ref_domn
    from afw_01_modl_comnc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_MODL_MESG_NOTFC;

create or replace force view apexframework.vd_i_afw_01_modl_mesg_notfc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,objet
 ,ref_domn
 ,corps_mesg
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,objet
        ,ref_domn
        ,corps_mesg
    from afw_01_modl_mesg_notfc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_NOTFC;

create or replace force view apexframework.vd_i_afw_01_notfc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,inden_mesg
 ,titre_mesg
 ,mesg
 ,ref_modl_afich_notfc
 ,indic_specf
 ,indic_afich_uniq
 ,ref_domn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,inden_mesg
        ,titre_mesg
        ,mesg
        ,ref_modl_afich_notfc
        ,indic_specf
        ,indic_afich_uniq
        ,ref_domn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_notfc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_OSA_EVENM_NOTFB;

create or replace force view apexframework.vd_i_afw_01_osa_evenm_notfb
(
  seqnc
 ,ref_hierc_aplic
 ,ref_confg_evenm_notfb
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_seqnc_struc_aplic
)
as
  select seqnc
        ,ref_hierc_aplic
        ,ref_confg_evenm_notfb
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_seqnc_struc_aplic
    from afw_01_ocurn_sa_evenm_notfb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_PROPG_EVENM_NOTFB;

create or replace force view apexframework.vd_i_afw_01_propg_evenm_notfb
(
  seqnc
 ,ref_evenm_notfb
 ,ref_seqnc_struc_aplic
 ,ref_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_evenm_notfb
        ,ref_seqnc_struc_aplic
        ,ref_utils
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_propg_evenm_notfb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_RESLT_DESTN;

create or replace force view apexframework.vd_i_afw_01_reslt_destn
(
  seqnc
 ,ref_destn
 ,dnr_ref_prodt
 ,ident_acces
 ,ident_acces_formt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,nom
 ,ref_struc_aplic_acces
)
as
  select seqnc
        ,ref_destn
        ,dnr_ref_prodt
        ,ident_acces
        ,ident_acces_formt
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,nom
        ,ref_struc_aplic_acces
    from afw_01_reslt_destn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_01_TYPE_COMNC;

create or replace force view apexframework.vd_i_afw_01_type_comnc
(
  seqnc
 ,code
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_type_comnc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_03_CLAS_INTER;

create or replace force view apexframework.vd_i_afw_03_clas_inter
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,ref_profl_courl
 ,indic_avert_autr_uniq
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,ref_profl_courl
        ,indic_avert_autr_uniq
    from afw_03_clas_inter;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_03_JOURN;

create or replace force view apexframework.vd_i_afw_03_journ
(
  date_heure
 ,expli
 ,ereur
 ,pile_trace
 ,travl
)
as
  select date_heure
        ,expli
        ,ereur
        ,pile_trace
        ,travl
    from afw_03_journ;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_03_JOURN_STRUC_APLIC;

create or replace force view apexframework.vd_i_afw_03_journ_struc_aplic
(
  seqnc
 ,ref_domn
 ,struc_aplic
 ,seqnc_struc_aplic
 ,date_time
 ,numr_err
 ,actio_journ
 ,don_nomnl
 ,reslt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_domn
        ,struc_aplic
        ,seqnc_struc_aplic
        ,date_time
        ,numr_err
        ,actio_journ
        ,don_nomnl
        ,reslt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_03_journ_struc_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_03_LIEN_CLAS_INTER_UT;

create or replace force view apexframework.vd_i_afw_03_lien_clas_inter_ut
(
  seqnc
 ,ref_clas_inter
 ,ref_utils
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_group_utils
)
as
  select seqnc
        ,ref_clas_inter
        ,ref_utils
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_group_utils
    from afw_03_lien_clas_inter_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_03_TRACE_EXECT;

create or replace force view apexframework.vd_i_afw_03_trace_exect
(
  un
 ,deux
 ,dthr
 ,utils
 ,seqnc
 ,lb
 ,who_called_me
 ,page
 ,app
 ,app_user
 ,fil
 ,duree
 ,bb
)
as
  select un
        ,deux
        ,dthr
        ,utils
        ,seqnc
        ,lb
        ,who_called_me
        ,page
        ,app
        ,app_user
        ,fil
        ,duree
        ,bb
    from afw_03_trace_exect;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_04_CONTX;

create or replace force view apexframework.vd_i_afw_04_contx
(
  ref_fil_arian
 ,contx
 ,actio
 ,seqnc_contx
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,contx_inter
 ,actio_inter
 ,seqnc_contx_inter
 ,indic_ignor
 ,nom_procd_infor_suplm
 ,infor_suplm
 ,contx_formt
)
as
  select ref_fil_arian
        ,contx
        ,actio
        ,seqnc_contx
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,contx_inter
        ,actio_inter
        ,seqnc_contx_inter
        ,indic_ignor
        ,nom_procd_infor_suplm
        ,infor_suplm
        ,contx_formt
    from afw_04_contx;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_04_CONTX_ETEND;

create or replace force view apexframework.vd_i_afw_04_contx_etend
(
  seqnc
 ,ref_contx
 ,nom
 ,valr_numbr
 ,valr_varch
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,page_cible
 ,type_alimn
 ,type_elemn
)
as
  select seqnc
        ,ref_contx
        ,nom
        ,valr_numbr
        ,valr_varch
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,page_cible
        ,type_alimn
        ,type_elemn
    from afw_04_contx_etend;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_04_FIL_ARIAN;

create or replace force view apexframework.vd_i_afw_04_fil_arian
(
  seqnc
 ,page
 ,session_id
 ,ref_elemn_sup
 ,libl
 ,timst
 ,date_creat
 ,utils_creat
 ,app_id
 ,hash_dernr_url
 ,indic_afich
 ,ref_navgt_histr
 ,aplic
)
as
  select seqnc
        ,page
        ,session_id
        ,ref_elemn_sup
        ,libl
        ,timst
        ,date_creat
        ,utils_creat
        ,app_id
        ,hash_dernr_url
        ,indic_afich
        ,ref_navgt_histr
        ,aplic
    from afw_04_fil_arian;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_04_FIL_ARIAN_HISTR;

create or replace force view apexframework.vd_i_afw_04_fil_arian_histr
(
  seqnc
 ,page
 ,session_id
 ,ref_elemn_sup
 ,libl
 ,timst
 ,date_creat
 ,utils_creat
 ,app_id
 ,hash_dernr_url
 ,indic_afich
 ,ref_navgt_histr
 ,aplic
)
as
  select seqnc
        ,page
        ,session_id
        ,ref_elemn_sup
        ,libl
        ,timst
        ,date_creat
        ,utils_creat
        ,app_id
        ,hash_dernr_url
        ,indic_afich
        ,ref_navgt_histr
        ,aplic
    from afw_04_fil_arian;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_04_NAVGT_HISTR;

create or replace force view apexframework.vd_i_afw_04_navgt_histr
(
  seqnc
 ,ref_utils
 ,dnr_libl
 ,dnr_url
 ,dnr_icon
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,dnr_libl
        ,dnr_url
        ,dnr_icon
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_04_navgt_histr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_04_TUTRL;

create or replace force view apexframework.vd_i_afw_04_tutrl
(
  seqnc
 ,ref_sesn
 ,ref_tutrl
 ,timst
 ,date_creat
 ,utils_creat
)
as
  select seqnc
        ,ref_sesn
        ,ref_tutrl
        ,timst
        ,date_creat
        ,utils_creat
    from afw_04_tutrl tu;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_07_AUDIT_STRUC_APLIC;

create or replace force view apexframework.vd_i_afw_07_audit_struc_aplic
(
  seqnc
 ,ref_utils
 ,ref_seqnc_struc_aplic
 ,dnr_ref_seqnc_sa_formt
 ,ref_struc_aplic
 ,ref_actio_audit
 ,ref_page
 ,natr_audit
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
)
as
  select seqnc
        ,ref_utils
        ,ref_seqnc_struc_aplic
        ,dnr_ref_seqnc_sa_formt
        ,ref_struc_aplic
        ,ref_actio_audit
        ,ref_page
        ,natr_audit
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
    from afw_07_audit_struc_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_07_ETAT_SESN;

create or replace force view apexframework.vd_i_afw_07_etat_sesn
(
  seqnc
 ,session_id
 ,nom
 ,valr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,session_id
        ,nom
        ,valr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_07_etat_sesn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_07_INSTA_SEMPH;

create or replace force view apexframework.vd_i_afw_07_insta_semph
(
  seqnc
 ,ref_semph
 ,id_sesn
 ,date_creat
 ,utils_creat
 ,indic_seqnc
 ,page_perst
)
as
  select seqnc
        ,ref_semph
        ,id_sesn
        ,date_creat
        ,utils_creat
        ,indic_seqnc
        ,page_perst
    from afw_07_insta_semph;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_07_SEMPH;

create or replace force view apexframework.vd_i_afw_07_semph
(
  seqnc
 ,code
 ,varbl1
 ,varbl2
 ,varbl3
 ,date_creat
 ,utils_creat
 ,indic_exclu
)
as
  select seqnc
        ,code
        ,varbl1
        ,varbl2
        ,varbl3
        ,date_creat
        ,utils_creat
        ,indic_exclu
    from afw_07_semph;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_07_VALR_AUDIT_STR_APL;

create or replace force view apexframework.vd_i_afw_07_valr_audit_str_apl
(
  seqnc
 ,ref_audit_struc_aplic
 ,code
 ,valr_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_audit_struc_aplic
        ,code
        ,valr_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_07_valr_audit_struc_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_APLIC;

create or replace force view apexframework.vd_i_afw_11_aplic
(
  seqnc
 ,code
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,numr_aplic_apex
 ,date_dernr_maj_refrn_apex
 ,ref_versn
 ,indic_aplic_authe
 ,ref_aplic_authe
 ,ref_page_conxn
 ,ref_page_acuei
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,numr_aplic_apex
        ,date_dernr_maj_refrn_apex
        ,ref_versn
        ,indic_aplic_authe
        ,ref_aplic_authe
        ,ref_page_conxn
        ,ref_page_acuei
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_11_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_ATRIB_ENTIT;

create or replace force view apexframework.vd_i_afw_11_atrib_entit
(
  seqnc
 ,nom
 ,type_don
 ,compr_migrt
 ,ref_entit
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,code
 ,ref_entit_refrn
 ,indic_nouvl_atrib
)
as
  select seqnc
        ,nom
        ,type_don
        ,compr_migrt
        ,ref_entit
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
        ,code
        ,ref_entit_refrn
        ,indic_nouvl_atrib
    from afw_11_atrib_entit;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_ENTIT;

create or replace force view apexframework.vd_i_afw_11_entit
(
  seqnc
 ,nom
 ,nom_table_tempr
 ,nom_table_ereur
 ,indic_creer_ocurn
 ,indic_modif_ocurn
 ,indic_suprm_ocurn
 ,ref_versn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ordre_exect
 ,dnr_ref_prodt
 ,code
 ,indic_force_selct
 ,longr_bloc
 ,indic_nouvl_entit
 ,niv_inclu_migrt
 ,confg_inclu_migrt
 ,ref_atrib_entit_supr
 ,indic_expor_tabl_index
 ,indic_suprm_don_prodt
)
as
  select seqnc
        ,nom
        ,nom_table_tempr
        ,nom_table_ereur
        ,indic_creer_ocurn
        ,indic_modif_ocurn
        ,indic_suprm_ocurn
        ,ref_versn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ordre_exect
        ,dnr_ref_prodt
        ,code
        ,indic_force_selct
        ,longr_bloc
        ,indic_nouvl_entit
        ,niv_inclu_migrt
        ,confg_inclu_migrt
        ,ref_atrib_entit_supr
        ,indic_expor_tabl_index
        ,indic_suprm_don_prodt
    from afw_11_entit;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_PARMT_AFW;

create or replace force view apexframework.vd_i_afw_11_parmt_afw
(
  seqnc
 ,code
 ,valr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,valr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_11_parmt_afw;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_PLUGN;

create or replace force view apexframework.vd_i_afw_11_plugn
(
  seqnc
 ,code_inter
 ,nom
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_creat
 ,descr
 ,ref_versn
)
as
  select seqnc
        ,code_inter
        ,nom
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,date_creat
        ,descr
        ,ref_versn
    from afw_11_plugn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_PRODT;

create or replace force view apexframework.vd_i_afw_11_prodt
(
  seqnc
 ,code
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,procd_expor_metdn
 ,tail_tabl_extra
 ,indic_extra_tout
 ,ref_group_utils_admin
 ,dosr_fichr
 ,ident_envir
 ,ref_versn
 ,mesg_tout_droit_resrv
 ,jquer_ui_css_scope
 ,indic_afich_err_code
 ,ref_mesg_sucs
 ,ref_mesg_echec
 ,ref_mesg_fetch
 ,ref_mesg_range_suprm
 ,ref_mesg_range_modf
 ,ref_mesg_range_inser
 ,ref_mesg_aucun_don_trouv
 ,ref_mesg_trop_don_trouv
 ,ref_mesg_audit_creat
 ,ref_mesg_audit_modfc
 ,ref_mesg_audit_suprs
 ,fonct_obten_base_url
 ,ref_aplic_acuei
 ,ref_page_acuei
 ,ref_aplic_comnt_bogue
 ,ref_page_comnt_bogue
 ,indic_page_inexs_maj_refrn
 ,procd_impre_entet_pdf_ir
 ,procd_impre_pied_page_pdf_ir
 ,procd_plpdf_coulr
 ,compt_genrl
 ,domn_docmn_html
 ,initl_comps_javsc
 ,note_scrip_pre_migrt
 ,note_scrip_post_migrt
 ,procd_initl_sesn
 ,fonct_migrt_persn
)
as
  select seqnc
        ,code
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,procd_expor_metdn
        ,tail_tabl_extra
        ,indic_extra_tout
        ,ref_group_utils_admin
        ,dosr_fichr
        ,ident_envir
        ,ref_versn
        ,mesg_tout_droit_resrv
        ,jquer_ui_css_scope
        ,indic_afich_err_code
        ,ref_mesg_sucs
        ,ref_mesg_echec
        ,ref_mesg_fetch
        ,ref_mesg_range_suprm
        ,ref_mesg_range_modf
        ,ref_mesg_range_inser
        ,ref_mesg_aucun_don_trouv
        ,ref_mesg_trop_don_trouv
        ,ref_mesg_audit_creat
        ,ref_mesg_audit_modfc
        ,ref_mesg_audit_suprs
        ,fonct_obten_base_url
        ,ref_aplic_acuei
        ,ref_page_acuei
        ,ref_aplic_comnt_bogue
        ,ref_page_comnt_bogue
        ,indic_page_inexs_maj_refrn
        ,procd_impre_entet_pdf_ir
        ,procd_impre_pied_page_pdf_ir
        ,procd_plpdf_coulr
        ,compt_genrl
        ,domn_docmn_html
        ,initl_comps_javsc
        ,note_scrip_pre_migrt
        ,note_scrip_post_migrt
        ,procd_initl_sesn
        ,fonct_migrt_persn
    from afw_11_prodt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_PRODT_LANG;

create or replace force view apexframework.vd_i_afw_11_prodt_lang
(
  seqnc
 ,ref_prodt
 ,ref_lang
 ,indic_deft
 ,ordre_presn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,ref_lang
        ,indic_deft
        ,ordre_presn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_11_prodt_lang;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_PRODT_RESRC;

create or replace force view apexframework.vd_i_afw_11_prodt_resrc
(
  seqnc
 ,ref_prodt
 ,ref_resrc
 ,ref_formt
 ,ref_condt_exect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_plugn
)
as
  select seqnc
        ,ref_prodt
        ,ref_resrc
        ,ref_formt
        ,ref_condt_exect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_plugn
    from afw_11_prodt_resrc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_UTILS;

create or replace force view apexframework.vd_i_afw_11_utils
(
  seqnc
 ,ref_prodt
 ,ref_utils
 ,role
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,ref_utils
        ,role
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_11_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_11_VERSN;

create or replace force view apexframework.vd_i_afw_11_versn
(
  seqnc
 ,numr_versn_1
 ,numr_versn_2
 ,numr_versn_3
 ,numr_versn_4
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,indic_docmn_verl
 ,nom
 ,ref_plugn
 ,code
 ,dnr_ref_prodt
 ,ref_aplic
 ,dnr_ref_aplic
)
as
  select seqnc
        ,numr_versn_1
        ,numr_versn_2
        ,numr_versn_3
        ,numr_versn_4
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,indic_docmn_verl
        ,nom
        ,ref_plugn
        ,code
        ,dnr_ref_prodt
        ,ref_aplic
        ,dnr_ref_aplic
    from afw_11_versn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_ACTIO_AUDIT;

create or replace force view apexframework.vd_i_afw_12_actio_audit
(
  seqnc
 ,ref_struc_aplic
 ,dnr_ref_prodt
 ,code
 ,nom
 ,ref_mesg
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_struc_aplic
        ,dnr_ref_prodt
        ,code
        ,nom
        ,ref_mesg
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_actio_audit;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_ARBRE;

create or replace force view apexframework.vd_i_afw_12_arbre
(
  seqnc
 ,noeud_actif
 ,ref_sesn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_rafrc
 ,id_apex_regn
)
as
  select seqnc
        ,noeud_actif
        ,ref_sesn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_rafrc
        ,id_apex_regn
    from afw_12_arbre;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_ARBRE_NOEUD;

create or replace force view apexframework.vd_i_afw_12_arbre_noeud
(
  seqnc
 ,ref_arbre
 ,noeud_ouver
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_arbre
        ,noeud_ouver
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_arbre_noeud;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_ATRIB_STRUC_APLIC;

create or replace force view apexframework.vd_i_afw_12_atrib_struc_aplic
(
  seqnc
 ,nom_coln
 ,nom_fonct
 ,ref_dv_natr_infor
 ,indic_valid
 ,ref_struc_aplic
 ,ref_atrib_struc_aplic
 ,indic_destn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,nom_coln
        ,nom_fonct
        ,ref_dv_natr_infor
        ,indic_valid
        ,ref_struc_aplic
        ,ref_atrib_struc_aplic
        ,indic_destn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_12_atrib_struc_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_DEFNT_ACCES;

create or replace force view apexframework.vd_i_afw_12_defnt_acces
(
  seqnc
 ,ref_group_utils
 ,ref_utils
 ,indic_acces
 ,indic_modfc
 ,indic_suprs
 ,indic_creat
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_opert
 ,ref_struc_aplic
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_group_utils
        ,ref_utils
        ,indic_acces
        ,indic_modfc
        ,indic_suprs
        ,indic_creat
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_opert
        ,ref_struc_aplic
        ,dnr_ref_prodt
    from afw_12_defnt_acces;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_DOMN;

create or replace force view apexframework.vd_i_afw_12_domn
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_travl_deft
 ,ref_profl_courl_notfc
 ,ref_profl_sms_notfc
 ,ref_compt_axiat_deft
 ,ref_modl_rechr_deft
 ,procd_authe_exter_afw
 ,procd_vald_niv_secrt_mot_passe
 ,procd_apres_conxn
 ,procd_apres_decnx
 ,indic_demnd_activ_compt_utils
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_travl_deft
        ,ref_profl_courl_notfc
        ,ref_profl_sms_notfc
        ,ref_compt_axiat_deft
        ,ref_modl_rechr_deft
        ,procd_authe_exter_afw
        ,procd_vald_niv_secrt_mot_passe
        ,procd_apres_conxn
        ,procd_apres_decnx
        ,indic_demnd_activ_compt_utils
    from afw_12_domn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_DOMN_FONCT;

create or replace force view apexframework.vd_i_afw_12_domn_fonct
(
  seqnc
 ,ref_fonct
 ,ref_domn
 ,indic_actif
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_fonct
        ,ref_domn
        ,indic_actif
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_domn_fonct;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_DOMN_SERVR_LDAP;

create or replace force view apexframework.vd_i_afw_12_domn_servr_ldap
(
  seqnc
 ,ref_domn
 ,ref_servr_ldap
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_domn
        ,ref_servr_ldap
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_domn_servr_ldap;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_DOMN_UTILS;

create or replace force view apexframework.vd_i_afw_12_domn_utils
(
  seqnc
 ,ref_utils
 ,ref_domn
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_domn
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_domn_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_EVOLT_STAT;

create or replace force view apexframework.vd_i_afw_12_evolt_stat
(
  seqnc
 ,ref_stat
 ,ref_stat_evolt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_code
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_stat
        ,ref_stat_evolt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_code
        ,dnr_ref_prodt
    from afw_12_evolt_stat;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_FAVR;

create or replace force view apexframework.vd_i_afw_12_favr
(
  seqnc
 ,ref_struc_aplic
 ,ref_seqnc_struc_aplic
 ,ref_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_struc_aplic
        ,ref_seqnc_struc_aplic
        ,ref_utils
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_favr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_FONCT;

create or replace force view apexframework.vd_i_afw_12_fonct
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_12_fonct;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_FONCT_STRUC_APLIC;

create or replace force view apexframework.vd_i_afw_12_fonct_struc_aplic
(
  seqnc
 ,ref_fonct
 ,ref_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_fonct
        ,ref_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_12_fonct_struc_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_GROUP_GADGT_UTILS;

create or replace force view apexframework.vd_i_afw_12_group_gadgt_utils
(
  seqnc
 ,ref_utils
 ,ref_utils_demdr
 ,ref_tabl_bord
 ,nom
 ,indic_systm
 ,confg_gril
 ,confg_gadgt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_utils_demdr
        ,ref_tabl_bord
        ,nom
        ,indic_systm
        ,confg_gril
        ,confg_gadgt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_group_gadgt_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_GROUP_STAT;

create or replace force view apexframework.vd_i_afw_12_group_stat
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_12_group_stat;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_GROUP_UTILS;

create or replace force view apexframework.vd_i_afw_12_group_utils
(
  seqnc
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,code
 ,indic_ignor_group_admin
 ,indic_systm
 ,dnr_ref_prodt
 ,ref_domn
 ,indic_acces_globl
 ,ref_fonct
 ,indic_group_aplic
)
as
  select seqnc
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,code
        ,indic_ignor_group_admin
        ,indic_systm
        ,dnr_ref_prodt
        ,ref_domn
        ,indic_acces_globl
        ,ref_fonct
        ,indic_group_aplic
    from afw_12_group_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_G_U_OPERT_OPT_DOM;

create or replace force view apexframework.vd_i_afw_12_g_u_opert_opt_dom
(
  seqnc
 ,ref_group_utils
 ,ref_opert
 ,ref_opert_optio
 ,ref_domn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_group_utils
        ,ref_opert
        ,ref_opert_optio
        ,ref_domn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_gr_ut_opert_optio_domn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_HISTR_ACCES;

create or replace force view apexframework.vd_i_afw_12_histr_acces
(
  seqnc
 ,ref_utils
 ,date_evenm
 ,ref_dv_type_evenm
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,adres_ip
 ,ref_utils_pour
)
as
  select seqnc
        ,ref_utils
        ,date_evenm
        ,ref_dv_type_evenm
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,adres_ip
        ,ref_utils_pour
    from afw_12_histr_acces;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_HISTR_TUTRL;

create or replace force view apexframework.vd_i_afw_12_histr_tutrl
(
  seqnc
 ,ref_tutrl
 ,ref_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_tutrl
        ,ref_utils
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_histr_tutrl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_LIEN_GADGT_UTILS;

create or replace force view apexframework.vd_i_afw_12_lien_gadgt_utils
(
  seqnc
 ,ref_gadgt
 ,ref_group_gadgt_utils
 ,nom
 ,descr
 ,ref_sesn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_gadgt
        ,ref_group_gadgt_utils
        ,nom
        ,descr
        ,ref_sesn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_lien_gadgt_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_LIEN_GADGT_UTILS_P;

create or replace force view apexframework.vd_i_afw_12_lien_gadgt_utils_p
(
  seqnc
 ,ref_lien_gadgt_utils
 ,ref_gadgt_parmt
 ,ref_dv_forml_don
 ,ref_lien_gadgt_parmt_racrc
 ,ref_gadgt_parmt_racrc
 ,forml_don
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_lien_gadgt_utils
        ,ref_gadgt_parmt
        ,ref_dv_forml_don
        ,ref_lien_gadgt_parmt_racrc
        ,ref_gadgt_parmt_racrc
        ,forml_don
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_lien_gadgt_utils_parmt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_LIEN_GR_GADGT_GR_U;

create or replace force view apexframework.vd_i_afw_12_lien_gr_gadgt_gr_u
(
  seqnc
 ,ref_group_gadgt_utils
 ,ref_group_utils
 ,ref_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_group_gadgt_utils
        ,ref_group_utils
        ,ref_utils
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_lien_gr_gadgt_gr_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_LIEN_GROUP_UTILS;

create or replace force view apexframework.vd_i_afw_12_lien_group_utils
(
  seqnc
 ,ref_group
 ,ref_utils
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_group_utils_lie
 ,dnr_ref_prodt
 ,ref_domn
)
as
  select seqnc
        ,ref_group
        ,ref_utils
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_group_utils_lie
        ,dnr_ref_prodt
        ,ref_domn
    from afw_12_lien_group_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_LIEN_STRUC;

create or replace force view apexframework.vd_i_afw_12_lien_struc
(
  seqnc
 ,ref_struc_admin
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_lie
)
as
  select seqnc
        ,ref_struc_admin
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_struc_lie
    from afw_12_lien_struc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_MEMBR_STRUC;

create or replace force view apexframework.vd_i_afw_12_membr_struc
(
  seqnc
 ,ref_utils
 ,ref_struc_admin
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_struc_admin
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_membr_struc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_REQT_INTER_UTILS;

create or replace force view apexframework.vd_i_afw_12_reqt_inter_utils
(
  seqnc
 ,ident
 ,ref_utils
 ,ref_dv_type_reqt_inter
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_prodt
 ,numr_aplic_apex
 ,numr_page_apex
 ,date_trait
 ,procd_persn_url_apres_authe
)
as
  select seqnc
        ,ident
        ,ref_utils
        ,ref_dv_type_reqt_inter
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        ,ref_prodt
        ,numr_aplic_apex
        ,numr_page_apex
        ,date_trait
        ,procd_persn_url_apres_authe
    from afw_12_reqt_inter_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_SERVR_LDAP;

create or replace force view apexframework.vd_i_afw_12_servr_ldap
(
  seqnc
 ,adres
 ,port
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,base_dn
 ,utils_cn
 ,mot_passe
)
as
  select seqnc
        ,adres
        ,port
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,base_dn
        ,utils_cn
        ,mot_passe
    from afw_12_servr_ldap;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_SESN;

create or replace force view apexframework.vd_i_afw_12_sesn
(
  id_sesn
 ,app_user
 ,ref_id_sesn
 ,ref_lang
)
as
  select id_sesn
        ,app_user
        ,ref_id_sesn
        ,ref_lang
    from afw_12_sesn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_STAT;

create or replace force view apexframework.vd_i_afw_12_stat
(
  seqnc
 ,ref_struc_aplic
 ,ordre
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,indic_initl
 ,utils_modfc
 ,indic_stat_utils
 ,ref_group_stat
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_struc_aplic
        ,ordre
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,indic_initl
        ,utils_modfc
        ,indic_stat_utils
        ,ref_group_stat
        ,dnr_ref_prodt
    from afw_12_stat;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_STRUC_ADMIN;

create or replace force view apexframework.vd_i_afw_12_struc_admin
(
  seqnc
 ,nom
 ,indic_deft
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_type_struc
 ,ref_respn
 ,debut_efect
 ,fin_efect
 ,ref_domn
)
as
  select seqnc
        ,nom
        ,indic_deft
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_type_struc
        ,ref_respn
        ,debut_efect
        ,fin_efect
        ,ref_domn
    from afw_12_struc_admin;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_STRUC_APLIC;

create or replace force view apexframework.vd_i_afw_12_struc_aplic
(
  seqnc
 ,nom
 ,descr
 ,ref_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,code
 ,ref_mesg_err_suprs
 ,indic_extra_tout
 ,tail_tabl_extra
 ,nom_struc_acces_don
 ,ref_page_liste
 ,ref_page_forml
 ,nom_packg
 ,dnr_ref_prodt
 ,indic_dispn_docmn
 ,nom_schem
 ,icon_font_awesm
)
as
  select seqnc
        ,nom
        ,descr
        ,ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,code
        ,ref_mesg_err_suprs
        ,indic_extra_tout
        ,tail_tabl_extra
        ,nom_struc_acces_don
        ,ref_page_liste
        ,ref_page_forml
        ,nom_packg
        ,dnr_ref_prodt
        ,indic_dispn_docmn
        ,nom_schem
        ,icon_font_awesm
    from afw_12_struc_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_STRUC_APLIC_DESTN;

create or replace force view apexframework.vd_i_afw_12_struc_aplic_destn
(
  seqnc
 ,ref_struc_aplic
 ,ref_destn
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_struc_aplic
        ,ref_destn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_12_struc_aplic_destn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_STRUC_APLIC_LANG;

create or replace force view apexframework.vd_i_afw_12_struc_aplic_lang
(
  seqnc
 ,ref_struc_aplic
 ,adjec_demns
 ,nom
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,descr
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_struc_aplic
        ,adjec_demns
        ,nom
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,descr
        ,dnr_ref_prodt
    from afw_12_struc_aplic_lang;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_STRUC_APLIC_SUIVI;

create or replace force view apexframework.vd_i_afw_12_struc_aplic_suivi
(
  seqnc
 ,ref_struc_aplic
 ,ref_suivi
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom_persn
 ,indic_creat_initl
 ,seqnc_presn
 ,ref_sucrs_impla
)
as
  select seqnc
        ,ref_struc_aplic
        ,ref_suivi
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom_persn
        ,indic_creat_initl
        ,seqnc_presn
        ,ref_sucrs_impla
    from afw_12_struc_aplic_suivi;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_TUTRL;

create or replace force view apexframework.vd_i_afw_12_tutrl
(
  seqnc
 ,ref_utils
 ,ref_tutrl
 ,date_creat
 ,utils_creat
)
as
  select seqnc
        ,ref_utils
        ,ref_tutrl
        ,date_creat
        ,utils_creat
    from afw_12_tutrl tu;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_TYPE_STRUC;

create or replace force view apexframework.vd_i_afw_12_type_struc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
    from afw_12_type_struc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_UTILS;

create or replace force view apexframework.vd_i_afw_12_utils
(
  seqnc
 ,nom
 ,prenm
 ,code_utils
 ,mot_passe
 ,date_expir
 ,indic_verl
 ,indic_chang_mot_passe
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,courl
 ,dernr_prodt_acces
 ,indic_actif
 ,dernr_domn_acces
 ,ref_dv_compl_maxm
 ,code_utils_base_don
 ,parmt_authe_exter_afw
)
as
  select seqnc
        ,nom
        ,prenm
        ,code_utils
        ,mot_passe
        ,date_expir
        ,indic_verl
        ,indic_chang_mot_passe
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,courl
        ,dernr_prodt_acces
        ,indic_actif
        ,dernr_domn_acces
        ,ref_dv_compl_maxm
        ,code_utils_base_don
        ,parmt_authe_exter_afw
    from afw_12_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_12_UTILS_AVATR;

create or replace force view apexframework.vd_i_afw_12_utils_avatr
(
  seqnc
 ,ref_utils
 ,ref_domn
 ,logo_tail_large
 ,logo_tail_moyn
 ,logo_tail_pet
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_domn
        ,logo_tail_large
        ,logo_tail_moyn
        ,logo_tail_pet
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_utils_avatr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_CONDT_EXECT;

create or replace force view apexframework.vd_i_afw_13_condt_exect
(
  seqnc
 ,code
 ,nom
 ,descr
 ,enonc_condt_plsql
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,enonc_condt_plsql
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_13_condt_exect;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_CONDT_PILTB;

create or replace force view apexframework.vd_i_afw_13_condt_piltb
(
  seqnc
 ,ref_page
 ,code
 ,nom
 ,descr
 ,condt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_page_item_focus
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page
        ,code
        ,nom
        ,descr
        ,condt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_page_item_focus
        ,dnr_ref_aplic
    from afw_13_condt_piltb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_DOSR_VIRTL;

create or replace force view apexframework.vd_i_afw_13_dosr_virtl
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_13_dosr_virtl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_EMPLA_DOSR_VIRTL;

create or replace force view apexframework.vd_i_afw_13_empla_dosr_virtl
(
  seqnc
 ,ref_dosr_virtl
 ,ref_versn
 ,empla
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_dosr_virtl
        ,ref_versn
        ,empla
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_13_empla_dosr_virtl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_ETAPE_TUTRL;

create or replace force view apexframework.vd_i_afw_13_etape_tutrl
(
  seqnc
 ,nom
 ,descr
 ,ref_tutrl
 ,ordre_presn
 ,ref_page_item
 ,selct_jquer_elemn_html
 ,ref_mesg_titre
 ,ref_mesg_descr
 ,ref_dv_postn_afich
 ,indic_afich_toile_fond
 ,indic_mode_reflx
 ,indic_afich_orphe
 ,templ_html
 ,on_next
 ,on_prev
 ,on_show
 ,on_shown
 ,on_hide
 ,on_hidn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,nom
        ,descr
        ,ref_tutrl
        ,ordre_presn
        ,ref_page_item
        ,selct_jquer_elemn_html
        ,ref_mesg_titre
        ,ref_mesg_descr
        ,ref_dv_postn_afich
        ,indic_afich_toile_fond
        ,indic_mode_reflx
        ,indic_afich_orphe
        ,templ_html
        ,on_next
        ,on_prev
        ,on_show
        ,on_shown
        ,on_hide
        ,on_hidn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_etape_tutrl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_EXPOR_APLIC;

create or replace force view apexframework.vd_i_afw_13_expor_aplic
(
  seqnc
 ,ref_sesn
 ,ref_aplic
 ,indic_maj_refrn
 ,numr_aplic_cible
 ,indic_ajout_aplic_apex
)
as
  select seqnc
        ,ref_sesn
        ,ref_aplic
        ,indic_maj_refrn
        ,numr_aplic_cible
        ,indic_ajout_aplic_apex
    from afw_13_expor_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_EXPOR_PAGE;

create or replace force view apexframework.vd_i_afw_13_expor_page
(
  ref_page
 ,ref_sesn
 ,seqnc
)
as
  select ref_page
        ,ref_sesn
        ,seqnc
    from afw_13_expor_page;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_FORMT_RESRC;

create or replace force view apexframework.vd_i_afw_13_formt_resrc
(
  seqnc
 ,code
 ,ref_prodt
 ,descr
 ,ref_type_fichr
 ,largr
 ,hautr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,ref_prodt
        ,descr
        ,ref_type_fichr
        ,largr
        ,hautr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom
        ,dnr_ref_prodt
    from afw_13_formt_resrc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_INSTA_PREFR;

create or replace force view apexframework.vd_i_afw_13_insta_prefr
(
  seqnc
 ,ref_prefr
 ,ref_utils
 ,ref_sesn
 ,valr
 ,ref_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prefr
        ,ref_utils
        ,ref_sesn
        ,valr
        ,ref_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_13_insta_prefr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_INSTA_REGN_PILTB;

create or replace force view apexframework.vd_i_afw_13_insta_regn_piltb
(
  seqnc
 ,ref_utils
 ,ref_regn_piltb
 ,indic_regn_activ
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_regn_piltb
        ,indic_regn_activ
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_13_insta_regn_piltb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_ITEM_MENU;

create or replace force view apexframework.vd_i_afw_13_item_menu
(
  seqnc
 ,code
 ,nom
 ,descr
 ,forml_libl
 ,aide_insta
 ,titre_aide_insta
 ,ordre_presn
 ,ref_page
 ,icone
 ,efacr_cache
 ,ref_menu
 ,ref_dv_valr_reqst
 ,forml_valr_reqst
 ,indic_reint_pagnt
 ,indic_reint_page_ir
 ,indic_clear_page_ir
 ,ref_dv_valr_scpc
 ,forml_valr_scpc
 ,ref_dv_valr_sspc
 ,forml_valr_sspc
 ,ref_dv_valr_sapc
 ,forml_valr_sapc
 ,ref_dv_valr_scpi
 ,forml_valr_scpi
 ,ref_dv_valr_sspi
 ,forml_valr_sspi
 ,ref_dv_valr_sapi
 ,forml_valr_sapi
 ,ref_dv_valr_snpi
 ,forml_valr_snpi
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_soums_page
 ,indic_reint_navgt
 ,ref_item_menu
 ,dnr_ref_prodt
 ,ref_struc_aplic
 ,liste_ref_page_activ
 ,ref_resrc
 ,ref_ocurn_resrc
 ,ref_formt_resrc
 ,ref_dv_valr_insta_libl
 ,ref_dv_valr_url
 ,forml_valr_url
 ,indic_gerer_sidf
 ,ref_aplic
 ,ref_dv_valr_insta_condt_afich
 ,forml_condt_afich
 ,lien_id_html
 ,lien_class_css_html
 ,lien_atrib_html
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,forml_libl
        ,aide_insta
        ,titre_aide_insta
        ,ordre_presn
        ,ref_page
        ,icone
        ,efacr_cache
        ,ref_menu
        ,ref_dv_valr_reqst
        ,forml_valr_reqst
        ,indic_reint_pagnt
        ,indic_reint_page_ir
        ,indic_clear_page_ir
        ,ref_dv_valr_scpc
        ,forml_valr_scpc
        ,ref_dv_valr_sspc
        ,forml_valr_sspc
        ,ref_dv_valr_sapc
        ,forml_valr_sapc
        ,ref_dv_valr_scpi
        ,forml_valr_scpi
        ,ref_dv_valr_sspi
        ,forml_valr_sspi
        ,ref_dv_valr_sapi
        ,forml_valr_sapi
        ,ref_dv_valr_snpi
        ,forml_valr_snpi
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_soums_page
        ,indic_reint_navgt
        ,ref_item_menu
        ,dnr_ref_prodt
        ,ref_struc_aplic
        ,liste_ref_page_activ
        ,ref_resrc
        ,ref_ocurn_resrc
        ,ref_formt_resrc
        ,ref_dv_valr_insta_libl
        ,ref_dv_valr_url
        ,forml_valr_url
        ,indic_gerer_sidf
        ,ref_aplic
        ,ref_dv_valr_insta_condt_afich
        ,forml_condt_afich
        ,lien_id_html
        ,lien_class_css_html
        ,lien_atrib_html
    from afw_13_item_menu;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_LIEN_CONDT_PILTB;

create or replace force view apexframework.vd_i_afw_13_lien_condt_piltb
(
  seqnc
 ,ref_page_item
 ,ref_condt_piltb
 ,indic_lectr_seul
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_afich
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page_item
        ,ref_condt_piltb
        ,indic_lectr_seul
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_afich
        ,dnr_ref_aplic
    from afw_13_lien_condt_piltb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_LISTE_NAVGT;

create or replace force view apexframework.vd_i_afw_13_liste_navgt
(
  seqnc
 ,ref_page
 ,libl
 ,page
 ,sspc
 ,sapc
 ,sspi
 ,sapi
 ,scpi
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ordre_presn
 ,code
 ,indic_reint_sidf
 ,aplic
 ,dnr_ref_aplic
 ,css_icone_boots
 ,ref_domn
)
as
  select seqnc
        ,ref_page
        ,libl
        ,page
        ,sspc
        ,sapc
        ,sspi
        ,sapi
        ,scpi
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ordre_presn
        ,code
        ,indic_reint_sidf
        ,aplic
        ,dnr_ref_aplic
        ,css_icone_boots
        ,ref_domn
    from afw_13_liste_navgt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_MENU;

create or replace force view apexframework.vd_i_afw_13_menu
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_13_menu;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_MIME_TYPE;

create or replace force view apexframework.vd_i_afw_13_mime_type
(
  seqnc
 ,ref_type_fichr
 ,ext
 ,mime_type
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ordre_choix
)
as
  select seqnc
        ,ref_type_fichr
        ,ext
        ,mime_type
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ordre_choix
    from afw_13_mime_type;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_NAVGT;

create or replace force view apexframework.vd_i_afw_13_navgt
(
  seqnc
 ,ref_id_sesn
 ,ref_fil_arian
 ,indic_extra_total
 ,tail_tabl_extra
 ,nombr_rang_extra
 ,enonc_sql
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_extra_termn
 ,apex_repts_id
 ,ref_raprt_inter
)
as
  select seqnc
        ,ref_id_sesn
        ,ref_fil_arian
        ,indic_extra_total
        ,tail_tabl_extra
        ,nombr_rang_extra
        ,enonc_sql
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_extra_termn
        ,apex_repts_id
        ,ref_raprt_inter
    from afw_13_navgt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_NAVGT_ELEMN;

create or replace force view apexframework.vd_i_afw_13_navgt_elemn
(
  seqnc
 ,numr_elemn
 ,indic_courn
 ,seqnc_elemn
 ,ref_navgt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,numr_elemn
        ,indic_courn
        ,seqnc_elemn
        ,ref_navgt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_13_navgt_elemn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_OCURN_RESRC;

create or replace force view apexframework.vd_i_afw_13_ocurn_resrc
(
  seqnc
 ,ref_resrc
 ,ref_formt_resrc
 ,ref_mime_type
 ,nom_physq
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,cordn_x_debut
 ,cordn_y_debut
 ,largr_prepn
 ,hautr_prepn
 ,nom
 ,ref_dosr_virtl
 ,ref_versn
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_resrc
        ,ref_formt_resrc
        ,ref_mime_type
        ,nom_physq
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,cordn_x_debut
        ,cordn_y_debut
        ,largr_prepn
        ,hautr_prepn
        ,nom
        ,ref_dosr_virtl
        ,ref_versn
        ,dnr_ref_prodt
    from afw_13_ocurn_resrc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_OPERT;

create or replace force view apexframework.vd_i_afw_13_opert
(
  seqnc
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,code
 ,dnr_ref_prodt
 ,ref_fonct
)
as
  select seqnc
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,code
        ,dnr_ref_prodt
        ,ref_fonct
    from afw_13_opert;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_OPERT_OPTIO;

create or replace force view apexframework.vd_i_afw_13_opert_optio
(
  seqnc
 ,ref_opert
 ,code
 ,nom
 ,descr
 ,dnr_ref_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,prepn
)
as
  select seqnc
        ,ref_opert
        ,code
        ,nom
        ,descr
        ,dnr_ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,prepn
    from afw_13_opert_optio;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_PAGE;

create or replace force view apexframework.vd_i_afw_13_page
(
  seqnc
 ,numr_apex
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,indic_prise_charg_afw01
 ,indic_prise_charg_afw04
 ,ref_mesg_suprs_specf
 ,indic_prise_charg_afw19
 ,indic_prise_charg_afw13_navgt
 ,indic_prise_charg_afw18
 ,ref_page_rechr
 ,indic_prise_charg_afw14_popup
 ,indic_prise_charg_afw13_confr
 ,prefx_mesg
 ,date_dernr_maj_refrn_apex
 ,ref_mesg_sucs_specf
 ,ref_mesg_echec_specf
 ,ref_mesg_fetch_specf
 ,ref_mesg_range_suprm_specf
 ,ref_mesg_range_modf_specf
 ,ref_mesg_range_inser_specf
 ,ref_mesg_aucun_don_trouv
 ,ref_mesg_trop_don_trouv
 ,ref_aplic
 ,dnr_ref_aplic
)
as
  select seqnc
        ,numr_apex
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_struc_aplic
        ,indic_prise_charg_afw01
        ,indic_prise_charg_afw04
        ,ref_mesg_suprs_specf
        ,indic_prise_charg_afw19
        ,indic_prise_charg_afw13_navgt
        ,indic_prise_charg_afw18
        ,ref_page_rechr
        ,indic_prise_charg_afw14_popup
        ,indic_prise_charg_afw13_confr
        ,prefx_mesg
        ,date_dernr_maj_refrn_apex
        ,ref_mesg_sucs_specf
        ,ref_mesg_echec_specf
        ,ref_mesg_fetch_specf
        ,ref_mesg_range_suprm_specf
        ,ref_mesg_range_modf_specf
        ,ref_mesg_range_inser_specf
        ,ref_mesg_aucun_don_trouv
        ,ref_mesg_trop_don_trouv
        ,ref_aplic
        ,dnr_ref_aplic
    from afw_13_page;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_PAGE_IR;

create or replace force view apexframework.vd_i_afw_13_page_ir
(
  seqnc
 ,libl_regn
 ,id_apex
 ,ref_page
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,largr_deft
 ,unite_mesr_largr_deft
 ,code
 ,dnr_ref_aplic
 ,indic_forcr_ajust_page
 ,nombr_page_largr
)
as
  select seqnc
        ,libl_regn
        ,id_apex
        ,ref_page
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,largr_deft
        ,unite_mesr_largr_deft
        ,code
        ,dnr_ref_aplic
        ,indic_forcr_ajust_page
        ,nombr_page_largr
    from afw_13_page_ir;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_PAGE_IR_COLN;

create or replace force view apexframework.vd_i_afw_13_page_ir_coln
(
  seqnc
 ,ordre_afich
 ,libl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coln_table
 ,ref_page_ir
 ,id_apex
 ,largr
 ,type_largr
 ,indic_exprt
 ,ref_mesg_aide
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ordre_afich
        ,libl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coln_table
        ,ref_page_ir
        ,id_apex
        ,largr
        ,type_largr
        ,indic_exprt
        ,ref_mesg_aide
        ,dnr_ref_aplic
    from afw_13_page_ir_coln;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_PAGE_ITEM;

create or replace force view apexframework.vd_i_afw_13_page_item
(
  seqnc
 ,ref_page
 ,id_apex
 ,nom_apex
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,libl
 ,indic_creat
 ,indic_modfc
 ,indic_suprs
 ,indic_en_creat
 ,indic_en_modfc
 ,type_item
 ,ref_opert
 ,ref_mesg_aide
 ,depsm_alias_coln
 ,indic_rechr
 ,indic_confr_sauvg
 ,icone_bulle_aide
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page
        ,id_apex
        ,nom_apex
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,libl
        ,indic_creat
        ,indic_modfc
        ,indic_suprs
        ,indic_en_creat
        ,indic_en_modfc
        ,type_item
        ,ref_opert
        ,ref_mesg_aide
        ,depsm_alias_coln
        ,indic_rechr
        ,indic_confr_sauvg
        ,icone_bulle_aide
        ,dnr_ref_aplic
    from afw_13_page_item;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_PAGE_ITEM_LANG;

create or replace force view apexframework.vd_i_afw_13_page_item_lang
(
  seqnc
 ,ref_page_item
 ,nom
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page_item
        ,nom
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_page_item_lang;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_PAGE_LANG;

create or replace force view apexframework.vd_i_afw_13_page_lang
(
  seqnc
 ,ref_page
 ,nom
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page
        ,nom
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_page_lang;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_PAGE_PREFR_NAVGT;

create or replace force view apexframework.vd_i_afw_13_page_prefr_navgt
(
  seqnc
 ,ref_page
 ,ref_page_ir
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_page
        ,ref_page_ir
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_page_prefr_navgt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_PREFR;

create or replace force view apexframework.vd_i_afw_13_prefr
(
  seqnc
 ,code
 ,ref_dv_condt_utils
 ,forml_condt_utils
 ,ref_dv_condt_sauvg
 ,forml_condt_sauvg
 ,ref_dv_type_insta
 ,indic_contx
 ,ref_dv_valr_insta
 ,forml_valr_insta
 ,descr_comnt
 ,ref_item
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,code
        ,ref_dv_condt_utils
        ,forml_condt_utils
        ,ref_dv_condt_sauvg
        ,forml_condt_sauvg
        ,ref_dv_type_insta
        ,indic_contx
        ,ref_dv_valr_insta
        ,forml_valr_insta
        ,descr_comnt
        ,ref_item
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_prefr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_REGN_PILTB;

create or replace force view apexframework.vd_i_afw_13_regn_piltb
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_page
 ,ref_dv_type_regn_piltb
 ,dnr_ref_aplic
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_page
        ,ref_dv_type_regn_piltb
        ,dnr_ref_aplic
    from afw_13_regn_piltb;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_REGN_PILTB_LANG;

create or replace force view apexframework.vd_i_afw_13_regn_piltb_lang
(
  seqnc
 ,ref_regn_piltb
 ,contn
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ref_regn_piltb
        ,contn
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_regn_piltb_lang;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_RESRC;

create or replace force view apexframework.vd_i_afw_13_resrc
(
  seqnc
 ,code
 ,ref_prodt
 ,descr
 ,ref_type_fichr
 ,ref_struc_aplic
 ,indic_stock_meme_reprt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_resrc
 ,nom
 ,nom_physq_comps
 ,indic_publc
 ,empla_html
 ,ref_plugn
 ,ref_dosr_virtl
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,ref_prodt
        ,descr
        ,ref_type_fichr
        ,ref_struc_aplic
        ,indic_stock_meme_reprt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_resrc
        ,nom
        ,nom_physq_comps
        ,indic_publc
        ,empla_html
        ,ref_plugn
        ,ref_dosr_virtl
        ,dnr_ref_prodt
    from afw_13_resrc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_TUTRL;

create or replace force view apexframework.vd_i_afw_13_tutrl
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_page
 ,indic_premr_charg
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_aplic
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_page
        ,indic_premr_charg
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_aplic
    from afw_13_tutrl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_13_TYPE_FICHR;

create or replace force view apexframework.vd_i_afw_13_type_fichr
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom_icon
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom_icon
    from afw_13_type_fichr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_14_DETL_DOMN_VALR;

create or replace force view apexframework.vd_i_afw_14_detl_domn_valr
(
  seqnc
 ,code_valr
 ,valr
 ,ref_domn_valr
 ,seqnc_presn
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,valr_court
 ,valr_organ
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code_valr
        ,valr
        ,ref_domn_valr
        ,seqnc_presn
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,valr_court
        ,valr_organ
        ,dnr_ref_prodt
    from afw_14_detl_domn_valr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_14_DOMN_VALR;

create or replace force view apexframework.vd_i_afw_14_domn_valr
(
  seqnc
 ,code
 ,nom
 ,descr
 ,enonc_sourc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_don
 ,ref_formt
 ,ref_prodt
 ,ref_type_domn_valr
 ,indic_systm
 ,dnr_ref_prodt
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,enonc_sourc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
        ,ref_formt
        ,ref_prodt
        ,ref_type_domn_valr
        ,indic_systm
        ,dnr_ref_prodt
        ,ref_domn
    from afw_14_domn_valr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_14_FORMT;

create or replace force view apexframework.vd_i_afw_14_formt
(
  seqnc
 ,libl
 ,defnt
 ,type_don
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_formt_orcl
 ,indic_unite_inclu
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,libl
        ,defnt
        ,type_don
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_formt_orcl
        ,indic_unite_inclu
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_14_formt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_14_TYPE_DOMN_VALR;

create or replace force view apexframework.vd_i_afw_14_type_domn_valr
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_14_type_domn_valr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_COMPT_AXIAT;

create or replace force view apexframework.vd_i_afw_17_compt_axiat
(
  seqnc
 ,code
 ,nom
 ,descr
 ,numr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_profl_courl
 ,ref_publc_page_garde
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,numr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        ,ref_profl_courl
        ,ref_publc_page_garde
    from afw_17_compt_axiat;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_COMPT_TWILI;

create or replace force view apexframework.vd_i_afw_17_compt_twili
(
  seqnc
 ,code
 ,nom
 ,descr
 ,acoun_id
 ,authe_token
 ,reprt_walt
 ,mot_passe_walt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,numr
 ,indic_partg
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,acoun_id
        ,authe_token
        ,reprt_walt
        ,mot_passe_walt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,numr
        ,indic_partg
        ,ref_domn
    from afw_17_compt_twili;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_COURL;

create or replace force view apexframework.vd_i_afw_17_courl
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,servr
 ,port
 ,domn
 ,nom_envoy
 ,adres_envoy
 ,sujet
 ,indic_formt_html
 ,authe_methd
 ,authe_usagr
 ,authe_mdp
 ,corps
 ,nombr_tentv
 ,nombr_tentv_max
 ,sens
 ,stat_soums
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,servr
        ,port
        ,domn
        ,nom_envoy
        ,adres_envoy
        ,sujet
        ,indic_formt_html
        ,authe_methd
        ,authe_usagr
        ,authe_mdp
        ,corps
        ,nombr_tentv
        ,nombr_tentv_max
        ,sens
        ,stat_soums
    from afw_17_courl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_COURL_DESTN;

create or replace force view apexframework.vd_i_afw_17_courl_destn
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_fil_atent
 ,nom
 ,adres
 ,type
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_fil_atent
        ,nom
        ,adres
        ,type
    from afw_17_courl_destn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_COURL_PIECE_JOINT;

create or replace force view apexframework.vd_i_afw_17_courl_piece_joint
(
  seqnc
 ,ref_courl
 ,mime_type
 ,contn
 ,tail
 ,nom_fichr
 ,mode_atach
)
as
  select seqnc
        ,ref_courl
        ,mime_type
        ,contn
        ,tail
        ,nom_fichr
        ,mode_atach
    from afw_17_courl_piece_joint;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_PIECE_TELCP_AXIAT;

create or replace force view apexframework.vd_i_afw_17_piece_telcp_axiat
(
  seqnc
 ,ref_telcp_axiat
 ,nombr_page
 ,ordre_atach
 ,contn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,mime_type
 ,nom_fichr
)
as
  select seqnc
        ,ref_telcp_axiat
        ,nombr_page
        ,ordre_atach
        ,contn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,mime_type
        ,nom_fichr
    from afw_17_piece_telcp_axiat;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_PROFL_COURL;

create or replace force view apexframework.vd_i_afw_17_profl_courl
(
  seqnc
 ,servr_sortn
 ,port_sortn
 ,domn
 ,nom_envoy
 ,adres_envoy
 ,authe_methd_sortn
 ,authe_usagr_sortn
 ,authe_mdp_sortn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,code
 ,ref_domn
 ,nom
 ,descr
 ,indic_ssl_sortn
 ,servr_entra
 ,port_entra
 ,indic_ssl_entra
 ,authe_methd_entra
 ,authe_usagr_entra
 ,authe_mdp_entra
 ,protc_entra
 ,adres_suprt
 ,nom_suprt
 ,indic_ajout_suprt_cci
)
as
  select seqnc
        ,servr_sortn
        ,port_sortn
        ,domn
        ,nom_envoy
        ,adres_envoy
        ,authe_methd_sortn
        ,authe_usagr_sortn
        ,authe_mdp_sortn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,code
        ,ref_domn
        ,nom
        ,descr
        ,indic_ssl_sortn
        ,servr_entra
        ,port_entra
        ,indic_ssl_entra
        ,authe_methd_entra
        ,authe_usagr_entra
        ,authe_mdp_entra
        ,protc_entra
        ,adres_suprt
        ,nom_suprt
        ,indic_ajout_suprt_cci
    from afw_17_profl_courl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_SMS_TWILI;

create or replace force view apexframework.vd_i_afw_17_sms_twili
(
  seqnc
 ,numr_de
 ,numr_a
 ,mesg
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,tw_sid
 ,tw_status
 ,tw_price
 ,tw_uri
 ,stat_soums
 ,date_envoi_difr
 ,ref_compt_twili
 ,numr_mesg
 ,nombr_mesg_totl
 ,ref_mesg_precd
 ,id_sesn
 ,group_sms
 ,repns_servr
 ,sens
)
as
  select seqnc
        ,numr_de
        ,numr_a
        ,mesg
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,tw_sid
        ,tw_status
        ,tw_price
        ,tw_uri
        ,stat_soums
        ,date_envoi_difr
        ,ref_compt_twili
        ,numr_mesg
        ,nombr_mesg_totl
        ,ref_mesg_precd
        ,id_sesn
        ,group_sms
        ,repns_servr
        ,sens
    from afw_17_sms_twili;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_SMS_TWILI_ENTRA;

create or replace force view apexframework.vd_i_afw_17_sms_twili_entra
(
  seqnc
 ,tw_recpt_accountsid
 ,tw_recpt_apiversion
 ,tw_recpt_body
 ,tw_recpt_from
 ,tw_recpt_fromcity
 ,tw_recpt_fromcountry
 ,tw_recpt_fromstate
 ,tw_recpt_fromzip
 ,tw_recpt_smsmessagesid
 ,tw_recpt_smssid
 ,tw_recpt_smsstatus
 ,tw_recpt_to
 ,tw_recpt_tocity
 ,tw_recpt_tocountry
 ,tw_recpt_tostate
 ,tw_recpt_tozip
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,tw_recpt_accountsid
        ,tw_recpt_apiversion
        ,tw_recpt_body
        ,tw_recpt_from
        ,tw_recpt_fromcity
        ,tw_recpt_fromcountry
        ,tw_recpt_fromstate
        ,tw_recpt_fromzip
        ,tw_recpt_smsmessagesid
        ,tw_recpt_smssid
        ,tw_recpt_smsstatus
        ,tw_recpt_to
        ,tw_recpt_tocity
        ,tw_recpt_tocountry
        ,tw_recpt_tostate
        ,tw_recpt_tozip
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_17_sms_twili_entra;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_17_TELCP_AXIAT;

create or replace force view apexframework.vd_i_afw_17_telcp_axiat
(
  seqnc
 ,ref_compt_axiat
 ,destn_formt
 ,numr_destn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,stat_soums
 ,date_envoi_difr
 ,objet
 ,sens
)
as
  select seqnc
        ,ref_compt_axiat
        ,destn_formt
        ,numr_destn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,stat_soums
        ,date_envoi_difr
        ,objet
        ,sens
    from afw_17_telcp_axiat;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_19_BOUTN;

create or replace force view apexframework.vd_i_afw_19_boutn
(
  seqnc
 ,ref_lang
 ,ref_dispn_fonct
 ,item_subst
 ,id_templ_boutn
 ,templ_boutn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,libl
 ,indic_actif
 ,ref_dv_type_mesg_aide_contx
 ,mesg_aide_contx
)
as
  select seqnc
        ,ref_lang
        ,ref_dispn_fonct
        ,item_subst
        ,id_templ_boutn
        ,templ_boutn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,libl
        ,indic_actif
        ,ref_dv_type_mesg_aide_contx
        ,mesg_aide_contx
    from afw_19_boutn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_19_CLE;

create or replace force view apexframework.vd_i_afw_19_cle
(
  seqnc
 ,ref_lang
 ,indic_shift
 ,indic_alt
 ,indic_ctrl
 ,indic_inter
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,code_keypr
 ,code_keydw
 ,ref_dispn_fonct
 ,indic_actif
)
as
  select seqnc
        ,ref_lang
        ,indic_shift
        ,indic_alt
        ,indic_ctrl
        ,indic_inter
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,code_keypr
        ,code_keydw
        ,ref_dispn_fonct
        ,indic_actif
    from afw_19_cle;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_19_DISPN_FONCT;

create or replace force view apexframework.vd_i_afw_19_dispn_fonct
(
  seqnc
 ,ref_prodt
 ,ref_fonct
 ,valr_atrib_1
 ,valr_atrib_2
 ,valr_atrib_3
 ,valr_atrib_4
 ,valr_atrib_5
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,ref_fonct
        ,valr_atrib_1
        ,valr_atrib_2
        ,valr_atrib_3
        ,valr_atrib_4
        ,valr_atrib_5
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_19_dispn_fonct;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_19_FONCT;

create or replace force view apexframework.vd_i_afw_19_fonct
(
  seqnc
 ,code
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,titre_atrib1
 ,ref_dv_type_atrib1
 ,valr_deft_atrib1
 ,titre_atrib2
 ,titre_atrib3
 ,titre_atrib4
 ,titre_atrib5
 ,ref_dv_type_atrib2
 ,ref_dv_type_atrib3
 ,ref_dv_type_atrib4
 ,ref_dv_type_atrib5
 ,valr_deft_atrib2
 ,valr_deft_atrib3
 ,valr_deft_atrib4
 ,valr_deft_atrib5
 ,ref_dv_type_actio
 ,expre_actio
 ,ref_dv_type_expre
 ,indic_afect_input_html
 ,indic_prevn_actio_deft
 ,indic_cle
 ,indic_boutn
 ,condt_prise_charg
)
as
  select seqnc
        ,code
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,titre_atrib1
        ,ref_dv_type_atrib1
        ,valr_deft_atrib1
        ,titre_atrib2
        ,titre_atrib3
        ,titre_atrib4
        ,titre_atrib5
        ,ref_dv_type_atrib2
        ,ref_dv_type_atrib3
        ,ref_dv_type_atrib4
        ,ref_dv_type_atrib5
        ,valr_deft_atrib2
        ,valr_deft_atrib3
        ,valr_deft_atrib4
        ,valr_deft_atrib5
        ,ref_dv_type_actio
        ,expre_actio
        ,ref_dv_type_expre
        ,indic_afect_input_html
        ,indic_prevn_actio_deft
        ,indic_cle
        ,indic_boutn
        ,condt_prise_charg
    from afw_19_fonct;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_19_FONCT_LANG;

create or replace force view apexframework.vd_i_afw_19_fonct_lang
(
  seqnc
 ,nom
 ,ref_lang
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_fonct
)
as
  select seqnc
        ,nom
        ,ref_lang
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_fonct
    from afw_19_fonct_lang;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_19_SPECF_FONCT;

create or replace force view apexframework.vd_i_afw_19_specf_fonct
(
  seqnc
 ,ref_dispn_fonct
 ,ref_item
 ,ref_page
 ,ref_dv_type_subst
 ,valr_atrib_1
 ,valr_atrib_2
 ,valr_atrib_3
 ,valr_atrib_4
 ,valr_atrib_5
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_page
)
as
  select seqnc
        ,ref_dispn_fonct
        ,ref_item
        ,ref_page
        ,ref_dv_type_subst
        ,valr_atrib_1
        ,valr_atrib_2
        ,valr_atrib_3
        ,valr_atrib_4
        ,valr_atrib_5
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_page
    from afw_19_specf_fonct;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_20_DEPLM;

create or replace force view apexframework.vd_i_afw_20_deplm
(
  seqnc
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_modl
 ,ref_modl_parmt
 ,ref_prodt_lang
)
as
  select seqnc
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_modl
        ,ref_modl_parmt
        ,ref_prodt_lang
    from afw_20_deplm;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_20_DETL_DOCMN;

create or replace force view apexframework.vd_i_afw_20_detl_docmn
(
  seqnc
 ,ref_docmn
 ,ref_sectn_docmn
 ,ref_detl_docmn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,valr
)
as
  select seqnc
        ,ref_docmn
        ,ref_sectn_docmn
        ,ref_detl_docmn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,valr
    from afw_20_detl_docmn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_20_DOCMN;

create or replace force view apexframework.vd_i_afw_20_docmn
(
  seqnc
 ,ref_prodt_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,ref_seqnc_struc_aplic
)
as
  select seqnc
        ,ref_prodt_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_struc_aplic
        ,ref_seqnc_struc_aplic
    from afw_20_docmn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_20_MODL;

create or replace force view apexframework.vd_i_afw_20_modl
(
  seqnc
 ,ref_versn
 ,ref_modl
 ,nom_organ
 ,numr_surch
 ,indic_agreg
 ,indic_pipln
 ,indic_detrm
 ,indic_authid_curnt_utils
 ,indic_publc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,versn_bd_aplic
 ,ref_dv_type_modl
)
as
  select seqnc
        ,ref_versn
        ,ref_modl
        ,nom_organ
        ,numr_surch
        ,indic_agreg
        ,indic_pipln
        ,indic_detrm
        ,indic_authid_curnt_utils
        ,indic_publc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,versn_bd_aplic
        ,ref_dv_type_modl
    from afw_20_modl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_20_MODL_EXCEP;

create or replace force view apexframework.vd_i_afw_20_modl_excep
(
  seqnc
 ,ref_modl
 ,nom_organ
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_modl
        ,nom_organ
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_20_modl_excep;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_20_MODL_PARMT;

create or replace force view apexframework.vd_i_afw_20_modl_parmt
(
  seqnc
 ,ref_modl
 ,nom_organ
 ,postn
 ,valr_deft
 ,sens
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_publc
 ,indic_retr
 ,ref_dv_type_don
)
as
  select seqnc
        ,ref_modl
        ,nom_organ
        ,postn
        ,valr_deft
        ,sens
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_publc
        ,indic_retr
        ,ref_dv_type_don
    from afw_20_modl_parmt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_20_SECTN_DOCMN;

create or replace force view apexframework.vd_i_afw_20_sectn_docmn
(
  seqnc
 ,ref_dv_type_sectn
 ,ref_sectn_docmn
 ,ref_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom
 ,titre
 ,descr
 ,ref_formt
)
as
  select seqnc
        ,ref_dv_type_sectn
        ,ref_sectn_docmn
        ,ref_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom
        ,titre
        ,descr
        ,ref_formt
    from afw_20_sectn_docmn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_21_PLUGN_ARBRE;

create or replace force view apexframework.vd_i_afw_21_plugn_arbre
(
  seqnc
 ,enonc_pre_reqt
 ,nom_table
 ,coln_titre
 ,coln_type
 ,coln_valr
 ,coln_aide_insta
 ,coln_lien
 ,coln_id
 ,coln_id_parnt
 ,enonc_condt
 ,enonc_condt_comnc_par
 ,enonc_trier_par
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_renmr
 ,indic_deplc
 ,coln_titre_aide_insta
 ,largr_regn_arbre
 ,hautr_regn_arbre
 ,ref_plugn_arbre_noeud
 ,indic_comnc_par_racn
 ,image_sprit
 ,type_icone_noeud
 ,ref_formt_resrc
 ,ref_resrc_comps
 ,obten_json_arbre_nombr_niv
 ,obten_json_noeud_nombr_niv
 ,code
 ,mode_cache
 ,dnr_ref_prodt
 ,indic_charg_progr
 ,indic_flech_aide_insta
 ,ref_dv_cursr_aide_insta
 ,nom_procd_glisr_elemn_arbre
 ,nom_procd_depsr_elemn_arbre
 ,indic_comnc_par_coln_parnt_nul
 ,ref_prodt
)
as
  select seqnc
        ,enonc_pre_reqt
        ,nom_table
        ,coln_titre
        ,coln_type
        ,coln_valr
        ,coln_aide_insta
        ,coln_lien
        ,coln_id
        ,coln_id_parnt
        ,enonc_condt
        ,enonc_condt_comnc_par
        ,enonc_trier_par
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_renmr
        ,indic_deplc
        ,coln_titre_aide_insta
        ,largr_regn_arbre
        ,hautr_regn_arbre
        ,ref_plugn_arbre_noeud
        ,indic_comnc_par_racn
        ,image_sprit
        ,type_icone_noeud
        ,ref_formt_resrc
        ,ref_resrc_comps
        ,obten_json_arbre_nombr_niv
        ,obten_json_noeud_nombr_niv
        ,code
        ,mode_cache
        ,dnr_ref_prodt
        ,indic_charg_progr
        ,indic_flech_aide_insta
        ,ref_dv_cursr_aide_insta
        ,nom_procd_glisr_elemn_arbre
        ,nom_procd_depsr_elemn_arbre
        ,indic_comnc_par_coln_parnt_nul
        ,ref_prodt
    from afw_21_plugn_arbre;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_21_PLUGN_ARBRE_NOEUD;

create or replace force view apexframework.vd_i_afw_21_plugn_arbre_noeud
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_plugn_arbre
 ,indic_selct_noeud
 ,indic_ouvri_noeud
 ,indic_creer_noeud
 ,indic_suprm_noeud
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_fermr_noeud
 ,ref_resrc
 ,ref_ocurn_resrc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_plugn_arbre
        ,indic_selct_noeud
        ,indic_ouvri_noeud
        ,indic_creer_noeud
        ,indic_suprm_noeud
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_fermr_noeud
        ,ref_resrc
        ,ref_ocurn_resrc
        ,dnr_ref_prodt
    from afw_21_plugn_arbre_noeud;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_21_PLUGN_CALND;

create or replace force view apexframework.vd_i_afw_21_plugn_calnd
(
  seqnc
 ,enonc_pre_reqt
 ,ref_dv_vue_deft
 ,conct_propr_entet_gauch
 ,conct_propr_entet_centr
 ,conct_propr_entet_droit
 ,indic_evenm_modfb
 ,nom_table
 ,coln_titre
 ,coln_descr
 ,coln_type
 ,coln_aide_insta
 ,coln_lien
 ,coln_indic_journ_compl
 ,coln_date_debut
 ,coln_date_fin
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,largr_regn_calnd
 ,coln_titre_aide_insta
 ,indic_agend
 ,agend_nom_table
 ,agend_coln_titre
 ,coln_valr
 ,agend_coln_valr
 ,agend_coln_coulr
 ,code
 ,dnr_ref_prodt
 ,coln_agend
 ,coln_ident
 ,coln_date_journ_compl
 ,coln_date_fin_journ_compl
 ,nombr_mints_inter
 ,heure_debut_norml
 ,heure_fin_norml
 ,heure_debut_exten
 ,heure_fin_exten
 ,coln_indic_evenm_modfb
 ,ref_prodt
)
as
  select seqnc
        ,enonc_pre_reqt
        ,ref_dv_vue_deft
        ,conct_propr_entet_gauch
        ,conct_propr_entet_centr
        ,conct_propr_entet_droit
        ,indic_evenm_modfb
        ,nom_table
        ,coln_titre
        ,coln_descr
        ,coln_type
        ,coln_aide_insta
        ,coln_lien
        ,coln_indic_journ_compl
        ,coln_date_debut
        ,coln_date_fin
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,largr_regn_calnd
        ,coln_titre_aide_insta
        ,indic_agend
        ,agend_nom_table
        ,agend_coln_titre
        ,coln_valr
        ,agend_coln_valr
        ,agend_coln_coulr
        ,code
        ,dnr_ref_prodt
        ,coln_agend
        ,coln_ident
        ,coln_date_journ_compl
        ,coln_date_fin_journ_compl
        ,nombr_mints_inter
        ,heure_debut_norml
        ,heure_fin_norml
        ,heure_debut_exten
        ,heure_fin_exten
        ,coln_indic_evenm_modfb
        ,ref_prodt
    from afw_21_plugn_calnd;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_21_PLUGN_CALND_COULR;

create or replace force view apexframework.vd_i_afw_21_plugn_calnd_coulr
(
  seqnc
 ,ordre_presn
 ,coulr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coulr_text
)
as
  select seqnc
        ,ordre_presn
        ,coulr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coulr_text
    from afw_21_plugn_calnd_coulr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_21_PLUGN_CALND_TYPE;

create or replace force view apexframework.vd_i_afw_21_plugn_calnd_type
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coulr_texte
 ,coulr_bordr
 ,coulr_arier_plan
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coulr_texte
        ,coulr_bordr
        ,coulr_arier_plan
        ,ref_domn
    from afw_21_plugn_calnd_type;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_21_PLUGN_ITEM_MENU;

create or replace force view apexframework.vd_i_afw_21_plugn_item_menu
(
  seqnc
 ,ref_item_menu
 ,ref_plugn_menu
 ,niv_item
 ,etend_nombr_coln
 ,rang_item
 ,coln_item
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,ref_dv_contn_item_menu
 ,ref_dv_align
)
as
  select seqnc
        ,ref_item_menu
        ,ref_plugn_menu
        ,niv_item
        ,etend_nombr_coln
        ,rang_item
        ,coln_item
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
        ,ref_dv_contn_item_menu
        ,ref_dv_align
    from afw_21_plugn_item_menu;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_21_PLUGN_MENU;

create or replace force view apexframework.vd_i_afw_21_plugn_menu
(
  seqnc
 ,code
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,ref_dv_type_menu
 ,largr_regn_menu
 ,hautr_regn_menu
 ,ref_dv_orien_menu
 ,ref_dv_coulr_theme
 ,ref_dv_coulr_princ
 ,ref_menu
 ,ref_dv_formt_menu
 ,ref_prodt
)
as
  select seqnc
        ,code
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
        ,ref_dv_type_menu
        ,largr_regn_menu
        ,hautr_regn_menu
        ,ref_dv_orien_menu
        ,ref_dv_coulr_theme
        ,ref_dv_coulr_princ
        ,ref_menu
        ,ref_dv_formt_menu
        ,ref_prodt
    from afw_21_plugn_menu;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_23_APLIC_MODL_RECHR;

create or replace force view apexframework.vd_i_afw_23_aplic_modl_rechr
(
  seqnc
 ,ref_modl_rechr
 ,ref_struc_aplic_rechr
 ,ref_struc_aplic_lien
 ,nombr_maxim_reslt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_atrib_struc_aplic_afich
)
as
  select seqnc
        ,ref_modl_rechr
        ,ref_struc_aplic_rechr
        ,ref_struc_aplic_lien
        ,nombr_maxim_reslt
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_atrib_struc_aplic_afich
    from afw_23_aplic_modl_rechr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_23_DETL_APLIC_MODL_RE;

create or replace force view apexframework.vd_i_afw_23_detl_aplic_modl_re
(
  seqnc
 ,ref_aplic_modl_rechr
 ,ref_atrib_struc_aplic
 ,ref_patrn_rechr
 ,ordre_exect
 ,pertn
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_aplic_modl_rechr
        ,ref_atrib_struc_aplic
        ,ref_patrn_rechr
        ,ordre_exect
        ,pertn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_23_detl_aplic_modl_rechr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_23_DETL_RESLT_RECHR;

create or replace force view apexframework.vd_i_afw_23_detl_reslt_rechr
(
  seqnc
 ,ref_rechr
 ,ref_enonc_rechr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_detl_aplic_modl_rechr
 ,dnr_pertn
 ,ref_seqnc_struc_aplic
 ,ref_reslt_rechr
)
as
  select seqnc
        ,ref_rechr
        ,ref_enonc_rechr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_detl_aplic_modl_rechr
        ,dnr_pertn
        ,ref_seqnc_struc_aplic
        ,ref_reslt_rechr
    from afw_23_detl_reslt_rechr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_23_ENONC_RECHR;

create or replace force view apexframework.vd_i_afw_23_enonc_rechr
(
  seqnc
 ,ref_rechr
 ,mot
 ,ordre_apart
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_rechr
        ,mot
        ,ordre_apart
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_23_enonc_rechr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_23_MODL_RECHR;

create or replace force view apexframework.vd_i_afw_23_modl_rechr
(
  seqnc
 ,code
 ,ref_domn
 ,nom
 ,descr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,ref_domn
        ,nom
        ,descr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_23_modl_rechr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_23_PATRN_RECHR;

create or replace force view apexframework.vd_i_afw_23_patrn_rechr
(
  seqnc
 ,code
 ,nom
 ,descr
 ,enonc_plsql_gauch
 ,enonc_plsql_droit
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,opert
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,enonc_plsql_gauch
        ,enonc_plsql_droit
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,opert
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_23_patrn_rechr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_23_RECHR;

create or replace force view apexframework.vd_i_afw_23_rechr
(
  seqnc
 ,ref_utils
 ,date_exect
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_modl_rechr
)
as
  select seqnc
        ,ref_utils
        ,date_exect
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_modl_rechr
    from afw_23_rechr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_23_RESLT_RECHR;

create or replace force view apexframework.vd_i_afw_23_reslt_rechr
(
  seqnc
 ,ref_rechr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_libl_struc_aplic_html
 ,dnr_libl_struc_aplic
 ,dnr_pertn
 ,dnr_lien
 ,dnr_decmp_reslt
 ,ref_aplic_modl_rechr
 ,dnr_ref_struc_aplic
 ,ref_seqnc_struc_aplic
)
as
  select seqnc
        ,ref_rechr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_libl_struc_aplic_html
        ,dnr_libl_struc_aplic
        ,dnr_pertn
        ,dnr_lien
        ,dnr_decmp_reslt
        ,ref_aplic_modl_rechr
        ,dnr_ref_struc_aplic
        ,ref_seqnc_struc_aplic
    from afw_23_reslt_rechr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_CHAMP;

create or replace force view apexframework.vd_i_afw_25_champ
(
  seqnc
 ,code
 ,postn_x
 ,postn_y
 ,angle_orint
 ,ref_formt
 ,ref_versn_publc
 ,ref_dv_type_champ
 ,indic_modif
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,postn_x
        ,postn_y
        ,angle_orint
        ,ref_formt
        ,ref_versn_publc
        ,ref_dv_type_champ
        ,indic_modif
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_25_champ;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_DOMN_TYPE_PUBLC;

create or replace force view apexframework.vd_i_afw_25_domn_type_publc
(
  seqnc
 ,ref_domn
 ,ref_type_publc
 ,ref_publc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_domn
        ,ref_type_publc
        ,ref_publc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_25_domn_type_publc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_ELEMN_CONFG_PUBLC;

create or replace force view apexframework.vd_i_afw_25_elemn_confg_publc
(
  seqnc
 ,ref_type_publc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_don
)
as
  select seqnc
        ,ref_type_publc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
    from afw_25_elemn_confg_publc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_ENGIN;

create or replace force view apexframework.vd_i_afw_25_engin
(
  seqnc
 ,code
 ,ref_dv_formt_sort
 ,url_servl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,url_servl_exter
)
as
  select seqnc
        ,code
        ,ref_dv_formt_sort
        ,url_servl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,url_servl_exter
    from afw_25_engin;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_ENGIN_VERSN_PUBLC;

create or replace force view apexframework.vd_i_afw_25_engin_versn_publc
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_versn_publc
 ,ref_engin
 ,iden_acces
 ,pdf_fusn
 ,html_base
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_versn_publc
        ,ref_engin
        ,iden_acces
        ,pdf_fusn
        ,html_base
    from afw_25_engin_versn_publc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_GROUP_PUBLC;

create or replace force view apexframework.vd_i_afw_25_group_publc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_25_group_publc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_JOURN_TRAVL_EXECT;

create or replace force view apexframework.vd_i_afw_25_journ_travl_exect
(
  seqnc
 ,ref_dv_type_ecrit
 ,ref_travl
 ,ref_publc_travl
 ,date_journ
 ,enonc
)
as
  select seqnc
        ,ref_dv_type_ecrit
        ,ref_travl
        ,ref_publc_travl
        ,date_journ
        ,enonc
    from afw_25_journ_travl_exect;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_OCURN_PARMT_PUBLC;

create or replace force view apexframework.vd_i_afw_25_ocurn_parmt_publc
(
  seqnc
 ,valr_date
 ,valr_numbr
 ,valr_varch
 ,ref_parmt_publc_travl
)
as
  select seqnc
        ,valr_date
        ,valr_numbr
        ,valr_varch
        ,ref_parmt_publc_travl
    from afw_25_ocurn_parmt_publc_travl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_PARMT_PUBLC_TRAVL;

create or replace force view apexframework.vd_i_afw_25_parmt_publc_travl
(
  seqnc
 ,ref_publc_travl
 ,ref_parmt_type_publc
 ,valr_varch
 ,valr_date
 ,valr_numbr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_publc_travl
        ,ref_parmt_type_publc
        ,valr_varch
        ,valr_date
        ,valr_numbr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_25_parmt_publc_travl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_PARMT_TYPE_PUBLC;

create or replace force view apexframework.vd_i_afw_25_parmt_type_publc
(
  seqnc
 ,ref_type_publc
 ,ref_engin
 ,code
 ,nom
 ,descr
 ,indic_presn_appel
 ,indic_fixe
 ,valr_deft
 ,type_valr_deft
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_don
 ,ordre_presn
 ,cardn
)
as
  select seqnc
        ,ref_type_publc
        ,ref_engin
        ,code
        ,nom
        ,descr
        ,indic_presn_appel
        ,indic_fixe
        ,valr_deft
        ,type_valr_deft
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
        ,ordre_presn
        ,cardn
    from afw_25_parmt_type_publc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_PAR_PUB_TRA_EXECT;

create or replace force view apexframework.vd_i_afw_25_par_pub_tra_exect
(
  ref_travl_publc
 ,valr_numbr1
 ,valr_varch1
 ,valr_date1
 ,valr_numbr2
 ,valr_varch2
 ,valr_date2
 ,valr_numbr3
 ,valr_varch3
 ,valr_date3
 ,valr_numbr4
 ,valr_varch4
 ,valr_date4
 ,valr_numbr5
 ,valr_varch5
 ,valr_date5
 ,valr_numbr6
 ,valr_varch6
 ,valr_date6
 ,valr_numbr7
 ,valr_varch7
 ,valr_date7
 ,valr_numbr8
 ,valr_varch8
 ,valr_date8
 ,valr_numbr9
 ,valr_varch9
 ,valr_date9
 ,valr_numbr10
 ,valr_varch10
 ,valr_date10
 ,ref_travl
 ,seqnc
)
as
  select ref_travl_publc
        ,valr_numbr1
        ,valr_varch1
        ,valr_date1
        ,valr_numbr2
        ,valr_varch2
        ,valr_date2
        ,valr_numbr3
        ,valr_varch3
        ,valr_date3
        ,valr_numbr4
        ,valr_varch4
        ,valr_date4
        ,valr_numbr5
        ,valr_varch5
        ,valr_date5
        ,valr_numbr6
        ,valr_varch6
        ,valr_date6
        ,valr_numbr7
        ,valr_varch7
        ,valr_date7
        ,valr_numbr8
        ,valr_varch8
        ,valr_date8
        ,valr_numbr9
        ,valr_varch9
        ,valr_date9
        ,valr_numbr10
        ,valr_varch10
        ,valr_date10
        ,ref_travl
        ,seqnc
    from afw_25_parmt_publc_travl_exect;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_PUBLC;

create or replace force view apexframework.vd_i_afw_25_publc
(
  seqnc
 ,ref_type_publc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_group_publc
)
as
  select seqnc
        ,ref_type_publc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_group_publc
    from afw_25_publc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_PUBLC_TRAVL;

create or replace force view apexframework.vd_i_afw_25_publc_travl
(
  seqnc
 ,ref_travl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_stat
 ,nom
 ,indic_parmt_alimn
 ,ref_versn_publc
 ,ref_publc
 ,reslt_html
)
as
  select seqnc
        ,ref_travl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_stat
        ,nom
        ,indic_parmt_alimn
        ,ref_versn_publc
        ,ref_publc
        ,reslt_html
    from afw_25_publc_travl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_THEME;

create or replace force view apexframework.vd_i_afw_25_theme
(
  seqnc
 ,ref_group_publc
 ,dnr_ref_prodt
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_group_publc
        ,dnr_ref_prodt
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_25_theme;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_THEME_SUBST;

create or replace force view apexframework.vd_i_afw_25_theme_subst
(
  seqnc
 ,ref_theme
 ,dnr_ref_prodt
 ,nom
 ,descr
 ,code_subst
 ,coulr_subst
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_theme
        ,dnr_ref_prodt
        ,nom
        ,descr
        ,code_subst
        ,coulr_subst
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_25_theme_subst;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_TRAVL;

create or replace force view apexframework.vd_i_afw_25_travl
(
  seqnc
 ,ref_utils
 ,indic_imedt
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_stat
 ,ref_type_travl
)
as
  select seqnc
        ,ref_utils
        ,indic_imedt
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        ,ref_stat
        ,ref_type_travl
    from afw_25_travl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_TYPE_PUBLC;

create or replace force view apexframework.vd_i_afw_25_type_publc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_struc_aplic
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_25_type_publc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_TYPE_TRAVL;

create or replace force view apexframework.vd_i_afw_25_type_travl
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
    from afw_25_type_travl;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_VALR_CHAMP;

create or replace force view apexframework.vd_i_afw_25_valr_champ
(
  seqnc
 ,ref_champ
 ,ref_publc_travl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,valr_nombr
 ,valr_date
 ,valr_varch
)
as
  select seqnc
        ,ref_champ
        ,ref_publc_travl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,valr_nombr
        ,valr_date
        ,valr_varch
    from afw_25_valr_champ;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_VALR_ELEMN_CONFG;

create or replace force view apexframework.vd_i_afw_25_valr_elemn_confg
(
  seqnc
 ,ref_elemn_confg_publc
 ,date_debut_efect
 ,date_fin_efect
 ,valr_varch
 ,valr_date
 ,valr_numbr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
)
as
  select seqnc
        ,ref_elemn_confg_publc
        ,date_debut_efect
        ,date_fin_efect
        ,valr_varch
        ,valr_date
        ,valr_numbr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
    from afw_25_valr_elemn_confg;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_VERSN_PUBLC;

create or replace force view apexframework.vd_i_afw_25_versn_publc
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_debut_efect
 ,date_fin_efect
 ,ref_publc
 ,code
 ,nom
 ,descr
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,date_debut_efect
        ,date_fin_efect
        ,ref_publc
        ,code
        ,nom
        ,descr
    from afw_25_versn_publc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_25_VERSN_PUBLC_SUBST;

create or replace force view apexframework.vd_i_afw_25_versn_publc_subst
(
  seqnc
 ,dnr_ref_prodt
 ,ref_versn_publc
 ,ref_versn_publc_subst
 ,nom
 ,code_subst
 ,valr_subst
 ,type_subst
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,dnr_ref_prodt
        ,ref_versn_publc
        ,ref_versn_publc_subst
        ,nom
        ,code_subst
        ,valr_subst
        ,type_subst
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_25_versn_publc_subst;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_29_CONTR;

create or replace force view apexframework.vd_i_afw_29_contr
(
  seqnc
 ,code_contr
 ,nom_struc_acces
 ,nom
 ,descr
 ,niv_gravt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code_contr
        ,nom_struc_acces
        ,nom
        ,descr
        ,niv_gravt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,dnr_ref_prodt
    from afw_29_contr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_29_RESLT_REQUT_AQ;

create or replace force view apexframework.vd_i_afw_29_reslt_requt_aq
(
  ref_contr
 ,id
 ,flow_id
 ,page_id
 ,nom_comps
 ,niv_gravt
 ,natr
)
as
  select ref_contr
        ,id
        ,flow_id
        ,page_id
        ,nom_comps
        ,niv_gravt
        ,natr
    from afw_29_reslt_requt_aq;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_AFECT_ITEM;

create or replace force view apexframework.vd_i_afw_30_afect_item
(
  seqnc
 ,ref_item_carnt_prodt
 ,ref_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_item_carnt_prodt
        ,ref_utils
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_afect_item;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_CARNT_APLIC;

create or replace force view apexframework.vd_i_afw_30_carnt_aplic
(
  seqnc
 ,nom
 ,ref_carnt_prodt
 ,ref_aplic
 ,ref_utils_respn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,docmn_refrc
)
as
  select seqnc
        ,nom
        ,ref_carnt_prodt
        ,ref_aplic
        ,ref_utils_respn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,docmn_refrc
    from afw_30_carnt_aplic;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_CARNT_PRODT;

create or replace force view apexframework.vd_i_afw_30_carnt_prodt
(
  seqnc
 ,ref_prodt
 ,docmn_refrc
 ,ref_utils_respn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,docmn_refrc
        ,ref_utils_respn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_carnt_prodt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_CARNT_SPRIN;

create or replace force view apexframework.vd_i_afw_30_carnt_sprin
(
  seqnc
 ,descr
 ,ref_utils_respn
 ,ref_carnt_prodt
 ,date_debut_prevu
 ,date_fin_prevu
 ,ref_versn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,descr
        ,ref_utils_respn
        ,ref_carnt_prodt
        ,date_debut_prevu
        ,date_fin_prevu
        ,ref_versn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_carnt_sprin;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_CAS_UTILS;

create or replace force view apexframework.vd_i_afw_30_cas_utils
(
  seqnc
 ,code
 ,nom
 ,descr
 ,docmn_refrc
 ,ref_carnt_prodt
 ,ref_stat
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_utils_respn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,docmn_refrc
        ,ref_carnt_prodt
        ,ref_stat
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_utils_respn
    from afw_30_cas_utils;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_EFORT_ITEM;

create or replace force view apexframework.vd_i_afw_30_efort_item
(
  seqnc
 ,ref_item_carnt_sprin
 ,ref_utils
 ,comnt
 ,date_efort
 ,valr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_item_carnt_sprin
        ,ref_utils
        ,comnt
        ,date_efort
        ,valr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_efort_item;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_HISTR_EFORT_RESTN;

create or replace force view apexframework.vd_i_afw_30_histr_efort_restn
(
  seqnc
 ,ref_item_carnt_sprin
 ,date_heure_saisi
 ,efort_restn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_item_carnt_sprin
        ,date_heure_saisi
        ,efort_restn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_histr_efort_restn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_ITEM_CARNT_PRODT;

create or replace force view apexframework.vd_i_afw_30_item_carnt_prodt
(
  seqnc
 ,nom
 ,descr
 ,ref_carnt_prodt
 ,ref_dv_prior
 ,ref_stat
 ,ref_dv_tail_reltv
 ,ref_cas_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,nom
        ,descr
        ,ref_carnt_prodt
        ,ref_dv_prior
        ,ref_stat
        ,ref_dv_tail_reltv
        ,ref_cas_utils
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_item_carnt_prodt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_ITEM_CARNT_SPRIN;

create or replace force view apexframework.vd_i_afw_30_item_carnt_sprin
(
  seqnc
 ,nom
 ,descr
 ,numr_refrc_docmn
 ,ref_item_carnt_prodt
 ,ref_carnt_sprin
 ,efort_prevu
 ,efort_restn
 ,ref_dv_prior
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_afw_30_page
)
as
  select seqnc
        ,nom
        ,descr
        ,numr_refrc_docmn
        ,ref_item_carnt_prodt
        ,ref_carnt_sprin
        ,efort_prevu
        ,efort_restn
        ,ref_dv_prior
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_afw_30_page
    from afw_30_item_carnt_sprin;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_PAGE;

create or replace force view apexframework.vd_i_afw_30_page
(
  seqnc
 ,ref_afw_13_page
 ,nom
 ,numr_apex
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_afw_13_page
        ,nom
        ,numr_apex
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_page;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_30_PAGE_ITEM;

create or replace force view apexframework.vd_i_afw_30_page_item
(
  seqnc
 ,ref_afw_30_page
 ,ref_item_carnt_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_afw_30_page
        ,ref_item_carnt_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_page_item;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_36_ATRIB_DISPN;

create or replace force view apexframework.vd_i_afw_36_atrib_dispn
(
  seqnc
 ,ref_page
 ,ref_type_don
 ,indic_dispn
 ,nom_afich
 ,nom_sql
 ,dnr_ref_aplic
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_page
        ,ref_type_don
        ,indic_dispn
        ,nom_afich
        ,nom_sql
        ,dnr_ref_aplic
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_36_atrib_dispn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_36_FILTR_SESN;

create or replace force view apexframework.vd_i_afw_36_filtr_sesn
(
  seqnc
 ,ref_sesn
 ,ref_opert_filtr
 ,ref_atrib_dispn
 ,ref_page
 ,dnr_condt_sql
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_condt_afich
 ,valr_varch1
 ,valr_varch2
 ,valr_numbr1
 ,valr_numbr2
 ,valr_date1
 ,valr_date2
)
as
  select seqnc
        ,ref_sesn
        ,ref_opert_filtr
        ,ref_atrib_dispn
        ,ref_page
        ,dnr_condt_sql
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_condt_afich
        ,valr_varch1
        ,valr_varch2
        ,valr_numbr1
        ,valr_numbr2
        ,valr_date1
        ,valr_date2
    from afw_36_filtr_sesn;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_36_LIEN_OPERT_FILTR;

create or replace force view apexframework.vd_i_afw_36_lien_opert_filtr
(
  seqnc
 ,ref_type_don
 ,ref_opert_filtr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,indic_deft
)
as
  select seqnc
        ,ref_type_don
        ,ref_opert_filtr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,indic_deft
    from afw_36_lien_opert_filtr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_36_OPERT_FILTR;

create or replace force view apexframework.vd_i_afw_36_opert_filtr
(
  seqnc
 ,code
 ,nom
 ,texte_afich
 ,condt_sql
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,indic_valr2
 ,indic_auto_lancr_rechr
)
as
  select seqnc
        ,code
        ,nom
        ,texte_afich
        ,condt_sql
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,indic_valr2
        ,indic_auto_lancr_rechr
    from afw_36_opert_filtr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_36_TYPE_DON;

create or replace force view apexframework.vd_i_afw_36_type_don
(
  seqnc
 ,code
 ,nom
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,mesg_place_holdr
)
as
  select seqnc
        ,code
        ,nom
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,mesg_place_holdr
    from afw_36_type_don;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_36_VUE;

create or replace force view apexframework.vd_i_afw_36_vue
(
  seqnc
 ,ref_page
 ,code
 ,nom
 ,nom_afich
 ,descr
 ,dnr_ref_aplic
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_vue
)
as
  select seqnc
        ,ref_page
        ,code
        ,nom
        ,nom_afich
        ,descr
        ,dnr_ref_aplic
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_vue
    from afw_36_vue;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_36_VUE_ATRIB;

create or replace force view apexframework.vd_i_afw_36_vue_atrib
(
  seqnc
 ,ref_vue
 ,ref_atrib_dispn
 ,dnr_ref_aplic
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,postn_filtr_bris
 ,sens_filtr_bris
 ,postn_filtr_deft
 ,sens_filtr_deft
 ,ordre
)
as
  select seqnc
        ,ref_vue
        ,ref_atrib_dispn
        ,dnr_ref_aplic
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,postn_filtr_bris
        ,sens_filtr_bris
        ,postn_filtr_deft
        ,sens_filtr_deft
        ,ordre
    from afw_36_vue_atrib;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_36_VUE_TRI_SECND;

create or replace force view apexframework.vd_i_afw_36_vue_tri_secnd
(
  seqnc
 ,ref_vue
 ,ref_sesn
 ,ref_atrib
 ,sens_filtr
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_vue
        ,ref_sesn
        ,ref_atrib
        ,sens_filtr
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_36_vue_tri_secnd;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_37_GADGT;

create or replace force view apexframework.vd_i_afw_37_gadgt
(
  seqnc
 ,ref_prodt
 ,ref_struc_aplic
 ,ref_gadgt_catgr
 ,code
 ,nom
 ,procd_genrt
 ,procd_ajax
 ,class_css
 ,descr
 ,icone
 ,ordre_presn
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,ref_struc_aplic
        ,ref_gadgt_catgr
        ,code
        ,nom
        ,procd_genrt
        ,procd_ajax
        ,class_css
        ,descr
        ,icone
        ,ordre_presn
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_gadgt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_37_GADGT_CATGR;

create or replace force view apexframework.vd_i_afw_37_gadgt_catgr
(
  seqnc
 ,ref_prodt
 ,ref_gadgt_catgr
 ,code
 ,nom
 ,ordre_presn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,ref_gadgt_catgr
        ,code
        ,nom
        ,ordre_presn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_gadgt_catgr;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_37_GADGT_PARMT;

create or replace force view apexframework.vd_i_afw_37_gadgt_parmt
(
  seqnc
 ,ref_gadgt
 ,code
 ,nom
 ,ordre_presn
 ,indic_oblig
 ,ref_dv_type_don
 ,ref_domn_valr
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_gadgt
        ,code
        ,nom
        ,ordre_presn
        ,indic_oblig
        ,ref_dv_type_don
        ,ref_domn_valr
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_gadgt_parmt;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_37_GADGT_PARMT_RACRC;

create or replace force view apexframework.vd_i_afw_37_gadgt_parmt_racrc
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,ref_dv_type_don
 ,forml_don
 ,indic_genrq
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,ref_dv_type_don
        ,forml_don
        ,indic_genrq
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_gadgt_parmt_racrc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_37_LIEN_GADGT_PARMT_R;

create or replace force view apexframework.vd_i_afw_37_lien_gadgt_parmt_r
(
  seqnc
 ,ref_gadgt_parmt
 ,ref_gadgt_parmt_racrc
 ,nom
 ,forml_don
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_gadgt_parmt
        ,ref_gadgt_parmt_racrc
        ,nom
        ,forml_don
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_lien_gadgt_parmt_racrc;


DROP VIEW APEXFRAMEWORK.VD_I_AFW_37_TABL_BORD;

create or replace force view apexframework.vd_i_afw_37_tabl_bord
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,nom_group_deft
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
        ,nom_group_deft
    from afw_37_tabl_bord;
