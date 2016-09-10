DROP VIEW APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC;

create or replace force view apexframework.vd_afw_01_atrib_modl_comnc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_modl_comnc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_modl_comnc
    from vd_i_afw_01_atrib_modl_comnc;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_CODE_ERR_ORACL;

create or replace force view apexframework.vd_afw_01_code_err_oracl
(
  seqnc
 ,err_code
 ,err_code_formt
 ,libl
 ,utils_creat
 ,date_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,err_code
        ,   'ora-'
         || lpad (err_code
                 ,5
                 ,0)
           err_code_formt
        ,libl
        ,utils_creat
        ,date_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_01_code_err_oracl;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB;

create or replace force view apexframework.vd_afw_01_confg_evenm_notfb
(
  seqnc
 ,ref_type_comnc
 ,ref_type_comnc_code_formt
 ,ref_type_comnc_formt
 ,objet
 ,titre_mesg
 ,mesg_sms
 ,mesg
 ,ref_evenm_notfb
 ,ref_evenm_notfb_code_formt
 ,ref_evenm_notfb_formt
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
  select cen.seqnc
        ,cen.ref_type_comnc
        , (select tc.code
             from vd_i_afw_01_type_comnc tc
            where tc.seqnc = cen.ref_type_comnc)
        , (select tc.nom
             from vd_i_afw_01_type_comnc tc
            where tc.seqnc = cen.ref_type_comnc)
        ,cen.objet
        ,cen.titre_mesg
        ,cen.mesg_sms
        ,cen.mesg
        ,cen.ref_evenm_notfb
        , (select en.code
             from vd_i_afw_01_evenm_notfb en
            where en.seqnc = cen.ref_evenm_notfb)
        , (select en.nom
             from vd_i_afw_01_evenm_notfb en
            where en.seqnc = cen.ref_evenm_notfb)
        ,cen.nom
        ,cen.descr
        ,cen.ref_domn
        ,cen.ref_compt_twili
        ,cen.ref_profl_courl
        ,cen.indic_deft
        ,cen.indic_envoi_difr
        ,cen.date_creat
        ,cen.utils_creat
        ,cen.date_modfc
        ,cen.utils_modfc
    from vd_i_afw_01_confg_evenm_notfb cen;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_DESTN;

create or replace force view apexframework.vd_afw_01_destn
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_atrib_struc_aplic
 ,ref_sa
 ,ref_sa_formt
 ,ref_sa_prodt
 ,descr
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_atrib_struc_aplic
        , (select ref_struc_aplic
             from vd_i_afw_12_atrib_struc_aplic asa
            where asa.seqnc = d.ref_atrib_struc_aplic)
           ref_sa
        , (select sa.nom
             from vd_i_afw_12_struc_aplic sa
                 ,vd_i_afw_12_atrib_struc_aplic asa
            where     asa.seqnc = d.ref_atrib_struc_aplic
                  and sa.seqnc = asa.ref_struc_aplic)
           ref_sa_formt
        , (select sa.ref_prodt
             from vd_i_afw_12_struc_aplic sa
                 ,vd_i_afw_12_atrib_struc_aplic asa
            where     asa.seqnc = d.ref_atrib_struc_aplic
                  and sa.seqnc = asa.ref_struc_aplic)
           ref_sa_prodt
        ,descr
    from vd_i_afw_01_destn d;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN;

create or replace force view apexframework.vd_afw_01_elemn_confg_en
(
  seqnc
 ,ref_confg_evenm_notfb
 ,code
 ,elemn_subst_mesg
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
        ,afw_01_elemn_confg_en_pkg.formt_elemn_subst_mesg (code)
        ,ident_acces
        ,ident_acces_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,formt
    from vd_i_afw_01_elemn_confg_en;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC;

create or replace force view apexframework.vd_afw_01_hierc_aplic
(
  seqnc
 ,ref_evenm_notfb
 ,ref_atrib_struc_aplic
 ,aplic_prior
 ,ref_sa
 ,ref_sa_formt
 ,ref_sa_cle_etran
 ,ref_sa_cle_etran_formt
 ,chemn_reslt
)
as
  select seqnc
        ,ref_evenm_notfb
        ,ref_atrib_struc_aplic
        ,aplic_prior
        , (select sa.seqnc
             from vd_i_afw_12_atrib_struc_aplic asa
                 ,vd_i_afw_12_struc_aplic sa
            where     sa.seqnc = asa.ref_struc_aplic
                  and asa.seqnc = ha.ref_atrib_struc_aplic)
           ref_sa
        , (select sa.nom
             from vd_i_afw_12_atrib_struc_aplic asa
                 ,vd_i_afw_12_struc_aplic sa
            where     sa.seqnc = asa.ref_struc_aplic
                  and asa.seqnc = ha.ref_atrib_struc_aplic)
           ref_sa_formt
        , (select sa.seqnc
             from vd_i_afw_12_struc_aplic sa
                 ,vd_i_afw_12_atrib_struc_aplic asa2
                 ,vd_i_afw_12_atrib_struc_aplic asa
            where     sa.seqnc = asa2.ref_struc_aplic
                  and asa2.seqnc = asa.ref_atrib_struc_aplic
                  and asa.seqnc = ha.ref_atrib_struc_aplic)
           ref_sa_cle_etran
        , (select sa.nom
             from vd_i_afw_12_struc_aplic sa
                 ,vd_i_afw_12_atrib_struc_aplic asa2
                 ,vd_i_afw_12_atrib_struc_aplic asa
            where     sa.seqnc = asa2.ref_struc_aplic
                  and asa2.seqnc = asa.ref_atrib_struc_aplic
                  and asa.seqnc = ha.ref_atrib_struc_aplic)
           ref_sa_cle_etran_formt
        , (select nvl (asa.nom_fonct, asa.nom_coln)
             from vd_i_afw_12_atrib_struc_aplic asa
            where asa.seqnc = ha.ref_atrib_struc_aplic)
           chemn_reslt
    from vd_i_afw_01_hierc_aplic ha;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_LANG;

create or replace force view apexframework.vd_afw_01_lang
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
    from vd_i_afw_01_lang;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_LANG_LANG;

create or replace force view apexframework.vd_afw_01_lang_lang
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
    from vd_i_afw_01_lang_lang;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_MESG_AIDE;

create or replace force view apexframework.vd_afw_01_mesg_aide
(
  seqnc
 ,nom
 ,libl
 ,type_item
 ,ref_page
 ,numr_mesg
 ,mesg
 ,ref_lang
 ,seqnc_mesg_lang
)
as
  select aap.seqnc
        ,aap.nom_apex
        ,aap.libl
        ,aap.type_item
        ,aap.ref_page
        ,mes.numr_mesg
        ,mel.mesg
        ,mel.ref_lang
        ,mel.seqnc
    from vd_i_afw_13_page pa
        ,vd_i_afw_13_page_item aap
        ,vd_i_afw_11_prodt pro
        ,vd_i_afw_11_aplic ap
        ,vd_i_afw_01_mesg mes
        ,vd_i_afw_01_mesg_lang mel
   where     pa.ref_aplic = ap.seqnc
         and ap.ref_prodt = pro.seqnc
         and aap.ref_page = pa.seqnc
         and aap.ref_mesg_aide = mes.seqnc(+)
         and mel.ref_mesg(+) = mes.seqnc
  union all
  select irc.seqnc
        ,irc.coln_table
        ,irc.libl
        ,'RAPRT'
        ,ir.ref_page
        ,mes.numr_mesg
        ,mel.mesg
        ,mel.ref_lang
        ,mel.seqnc
    from vd_i_afw_13_page pa
        ,vd_i_afw_13_page_ir ir
        ,vd_i_afw_13_page_ir_coln irc
        ,vd_i_afw_11_prodt pro
        ,vd_i_afw_11_aplic ap
        ,vd_i_afw_01_mesg mes
        ,vd_i_afw_01_mesg_lang mel
   where     pa.ref_aplic = ap.seqnc
         and ap.ref_prodt = pro.seqnc
         and ir.ref_page = pa.seqnc
         and irc.ref_page_ir = ir.seqnc
         and irc.ref_mesg_aide = mes.seqnc(+)
         and mel.ref_mesg(+) = mes.seqnc
  union all
  select rpl.seqnc
        ,null
        ,null
        ,'PAGE'
        ,rp.ref_page
        ,rp.nom
        ,to_char (rpl.contn)
        ,rpl.ref_lang
        ,rpl.seqnc
    from vd_i_afw_13_page pa
        ,vd_i_afw_11_prodt pro
        ,vd_i_afw_11_aplic ap
        ,vd_i_afw_13_regn_piltb rp
        ,vd_i_afw_13_regn_piltb_lang rpl
   where     pa.ref_aplic = ap.seqnc
         and ap.ref_prodt = pro.seqnc
         and rp.ref_page = pa.seqnc
         and rpl.ref_regn_piltb = rp.seqnc
         and rp.ref_dv_type_regn_piltb = afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REGN_PILTB'
                                                                          ,'AIDE_PAGE');


DROP VIEW APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE;

create or replace force view apexframework.vd_afw_01_mesg_err_lie
(
  seqnc
 ,ref_code_err_oracl
 ,ref_code_err_oracl_formt
 ,nom_table
 ,nom_coln
 ,nom_contr
 ,page
 ,page_formt
 ,comnt
 ,ref_prodt
 ,ref_prodt_formt
 ,type_liais
 ,ref_mesg
 ,ref_numr_mesg
)
as
  select seqnc
        ,ref_code_err_oracl
        , (select err_code
             from vd_i_afw_01_code_err_oracl ceo
            where ceo.seqnc = mel.ref_code_err_oracl)
           ref_code_err_oracl_formt
        ,nom_table
        ,nom_coln
        ,nom_contr
        ,page
        , -- Ajouter un numéro d'application à la vue pour rendre unique la combinaison page, ref_prodt et aplic.
         page /*(SELECT numr || ' - ' || nom
                 FROM vs_afw_13_page
                WHERE numr = mel.page AND mel.ref_prodt = seqnc_prodt AND )*/
             page_formt
        ,comnt
        ,ref_prodt
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_11_prodt
            where seqnc = mel.ref_prodt)
           ref_prodt_formt
        ,type_liais
        ,ref_mesg
        , (select m.numr_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = mel.ref_mesg)
           ref_numr_mesg
    from vd_i_afw_01_mesg_err_lie mel;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_MESG_INFOR;

create or replace force view apexframework.vd_afw_01_mesg_infor
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
    from vd_i_afw_01_mesg_infor
   where    sess_id = afw_07_util_pkg.nv ('APP_SESSION')
         or ref_utils = afw_12_utils_pkg.obten_usagr_conct
  with check option;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_MESG_LANG;

create or replace force view apexframework.vd_afw_01_mesg_lang
(
  seqnc
 ,ref_lang
 ,ref_lang_formt
 ,mesg
 ,ref_mesg
 ,ref_mesg_formt
 ,type_mesg
)
as
  select seqnc
        ,ref_lang
        , (select l.nom
             from vd_afw_01_lang l
            where l.seqnc = p.seqnc)
           ref_lang
        ,mesg
        ,ref_mesg
        , (select m.numr_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = p.ref_mesg)
           ref_mesg_formt
        , (select m.type_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = p.ref_mesg)
           type_mesg
    from vd_i_afw_01_mesg_lang p;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX;

create or replace force view apexframework.vd_afw_01_mesg_tradc_apex
(
  seqnc
 ,nom
 ,text
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_lang
 ,lang
 ,ref_lang_formt
 ,ref_prodt
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
        , (select lower (l.code)
             from vd_i_afw_01_lang l
            where l.seqnc = mta.ref_lang)
           lang
        , (select l.nom
             from vd_i_afw_01_lang l
            where l.seqnc = mta.ref_lang)
           ref_lang_formt
        ,ref_prodt
    from vd_i_afw_01_mesg_tradc_apex mta;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC;

create or replace force view apexframework.vd_afw_01_modl_afich_notfc
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
    from vd_i_afw_01_modl_afich_notfc;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_MODL_COMNC;

create or replace force view apexframework.vd_afw_01_modl_comnc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_type_comnc
 ,ref_type_comnc_formt
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
        , (select nom
             from vd_i_afw_01_type_comnc tc
            where tc.seqnc = mc.ref_type_comnc)
           ref_type_comnc_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_systm
        ,ref_domn
    from vd_i_afw_01_modl_comnc mc;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC;

create or replace force view apexframework.vd_afw_01_modl_mesg_notfc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,objet
 ,corps_mesg
 ,ref_domn
)
as
  (select seqnc
         ,code
         ,nom
         ,descr
         ,objet
         ,corps_mesg
         ,ref_domn
     from vd_i_afw_01_modl_mesg_notfc);


DROP VIEW APEXFRAMEWORK.VD_AFW_01_NOTFC;

create or replace force view apexframework.vd_afw_01_notfc
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
    from vd_i_afw_01_notfc;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB;

create or replace force view apexframework.vd_afw_01_osa_evenm_notfb
(
  seqnc
 ,ref_hierc_aplic
 ,ref_confg_evenm_notfb
 ,ref_seqnc_struc_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_hierc_aplic
        ,ref_confg_evenm_notfb
        ,ref_seqnc_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_01_osa_evenm_notfb;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB;

create or replace force view apexframework.vd_afw_01_propg_evenm_notfb
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
    from vd_i_afw_01_propg_evenm_notfb;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN;

create or replace force view apexframework.vd_afw_01_reslt_destn
(
  seqnc
 ,ref_destn
 ,dnr_ref_prodt
 ,ident_acces
 ,ident_acces_formt
 ,nom
 ,ref_struc_aplic_acces
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_destn
        ,dnr_ref_prodt
        ,ident_acces
        ,ident_acces_formt
        ,nom
        ,ref_struc_aplic_acces
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from vd_i_afw_01_reslt_destn;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC;

create or replace force view apexframework.vd_afw_01_type_comnc
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
    from vd_i_afw_01_type_comnc;


DROP VIEW APEXFRAMEWORK.VD_AFW_03_CLAS_INTER;

create or replace force view apexframework.vd_afw_03_clas_inter
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
 ,ref_prodt_formt
 ,ref_profl_courl
 ,ref_profl_courl_formt
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
        , (select    p.code
                  || ' - '
                  || p.nom
             from vd_i_afw_11_prodt p
            where p.seqnc = ci.ref_prodt)
        ,ref_profl_courl
        , (select    pc.code
                  || ' - '
                  || pc.servr_sortn
             from vd_i_afw_17_profl_courl pc
            where pc.seqnc = ci.ref_profl_courl)
        ,indic_avert_autr_uniq
    from vd_i_afw_03_clas_inter ci;


DROP VIEW APEXFRAMEWORK.VD_AFW_03_JOURN;

create or replace force view apexframework.vd_afw_03_journ
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
    from vd_i_afw_03_journ;


DROP VIEW APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC;

create or replace force view apexframework.vd_afw_03_journ_struc_aplic
(
  seqnc
 ,ref_domn
 ,struc_aplic
 ,struc_aplic_code
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
        , (select code
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = struc_aplic)
           struc_aplic_code
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
    from vd_i_afw_03_journ_struc_aplic;


DROP VIEW APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL;

create or replace force view apexframework.vd_afw_03_lien_clas_inter_util
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
    from vd_i_afw_03_lien_clas_inter_ut;


DROP VIEW APEXFRAMEWORK.VD_AFW_03_TRACE_EXECT;

create or replace force view apexframework.vd_afw_03_trace_exect
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
    from vd_i_afw_03_trace_exect;


DROP VIEW APEXFRAMEWORK.VD_AFW_04_CONTX;

create or replace force view apexframework.vd_afw_04_contx
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
  select ctx.ref_fil_arian
        ,ctx.contx
        ,ctx.actio
        ,ctx.seqnc_contx
        ,ctx.date_creat
        ,ctx.utils_creat
        ,ctx.date_modfc
        ,ctx.utils_modfc
        ,ctx.contx_inter
        ,ctx.actio_inter
        ,ctx.seqnc_contx_inter
        ,ctx.indic_ignor
        ,ctx.nom_procd_infor_suplm
        ,ctx.infor_suplm
        ,ctx.contx_formt
    from vd_i_afw_04_contx ctx
   where exists
           (select null
              from vd_i_afw_04_fil_arian fil
             where fil.seqnc = ctx.ref_fil_arian);


DROP VIEW APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND;

create or replace force view apexframework.vd_afw_04_contx_etend
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
    from vd_i_afw_04_contx_etend etend
   where exists
           (select null
              from vd_i_afw_04_contx contx
             where contx.ref_fil_arian = etend.ref_contx);


DROP VIEW APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN;

create or replace force view apexframework.vd_afw_04_fil_arian
(
  seqnc
 ,aplic
 ,page
 ,session_id
 ,ref_elemn_sup
 ,libl
 ,timst
 ,app_id
 ,hash_dernr_url
 ,indic_afich
)
as
  select seqnc
        ,aplic
        ,page
        ,session_id
        ,ref_elemn_sup
        ,libl
        ,timst
        ,app_id
        ,hash_dernr_url
        ,indic_afich
    from vd_i_afw_04_fil_arian fa
   where fa.session_id = afw_07_util_pkg.nv ('SESSION');


DROP VIEW APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR;

create or replace force view apexframework.vd_afw_04_navgt_histr
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
    from vd_i_afw_04_navgt_histr;


DROP VIEW APEXFRAMEWORK.VD_AFW_04_TUTRL;

create or replace force view apexframework.vd_afw_04_tutrl
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
    from vd_i_afw_04_tutrl tu
   where tu.ref_sesn = afw_12_sesn_pkg.obten_sesn;


DROP VIEW APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC;

create or replace force view apexframework.vd_afw_07_audit_struc_aplic
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
    from vd_i_afw_07_audit_struc_aplic;


DROP VIEW APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL;

create or replace force view apexframework.vd_afw_07_valr_audit_str_apl
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
    from vd_i_afw_07_valr_audit_str_apl;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT;

create or replace force view apexframework.vd_afw_11_atrib_entit
(
  seqnc
 ,nom
 ,type_don
 ,type_don_formt
 ,compr_migrt
 ,ref_entit
 ,ref_entit_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,code
 ,ref_entit_refrn
 ,ref_entit_refrn_formt
 ,indic_nouvl_atrib_formt
)
as
  select seqnc
        ,nom
        ,type_don
        , (case type_don when 'V' then 'Varchar2' when 'N' then 'Number' when 'D' then 'Date' end)
        ,compr_migrt
        ,ref_entit
        , (select nom
             from vd_i_afw_11_entit e
            where e.seqnc = ae.ref_entit)
           ref_entit_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,code
        ,ref_entit_refrn
        , (select nom
             from vd_i_afw_11_entit e
            where e.seqnc = ae.ref_entit_refrn)
           ref_entit_refrn_formt
        ,decode (indic_nouvl_atrib,  'O', 'Oui',  'N', 'Non')
    from vd_i_afw_11_atrib_entit ae;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_ENTIT;

create or replace force view apexframework.vd_afw_11_entit
(
  seqnc
 ,nom
 ,nom_table_tempr
 ,nom_table_ereur
 ,indic_creer_ocurn
 ,indic_creer_ocurn_formt
 ,indic_modif_ocurn
 ,indic_modif_ocurn_formt
 ,indic_suprm_ocurn
 ,indic_suprm_ocurn_formt
 ,indic_force_selct
 ,indic_force_selct_formt
 ,ref_versn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ordre_exect
 ,longr_bloc
 ,indic_nouvl_entit
 ,indic_nouvl_entit_formt
 ,niv_inclu_migrt
 ,niv_inclu_migrt_formt
 ,confg_inclu_migrt
 ,indic_expor_tabl_index
 ,indic_expor_tabl_index_formt
 ,indic_suprm_don_prodt
 ,indic_suprm_don_prodt_formt
)
as
  select seqnc
        ,nom
        ,nom_table_tempr
        ,nom_table_ereur
        ,indic_creer_ocurn
        ,case indic_creer_ocurn when 'O' then 'Oui' else 'Non' end indic_creer_ocurn_formt
        ,indic_modif_ocurn
        ,case indic_modif_ocurn when 'O' then 'Oui' else 'Non' end indic_modif_ocurn_formt
        ,indic_suprm_ocurn
        ,case indic_suprm_ocurn when 'O' then 'Oui' else 'Non' end indic_suprm_ocurn_formt
        ,indic_force_selct
        ,case indic_force_selct when 'O' then 'Oui' else 'Non' end indic_force_selct_formt
        ,ref_versn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ordre_exect
        ,longr_bloc
        ,indic_nouvl_entit
        ,case indic_nouvl_entit when 'O' then 'Oui' else 'Non' end indic_nouvl_entit_formt
        ,niv_inclu_migrt
        ,case niv_inclu_migrt
           when 'GLOBL' then 'Global'
           when 'PRODT' then 'Produit'
           when 'APLIC' then 'Application'
           when 'CONTX' then 'Selon contexte'
           else null
         end
           niv_inclu_migrt_formt
        ,confg_inclu_migrt
        ,indic_expor_tabl_index
        ,case indic_expor_tabl_index when 'O' then 'Oui' else 'Non' end indic_expor_tabl_index_formt
        ,indic_suprm_don_prodt
        ,case indic_suprm_don_prodt when 'O' then 'Oui' else 'Non' end indic_suprm_don_prodt_formt
    from vd_i_afw_11_entit;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_PARMT_AFW;

create or replace force view apexframework.vd_afw_11_parmt_afw
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
    from vd_i_afw_11_parmt_afw;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_PLUGN;

create or replace force view apexframework.vd_afw_11_plugn
(
  seqnc
 ,code_inter
 ,nom
 ,nom_formt
 ,descr
 ,ref_versn
 ,ref_versn_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select p.seqnc
        ,p.code_inter
        ,p.nom
        ,   p.nom
         || ' '
         || (select afw_11_versn_pkg.obten_versn (v.numr_versn_1
                                                 ,v.numr_versn_2
                                                 ,v.numr_versn_3
                                                 ,v.numr_versn_4)
               from vd_i_afw_11_versn v
              where v.ref_plugn = p.seqnc)
           nom_formt
        ,p.descr
        ,p.ref_versn
        , (select afw_11_versn_pkg.obten_numr_versn (v.numr_versn_1
                                                    ,v.numr_versn_2
                                                    ,v.numr_versn_3
                                                    ,v.numr_versn_4)
             from vd_i_afw_11_versn v
            where v.ref_plugn = p.seqnc)
           ref_versn_formt
        ,p.date_creat
        ,p.utils_creat
        ,p.date_modfc
        ,p.utils_modfc
    from vd_i_afw_11_plugn p;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_PRODT_LANG;

create or replace force view apexframework.vd_afw_11_prodt_lang
(
  seqnc
 ,ref_prodt
 ,ref_lang
 ,indic_deft
 ,indic_deft_formt
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
        ,case indic_deft when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>' else null end as indic_deft_formt
        ,ordre_presn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_11_prodt_lang;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC;

create or replace force view apexframework.vd_afw_11_prodt_resrc
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
    from vd_i_afw_11_prodt_resrc;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_UTILS;

create or replace force view apexframework.vd_afw_11_utils
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
    from vd_i_afw_11_utils;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_VERSN;

create or replace force view apexframework.vd_afw_11_versn
(
  seqnc
 ,code
 ,nom
 ,nom_formt
 ,numr_versn_1
 ,numr_versn_2
 ,numr_versn_3
 ,numr_versn_4
 ,versn_formt
 ,numr_versn_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,ref_plugn
 ,indic_docmn_verl
 ,ref_aplic
)
as
  select seqnc
        ,code
        ,nom
        ,   case
              when nom is not null
              then
                   nom
                || ' '
              else
                null
            end
         || afw_11_versn_pkg.obten_versn (numr_versn_1
                                         ,numr_versn_2
                                         ,numr_versn_3
                                         ,numr_versn_4)
        ,numr_versn_1
        ,numr_versn_2
        ,numr_versn_3
        ,numr_versn_4
        ,afw_11_versn_pkg.obten_versn (numr_versn_1
                                      ,numr_versn_2
                                      ,numr_versn_3
                                      ,numr_versn_4)
        ,afw_11_versn_pkg.obten_numr_versn (numr_versn_1
                                           ,numr_versn_2
                                           ,numr_versn_3
                                           ,numr_versn_4)
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,ref_plugn
        ,indic_docmn_verl
        ,ref_aplic
    from vd_i_afw_11_versn;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT;

create or replace force view apexframework.vd_afw_12_actio_audit
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
    from vd_i_afw_12_actio_audit;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_ARBRE;

create or replace force view apexframework.vd_afw_12_arbre
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
    from vd_i_afw_12_arbre;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD;

create or replace force view apexframework.vd_afw_12_arbre_noeud
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
    from vd_i_afw_12_arbre_noeud;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES;

create or replace force view apexframework.vd_afw_12_defnt_acces
(
  seqnc
 ,ref_group_utils
 ,ref_group_utils_formt
 ,ref_utils
 ,ref_utils_formt
 ,indic_acces
 ,indic_acces_formt
 ,indic_modfc
 ,indic_modfc_formt
 ,indic_suprs
 ,indic_suprs_formt
 ,indic_creat
 ,indic_creat_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_opert
 ,ref_opert_formt
 ,ref_code_opert
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,ref_code_struc_aplic
)
as
  select seqnc
        ,ref_group_utils
        , (select nom
             from vd_i_afw_12_group_utils
            where seqnc = dac.ref_group_utils)
           ref_group_utils_formt
        ,ref_utils
        ,null ref_utils_formt
        ,indic_acces
        ,afw_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES'
                                         ,indic_acces)
           indic_acces_formt
        ,indic_modfc
        ,afw_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES'
                                         ,indic_modfc)
           indic_modfc_formt
        ,indic_suprs
        ,afw_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES'
                                         ,indic_suprs)
           indic_suprs_formt
        ,indic_creat
        ,afw_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES'
                                         ,indic_creat)
           indic_creat_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_opert
        , (select nom
             from vd_i_afw_13_opert
            where seqnc = dac.ref_opert)
           ref_opert_formt
        , (select code
             from vd_i_afw_13_opert
            where seqnc = dac.ref_opert)
           ref_code_opert
        ,ref_struc_aplic
        , (select nom
             from vd_i_afw_12_struc_aplic
            where seqnc = dac.ref_struc_aplic)
           ref_struc_aplic_formt
        , (select code
             from vd_i_afw_12_struc_aplic
            where seqnc = dac.ref_struc_aplic)
           ref_code_struc_aplic
    from vd_i_afw_12_defnt_acces dac;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_DOMN;

create or replace force view apexframework.vd_afw_12_domn
(
  seqnc
 ,code
 ,nom
 ,nom_formt
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
        ,   code
         || ' - '
         || nom
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
    from vd_i_afw_12_domn;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP;

create or replace force view apexframework.vd_afw_12_domn_servr_ldap
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
    from vd_i_afw_12_domn_servr_ldap;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT;

create or replace force view apexframework.vd_afw_12_evolt_stat
(
  seqnc
 ,ref_stat
 ,ref_stat_evolt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_code
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
    from vd_i_afw_12_evolt_stat;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_FAVR;

create or replace force view apexframework.vd_afw_12_favr
(
  seqnc
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,numr_page
 ,ref_seqnc_struc_aplic
 ,ref_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select f.seqnc
        ,f.ref_struc_aplic
        ,sa.code ref_struc_aplic_formt
        ,p.numr_apex numr_page
        ,f.ref_seqnc_struc_aplic
        ,f.ref_utils
        ,f.date_creat
        ,f.utils_creat
        ,f.date_modfc
        ,f.utils_modfc
    from vd_i_afw_12_favr f
        ,vd_i_afw_12_struc_aplic sa
        ,vd_i_afw_13_page p
   where     f.ref_struc_aplic = sa.seqnc
         and p.seqnc = sa.ref_page_forml;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_FONCT;

create or replace force view apexframework.vd_afw_12_fonct
(
  seqnc
 ,ref_prodt
 ,ref_prodt_formt
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
        ,afw_11_prodt_pkg.obten_code_prodt (ref_prodt)
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_12_fonct;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC;

create or replace force view apexframework.vd_afw_12_fonct_struc_aplic
(
  seqnc
 ,ref_fonct
 ,ref_fonct_formt
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,ref_struc_aplic_code_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select fsa.seqnc
        ,fsa.ref_fonct
        , (select f.nom
             from vd_i_afw_12_fonct f
            where f.seqnc = fsa.ref_fonct)
        ,fsa.ref_struc_aplic
        , (select sa.nom
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = fsa.ref_struc_aplic)
        , (select sa.code
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = fsa.ref_struc_aplic)
        ,fsa.date_creat
        ,fsa.utils_creat
        ,fsa.date_modfc
        ,fsa.utils_modfc
        ,fsa.dnr_ref_prodt
    from vd_i_afw_12_fonct_struc_aplic fsa;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS;

create or replace force view apexframework.vd_afw_12_group_gadgt_utils
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
 ,ref_tabl_bord
 ,nom
 ,indic_systm
 ,confg_gril
 ,confg_gadgt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_utils_demdr
 ,ref_utils_demdr_formt
)
as
  select seqnc
        ,ref_utils
        ,afw_12_utils_pkg.obten_nom_formt (ref_utils) ref_utils_fromt
        ,ref_tabl_bord
        ,nom
        ,indic_systm
        ,confg_gril
        ,confg_gadgt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_utils_demdr
        ,afw_12_utils_pkg.obten_nom_formt (ref_utils_demdr) ref_utils_demdr_formt
    from vd_i_afw_12_group_gadgt_utils;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_GROUP_STAT;

create or replace force view apexframework.vd_afw_12_group_stat
(
  seqnc
 ,ref_prodt
 ,ref_prodt_formt
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
        ,ref_prodt
        , (select nom
             from vd_i_afw_11_prodt p
            where p.seqnc = gs.ref_prodt)
           ref_prodt_formt
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_group_stat gs;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS;

create or replace force view apexframework.vd_afw_12_group_utils
(
  seqnc
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,ref_prodt_formt
 ,ref_code_prodt_formt
 ,code
 ,indic_ignor_group_admin
 ,indic_ignor_group_admin_formt
 ,indic_systm
 ,indic_systm_formt
 ,ref_domn
 ,ref_domn_formt
 ,indic_acces_globl
 ,indic_acces_globl_formt
 ,indic_opert_exist_formt
 ,indic_struc_aplic_exist_formt
 ,indic_group_utils_exist_formt
 ,ref_fonct
 ,indic_group_aplic
 ,indic_group_aplic_formt
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
        , (select    sp.code
                  || ' - '
                  || sp.nom
             from vd_i_afw_11_prodt sp
            where sp.seqnc = sgu.ref_prodt)
           as ref_prodt_formt
        , (select sp.code
             from vd_i_afw_11_prodt sp
            where sp.seqnc = sgu.ref_prodt)
           as ref_code_prodt_formt
        ,code
        ,indic_ignor_group_admin
        ,case indic_ignor_group_admin when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>' else null end
           as indic_ignor_group_admin_formt
        ,indic_systm
        ,case indic_systm when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>' else null end as indic_systm_formt
        ,ref_domn
        , (select sd.nom_formt
             from vd_afw_12_domn sd
            where sd.seqnc = sgu.ref_domn)
           as ref_domn_formt
        ,indic_acces_globl
        ,case indic_acces_globl when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>' else null end as indic_acces_globl_formt
        ,case (select 1
                 from vd_afw_12_defnt_acces sda
                where     sda.ref_group_utils = sgu.seqnc
                      and sda.ref_opert is not null
                      and rownum = 1)
           when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
           else null
         end
           as indic_opert_exist_formt
        ,case (select 1
                 from vd_afw_12_defnt_acces sda
                where     sda.ref_group_utils = sgu.seqnc
                      and sda.ref_struc_aplic is not null
                      and rownum = 1)
           when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
           else null
         end
           as indic_struc_aplic_exist_formt
        ,case (select 1
                 from vd_i_afw_12_lien_group_utils slgu
                where     slgu.ref_group = sgu.seqnc
                      and slgu.ref_group_utils_lie is not null
                      and rownum = 1)
           when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
           else null
         end
           as indic_group_utils_exist_formt
        ,ref_fonct
        ,indic_group_aplic
        ,case indic_group_aplic when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>' else null end as indic_group_aplic_formt
    from vd_i_afw_12_group_utils sgu;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES;

create or replace force view apexframework.vd_afw_12_histr_acces
(
  seqnc
 ,ref_utils
 ,date_evenm
 ,ref_dv_type_evenm
 ,ref_dv_type_evenm_formt
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
        ,case
           when ref_utils_pour is null
           then
             afw_14_domn_valr_pkg.obten_valr (ref_dv_type_evenm)
           else
             replace (afw_14_domn_valr_pkg.obten_valr (ref_dv_type_evenm)
                     ,'%1%'
                     ,afw_12_utils_pkg.obten_nom_formt_de_utils (ref_utils_pour))
         end
           ref_dv_type_evenm_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,adres_ip
        ,ref_utils_pour
    from vd_i_afw_12_histr_acces;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL;

create or replace force view apexframework.vd_afw_12_histr_tutrl
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
    from vd_i_afw_12_histr_tutrl;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS;

create or replace force view apexframework.vd_afw_12_lien_gadgt_utils
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
    from vd_i_afw_12_lien_gadgt_utils;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P;

create or replace force view apexframework.vd_afw_12_lien_gadgt_utils_p
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
    from vd_i_afw_12_lien_gadgt_utils_p;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U;

create or replace force view apexframework.vd_afw_12_lien_gr_gadgt_gr_u
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
    from vd_i_afw_12_lien_gr_gadgt_gr_u;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS;

create or replace force view apexframework.vd_afw_12_lien_group_utils
(
  seqnc
 ,ref_group
 ,ref_group_indic_acces
 ,ref_group_domn
 ,ref_group_prodt
 ,ref_group_indic_non_modfb
 ,ref_utils
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_group_utils_lie
 ,ref_group_utils_lie_formt
 ,ref_group_lie_indic_acces
 ,ref_group_lie_domn
 ,ref_group_lie_prodt
 ,dnr_ref_prodt
 ,ref_domn
)
as
  select seqnc
        ,ref_group
        , (select indic_acces_globl
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group)
           ref_group_indic_acces
        , (select ref_domn
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group)
           ref_group_domn
        , (select ref_prodt
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group)
           ref_group_prodt
        ,case afw_12_group_utils_pkg.obten_code (lgu.ref_group) when 'SUPER_UTILS' then 'O' when 'AUTOR_CONXN_DERV' then 'O' else 'N' end
           ref_group_indic_non_modfb
        ,ref_utils
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_group_utils_lie
        , (select gu.nom
             from vd_afw_12_group_utils gu
            where gu.seqnc = lgu.ref_group_utils_lie)
           ref_group_utils_lie_formt
        , (select indic_acces_globl
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group_utils_lie)
           ref_group_lie_indic_acces
        , (select ref_domn
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group_utils_lie)
           ref_group_lie_domn
        , (select ref_prodt
             from vd_i_afw_12_group_utils
            where seqnc = lgu.ref_group_utils_lie)
           ref_group_lie_prodt
        ,dnr_ref_prodt
        ,ref_domn
    from vd_i_afw_12_lien_group_utils lgu;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC;

create or replace force view apexframework.vd_afw_12_lien_struc
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
    from vd_i_afw_12_lien_struc;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC;

create or replace force view apexframework.vd_afw_12_membr_struc
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
 ,date_expir_utils
 ,ref_struc_admin
 ,ref_respn_struc_admin
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
        , (select    nom
                  || ', '
                  || prenm
             from vd_i_afw_12_utils
            where seqnc = mes.ref_utils)
           ref_utils_formt
        , (select date_expir
             from vd_i_afw_12_utils
            where seqnc = mes.ref_utils)
           date_expir_utils
        ,ref_struc_admin
        , (select ref_respn
             from vd_i_afw_12_struc_admin
            where seqnc = mes.ref_struc_admin)
           ref_respn_struc_admin
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_membr_struc mes;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP;

create or replace force view apexframework.vd_afw_12_servr_ldap
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
    from vd_i_afw_12_servr_ldap;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_SESN;

create or replace force view apexframework.vd_afw_12_sesn
(
  id_sesn
 ,app_user
 ,ref_lang
)
as
  select id_sesn
        ,app_user
        ,ref_lang
    from vd_i_afw_12_sesn;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_STAT;

create or replace force view apexframework.vd_afw_12_stat
(
  seqnc
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,ref_group_stat
 ,ref_group_stat_formt
 ,ordre
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,indic_initl
 ,indic_stat_utils
)
as
  select seqnc
        ,ref_struc_aplic
        , (select code
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = s.ref_struc_aplic)
           ref_struc_aplic_formt
        ,ref_group_stat
        , (select code
             from vd_i_afw_12_group_stat gs
            where gs.seqnc = s.ref_group_stat)
           ref_group_stat_formt
        ,ordre
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,indic_initl
        ,indic_stat_utils
    from vd_i_afw_12_stat s;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN;

create or replace force view apexframework.vd_afw_12_struc_admin
(
  seqnc
 ,nom
 ,indic_deft
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_type_struc
 ,ref_type_struc_formt
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
        , (select nom
             from vd_i_afw_12_type_struc
            where seqnc = str.ref_type_struc)
           ref_type_struc_formt
        ,ref_respn
        ,debut_efect
        ,fin_efect
        ,ref_domn
    from vd_i_afw_12_struc_admin str;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC;

create or replace force view apexframework.vd_afw_12_struc_aplic
(
  seqnc
 ,nom
 ,descr
 ,ref_prodt
 ,ref_prodt_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,code
 ,ref_mesg_err_suprs
 ,ref_code_mesg_err_suprs
 ,indic_extra_tout
 ,tail_tabl_extra
 ,nom_struc_acces_don
 ,ref_page_liste
 ,ref_page_forml
 ,nom_packg
 ,indic_dispn_docmn
 ,indic_stat_exist_formt
 ,indic_page_liee_exist_formt
 ,indic_evenm_notfb_exist_formt
 ,indic_atrib_destn_exist_formt
 ,nom_schem
 ,icon_font_awesm
)
as
  select sa.seqnc
        ,sa.nom
        ,sa.descr
        ,sa.ref_prodt
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_11_prodt
            where seqnc = sa.ref_prodt)
           ref_prodt_formt
        ,sa.date_creat
        ,sa.utils_creat
        ,sa.date_modfc
        ,sa.utils_modfc
        ,sa.code
        ,sa.ref_mesg_err_suprs
        , (select m.numr_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = sa.ref_mesg_err_suprs)
           ref_code_mesg_err_suprs
        ,indic_extra_tout
        ,tail_tabl_extra
        ,nom_struc_acces_don
        ,ref_page_liste
        ,ref_page_forml
        ,nom_packg
        ,indic_dispn_docmn
        ,case (select 1
                 from vd_i_afw_12_stat s
                where     s.ref_struc_aplic = sa.seqnc
                      and rownum < 2)
           when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
           else null
         end
           indic_stat_exist_formt
        ,case (select 1
                 from vd_i_afw_13_page p
                where     p.ref_struc_aplic = sa.seqnc
                      and rownum < 2)
           when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
           else null
         end
           indic_page_liee_exist_formt
        ,case (select 1
                 from vd_i_afw_01_evenm_notfb en
                where     en.ref_struc_aplic = sa.seqnc
                      and rownum < 2)
           when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
           else null
         end
           indic_evenm_notfb_exist_formt
        ,case (select 1
                 from vd_i_afw_12_atrib_struc_aplic asa
                where     asa.ref_struc_aplic = sa.seqnc
                      and asa.indic_destn = 'O'
                      and rownum < 2)
           when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
           else null
         end
           indic_atrib_destn_exist_formt
        ,nom_schem
        ,icon_font_awesm
    from vd_i_afw_12_struc_aplic sa;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN;

create or replace force view apexframework.vd_afw_12_struc_aplic_destn
(
  seqnc
 ,ref_struc_aplic
 ,ref_struc_aplic_code
 ,ref_destn
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_struc_aplic
        , (select s.code
             from vd_i_afw_12_struc_aplic s
            where s.seqnc = sd.ref_struc_aplic)
           ref_struc_aplic_code
        ,ref_destn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from vd_i_afw_12_struc_aplic_destn sd;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG;

create or replace force view apexframework.vd_afw_12_struc_aplic_lang
(
  seqnc
 ,ref_struc_aplic
 ,adjec_demns
 ,nom
 ,descr
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_struc_aplic
        ,adjec_demns
        ,nom
        ,descr
        ,ref_lang
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_struc_aplic_lang;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_TUTRL;

create or replace force view apexframework.vd_afw_12_tutrl
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
    from vd_i_afw_12_tutrl tu;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC;

create or replace force view apexframework.vd_afw_12_type_struc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_domn
 ,ref_domn_formt
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
        ,ref_domn
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_12_domn
            where seqnc = tst.ref_domn)
           ref_prodt_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_type_struc tst;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_UTILS;

create or replace force view apexframework.vd_afw_12_utils
(
  seqnc
 ,nom
 ,prenm
 ,courl
 ,nom_formt
 ,nom_formt_comnc
 ,code_utils
 ,mot_passe
 ,date_expir
 ,indic_verl
 ,indic_verl_formt
 ,indic_chang_mot_passe
 ,indic_chang_mot_passe_formt
 ,indic_actif
 ,indic_actif_formt
 ,dernr_prodt_acces
 ,dernr_domn_acces
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_dv_compl_maxm
 ,code_utils_base_don
 ,parmt_authe_exter_afw
)
as
  select seqnc
        ,nom
        ,prenm
        ,courl
        , (   nom
           || ', '
           || prenm)
           nom_formt
        , (   prenm
           || ' '
           || nom)
           nom_formt_comnc
        ,code_utils
        ,mot_passe
        ,date_expir
        ,indic_verl
        ,decode (indic_verl, 'O', '<span class="ui-button-icon-primary ui-icon fff-icon-stop"></span>', null) indic_verl_formt
        ,indic_chang_mot_passe
        ,decode (indic_chang_mot_passe, 'O', 'X', null) indic_chang_mot_passe_formt
        ,indic_actif
        ,decode (indic_actif, 'O', '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>', null) indic_actif_formt
        ,dernr_prodt_acces
        ,dernr_domn_acces
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_dv_compl_maxm
        ,code_utils_base_don
        ,parmt_authe_exter_afw
    from vd_i_afw_12_utils;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR;

create or replace force view apexframework.vd_afw_12_utils_avatr
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
    from vd_i_afw_12_utils_avatr;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT;

create or replace force view apexframework.vd_afw_13_condt_exect
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
    from vd_i_afw_13_condt_exect;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB;

create or replace force view apexframework.vd_afw_13_condt_piltb
(
  seqnc
 ,ref_page
 ,ref_page_apex
 ,code
 ,nom
 ,descr
 ,condt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_page_item_focus
)
as
  select seqnc
        ,ref_page
        , (select numr_apex
             from vd_i_afw_13_page p
            where p.seqnc = cp.ref_page)
           ref_page_apex
        ,code
        ,nom
        ,descr
        ,condt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_page_item_focus
    from vd_i_afw_13_condt_piltb cp;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL;

create or replace force view apexframework.vd_afw_13_dosr_virtl
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
    from vd_i_afw_13_dosr_virtl;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL;

create or replace force view apexframework.vd_afw_13_empla_dosr_virtl
(
  seqnc
 ,ref_dosr_virtl
 ,ref_versn
 ,empla
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
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
    from vd_i_afw_13_empla_dosr_virtl;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL;

create or replace force view apexframework.vd_afw_13_etape_tutrl
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
    from vd_i_afw_13_etape_tutrl;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC;

create or replace force view apexframework.vd_afw_13_formt_resrc
(
  seqnc
 ,code
 ,nom
 ,ref_prodt
 ,descr
 ,ref_type_fichr
 ,ref_type_fichr_formt
 ,ref_type_fichr_code
 ,largr
 ,hautr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,ref_prodt
        ,descr
        ,ref_type_fichr
        , (select nom
             from vd_i_afw_13_type_fichr
            where seqnc = ref_type_fichr)
        , (select code
             from vd_i_afw_13_type_fichr
            where seqnc = ref_type_fichr)
        ,largr
        ,hautr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_formt_resrc;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR;

create or replace force view apexframework.vd_afw_13_insta_prefr
(
  seqnc
 ,ref_prefr
 ,ref_utils
 ,ref_utils_formt
 ,ref_sesn
 ,ref_sesn_formt
 ,valr
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prefr
        ,ref_utils
        , (select code_utils
             from vd_afw_12_utils u
            where u.seqnc = ref_utils)
           ref_utils_formt
        ,ref_sesn
        , (select app_user
             from afw_12_sesn s
            where s.id_sesn = ref_sesn)
           ref_sesn_formt
        ,valr
        ,ref_struc_aplic
        , (select nom
             from vd_afw_12_struc_aplic tc
            where tc.seqnc = ref_struc_aplic)
           ref_contx_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_insta_prefr;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_INSTA_REGN_PILTB;

create or replace force view apexframework.vd_afw_13_insta_regn_piltb
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
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
        ,afw_12_utils_pkg.obten_nom_formt (ref_utils) ref_utils_formt
        ,ref_regn_piltb
        ,indic_regn_activ
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_insta_regn_piltb;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB;

create or replace force view apexframework.vd_afw_13_lien_condt_piltb
(
  seqnc
 ,ref_page_item
 ,ref_page_item_formt
 ,ref_condt_piltb
 ,indic_lectr_seul
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_afich
)
as
  select seqnc
        ,ref_page_item
        , (select nom_apex
             from vd_i_afw_13_page_item
            where seqnc = lcp.ref_page_item)
           ref_page_item_formt
        ,ref_condt_piltb
        ,indic_lectr_seul
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_afich
    from vd_i_afw_13_lien_condt_piltb lcp;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT;

create or replace force view apexframework.vd_afw_13_liste_navgt
(
  seqnc
 ,ref_page
 ,libl
 ,aplic
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
 ,css_icone_boots
 ,ref_domn
)
as
  select seqnc
        ,ref_page
        ,libl
        ,aplic
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
        ,css_icone_boots
        ,ref_domn
    from vd_i_afw_13_liste_navgt;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_MENU;

create or replace force view apexframework.vd_afw_13_menu
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_prodt
 ,ref_prodt_formt
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
        ,ref_prodt
        , (select    p.code
                  || ' - '
                  || p.nom
             from vd_i_afw_11_prodt p
            where p.seqnc = m.ref_prodt)
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_menu m;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_MIME_TYPE;

create or replace force view apexframework.vd_afw_13_mime_type
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
    from vd_i_afw_13_mime_type;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_NAVGT;

create or replace force view apexframework.vd_afw_13_navgt
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
    from vd_i_afw_13_navgt
   where     ref_id_sesn = afw_07_util_pkg.nv ('SESSION')
         and ref_fil_arian = afw_04_fil_arian_pkg.obten_fa_courn ()
  with check option;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN;

create or replace force view apexframework.vd_afw_13_navgt_elemn
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
    from vd_i_afw_13_navgt_elemn ne
   where exists
           (select 1
              from vd_afw_13_navgt n
             where n.seqnc = ne.ref_navgt)
  with check option;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC;

create or replace force view apexframework.vd_afw_13_ocurn_resrc
(
  seqnc
 ,ref_resrc
 ,nom
 ,ref_formt_resrc
 ,ref_formt_resrc_formt
 ,ref_mime_type
 ,ref_mime_type_formt
 ,nom_physq
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,cordn_x_debut
 ,cordn_y_debut
 ,largr_prepn
 ,hautr_prepn
 ,ref_dosr_virtl
 ,ref_dosr_virtl_formt
 ,ref_versn
 ,ref_versn_formt
)
as
  select seqnc
        ,ref_resrc
        ,nom
        ,ref_formt_resrc
        , (select nom
             from vd_i_afw_13_formt_resrc fr
            where fr.seqnc = ocr.ref_formt_resrc)
        ,ref_mime_type
        , (select    mime_type
                  || ' ('
                  || ext
                  || ')'
             from vd_i_afw_13_mime_type mt
            where mt.seqnc = ocr.ref_mime_type)
        ,nom_physq
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,cordn_x_debut
        ,cordn_y_debut
        ,largr_prepn
        ,hautr_prepn
        ,ref_dosr_virtl
        , (select nom
             from vd_i_afw_13_dosr_virtl dv
            where dv.seqnc = ocr.ref_dosr_virtl)
           ref_dosr_virtl_formt
        ,ref_versn
        , (select nom_formt
             from vd_afw_11_versn v
            where v.seqnc = ocr.ref_versn)
           ref_versn_formt
    from vd_i_afw_13_ocurn_resrc ocr;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_OPERT;

create or replace force view apexframework.vd_afw_13_opert
(
  seqnc
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,ref_prodt_formt
 ,code
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
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_11_prodt
            where seqnc = ope.ref_prodt)
           ref_prodt_formt
        ,code
        ,ref_fonct
    from vd_i_afw_13_opert ope;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO;

create or replace force view apexframework.vd_afw_13_opert_optio
(
  seqnc
 ,ref_opert
 ,ref_opert_formt
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
        , (select o.nom
             from vd_afw_13_opert o
            where o.seqnc = ref_opert)
        ,code
        ,nom
        ,descr
        ,dnr_ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,prepn
    from vd_i_afw_13_opert_optio;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_PAGE;

create or replace force view apexframework.vd_afw_13_page
(
  seqnc
 ,numr_apex
 ,nom
 ,nom_formt
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_aplic
 ,app_id_formt
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,indic_prise_charg_afw01
 ,indic_prise_charg_afw04
 ,ref_mesg_suprs_specf
 ,ref_code_mesg_suprs_specf
 ,indic_prise_charg_afw19
 ,indic_prise_charg_afw13_navgt
 ,indic_prise_charg_afw13_confr
 ,indic_prise_charg_afw18
 ,indic_prise_charg_afw14_popup
 ,ref_page_rechr
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
 ,liste_fonct
)
as
  select seqnc
        ,numr_apex
        ,nom
        ,   numr_apex
         || ' - '
         || nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_aplic
        , (select p.numr_aplic_apex
             from vd_i_afw_11_aplic p
            where p.seqnc = pag.ref_aplic)
           app_id_formt
        ,ref_struc_aplic
        , (select nom
             from vd_i_afw_12_struc_aplic
            where seqnc = pag.ref_struc_aplic)
           ref_struc_aplic_formt
        ,indic_prise_charg_afw01
        ,indic_prise_charg_afw04
        ,ref_mesg_suprs_specf
        , (select m.numr_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = pag.ref_mesg_suprs_specf)
           ref_code_mesg_suprs_specf
        ,indic_prise_charg_afw19
        ,indic_prise_charg_afw13_navgt
        ,indic_prise_charg_afw13_confr
        ,indic_prise_charg_afw18
        ,indic_prise_charg_afw14_popup
        ,ref_page_rechr
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
        ,afw_12_fonct_pkg.obten_liste_fonct (pag.seqnc)
    from vd_i_afw_13_page pag;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_PAGE_IR;

create or replace force view apexframework.vd_afw_13_page_ir
(
  seqnc
 ,libl_regn
 ,id_apex
 ,ref_page
 ,app_id_formt
 ,app_page_id_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,largr_deft
 ,unite_mesr_largr_deft
 ,code
 ,indic_forcr_ajust_page
 ,nombr_page_largr
)
as
  select seqnc
        ,libl_regn
        ,id_apex
        ,ref_page
        , (select pag.app_id_formt
             from vd_afw_13_page pag
            where pag.seqnc = pir.ref_page)
           app_id_formt
        , (select pag.numr_apex
             from vd_afw_13_page pag
            where pag.seqnc = pir.ref_page)
           app_page_id_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,largr_deft
        ,unite_mesr_largr_deft
        ,code
        ,indic_forcr_ajust_page
        ,nombr_page_largr
    from vd_i_afw_13_page_ir pir;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM;

create or replace force view apexframework.vd_afw_13_page_item
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
    from vd_i_afw_13_page_item pi;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG;

create or replace force view apexframework.vd_afw_13_page_item_lang
(
  seqnc
 ,ref_page_item
 ,nom
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
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
    from vd_i_afw_13_page_item_lang;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_PAGE_LANG;

create or replace force view apexframework.vd_afw_13_page_lang
(
  seqnc
 ,ref_page
 ,nom
 ,ref_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
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
    from vd_i_afw_13_page_lang;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT;

create or replace force view apexframework.vd_afw_13_page_prefr_navgt
(
  seqnc
 ,ref_page
 ,ref_page_ir
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_page_ir_page_formt
 ,ref_page_ir_formt
)
as
  select seqnc
        ,ref_page
        ,ref_page_ir
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        , (select    numr_apex
                  || ' - '
                  || nom
             from vd_afw_13_page p
            where p.seqnc = (select ref_page
                               from vd_afw_13_page_ir pi
                              where pi.seqnc = ppn.ref_page_ir))
           ref_page_ir_page_formt
        , (select libl_regn
             from vd_afw_13_page_ir pi
            where pi.seqnc = ppn.ref_page_ir)
           ref_page_ir_formt
    from vd_i_afw_13_page_prefr_navgt ppn;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_REGN_PILTB;

create or replace force view apexframework.vd_afw_13_regn_piltb
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
 ,ref_dv_type_regn_piltb_formt
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
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_regn_piltb)
    from vd_i_afw_13_regn_piltb;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG;

create or replace force view apexframework.vd_afw_13_regn_piltb_lang
(
  seqnc
 ,ref_regn_piltb
 ,contn
 ,ref_lang
 ,ref_lang_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_regn_piltb
        ,contn
        ,ref_lang
        , (select l.nom
             from vd_afw_01_lang l
            where l.seqnc = ref_lang)
           ref_lang_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_regn_piltb_lang;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_TUTRL;

create or replace force view apexframework.vd_afw_13_tutrl
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
    from vd_i_afw_13_tutrl;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR;

create or replace force view apexframework.vd_afw_13_type_fichr
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
    from vd_i_afw_13_type_fichr;


DROP VIEW APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR;

create or replace force view apexframework.vd_afw_14_detl_domn_valr
(
  seqnc
 ,code_valr
 ,valr
 ,ref_domn_valr
 ,ref_code_domn_valr_formt
 ,seqnc_presn
 ,date_debut_efect
 ,date_fin_efect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,valr_court
 ,valr_organ
 ,ref_prodt_dv
)
as
  select seqnc
        ,code_valr
        ,valr
        ,ref_domn_valr
        , (select code
             from vd_i_afw_14_domn_valr
            where seqnc = ref_domn_valr)
           ref_code_domn_valr_formt
        ,seqnc_presn
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,valr_court
        ,valr_organ
        , (select ref_prodt
             from vd_i_afw_14_domn_valr
            where seqnc = ref_domn_valr)
           ref_prodt_dv
    from vd_i_afw_14_detl_domn_valr;


DROP VIEW APEXFRAMEWORK.VD_AFW_14_FORMT;

create or replace force view apexframework.vd_afw_14_formt
(
  seqnc
 ,libl
 ,defnt
 ,type_don
 ,type_don_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,indic_formt_orcl
 ,indic_unite_inclu
)
as
  select seqnc
        ,libl
        ,defnt
        ,type_don
        ,decode (type_don,  'D', 'Date',  'NE', 'Numérique entier',  'ND', 'Numérique décimal',  'V', 'Alphanumérique',  null) type_don_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,indic_formt_orcl
        ,indic_unite_inclu
    from vd_i_afw_14_formt;


DROP VIEW APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR;

create or replace force view apexframework.vd_afw_14_type_domn_valr
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
    from vd_i_afw_14_type_domn_valr;


DROP VIEW APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT;

create or replace force view apexframework.vd_afw_17_compt_axiat
(
  seqnc
 ,code
 ,nom
 ,descr
 ,numr
 ,ref_profl_courl
 ,ref_profl_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_domn_formt
 ,ref_publc_page_garde
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,numr
        ,ref_profl_courl
        , (select pc.nom
             from vd_i_afw_17_profl_courl pc
            where pc.seqnc = ca.ref_profl_courl)
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        , (select d.nom
             from vd_i_afw_12_domn d
            where d.seqnc = ca.ref_domn)
        ,ref_publc_page_garde
    from vd_i_afw_17_compt_axiat ca;


DROP VIEW APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI;

create or replace force view apexframework.vd_afw_17_compt_twili
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
    from vd_i_afw_17_compt_twili;


DROP VIEW APEXFRAMEWORK.VD_AFW_17_COURL;

create or replace force view apexframework.vd_afw_17_courl
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
 ,indic_formt_html_formt
 ,authe_methd
 ,authe_usagr
 ,authe_mdp
 ,corps
 ,nombr_tentv
 ,nombr_tentv_max
 ,sens
 ,stat_soums
 ,stat_soums_formt
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
        ,case indic_formt_html when 'O' then 'Oui' when 'N' then 'Non' end indic_formt_html_formt
        ,authe_methd
        ,authe_usagr
        ,authe_mdp
        ,corps
        ,nombr_tentv
        ,nombr_tentv_max
        ,sens
        ,stat_soums
        ,case stat_soums when 'ENVOY' then 'Envoyé' when 'A_ENVOY' then 'À envoyé' end stat_soums_formt
    from vd_i_afw_17_courl;


DROP VIEW APEXFRAMEWORK.VD_AFW_17_COURL_DESTN;

create or replace force view apexframework.vd_afw_17_courl_destn
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
    from vd_i_afw_17_courl_destn;


DROP VIEW APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT;

create or replace force view apexframework.vd_afw_17_piece_telcp_axiat
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


DROP VIEW APEXFRAMEWORK.VD_AFW_17_PROFL_COURL;

create or replace force view apexframework.vd_afw_17_profl_courl
(
  seqnc
 ,code
 ,servr_sortn
 ,port_sortn
 ,authe_mdp_sortn
 ,authe_methd_sortn
 ,authe_usagr_sortn
 ,indic_ssl_sortn
 ,servr_entra
 ,port_entra
 ,authe_mdp_entra
 ,authe_methd_entra
 ,authe_usagr_entra
 ,indic_ssl_entra
 ,domn
 ,nom_envoy
 ,adres_envoy
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_domn_formt
 ,nom
 ,descr
 ,protc_entra
 ,adres_suprt
 ,nom_suprt
 ,indic_ajout_suprt_cci
)
as
  select seqnc
        ,code
        ,servr_sortn
        ,port_sortn
        ,authe_mdp_sortn
        ,authe_methd_sortn
        ,authe_usagr_sortn
        ,indic_ssl_sortn
        ,servr_entra
        ,port_entra
        ,authe_mdp_entra
        ,authe_methd_entra
        ,authe_usagr_entra
        ,indic_ssl_entra
        ,domn
        ,nom_envoy
        ,adres_envoy
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        , (select d.nom
             from vd_afw_12_domn d
            where d.seqnc = pc.ref_domn)
           ref_domn_formt
        ,nom
        ,descr
        ,protc_entra
        ,adres_suprt
        ,nom_suprt
        ,indic_ajout_suprt_cci
    from vd_i_afw_17_profl_courl pc;


DROP VIEW APEXFRAMEWORK.VD_AFW_17_SMS_TWILI;

create or replace force view apexframework.vd_afw_17_sms_twili
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
    from vd_i_afw_17_sms_twili;


DROP VIEW APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA;

create or replace force view apexframework.vd_afw_17_sms_twili_entra
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
    from vd_i_afw_17_sms_twili_entra;


DROP VIEW APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT;

create or replace force view apexframework.vd_afw_17_telcp_axiat
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
    from vd_i_afw_17_telcp_axiat;


DROP VIEW APEXFRAMEWORK.VD_AFW_19_BOUTN;

create or replace force view apexframework.vd_afw_19_boutn
(
  seqnc
 ,ref_lang
 ,ref_dispn_fonct
 ,item_subst
 ,libl
 ,id_templ_boutn
 ,templ_boutn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_actif
 ,ref_dv_type_mesg_aide_contx
 ,ref_code_type_mesg_aide_contx
 ,mesg_aide_contx
)
as
  select seqnc
        ,ref_lang
        ,ref_dispn_fonct
        ,item_subst
        ,libl
        ,id_templ_boutn
        ,templ_boutn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_actif
        ,ref_dv_type_mesg_aide_contx
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_mesg_aide_contx)
        ,mesg_aide_contx
    from vd_i_afw_19_boutn;


DROP VIEW APEXFRAMEWORK.VD_AFW_19_CLE;

create or replace force view apexframework.vd_afw_19_cle
(
  seqnc
 ,ref_dispn_fonct
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
 ,indic_actif
)
as
  select seqnc
        ,ref_dispn_fonct
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
        ,indic_actif
    from vd_i_afw_19_cle;


DROP VIEW APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT;

create or replace force view apexframework.vd_afw_19_dispn_fonct
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
    from vd_i_afw_19_dispn_fonct;


DROP VIEW APEXFRAMEWORK.VD_AFW_19_FONCT;

create or replace force view apexframework.vd_afw_19_fonct
(
  seqnc
 ,code
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom_formt
 ,descr_formt
 ,titre_atrib1
 ,titre_atrib2
 ,titre_atrib3
 ,titre_atrib4
 ,titre_atrib5
 ,ref_dv_type_atrib1
 ,ref_dv_type_atrib1_formt
 ,ref_code_type_atrib1_formt
 ,ref_dv_type_atrib2
 ,ref_dv_type_atrib2_formt
 ,ref_code_type_atrib2_formt
 ,ref_dv_type_atrib3
 ,ref_dv_type_atrib3_formt
 ,ref_code_type_atrib3_formt
 ,ref_dv_type_atrib4
 ,ref_dv_type_atrib4_formt
 ,ref_code_type_atrib4_formt
 ,ref_dv_type_atrib5
 ,ref_dv_type_atrib5_formt
 ,ref_code_type_atrib5_formt
 ,valr_deft_atrib1
 ,valr_deft_atrib2
 ,valr_deft_atrib3
 ,valr_deft_atrib4
 ,valr_deft_atrib5
 ,ref_dv_type_actio
 ,ref_dv_type_actio_formt
 ,ref_code_type_actio_formt
 ,expre_actio
 ,ref_dv_type_expre
 ,ref_dv_type_expre_formt
 ,ref_code_type_expre_formt
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
        ,afw_19_fonct_pkg.obten_nom_lang (seqnc) nom_formt
        ,afw_19_fonct_pkg.obten_descr_lang (seqnc) descr_formt
        ,titre_atrib1
        ,titre_atrib2
        ,titre_atrib3
        ,titre_atrib4
        ,titre_atrib5
        ,ref_dv_type_atrib1
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib1) ref_dv_type_atrib1_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib1) ref_code_type_atrib1_formt
        ,ref_dv_type_atrib2
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib2) ref_dv_type_atrib2_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib2) ref_code_type_atrib2_formt
        ,ref_dv_type_atrib3
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib3) ref_dv_type_atrib3_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib3) ref_code_type_atrib3_formt
        ,ref_dv_type_atrib4
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib4) ref_dv_type_atrib4_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib4) ref_code_type_atrib4_formt
        ,ref_dv_type_atrib5
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib5) ref_dv_type_atrib5_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_atrib5) ref_code_type_atrib5_formt
        ,valr_deft_atrib1
        ,valr_deft_atrib2
        ,valr_deft_atrib3
        ,valr_deft_atrib4
        ,valr_deft_atrib5
        ,ref_dv_type_actio
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_actio) ref_dv_type_actio_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_actio) ref_code_type_actio_formt
        ,expre_actio
        ,ref_dv_type_expre
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_expre) ref_dv_type_expre_formt
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_expre) ref_code_type_expre_formt
        ,indic_afect_input_html
        ,indic_prevn_actio_deft
        ,indic_cle
        ,indic_boutn
        ,condt_prise_charg
    from vd_i_afw_19_fonct;


DROP VIEW APEXFRAMEWORK.VD_AFW_19_FONCT_LANG;

create or replace force view apexframework.vd_afw_19_fonct_lang
(
  seqnc
 ,nom
 ,ref_lang
 ,ref_lang_formt
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
        ,afw_01_lang_pkg.obten_lang_formt (ref_lang
                                          ,afw_01_lang_pkg.obten_lang_sesn)
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_fonct
    from vd_i_afw_19_fonct_lang;


DROP VIEW APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT;

create or replace force view apexframework.vd_afw_19_specf_fonct
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
    from vd_i_afw_19_specf_fonct;


DROP VIEW APEXFRAMEWORK.VD_AFW_20_DEPLM;

create or replace force view apexframework.vd_afw_20_deplm
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
    from vd_i_afw_20_deplm;


DROP VIEW APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN;

create or replace force view apexframework.vd_afw_20_detl_docmn
(
  seqnc
 ,ref_docmn
 ,ref_docmn_formt
 ,ref_sectn_docmn
 ,ref_sectn_docmn_formt
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
        ,afw_20_docmn_pkg.formt_propr_docmn (dd.ref_docmn)
        ,ref_sectn_docmn
        , (select nom
             from vd_i_afw_20_sectn_docmn sd
            where sd.seqnc = dd.ref_sectn_docmn)
        ,ref_detl_docmn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,valr
    from vd_i_afw_20_detl_docmn dd;


DROP VIEW APEXFRAMEWORK.VD_AFW_20_MODL;

create or replace force view apexframework.vd_afw_20_modl
(
  seqnc
 ,ref_dv_type_modl
 ,ref_dv_type_modl_formt
 ,ref_dv_type_modl_code
 ,ref_versn
 ,ref_modl
 ,ref_modl_formt
 ,nom_organ
 ,numr_surch
 ,indic_agreg
 ,indic_agreg_formt
 ,indic_pipln
 ,indic_pipln_formt
 ,indic_detrm
 ,indic_detrm_formt
 ,indic_authid_curnt_utils
 ,indic_authid_curnt_utils_formt
 ,indic_publc
 ,indic_publc_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,versn_bd_aplic
)
as
  select seqnc
        ,ref_dv_type_modl
        ,afw_14_domn_valr_pkg.obten_valr (m.ref_dv_type_modl)
        ,afw_14_domn_valr_pkg.obten_code (m.ref_dv_type_modl)
        ,ref_versn
        ,ref_modl
        , (select nom_organ
             from vd_i_afw_20_modl n
            where n.seqnc = m.ref_modl)
           ref_modl_formt
        ,nom_organ
        ,numr_surch
        ,indic_agreg
        ,case indic_agreg when 'O' then 'Oui' else 'Non' end indic_agreg_formt
        ,indic_pipln
        ,case indic_pipln when 'O' then 'Oui' else 'Non' end indic_pipln_formt
        ,indic_detrm
        ,case indic_detrm when 'O' then 'Oui' else 'Non' end indic_detrm_formt
        ,indic_authid_curnt_utils
        ,case indic_authid_curnt_utils when 'O' then 'Oui' else 'Non' end indic_authid_curnt_utils_formt
        ,indic_publc
        ,case indic_publc when 'O' then 'Oui' else 'Non' end indic_publc_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,versn_bd_aplic
    from vd_i_afw_20_modl m;


DROP VIEW APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP;

create or replace force view apexframework.vd_afw_20_modl_excep
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
    from vd_i_afw_20_modl_excep;


DROP VIEW APEXFRAMEWORK.VD_AFW_20_MODL_PARMT;

create or replace force view apexframework.vd_afw_20_modl_parmt
(
  seqnc
 ,ref_modl
 ,nom_organ
 ,ref_dv_type_don
 ,ref_dv_type_don_formt
 ,postn
 ,valr_deft
 ,sens
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_publc
 ,indic_publc_formt
)
as
  select seqnc
        ,ref_modl
        ,nom_organ
        ,ref_dv_type_don
        ,afw_14_domn_valr_pkg.obten_valr (m.ref_dv_type_don)
        ,postn
        ,valr_deft
        ,sens
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_publc
        ,case indic_publc when 'O' then 'Oui' else 'Non' end indic_publc_formt
    from vd_i_afw_20_modl_parmt m;


DROP VIEW APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN;

create or replace force view apexframework.vd_afw_20_sectn_docmn
(
  seqnc
 ,ref_dv_type_sectn
 ,ref_dv_type_sectn_formt
 ,ref_sectn_docmn
 ,ref_sectn_docmn_formt
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
        ,afw_14_domn_valr_pkg.obten_valr (sc.ref_dv_type_sectn)
        ,ref_sectn_docmn
        , (select nom
             from vd_i_afw_20_sectn_docmn sc2
            where sc2.seqnc = sc.ref_sectn_docmn)
        ,ref_struc_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom
        ,titre
        ,descr
        ,ref_formt
    from vd_i_afw_20_sectn_docmn sc;


DROP VIEW APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE;

create or replace force view apexframework.vd_afw_21_plugn_arbre
(
  seqnc
 ,code
 ,enonc_pre_reqt
 ,nom_table
 ,coln_titre
 ,coln_type
 ,coln_valr
 ,coln_aide_insta
 ,coln_titre_aide_insta
 ,coln_lien
 ,coln_id
 ,coln_id_parnt
 ,enonc_condt
 ,indic_comnc_par_racn
 ,indic_comnc_par_coln_parnt_nul
 ,enonc_condt_comnc_par
 ,enonc_trier_par
 ,indic_renmr
 ,indic_deplc
 ,largr_regn_arbre
 ,hautr_regn_arbre
 ,ref_plugn_arbre_noeud
 ,image_sprit
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_icone_noeud
 ,ref_formt_resrc
 ,ref_resrc_comps
 ,obten_json_arbre_nombr_niv
 ,obten_json_noeud_nombr_niv
 ,mode_cache
 ,indic_charg_progr
 ,nom_procd_glisr_elemn_arbre
 ,nom_procd_depsr_elemn_arbre
 ,ref_prodt
)
as
  select seqnc
        ,code
        ,enonc_pre_reqt
        ,nom_table
        ,coln_titre
        ,coln_type
        ,coln_valr
        ,coln_aide_insta
        ,coln_titre_aide_insta
        ,coln_lien
        ,coln_id
        ,coln_id_parnt
        ,enonc_condt
        ,indic_comnc_par_racn
        ,indic_comnc_par_coln_parnt_nul
        ,enonc_condt_comnc_par
        ,enonc_trier_par
        ,indic_renmr
        ,indic_deplc
        ,largr_regn_arbre
        ,hautr_regn_arbre
        ,ref_plugn_arbre_noeud
        ,image_sprit
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_icone_noeud
        ,ref_formt_resrc
        ,ref_resrc_comps
        ,obten_json_arbre_nombr_niv
        ,obten_json_noeud_nombr_niv
        ,mode_cache
        ,indic_charg_progr
        ,nom_procd_glisr_elemn_arbre
        ,nom_procd_depsr_elemn_arbre
        ,ref_prodt
    from vd_i_afw_21_plugn_arbre;


DROP VIEW APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD;

create or replace force view apexframework.vd_afw_21_plugn_arbre_noeud
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_plugn_arbre
 ,indic_selct_noeud
 ,indic_selct_noeud_formt
 ,indic_ouvri_noeud
 ,indic_ouvri_noeud_formt
 ,indic_fermr_noeud
 ,indic_fermr_noeud_formt
 ,indic_creer_noeud
 ,indic_creer_noeud_formt
 ,indic_suprm_noeud
 ,indic_suprm_noeud_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_resrc
 ,ref_ocurn_resrc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_plugn_arbre
        ,indic_selct_noeud
        , (decode (indic_selct_noeud,  'O', 'Oui',  'N', 'Non')) indic_selct_noeud_formt
        ,indic_ouvri_noeud
        , (decode (indic_ouvri_noeud,  'O', 'Oui',  'N', 'Non')) indic_ouvri_noeud_formt
        ,indic_fermr_noeud
        , (decode (indic_fermr_noeud,  'O', 'Oui',  'N', 'Non')) indic_fermr_noeud_formt
        ,indic_creer_noeud
        , (decode (indic_creer_noeud,  'O', 'Oui',  'N', 'Non')) indic_creer_noeud_formt
        ,indic_suprm_noeud
        , (decode (indic_suprm_noeud,  'O', 'Oui',  'N', 'Non')) indic_suprm_noeud_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_resrc
        ,ref_ocurn_resrc
    from vd_i_afw_21_plugn_arbre_noeud;


DROP VIEW APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND;

create or replace force view apexframework.vd_afw_21_plugn_calnd
(
  seqnc
 ,enonc_pre_reqt
 ,ref_dv_vue_deft
 ,conct_propr_entet_gauch
 ,conct_propr_entet_gauch_formt
 ,conct_propr_entet_centr
 ,conct_propr_entet_centr_formt
 ,conct_propr_entet_droit
 ,conct_propr_entet_droit_formt
 ,indic_evenm_modfb
 ,nom_table
 ,coln_titre
 ,coln_descr
 ,coln_type
 ,coln_aide_insta
 ,coln_lien
 ,coln_indic_journ_compl
 ,coln_indic_evenm_modfb
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
 ,coln_agend
 ,coln_ident
 ,coln_date_journ_compl
 ,coln_date_fin_journ_compl
 ,nombr_mints_inter
 ,heure_debut_norml
 ,heure_fin_norml
 ,heure_debut_exten
 ,heure_fin_exten
 ,ref_prodt
)
as
  select seqnc
        ,enonc_pre_reqt
        ,ref_dv_vue_deft
        ,conct_propr_entet_gauch
        ,afw_21_plugn_calnd_pkg.obten_prop_entet_formt (conct_propr_entet_gauch) conct_propr_entet_gauch_formt
        ,conct_propr_entet_centr
        ,afw_21_plugn_calnd_pkg.obten_prop_entet_formt (conct_propr_entet_centr) conct_propr_entet_centr_formt
        ,conct_propr_entet_droit
        ,afw_21_plugn_calnd_pkg.obten_prop_entet_formt (conct_propr_entet_droit) conct_propr_entet_droit_formt
        ,indic_evenm_modfb
        ,nom_table
        ,coln_titre
        ,coln_descr
        ,coln_type
        ,coln_aide_insta
        ,coln_lien
        ,coln_indic_journ_compl
        ,coln_indic_evenm_modfb
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
        ,coln_agend
        ,coln_ident
        ,coln_date_journ_compl
        ,coln_date_fin_journ_compl
        ,nombr_mints_inter
        ,heure_debut_norml
        ,heure_fin_norml
        ,heure_debut_exten
        ,heure_fin_exten
        ,ref_prodt
    from vd_i_afw_21_plugn_calnd;


DROP VIEW APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR;

create or replace force view apexframework.vd_afw_21_plugn_calnd_coulr
(
  seqnc
 ,ordre_presn
 ,coulr
 ,coulr_text
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ordre_presn
        ,coulr
        ,coulr_text
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_21_plugn_calnd_coulr;


DROP VIEW APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE;

create or replace force view apexframework.vd_afw_21_plugn_calnd_type
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_domn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coulr_texte
 ,coulr_bordr
 ,coulr_arier_plan
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_domn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coulr_texte
        ,coulr_bordr
        ,coulr_arier_plan
    from vd_i_afw_21_plugn_calnd_type;


DROP VIEW APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU;

create or replace force view apexframework.vd_afw_21_plugn_item_menu
(
  seqnc
 ,ref_item_menu
 ,ref_item_menu_formt
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
 ,clas_css_elemn
 ,clas_css_racn
 ,ref_dv_contn_item_menu
 ,ref_dv_contn_item_menu_code
 ,ref_dv_contn_im_valr_organ
 ,ref_dv_align
 ,ref_dv_align_code
 ,ref_dv_align_valr_organ
)
as
  select seqnc
        ,ref_item_menu
        , (select nom
             from vd_i_afw_13_item_menu im
            where im.seqnc = pim.ref_item_menu)
           ref_item_menu_formt
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
        ,afw_21_plugn_menu_pkg.obten_clas_css_elemn (pim.seqnc) clas_css_elemn
        ,afw_21_plugn_menu_pkg.obten_clas_css_racn (pim.seqnc) clas_css_racn
        ,ref_dv_contn_item_menu
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_contn_item_menu) ref_dv_contn_item_menu_code
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_contn_item_menu) ref_dv_contn_im_valr_organ
        ,ref_dv_align
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_align) ref_dv_align_code
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_align) ref_dv_align_valr_organ
    from vd_i_afw_21_plugn_item_menu pim;


DROP VIEW APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU;

create or replace force view apexframework.vd_afw_21_plugn_menu
(
  seqnc
 ,code
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,ref_dv_type_menu
 ,ref_dv_type_menu_code
 ,ref_dv_type_menu_formt
 ,largr_regn_menu
 ,hautr_regn_menu
 ,ref_dv_orien_menu
 ,ref_dv_orien_menu_code
 ,ref_dv_orien_menu_formt
 ,ref_dv_coulr_theme
 ,ref_dv_coulr_theme_code
 ,ref_dv_coulr_theme_formt
 ,ref_dv_coulr_princ
 ,ref_dv_coulr_princ_code
 ,ref_dv_coulr_princ_formt
 ,ref_dv_formt_menu
 ,ref_dv_formt_menu_code
 ,ref_dv_formt_menu_formt
 ,ref_menu
 ,ref_menu_formt
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
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_menu) ref_dv_type_menu_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_menu) ref_dv_type_menu_formt
        ,largr_regn_menu
        ,hautr_regn_menu
        ,ref_dv_orien_menu
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_orien_menu) ref_dv_orien_menu_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_orien_menu) ref_dv_orien_menu_formt
        ,ref_dv_coulr_theme
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_coulr_theme) ref_dv_coulr_theme_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_coulr_theme) ref_dv_coulr_theme_formt
        ,ref_dv_coulr_princ
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_coulr_princ) ref_dv_coulr_princ_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_coulr_princ) ref_dv_coulr_princ_formt
        ,ref_dv_formt_menu
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_formt_menu) ref_dv_formt_menu_code
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_formt_menu) ref_dv_formt_menu_formt
        ,ref_menu
        , (select nom
             from vd_i_afw_13_menu m
            where m.seqnc = ref_menu)
           ref_menu_formt
        ,ref_prodt
    from vd_i_afw_21_plugn_menu;


DROP VIEW APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR;

create or replace force view apexframework.vd_afw_23_detl_reslt_rechr
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
    from vd_i_afw_23_detl_reslt_rechr;


DROP VIEW APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR;

create or replace force view apexframework.vd_afw_23_enonc_rechr
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
    from vd_i_afw_23_enonc_rechr;


DROP VIEW APEXFRAMEWORK.VD_AFW_23_MODL_RECHR;

create or replace force view apexframework.vd_afw_23_modl_rechr
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
    from vd_i_afw_23_modl_rechr;


DROP VIEW APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR;

create or replace force view apexframework.vd_afw_23_patrn_rechr
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
    from vd_i_afw_23_patrn_rechr;


DROP VIEW APEXFRAMEWORK.VD_AFW_23_RECHR;

create or replace force view apexframework.vd_afw_23_rechr
(
  seqnc
 ,ref_utils
 ,date_exect
 ,date_exect_formt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_modl_rechr
 ,enonc_formt
 ,decmp_reslt
 ,decmp_reslt_formt
)
as
  select seqnc
        ,ref_utils
        ,date_exect
        ,to_char (trunc (date_exect)
                 ,'fmDay fmDD fmMonth YYYY')
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_modl_rechr
        ,afw_23_rechr_pkg.obten_enonc_rechr_formt (seqnc)
        , (select count (1)
             from vd_i_afw_23_reslt_rechr rr
            where rr.ref_rechr = r.seqnc)
        , (select to_char (count (1)
                          ,'fm999g990')
             from vd_i_afw_23_reslt_rechr rr
            where rr.ref_rechr = r.seqnc)
    from vd_i_afw_23_rechr r;


DROP VIEW APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR;

create or replace force view apexframework.vd_afw_23_reslt_rechr
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
 ,dnr_ref_struc_aplic_formt
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
        , (select sa.nom d
             from vd_afw_12_struc_aplic sa
            where sa.seqnc = rr.dnr_ref_struc_aplic)
        ,ref_seqnc_struc_aplic
    from vd_i_afw_23_reslt_rechr rr;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_CHAMP;

create or replace force view apexframework.vd_afw_25_champ
(
  seqnc
 ,code
 ,postn_x
 ,postn_y
 ,angle_orint
 ,ref_formt
 ,ref_formt_formt
 ,ref_versn_publc
 ,ref_dv_type_champ
 ,ref_dv_type_champ_formt
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
        , (select type_don_formt
             from vd_afw_14_formt
            where seqnc = ref_formt)
        ,ref_versn_publc
        ,ref_dv_type_champ
        , (select valr
             from vd_afw_14_detl_domn_valr
            where seqnc = ref_dv_type_champ)
        ,indic_modif
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_25_champ;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC;

create or replace force view apexframework.vd_afw_25_domn_type_publc
(
  seqnc
 ,ref_domn
 ,ref_type_publc
 ,ref_type_publc_formt
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
        , (select nom
             from vd_i_afw_25_type_publc
            where seqnc = ref_type_publc)
        ,ref_publc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_25_domn_type_publc;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC;

create or replace force view apexframework.vd_afw_25_elemn_confg_publc
(
  seqnc
 ,ref_type_publc
 ,ref_type_publc_formt
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
        , (select nom
             from vd_i_afw_25_type_publc
            where seqnc = ref_type_publc)
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
    from vd_i_afw_25_elemn_confg_publc;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_ENGIN;

create or replace force view apexframework.vd_afw_25_engin
(
  seqnc
 ,code
 ,ref_dv_formt_sort
 ,ref_dv_formt_sort_formt
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
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_formt_sort)
        ,url_servl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,url_servl_exter
    from vd_i_afw_25_engin;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC;

create or replace force view apexframework.vd_afw_25_engin_versn_publc
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_versn_publc
 ,ref_engin
 ,ref_code_engin
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
        , (select code
             from vd_afw_25_engin
            where seqnc = ref_engin)
        ,iden_acces
        ,pdf_fusn
        ,html_base
    from vd_i_afw_25_engin_versn_publc;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC;

create or replace force view apexframework.vd_afw_25_group_publc
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
    from vd_i_afw_25_group_publc;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT;

create or replace force view apexframework.vd_afw_25_journ_travl_exect
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
    from vd_i_afw_25_journ_travl_exect;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC;

create or replace force view apexframework.vd_afw_25_ocurn_parmt_publc
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
    from vd_i_afw_25_ocurn_parmt_publc;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL;

create or replace force view apexframework.vd_afw_25_parmt_publc_travl
(
  seqnc
 ,ref_publc_travl
 ,ref_parmt_type_publc
 ,ref_code_parmt_tp_formt
 ,indic_presn_appel
 ,ordre_presn
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
        , (select ptp.code
             from vd_i_afw_25_parmt_type_publc ptp
            where ptp.seqnc = ppt.ref_parmt_type_publc)
        , (select ptp.indic_presn_appel
             from vd_i_afw_25_parmt_type_publc ptp
            where ptp.seqnc = ppt.ref_parmt_type_publc)
        , (select ptp.ordre_presn
             from vd_i_afw_25_parmt_type_publc ptp
            where ptp.seqnc = ppt.ref_parmt_type_publc)
        ,valr_varch
        ,valr_date
        ,valr_numbr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_25_parmt_publc_travl ppt;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC;

create or replace force view apexframework.vd_afw_25_parmt_type_publc
(
  seqnc
 ,ref_type_publc
 ,ref_type_publc_formt
 ,ref_engin
 ,ref_engin_formt
 ,code
 ,nom
 ,descr
 ,indic_presn_appel
 ,indic_presn_appel_formt
 ,indic_fixe
 ,indic_fixe_formt
 ,valr_deft
 ,type_valr_deft
 ,type_valr_deft_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_don
 ,type_don_formt
 ,ordre_presn
 ,cardn
 ,cardn_formt
)
as
  select seqnc
        ,ref_type_publc
        , (select nom
             from vd_i_afw_25_type_publc tp
            where tp.seqnc = ref_type_publc)
        ,ref_engin
        , (select code
             from vd_i_afw_25_engin e
            where e.seqnc = ref_engin)
        ,code
        ,nom
        ,descr
        ,indic_presn_appel
        ,case indic_presn_appel when 'O' then 'Oui' else 'Non' end indic_presn_appel_formt
        ,indic_fixe
        ,case indic_fixe when 'O' then 'Oui' else 'Non' end indic_fixe_formt
        ,valr_deft
        ,type_valr_deft
        ,case type_valr_deft when 'ITEM' then 'Item de page' when 'LITRL' then 'Littéral' else 'PL/SQL' end type_valr_deft_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
        ,case type_don when 'D' then 'Date' when 'N' then 'Numérique' else 'Alphanumérique' end type_don_formt
        ,ordre_presn
        ,cardn
        ,case cardn when 'L' then 'Littéral' else 'Vecteur' end cardn_formt
    from vd_i_afw_25_parmt_type_publc;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT;

create or replace force view apexframework.vd_afw_25_par_pub_tra_exect
(
  seqnc
 ,ref_travl_publc
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
)
as
  select seqnc
        ,ref_travl_publc
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
    from vd_i_afw_25_par_pub_tra_exect;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL;

create or replace force view apexframework.vd_afw_25_publc_travl
(
  seqnc
 ,ref_versn_publc
 ,ref_type_publc
 ,ref_code_type_publc
 ,ref_code_publc
 ,ref_code_type_publc_formt
 ,ref_code_publc_formt
 ,ref_travl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_stat
 ,ref_stat_formt
 ,nom
 ,indic_parmt_alimn
 ,ref_publc
 ,reslt_html
)
as
  select seqnc
        ,ref_versn_publc
        , (select tp.seqnc
             from vd_i_afw_25_type_publc tp
                 ,vd_i_afw_25_publc p
                 ,vd_i_afw_25_versn_publc vp
            where     tp.seqnc = p.ref_type_publc
                  and vp.seqnc = pt.ref_versn_publc
                  and p.seqnc = vp.ref_publc)
        , (select tp.code
             from vd_i_afw_25_type_publc tp
                 ,vd_i_afw_25_publc p
                 ,vd_i_afw_25_versn_publc vp
            where     tp.seqnc = p.ref_type_publc
                  and vp.seqnc = pt.ref_versn_publc
                  and p.seqnc = vp.ref_publc)
        , (select p.code
             from vd_i_afw_25_publc p
                 ,vd_i_afw_25_versn_publc vp
            where     vp.seqnc = pt.ref_versn_publc
                  and p.seqnc = vp.ref_publc)
        , (select tp.nom
             from vd_i_afw_25_type_publc tp
                 ,vd_i_afw_25_publc p
                 ,vd_i_afw_25_versn_publc vp
            where     tp.seqnc = p.ref_type_publc
                  and vp.seqnc = pt.ref_versn_publc
                  and p.seqnc = vp.ref_publc)
        , (select p.nom
             from vd_i_afw_25_publc p
                 ,vd_i_afw_25_versn_publc vp
            where     vp.seqnc = pt.ref_versn_publc
                  and p.seqnc = vp.ref_publc)
        ,ref_travl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_stat
        , (select s.nom
             from vd_i_afw_12_stat s
            where s.seqnc = pt.ref_stat)
        ,nom
        ,indic_parmt_alimn
        ,ref_publc
        ,reslt_html
    from vd_i_afw_25_publc_travl pt;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_THEME;

create or replace force view apexframework.vd_afw_25_theme
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
    from vd_i_afw_25_theme;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_THEME_SUBST;

create or replace force view apexframework.vd_afw_25_theme_subst
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


DROP VIEW APEXFRAMEWORK.VD_AFW_25_TRAVL;

create or replace force view apexframework.vd_afw_25_travl
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
 ,indic_imedt
 ,indic_imedt_formt
 ,nom
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_domn
 ,ref_stat
 ,ref_stat_formt
 ,nombr_elemn
 ,ref_type_travl
)
as
  select seqnc
        ,ref_utils
        , (select nom_formt
             from vd_afw_12_utils
            where seqnc = ref_utils)
        ,indic_imedt
        ,case indic_imedt when 'O' then 'Oui' else 'Non' end indic_imedt_formt
        ,nom
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_domn
        ,ref_stat
        , (select nom
             from vd_i_afw_12_stat s
            where s.seqnc = t.ref_stat)
        , (select count (1)
             from vd_i_afw_25_publc_travl pt
            where pt.ref_travl = t.seqnc)
        ,ref_type_travl
    from vd_i_afw_25_travl t;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC;

create or replace force view apexframework.vd_afw_25_type_publc
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
 ,ref_struc_aplic_formt
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
        , (select nom
             from vd_i_afw_12_struc_aplic sa
            where tp.ref_struc_aplic = sa.seqnc)
           ref_struc_aplic_formt
        ,ref_prodt
        ,dnr_ref_prodt
    from vd_i_afw_25_type_publc tp;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL;

create or replace force view apexframework.vd_afw_25_type_travl
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
  (select seqnc
         ,code
         ,nom
         ,descr
         ,date_creat
         ,utils_creat
         ,date_modfc
         ,utils_modfc
         ,ref_domn
     from vd_i_afw_25_type_travl);


DROP VIEW APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP;

create or replace force view apexframework.vd_afw_25_valr_champ
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
    from vd_i_afw_25_valr_champ;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG;

create or replace force view apexframework.vd_afw_25_valr_elemn_confg
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
 ,ref_domn_formt
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
        , (select nom
             from vd_i_afw_12_domn
            where seqnc = ref_domn)
    from vd_i_afw_25_valr_elemn_confg;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC;

create or replace force view apexframework.vd_afw_25_versn_publc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_publc
 ,date_debut_efect
 ,date_fin_efect
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
        ,ref_publc
        ,date_debut_efect
        ,date_fin_efect
    from vd_i_afw_25_versn_publc;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC_SUBST;

create or replace force view apexframework.vd_afw_25_versn_publc_subst
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
    from vd_i_afw_25_versn_publc_subst;


DROP VIEW APEXFRAMEWORK.VD_AFW_29_CONTR;

create or replace force view apexframework.vd_afw_29_contr
(
  seqnc
 ,ref_prodt
 ,code_contr
 ,nom_struc_acces
 ,nom
 ,descr
 ,niv_gravt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,code_contr
        ,nom_struc_acces
        ,nom
        ,descr
        ,niv_gravt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_29_contr;


DROP VIEW APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM;

create or replace force view apexframework.vd_afw_30_afect_item
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
    from vd_i_afw_30_afect_item;


DROP VIEW APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN;

create or replace force view apexframework.vd_afw_30_carnt_sprin
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
    from vd_i_afw_30_carnt_sprin;


DROP VIEW APEXFRAMEWORK.VD_AFW_30_CAS_UTILS;

create or replace force view apexframework.vd_afw_30_cas_utils
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
    from vd_i_afw_30_cas_utils;


DROP VIEW APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM;

create or replace force view apexframework.vd_afw_30_efort_item
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
    from vd_i_afw_30_efort_item;


DROP VIEW APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN;

create or replace force view apexframework.vd_afw_30_histr_efort_restn
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
    from vd_i_afw_30_histr_efort_restn;


DROP VIEW APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT;

create or replace force view apexframework.vd_afw_30_item_carnt_prodt
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
    from vd_i_afw_30_item_carnt_prodt;


DROP VIEW APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN;

create or replace force view apexframework.vd_afw_30_item_carnt_sprin
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
    from vd_i_afw_30_item_carnt_sprin;


DROP VIEW APEXFRAMEWORK.VD_AFW_30_PAGE;

create or replace force view apexframework.vd_afw_30_page
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
    from vd_i_afw_30_page;


DROP VIEW APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM;

create or replace force view apexframework.vd_afw_30_page_item
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
    from vd_i_afw_30_page_item;


DROP VIEW APEXFRAMEWORK.VD_AFW_36_ATRIB_DISPN;

create or replace force view apexframework.vd_afw_36_atrib_dispn
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
    from vd_i_afw_36_atrib_dispn;


DROP VIEW APEXFRAMEWORK.VD_AFW_36_FILTR_SESN;

create or replace force view apexframework.vd_afw_36_filtr_sesn
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
    from vd_i_afw_36_filtr_sesn;


DROP VIEW APEXFRAMEWORK.VD_AFW_36_LIEN_OPERT_FILTR;

create or replace force view apexframework.vd_afw_36_lien_opert_filtr
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
    from vd_i_afw_36_lien_opert_filtr;


DROP VIEW APEXFRAMEWORK.VD_AFW_36_OPERT_FILTR;

create or replace force view apexframework.vd_afw_36_opert_filtr
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
    from vd_i_afw_36_opert_filtr;


DROP VIEW APEXFRAMEWORK.VD_AFW_36_TYPE_DON;

create or replace force view apexframework.vd_afw_36_type_don
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
    from vd_i_afw_36_type_don;


DROP VIEW APEXFRAMEWORK.VD_AFW_36_VUE;

create or replace force view apexframework.vd_afw_36_vue
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
    from vd_i_afw_36_vue;


DROP VIEW APEXFRAMEWORK.VD_AFW_36_VUE_ATRIB;

create or replace force view apexframework.vd_afw_36_vue_atrib
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
    from vd_i_afw_36_vue_atrib;


DROP VIEW APEXFRAMEWORK.VD_AFW_36_VUE_TRI_SECND;

create or replace force view apexframework.vd_afw_36_vue_tri_secnd
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
    from vd_i_afw_36_vue_tri_secnd;


DROP VIEW APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR;

create or replace force view apexframework.vd_afw_37_gadgt_catgr
(
  seqnc
 ,ref_prodt
 ,ref_gadgt_catgr
 ,ref_gadgt_catgr_formt
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
        , (select gc2.nom
             from vd_i_afw_37_gadgt_catgr gc2
            where gc2.seqnc = gc1.ref_gadgt_catgr)
           as ref_gadgt_catgr_formt
        ,code
        ,nom
        ,ordre_presn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_gadgt_catgr gc1;


DROP VIEW APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT;

create or replace force view apexframework.vd_afw_37_gadgt_parmt
(
  seqnc
 ,ref_gadgt
 ,code
 ,nom
 ,ordre_presn
 ,indic_oblig
 ,indic_oblig_formt
 ,ref_dv_type_don
 ,ref_dv_type_don_formt
 ,ref_domn_valr
 ,ref_domn_valr_formt
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
        ,case indic_oblig when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>' else null end as indic_oblig_formt
        ,ref_dv_type_don
        , (select ddv.valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = gp.ref_dv_type_don)
           as ref_dv_type_don_formt
        ,ref_domn_valr
        , (select    code
                  || ' - '
                  || nom
             from afw_14_domn_valr
            where seqnc = ref_domn_valr)
           ref_domn_valr_formt
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_gadgt_parmt gp;


DROP VIEW APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC;

create or replace force view apexframework.vd_afw_37_gadgt_parmt_racrc
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,ref_dv_type_don
 ,ref_dv_type_don_formt
 ,forml_don
 ,indic_genrq
 ,indic_genrq_formt
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
        , (select ddv.valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = pr.ref_dv_type_don)
           as ref_dv_type_don_formt
        ,forml_don
        ,indic_genrq
        ,case indic_genrq when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>' else null end as indic_oblig_formt
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_gadgt_parmt_racrc pr;


DROP VIEW APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R;

create or replace force view apexframework.vd_afw_37_lien_gadgt_parmt_r
(
  seqnc
 ,ref_gadgt_parmt
 ,ref_gadgt_parmt_racrc
 ,ref_gadgt_parmt_racrc_formt
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
        , (select    gpr.code
                  || ' - '
                  || gpr.nom
             from vd_afw_37_gadgt_parmt_racrc gpr
            where gpr.seqnc = lgpr.ref_gadgt_parmt_racrc)
           as ref_gadgt_parmt_racrc_formt
        ,nom
        ,forml_don
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_lien_gadgt_parmt_r lgpr;


DROP VIEW APEXFRAMEWORK.VD_AFW_37_TABL_BORD;

create or replace force view apexframework.vd_afw_37_tabl_bord
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,nom_group_deft
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
        ,nom_group_deft
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_tabl_bord;


CREATE OR REPLACE TRIGGER APEXFRAMEWORK.vd_afw_01_mesg_aide_iou_trg
  instead of update
  ON APEXFRAMEWORK.VD_AFW_01_MESG_AIDE
  for each row
begin
  if :new.type_item in ('RAPRT', 'ITEM', 'BOUTN')
  then
    update vd_i_afw_01_mesg_lang ml
       set ml.mesg   = :new.mesg
     where seqnc = :new.seqnc_mesg_lang;
  elsif :new.type_item = 'PAGE'
  then
    update vd_i_afw_13_regn_piltb_lang rpl
       set rpl.contn   = :new.mesg
     where rpl.seqnc = :new.seqnc_mesg_lang;
  end if;
end vd_afw_01_mesg_aide_iou_trg;
/


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_ATRIB_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_CONFG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_DESTN FOR APEXFRAMEWORK.VD_AFW_01_DESTN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_ELEMN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_HIERC_APLIC FOR APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_LANG_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG_LANG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_MESG_ERR_LIE FOR APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_MESG_INFOR FOR APEXFRAMEWORK.VD_AFW_01_MESG_INFOR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_MESG_LANG FOR APEXFRAMEWORK.VD_AFW_01_MESG_LANG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_MESG_TRADC_APEX FOR APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_MODL_AFICH_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_MODL_COMNC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_MODL_MESG_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_NOTFC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_OSA_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_PROPG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_RESLT_DESTN FOR APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_TYPE_COMNC FOR APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_03_CLAS_INTER FOR APEXFRAMEWORK.VD_AFW_03_CLAS_INTER;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_03_JOURN FOR APEXFRAMEWORK.VD_AFW_03_JOURN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_03_JOURN_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_03_LIEN_CLAS_INTER_UTIL FOR APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_04_CONTX FOR APEXFRAMEWORK.VD_AFW_04_CONTX;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_04_CONTX_ETEND FOR APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_04_FIL_ARIAN FOR APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_04_NAVGT_HISTR FOR APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_04_TUTRL FOR APEXFRAMEWORK.VD_AFW_04_TUTRL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_07_AUDIT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_07_VALR_AUDIT_STR_APL FOR APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_ATRIB_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ENTIT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_PARMT_AFW FOR APEXFRAMEWORK.VD_AFW_11_PARMT_AFW;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_PLUGN FOR APEXFRAMEWORK.VD_AFW_11_PLUGN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_PRODT_LANG FOR APEXFRAMEWORK.VD_AFW_11_PRODT_LANG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_PRODT_RESRC FOR APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_UTILS FOR APEXFRAMEWORK.VD_AFW_11_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_VERSN FOR APEXFRAMEWORK.VD_AFW_11_VERSN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_ACTIO_AUDIT FOR APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_ARBRE FOR APEXFRAMEWORK.VD_AFW_12_ARBRE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_DEFNT_ACCES FOR APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_DOMN FOR APEXFRAMEWORK.VD_AFW_12_DOMN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_DOMN_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_EVOLT_STAT FOR APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_FAVR FOR APEXFRAMEWORK.VD_AFW_12_FAVR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_FONCT FOR APEXFRAMEWORK.VD_AFW_12_FONCT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_FONCT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_GROUP_STAT FOR APEXFRAMEWORK.VD_AFW_12_GROUP_STAT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_HISTR_ACCES FOR APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_HISTR_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_LIEN_GR_GADGT_GR_U FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_LIEN_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_LIEN_STRUC FOR APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_MEMBR_STRUC FOR APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_SESN FOR APEXFRAMEWORK.VD_AFW_12_SESN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_STAT FOR APEXFRAMEWORK.VD_AFW_12_STAT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_STRUC_ADMIN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_STRUC_APLIC_DESTN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_STRUC_APLIC_LANG FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_TUTRL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_TYPE_STRUC FOR APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_UTILS FOR APEXFRAMEWORK.VD_AFW_12_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_UTILS_AVATR FOR APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_CONDT_EXECT FOR APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_EMPLA_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_ETAPE_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_FORMT_RESRC FOR APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_INSTA_PREFR FOR APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_LIEN_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_LISTE_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_MENU FOR APEXFRAMEWORK.VD_AFW_13_MENU;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_MIME_TYPE FOR APEXFRAMEWORK.VD_AFW_13_MIME_TYPE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_NAVGT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_NAVGT_ELEMN FOR APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_OCURN_RESRC FOR APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_OPERT FOR APEXFRAMEWORK.VD_AFW_13_OPERT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_OPERT_OPTIO FOR APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_PAGE FOR APEXFRAMEWORK.VD_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_PAGE_IR FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_PAGE_ITEM_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_PAGE_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_LANG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_PAGE_PREFR_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_REGN_PILTB FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_REGN_PILTB_LANG FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_TUTRL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_TYPE_FICHR FOR APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_14_DETL_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_14_FORMT FOR APEXFRAMEWORK.VD_AFW_14_FORMT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_14_TYPE_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_17_COMPT_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_17_COMPT_TWILI FOR APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_17_COURL FOR APEXFRAMEWORK.VD_AFW_17_COURL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_17_COURL_DESTN FOR APEXFRAMEWORK.VD_AFW_17_COURL_DESTN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_17_PIECE_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_17_PROFL_COURL FOR APEXFRAMEWORK.VD_AFW_17_PROFL_COURL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_17_SMS_TWILI FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_17_SMS_TWILI_ENTRA FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_17_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_19_BOUTN FOR APEXFRAMEWORK.VD_AFW_19_BOUTN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_19_CLE FOR APEXFRAMEWORK.VD_AFW_19_CLE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_19_DISPN_FONCT FOR APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_19_FONCT FOR APEXFRAMEWORK.VD_AFW_19_FONCT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_19_FONCT_LANG FOR APEXFRAMEWORK.VD_AFW_19_FONCT_LANG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_19_SPECF_FONCT FOR APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_20_DEPLM FOR APEXFRAMEWORK.VD_AFW_20_DEPLM;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_20_DETL_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_20_MODL FOR APEXFRAMEWORK.VD_AFW_20_MODL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_20_MODL_EXCEP FOR APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_20_MODL_PARMT FOR APEXFRAMEWORK.VD_AFW_20_MODL_PARMT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_20_SECTN_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_21_PLUGN_ARBRE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_21_PLUGN_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_21_PLUGN_CALND FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_21_PLUGN_CALND_COULR FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_21_PLUGN_CALND_TYPE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_21_PLUGN_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_21_PLUGN_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_23_DETL_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_23_ENONC_RECHR FOR APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_23_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_MODL_RECHR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_23_PATRN_RECHR FOR APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_23_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RECHR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_23_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_CHAMP;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_DOMN_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_ELEMN_CONFG_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_ENGIN FOR APEXFRAMEWORK.VD_AFW_25_ENGIN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_ENGIN_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_GROUP_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_JOURN_TRAVL_EXECT FOR APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_OCURN_PARMT_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_PARMT_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_PARMT_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TRAVL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_TYPE_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_VALR_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_VALR_ELEMN_CONFG FOR APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_29_CONTR FOR APEXFRAMEWORK.VD_AFW_29_CONTR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_30_AFECT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_30_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_30_CAS_UTILS FOR APEXFRAMEWORK.VD_AFW_30_CAS_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_30_EFORT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_30_HISTR_EFORT_RESTN FOR APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_30_ITEM_CARNT_PRODT FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_30_ITEM_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_30_PAGE FOR APEXFRAMEWORK.VD_AFW_30_PAGE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_30_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_37_GADGT_CATGR FOR APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_37_GADGT_PARMT FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_37_GADGT_PARMT_RACRC FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_37_TABL_BORD FOR APEXFRAMEWORK.VD_AFW_37_TABL_BORD;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_ATRIB_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_CONFG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_DESTN FOR APEXFRAMEWORK.VD_AFW_01_DESTN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_ELEMN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_HIERC_APLIC FOR APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_LANG_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG_LANG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_MESG_ERR_LIE FOR APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_MESG_INFOR FOR APEXFRAMEWORK.VD_AFW_01_MESG_INFOR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_MESG_LANG FOR APEXFRAMEWORK.VD_AFW_01_MESG_LANG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_MESG_TRADC_APEX FOR APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_MODL_AFICH_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_MODL_COMNC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_MODL_MESG_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_NOTFC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_OSA_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_PROPG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_RESLT_DESTN FOR APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_TYPE_COMNC FOR APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_03_CLAS_INTER FOR APEXFRAMEWORK.VD_AFW_03_CLAS_INTER;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_03_JOURN FOR APEXFRAMEWORK.VD_AFW_03_JOURN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_03_JOURN_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_03_LIEN_CLAS_INTER_UTIL FOR APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_04_CONTX FOR APEXFRAMEWORK.VD_AFW_04_CONTX;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_04_CONTX_ETEND FOR APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_04_FIL_ARIAN FOR APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_04_NAVGT_HISTR FOR APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_04_TUTRL FOR APEXFRAMEWORK.VD_AFW_04_TUTRL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_07_AUDIT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_07_VALR_AUDIT_STR_APL FOR APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_ATRIB_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ENTIT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_PARMT_AFW FOR APEXFRAMEWORK.VD_AFW_11_PARMT_AFW;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_PLUGN FOR APEXFRAMEWORK.VD_AFW_11_PLUGN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_PRODT_LANG FOR APEXFRAMEWORK.VD_AFW_11_PRODT_LANG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_PRODT_RESRC FOR APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_UTILS FOR APEXFRAMEWORK.VD_AFW_11_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_VERSN FOR APEXFRAMEWORK.VD_AFW_11_VERSN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_ACTIO_AUDIT FOR APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_ARBRE FOR APEXFRAMEWORK.VD_AFW_12_ARBRE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_DEFNT_ACCES FOR APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_DOMN FOR APEXFRAMEWORK.VD_AFW_12_DOMN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_DOMN_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_EVOLT_STAT FOR APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_FAVR FOR APEXFRAMEWORK.VD_AFW_12_FAVR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_FONCT FOR APEXFRAMEWORK.VD_AFW_12_FONCT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_FONCT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_GROUP_STAT FOR APEXFRAMEWORK.VD_AFW_12_GROUP_STAT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_HISTR_ACCES FOR APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_HISTR_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_LIEN_GR_GADGT_GR_U FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_LIEN_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_LIEN_STRUC FOR APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_MEMBR_STRUC FOR APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_SESN FOR APEXFRAMEWORK.VD_AFW_12_SESN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_STAT FOR APEXFRAMEWORK.VD_AFW_12_STAT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_STRUC_ADMIN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_STRUC_APLIC_DESTN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_STRUC_APLIC_LANG FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_TUTRL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_TYPE_STRUC FOR APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_UTILS FOR APEXFRAMEWORK.VD_AFW_12_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_UTILS_AVATR FOR APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_CONDT_EXECT FOR APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_EMPLA_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_ETAPE_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_FORMT_RESRC FOR APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_INSTA_PREFR FOR APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_LIEN_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_LISTE_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_MENU FOR APEXFRAMEWORK.VD_AFW_13_MENU;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_MIME_TYPE FOR APEXFRAMEWORK.VD_AFW_13_MIME_TYPE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_NAVGT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_NAVGT_ELEMN FOR APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_OCURN_RESRC FOR APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_OPERT FOR APEXFRAMEWORK.VD_AFW_13_OPERT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_OPERT_OPTIO FOR APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_PAGE FOR APEXFRAMEWORK.VD_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_PAGE_IR FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_PAGE_ITEM_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_PAGE_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_LANG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_PAGE_PREFR_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_REGN_PILTB FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_REGN_PILTB_LANG FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_TUTRL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_TYPE_FICHR FOR APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_14_DETL_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_14_FORMT FOR APEXFRAMEWORK.VD_AFW_14_FORMT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_14_TYPE_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_17_COMPT_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_17_COMPT_TWILI FOR APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_17_COURL FOR APEXFRAMEWORK.VD_AFW_17_COURL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_17_COURL_DESTN FOR APEXFRAMEWORK.VD_AFW_17_COURL_DESTN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_17_PIECE_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_17_PROFL_COURL FOR APEXFRAMEWORK.VD_AFW_17_PROFL_COURL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_17_SMS_TWILI FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_17_SMS_TWILI_ENTRA FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_17_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_19_BOUTN FOR APEXFRAMEWORK.VD_AFW_19_BOUTN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_19_CLE FOR APEXFRAMEWORK.VD_AFW_19_CLE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_19_DISPN_FONCT FOR APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_19_FONCT FOR APEXFRAMEWORK.VD_AFW_19_FONCT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_19_FONCT_LANG FOR APEXFRAMEWORK.VD_AFW_19_FONCT_LANG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_19_SPECF_FONCT FOR APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_20_DEPLM FOR APEXFRAMEWORK.VD_AFW_20_DEPLM;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_20_DETL_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_20_MODL FOR APEXFRAMEWORK.VD_AFW_20_MODL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_20_MODL_EXCEP FOR APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_20_MODL_PARMT FOR APEXFRAMEWORK.VD_AFW_20_MODL_PARMT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_20_SECTN_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_21_PLUGN_ARBRE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_21_PLUGN_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_21_PLUGN_CALND FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_21_PLUGN_CALND_COULR FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_21_PLUGN_CALND_TYPE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_21_PLUGN_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_21_PLUGN_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_23_DETL_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_23_ENONC_RECHR FOR APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_23_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_MODL_RECHR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_23_PATRN_RECHR FOR APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_23_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RECHR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_23_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_CHAMP;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_DOMN_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_ELEMN_CONFG_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_ENGIN FOR APEXFRAMEWORK.VD_AFW_25_ENGIN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_ENGIN_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_GROUP_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_JOURN_TRAVL_EXECT FOR APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_OCURN_PARMT_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_PARMT_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_PARMT_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TRAVL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_TYPE_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_VALR_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_VALR_ELEMN_CONFG FOR APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_29_CONTR FOR APEXFRAMEWORK.VD_AFW_29_CONTR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_30_AFECT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_30_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_30_CAS_UTILS FOR APEXFRAMEWORK.VD_AFW_30_CAS_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_30_EFORT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_30_HISTR_EFORT_RESTN FOR APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_30_ITEM_CARNT_PRODT FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_30_ITEM_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_30_PAGE FOR APEXFRAMEWORK.VD_AFW_30_PAGE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_30_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_37_GADGT_CATGR FOR APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_37_GADGT_PARMT FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_37_GADGT_PARMT_RACRC FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_37_TABL_BORD FOR APEXFRAMEWORK.VD_AFW_37_TABL_BORD;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_ATRIB_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_CONFG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_DESTN FOR APEXFRAMEWORK.VD_AFW_01_DESTN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_ELEMN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_HIERC_APLIC FOR APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_LANG_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG_LANG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_MESG_ERR_LIE FOR APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_MESG_INFOR FOR APEXFRAMEWORK.VD_AFW_01_MESG_INFOR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_MESG_LANG FOR APEXFRAMEWORK.VD_AFW_01_MESG_LANG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_MESG_TRADC_APEX FOR APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_MODL_AFICH_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_MODL_COMNC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_MODL_MESG_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_NOTFC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_OSA_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_PROPG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_RESLT_DESTN FOR APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_TYPE_COMNC FOR APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_03_CLAS_INTER FOR APEXFRAMEWORK.VD_AFW_03_CLAS_INTER;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_03_JOURN FOR APEXFRAMEWORK.VD_AFW_03_JOURN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_03_JOURN_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_03_LIEN_CLAS_INTER_UTIL FOR APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_04_CONTX FOR APEXFRAMEWORK.VD_AFW_04_CONTX;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_04_CONTX_ETEND FOR APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_04_FIL_ARIAN FOR APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_04_NAVGT_HISTR FOR APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_04_TUTRL FOR APEXFRAMEWORK.VD_AFW_04_TUTRL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_07_AUDIT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_07_VALR_AUDIT_STR_APL FOR APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_ATRIB_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ENTIT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_PARMT_AFW FOR APEXFRAMEWORK.VD_AFW_11_PARMT_AFW;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_PLUGN FOR APEXFRAMEWORK.VD_AFW_11_PLUGN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_PRODT_LANG FOR APEXFRAMEWORK.VD_AFW_11_PRODT_LANG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_PRODT_RESRC FOR APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_UTILS FOR APEXFRAMEWORK.VD_AFW_11_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_VERSN FOR APEXFRAMEWORK.VD_AFW_11_VERSN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_ACTIO_AUDIT FOR APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_ARBRE FOR APEXFRAMEWORK.VD_AFW_12_ARBRE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_DEFNT_ACCES FOR APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_DOMN FOR APEXFRAMEWORK.VD_AFW_12_DOMN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_DOMN_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_EVOLT_STAT FOR APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_FAVR FOR APEXFRAMEWORK.VD_AFW_12_FAVR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_FONCT FOR APEXFRAMEWORK.VD_AFW_12_FONCT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_FONCT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_GROUP_STAT FOR APEXFRAMEWORK.VD_AFW_12_GROUP_STAT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_HISTR_ACCES FOR APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_HISTR_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_LIEN_GR_GADGT_GR_U FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_LIEN_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_LIEN_STRUC FOR APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_MEMBR_STRUC FOR APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_SESN FOR APEXFRAMEWORK.VD_AFW_12_SESN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_STAT FOR APEXFRAMEWORK.VD_AFW_12_STAT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_STRUC_ADMIN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_STRUC_APLIC_DESTN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_STRUC_APLIC_LANG FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_TUTRL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_TYPE_STRUC FOR APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_UTILS FOR APEXFRAMEWORK.VD_AFW_12_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_UTILS_AVATR FOR APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_CONDT_EXECT FOR APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_EMPLA_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_ETAPE_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_FORMT_RESRC FOR APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_INSTA_PREFR FOR APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_LIEN_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_LISTE_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_MENU FOR APEXFRAMEWORK.VD_AFW_13_MENU;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_MIME_TYPE FOR APEXFRAMEWORK.VD_AFW_13_MIME_TYPE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_NAVGT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_NAVGT_ELEMN FOR APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_OCURN_RESRC FOR APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_OPERT FOR APEXFRAMEWORK.VD_AFW_13_OPERT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_OPERT_OPTIO FOR APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_PAGE FOR APEXFRAMEWORK.VD_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_PAGE_IR FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_PAGE_ITEM_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_PAGE_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_LANG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_PAGE_PREFR_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_REGN_PILTB FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_REGN_PILTB_LANG FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_TUTRL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_TYPE_FICHR FOR APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_14_DETL_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_14_FORMT FOR APEXFRAMEWORK.VD_AFW_14_FORMT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_14_TYPE_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_17_COMPT_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_17_COMPT_TWILI FOR APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_17_COURL FOR APEXFRAMEWORK.VD_AFW_17_COURL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_17_COURL_DESTN FOR APEXFRAMEWORK.VD_AFW_17_COURL_DESTN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_17_PIECE_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_17_PROFL_COURL FOR APEXFRAMEWORK.VD_AFW_17_PROFL_COURL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_17_SMS_TWILI FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_17_SMS_TWILI_ENTRA FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_17_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_19_BOUTN FOR APEXFRAMEWORK.VD_AFW_19_BOUTN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_19_CLE FOR APEXFRAMEWORK.VD_AFW_19_CLE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_19_DISPN_FONCT FOR APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_19_FONCT FOR APEXFRAMEWORK.VD_AFW_19_FONCT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_19_FONCT_LANG FOR APEXFRAMEWORK.VD_AFW_19_FONCT_LANG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_19_SPECF_FONCT FOR APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_20_DEPLM FOR APEXFRAMEWORK.VD_AFW_20_DEPLM;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_20_DETL_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_20_MODL FOR APEXFRAMEWORK.VD_AFW_20_MODL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_20_MODL_EXCEP FOR APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_20_MODL_PARMT FOR APEXFRAMEWORK.VD_AFW_20_MODL_PARMT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_20_SECTN_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_21_PLUGN_ARBRE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_21_PLUGN_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_21_PLUGN_CALND FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_21_PLUGN_CALND_COULR FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_21_PLUGN_CALND_TYPE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_21_PLUGN_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_21_PLUGN_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_23_DETL_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_23_ENONC_RECHR FOR APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_23_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_MODL_RECHR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_23_PATRN_RECHR FOR APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_23_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RECHR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_23_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_CHAMP;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_DOMN_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_ELEMN_CONFG_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_ENGIN FOR APEXFRAMEWORK.VD_AFW_25_ENGIN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_ENGIN_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_GROUP_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_JOURN_TRAVL_EXECT FOR APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_OCURN_PARMT_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_PARMT_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_PARMT_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TRAVL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_TYPE_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_VALR_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_VALR_ELEMN_CONFG FOR APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_29_CONTR FOR APEXFRAMEWORK.VD_AFW_29_CONTR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_30_AFECT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_30_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_30_CAS_UTILS FOR APEXFRAMEWORK.VD_AFW_30_CAS_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_30_EFORT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_30_HISTR_EFORT_RESTN FOR APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_30_ITEM_CARNT_PRODT FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_30_ITEM_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_30_PAGE FOR APEXFRAMEWORK.VD_AFW_30_PAGE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_30_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_37_GADGT_CATGR FOR APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_37_GADGT_PARMT FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_37_GADGT_PARMT_RACRC FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_37_TABL_BORD FOR APEXFRAMEWORK.VD_AFW_37_TABL_BORD;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_ATRIB_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_CONFG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_DESTN FOR APEXFRAMEWORK.VD_AFW_01_DESTN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_ELEMN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_HIERC_APLIC FOR APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_LANG_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG_LANG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_MESG_ERR_LIE FOR APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_MESG_INFOR FOR APEXFRAMEWORK.VD_AFW_01_MESG_INFOR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_MESG_LANG FOR APEXFRAMEWORK.VD_AFW_01_MESG_LANG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_MESG_TRADC_APEX FOR APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_MODL_AFICH_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_MODL_COMNC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_MODL_MESG_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_NOTFC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_OSA_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_PROPG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_RESLT_DESTN FOR APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_TYPE_COMNC FOR APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_03_CLAS_INTER FOR APEXFRAMEWORK.VD_AFW_03_CLAS_INTER;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_03_JOURN FOR APEXFRAMEWORK.VD_AFW_03_JOURN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_03_JOURN_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_03_LIEN_CLAS_INTER_UTIL FOR APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_04_CONTX FOR APEXFRAMEWORK.VD_AFW_04_CONTX;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_04_CONTX_ETEND FOR APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_04_FIL_ARIAN FOR APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_04_NAVGT_HISTR FOR APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_04_TUTRL FOR APEXFRAMEWORK.VD_AFW_04_TUTRL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_07_AUDIT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_07_VALR_AUDIT_STR_APL FOR APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_ATRIB_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ENTIT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_PARMT_AFW FOR APEXFRAMEWORK.VD_AFW_11_PARMT_AFW;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_PLUGN FOR APEXFRAMEWORK.VD_AFW_11_PLUGN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_PRODT_LANG FOR APEXFRAMEWORK.VD_AFW_11_PRODT_LANG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_PRODT_RESRC FOR APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_UTILS FOR APEXFRAMEWORK.VD_AFW_11_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_VERSN FOR APEXFRAMEWORK.VD_AFW_11_VERSN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_ACTIO_AUDIT FOR APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_ARBRE FOR APEXFRAMEWORK.VD_AFW_12_ARBRE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_DEFNT_ACCES FOR APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_DOMN FOR APEXFRAMEWORK.VD_AFW_12_DOMN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_DOMN_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_EVOLT_STAT FOR APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_FAVR FOR APEXFRAMEWORK.VD_AFW_12_FAVR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_FONCT FOR APEXFRAMEWORK.VD_AFW_12_FONCT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_FONCT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_GROUP_STAT FOR APEXFRAMEWORK.VD_AFW_12_GROUP_STAT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_HISTR_ACCES FOR APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_HISTR_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_LIEN_GR_GADGT_GR_U FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_LIEN_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_LIEN_STRUC FOR APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_MEMBR_STRUC FOR APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_SESN FOR APEXFRAMEWORK.VD_AFW_12_SESN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_STAT FOR APEXFRAMEWORK.VD_AFW_12_STAT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_STRUC_ADMIN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_STRUC_APLIC_DESTN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_STRUC_APLIC_LANG FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_TUTRL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_TYPE_STRUC FOR APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_UTILS FOR APEXFRAMEWORK.VD_AFW_12_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_UTILS_AVATR FOR APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_CONDT_EXECT FOR APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_EMPLA_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_ETAPE_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_FORMT_RESRC FOR APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_INSTA_PREFR FOR APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_LIEN_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_LISTE_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_MENU FOR APEXFRAMEWORK.VD_AFW_13_MENU;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_MIME_TYPE FOR APEXFRAMEWORK.VD_AFW_13_MIME_TYPE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_NAVGT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_NAVGT_ELEMN FOR APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_OCURN_RESRC FOR APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_OPERT FOR APEXFRAMEWORK.VD_AFW_13_OPERT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_OPERT_OPTIO FOR APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_PAGE FOR APEXFRAMEWORK.VD_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_PAGE_IR FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_PAGE_ITEM_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_PAGE_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_LANG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_PAGE_PREFR_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_REGN_PILTB FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_REGN_PILTB_LANG FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_TUTRL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_TYPE_FICHR FOR APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_14_DETL_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_14_FORMT FOR APEXFRAMEWORK.VD_AFW_14_FORMT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_14_TYPE_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_17_COMPT_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_17_COMPT_TWILI FOR APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_17_COURL FOR APEXFRAMEWORK.VD_AFW_17_COURL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_17_COURL_DESTN FOR APEXFRAMEWORK.VD_AFW_17_COURL_DESTN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_17_PIECE_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_17_PROFL_COURL FOR APEXFRAMEWORK.VD_AFW_17_PROFL_COURL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_17_SMS_TWILI FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_17_SMS_TWILI_ENTRA FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_17_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_19_BOUTN FOR APEXFRAMEWORK.VD_AFW_19_BOUTN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_19_CLE FOR APEXFRAMEWORK.VD_AFW_19_CLE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_19_DISPN_FONCT FOR APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_19_FONCT FOR APEXFRAMEWORK.VD_AFW_19_FONCT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_19_FONCT_LANG FOR APEXFRAMEWORK.VD_AFW_19_FONCT_LANG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_19_SPECF_FONCT FOR APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_20_DEPLM FOR APEXFRAMEWORK.VD_AFW_20_DEPLM;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_20_DETL_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_20_MODL FOR APEXFRAMEWORK.VD_AFW_20_MODL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_20_MODL_EXCEP FOR APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_20_MODL_PARMT FOR APEXFRAMEWORK.VD_AFW_20_MODL_PARMT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_20_SECTN_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_21_PLUGN_ARBRE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_21_PLUGN_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_21_PLUGN_CALND FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_21_PLUGN_CALND_COULR FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_21_PLUGN_CALND_TYPE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_21_PLUGN_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_21_PLUGN_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_23_DETL_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_23_ENONC_RECHR FOR APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_23_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_MODL_RECHR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_23_PATRN_RECHR FOR APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_23_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RECHR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_23_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_CHAMP;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_DOMN_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_ELEMN_CONFG_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_ENGIN FOR APEXFRAMEWORK.VD_AFW_25_ENGIN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_ENGIN_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_GROUP_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_JOURN_TRAVL_EXECT FOR APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_OCURN_PARMT_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_PARMT_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_PARMT_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TRAVL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_TYPE_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_VALR_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_VALR_ELEMN_CONFG FOR APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_29_CONTR FOR APEXFRAMEWORK.VD_AFW_29_CONTR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_30_AFECT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_30_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_30_CAS_UTILS FOR APEXFRAMEWORK.VD_AFW_30_CAS_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_30_EFORT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_30_HISTR_EFORT_RESTN FOR APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_30_ITEM_CARNT_PRODT FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_30_ITEM_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_30_PAGE FOR APEXFRAMEWORK.VD_AFW_30_PAGE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_30_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_37_GADGT_CATGR FOR APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_37_GADGT_PARMT FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_37_GADGT_PARMT_RACRC FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_37_TABL_BORD FOR APEXFRAMEWORK.VD_AFW_37_TABL_BORD;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_ATRIB_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_CONFG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_DESTN FOR APEXFRAMEWORK.VD_AFW_01_DESTN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_ELEMN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_HIERC_APLIC FOR APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_LANG_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG_LANG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_MESG_ERR_LIE FOR APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_MESG_INFOR FOR APEXFRAMEWORK.VD_AFW_01_MESG_INFOR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_MESG_LANG FOR APEXFRAMEWORK.VD_AFW_01_MESG_LANG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_MESG_TRADC_APEX FOR APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_MODL_AFICH_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_MODL_COMNC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_MODL_MESG_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_NOTFC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_OSA_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_PROPG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_RESLT_DESTN FOR APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_TYPE_COMNC FOR APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_03_CLAS_INTER FOR APEXFRAMEWORK.VD_AFW_03_CLAS_INTER;


CREATE OR REPLACE SYNONYM TC.VD_AFW_03_JOURN FOR APEXFRAMEWORK.VD_AFW_03_JOURN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_03_JOURN_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_03_LIEN_CLAS_INTER_UTIL FOR APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_04_CONTX FOR APEXFRAMEWORK.VD_AFW_04_CONTX;


CREATE OR REPLACE SYNONYM TC.VD_AFW_04_CONTX_ETEND FOR APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND;


CREATE OR REPLACE SYNONYM TC.VD_AFW_04_FIL_ARIAN FOR APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_04_NAVGT_HISTR FOR APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_04_TUTRL FOR APEXFRAMEWORK.VD_AFW_04_TUTRL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_07_AUDIT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_07_VALR_AUDIT_STR_APL FOR APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_ATRIB_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ENTIT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_PARMT_AFW FOR APEXFRAMEWORK.VD_AFW_11_PARMT_AFW;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_PLUGN FOR APEXFRAMEWORK.VD_AFW_11_PLUGN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_PRODT_LANG FOR APEXFRAMEWORK.VD_AFW_11_PRODT_LANG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_PRODT_RESRC FOR APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_UTILS FOR APEXFRAMEWORK.VD_AFW_11_UTILS;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_VERSN FOR APEXFRAMEWORK.VD_AFW_11_VERSN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_ACTIO_AUDIT FOR APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_ARBRE FOR APEXFRAMEWORK.VD_AFW_12_ARBRE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_DEFNT_ACCES FOR APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_DOMN FOR APEXFRAMEWORK.VD_AFW_12_DOMN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_DOMN_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_EVOLT_STAT FOR APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_FAVR FOR APEXFRAMEWORK.VD_AFW_12_FAVR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_FONCT FOR APEXFRAMEWORK.VD_AFW_12_FONCT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_FONCT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_GROUP_STAT FOR APEXFRAMEWORK.VD_AFW_12_GROUP_STAT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_HISTR_ACCES FOR APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_HISTR_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_LIEN_GR_GADGT_GR_U FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_LIEN_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_LIEN_STRUC FOR APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_MEMBR_STRUC FOR APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_SESN FOR APEXFRAMEWORK.VD_AFW_12_SESN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_STAT FOR APEXFRAMEWORK.VD_AFW_12_STAT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_STRUC_ADMIN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_STRUC_APLIC_DESTN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_STRUC_APLIC_LANG FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_TUTRL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_TYPE_STRUC FOR APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_UTILS FOR APEXFRAMEWORK.VD_AFW_12_UTILS;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_UTILS_AVATR FOR APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_CONDT_EXECT FOR APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_EMPLA_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_ETAPE_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_FORMT_RESRC FOR APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_INSTA_PREFR FOR APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_LIEN_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_LISTE_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_MENU FOR APEXFRAMEWORK.VD_AFW_13_MENU;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_MIME_TYPE FOR APEXFRAMEWORK.VD_AFW_13_MIME_TYPE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_NAVGT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_NAVGT_ELEMN FOR APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_OCURN_RESRC FOR APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_OPERT FOR APEXFRAMEWORK.VD_AFW_13_OPERT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_OPERT_OPTIO FOR APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_PAGE FOR APEXFRAMEWORK.VD_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_PAGE_IR FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_PAGE_ITEM_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_PAGE_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_LANG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_PAGE_PREFR_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_REGN_PILTB FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_REGN_PILTB_LANG FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_TUTRL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_TYPE_FICHR FOR APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_14_DETL_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_14_FORMT FOR APEXFRAMEWORK.VD_AFW_14_FORMT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_14_TYPE_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_17_COMPT_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_17_COMPT_TWILI FOR APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI;


CREATE OR REPLACE SYNONYM TC.VD_AFW_17_COURL FOR APEXFRAMEWORK.VD_AFW_17_COURL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_17_COURL_DESTN FOR APEXFRAMEWORK.VD_AFW_17_COURL_DESTN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_17_PIECE_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_17_PROFL_COURL FOR APEXFRAMEWORK.VD_AFW_17_PROFL_COURL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_17_SMS_TWILI FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI;


CREATE OR REPLACE SYNONYM TC.VD_AFW_17_SMS_TWILI_ENTRA FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA;


CREATE OR REPLACE SYNONYM TC.VD_AFW_17_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_19_BOUTN FOR APEXFRAMEWORK.VD_AFW_19_BOUTN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_19_CLE FOR APEXFRAMEWORK.VD_AFW_19_CLE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_19_DISPN_FONCT FOR APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_19_FONCT FOR APEXFRAMEWORK.VD_AFW_19_FONCT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_19_FONCT_LANG FOR APEXFRAMEWORK.VD_AFW_19_FONCT_LANG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_19_SPECF_FONCT FOR APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_20_DEPLM FOR APEXFRAMEWORK.VD_AFW_20_DEPLM;


CREATE OR REPLACE SYNONYM TC.VD_AFW_20_DETL_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_20_MODL FOR APEXFRAMEWORK.VD_AFW_20_MODL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_20_MODL_EXCEP FOR APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP;


CREATE OR REPLACE SYNONYM TC.VD_AFW_20_MODL_PARMT FOR APEXFRAMEWORK.VD_AFW_20_MODL_PARMT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_20_SECTN_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_21_PLUGN_ARBRE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_21_PLUGN_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM TC.VD_AFW_21_PLUGN_CALND FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND;


CREATE OR REPLACE SYNONYM TC.VD_AFW_21_PLUGN_CALND_COULR FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_21_PLUGN_CALND_TYPE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_21_PLUGN_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU;


CREATE OR REPLACE SYNONYM TC.VD_AFW_21_PLUGN_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU;


CREATE OR REPLACE SYNONYM TC.VD_AFW_23_DETL_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_23_ENONC_RECHR FOR APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_23_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_MODL_RECHR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_23_PATRN_RECHR FOR APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_23_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RECHR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_23_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_CHAMP;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_DOMN_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_ELEMN_CONFG_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_ENGIN FOR APEXFRAMEWORK.VD_AFW_25_ENGIN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_ENGIN_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_GROUP_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_JOURN_TRAVL_EXECT FOR APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_OCURN_PARMT_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_PARMT_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_PARMT_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TRAVL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_TYPE_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_VALR_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_VALR_ELEMN_CONFG FOR APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_29_CONTR FOR APEXFRAMEWORK.VD_AFW_29_CONTR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_30_AFECT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM;


CREATE OR REPLACE SYNONYM TC.VD_AFW_30_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_30_CAS_UTILS FOR APEXFRAMEWORK.VD_AFW_30_CAS_UTILS;


CREATE OR REPLACE SYNONYM TC.VD_AFW_30_EFORT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM;


CREATE OR REPLACE SYNONYM TC.VD_AFW_30_HISTR_EFORT_RESTN FOR APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_30_ITEM_CARNT_PRODT FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_30_ITEM_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_30_PAGE FOR APEXFRAMEWORK.VD_AFW_30_PAGE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_30_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM;


CREATE OR REPLACE SYNONYM TC.VD_AFW_37_GADGT_CATGR FOR APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_37_GADGT_PARMT FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_37_GADGT_PARMT_RACRC FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM TC.VD_AFW_37_TABL_BORD FOR APEXFRAMEWORK.VD_AFW_37_TABL_BORD;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_ATRIB_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_CONFG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_DESTN FOR APEXFRAMEWORK.VD_AFW_01_DESTN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_ELEMN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_HIERC_APLIC FOR APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_LANG_LANG FOR APEXFRAMEWORK.VD_AFW_01_LANG_LANG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_MESG_ERR_LIE FOR APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_MESG_INFOR FOR APEXFRAMEWORK.VD_AFW_01_MESG_INFOR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_MESG_LANG FOR APEXFRAMEWORK.VD_AFW_01_MESG_LANG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_MESG_TRADC_APEX FOR APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_MODL_AFICH_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_MODL_COMNC FOR APEXFRAMEWORK.VD_AFW_01_MODL_COMNC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_MODL_MESG_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_NOTFC FOR APEXFRAMEWORK.VD_AFW_01_NOTFC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_OSA_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_PROPG_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_RESLT_DESTN FOR APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_TYPE_COMNC FOR APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_03_CLAS_INTER FOR APEXFRAMEWORK.VD_AFW_03_CLAS_INTER;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_03_JOURN FOR APEXFRAMEWORK.VD_AFW_03_JOURN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_03_JOURN_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_03_LIEN_CLAS_INTER_UTIL FOR APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_04_CONTX FOR APEXFRAMEWORK.VD_AFW_04_CONTX;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_04_CONTX_ETEND FOR APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_04_FIL_ARIAN FOR APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_04_NAVGT_HISTR FOR APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_04_TUTRL FOR APEXFRAMEWORK.VD_AFW_04_TUTRL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_07_AUDIT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_07_VALR_AUDIT_STR_APL FOR APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_ATRIB_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_ENTIT FOR APEXFRAMEWORK.VD_AFW_11_ENTIT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_PARMT_AFW FOR APEXFRAMEWORK.VD_AFW_11_PARMT_AFW;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_PLUGN FOR APEXFRAMEWORK.VD_AFW_11_PLUGN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_PRODT_LANG FOR APEXFRAMEWORK.VD_AFW_11_PRODT_LANG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_PRODT_RESRC FOR APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_UTILS FOR APEXFRAMEWORK.VD_AFW_11_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_VERSN FOR APEXFRAMEWORK.VD_AFW_11_VERSN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_ACTIO_AUDIT FOR APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_ARBRE FOR APEXFRAMEWORK.VD_AFW_12_ARBRE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_DEFNT_ACCES FOR APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_DOMN FOR APEXFRAMEWORK.VD_AFW_12_DOMN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_DOMN_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_EVOLT_STAT FOR APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_FAVR FOR APEXFRAMEWORK.VD_AFW_12_FAVR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_FONCT FOR APEXFRAMEWORK.VD_AFW_12_FONCT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_FONCT_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_GROUP_STAT FOR APEXFRAMEWORK.VD_AFW_12_GROUP_STAT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_HISTR_ACCES FOR APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_HISTR_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_LIEN_GR_GADGT_GR_U FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_LIEN_GROUP_UTILS FOR APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_LIEN_STRUC FOR APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_MEMBR_STRUC FOR APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_SERVR_LDAP FOR APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_SESN FOR APEXFRAMEWORK.VD_AFW_12_SESN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_STAT FOR APEXFRAMEWORK.VD_AFW_12_STAT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_STRUC_ADMIN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_STRUC_APLIC_DESTN FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_STRUC_APLIC_LANG FOR APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_TUTRL FOR APEXFRAMEWORK.VD_AFW_12_TUTRL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_TYPE_STRUC FOR APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_UTILS FOR APEXFRAMEWORK.VD_AFW_12_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_UTILS_AVATR FOR APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_CONDT_EXECT FOR APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_EMPLA_DOSR_VIRTL FOR APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_ETAPE_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_FORMT_RESRC FOR APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_INSTA_PREFR FOR APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_LIEN_CONDT_PILTB FOR APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_LISTE_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_MENU FOR APEXFRAMEWORK.VD_AFW_13_MENU;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_MIME_TYPE FOR APEXFRAMEWORK.VD_AFW_13_MIME_TYPE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_NAVGT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_NAVGT_ELEMN FOR APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_OCURN_RESRC FOR APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_OPERT FOR APEXFRAMEWORK.VD_AFW_13_OPERT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_OPERT_OPTIO FOR APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_PAGE FOR APEXFRAMEWORK.VD_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_PAGE_IR FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_PAGE_ITEM_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_PAGE_LANG FOR APEXFRAMEWORK.VD_AFW_13_PAGE_LANG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_PAGE_PREFR_NAVGT FOR APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_REGN_PILTB FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_REGN_PILTB_LANG FOR APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_TUTRL FOR APEXFRAMEWORK.VD_AFW_13_TUTRL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_TYPE_FICHR FOR APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_14_DETL_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_14_FORMT FOR APEXFRAMEWORK.VD_AFW_14_FORMT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_14_TYPE_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_17_COMPT_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_17_COMPT_TWILI FOR APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_17_COURL FOR APEXFRAMEWORK.VD_AFW_17_COURL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_17_COURL_DESTN FOR APEXFRAMEWORK.VD_AFW_17_COURL_DESTN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_17_PIECE_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_17_PROFL_COURL FOR APEXFRAMEWORK.VD_AFW_17_PROFL_COURL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_17_SMS_TWILI FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_17_SMS_TWILI_ENTRA FOR APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_17_TELCP_AXIAT FOR APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_19_BOUTN FOR APEXFRAMEWORK.VD_AFW_19_BOUTN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_19_CLE FOR APEXFRAMEWORK.VD_AFW_19_CLE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_19_DISPN_FONCT FOR APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_19_FONCT FOR APEXFRAMEWORK.VD_AFW_19_FONCT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_19_FONCT_LANG FOR APEXFRAMEWORK.VD_AFW_19_FONCT_LANG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_19_SPECF_FONCT FOR APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_20_DEPLM FOR APEXFRAMEWORK.VD_AFW_20_DEPLM;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_20_DETL_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_20_MODL FOR APEXFRAMEWORK.VD_AFW_20_MODL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_20_MODL_EXCEP FOR APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_20_MODL_PARMT FOR APEXFRAMEWORK.VD_AFW_20_MODL_PARMT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_20_SECTN_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_21_PLUGN_ARBRE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_21_PLUGN_ARBRE_NOEUD FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_21_PLUGN_CALND FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_21_PLUGN_CALND_COULR FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_21_PLUGN_CALND_TYPE FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_21_PLUGN_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_21_PLUGN_MENU FOR APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_23_DETL_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_23_ENONC_RECHR FOR APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_23_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_MODL_RECHR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_23_PATRN_RECHR FOR APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_23_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RECHR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_23_RESLT_RECHR FOR APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_CHAMP;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_DOMN_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_ELEMN_CONFG_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_ENGIN FOR APEXFRAMEWORK.VD_AFW_25_ENGIN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_ENGIN_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_GROUP_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_JOURN_TRAVL_EXECT FOR APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_OCURN_PARMT_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_PARMT_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_PARMT_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_PUBLC_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TRAVL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_TYPE_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_TYPE_TRAVL FOR APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_VALR_CHAMP FOR APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_VALR_ELEMN_CONFG FOR APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_VERSN_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_29_CONTR FOR APEXFRAMEWORK.VD_AFW_29_CONTR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_30_AFECT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_30_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_30_CAS_UTILS FOR APEXFRAMEWORK.VD_AFW_30_CAS_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_30_EFORT_ITEM FOR APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_30_HISTR_EFORT_RESTN FOR APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_30_ITEM_CARNT_PRODT FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_30_ITEM_CARNT_SPRIN FOR APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_30_PAGE FOR APEXFRAMEWORK.VD_AFW_30_PAGE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_30_PAGE_ITEM FOR APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_37_GADGT_CATGR FOR APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_37_GADGT_PARMT FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_37_GADGT_PARMT_RACRC FOR APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_37_TABL_BORD FOR APEXFRAMEWORK.VD_AFW_37_TABL_BORD;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB;

create or replace force view apexframework.vd_afw_01_evenm_notfb
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
 ,ref_struc_aplic_code
 ,ref_struc_aplic_formt
 ,ref_prodt
 ,ref_prodt_formt
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
        , (select code
             from vd_afw_12_struc_aplic sa
            where sa.seqnc = en.ref_struc_aplic)
           ref_struc_aplic_code
        , (select nom
             from vd_afw_12_struc_aplic sa
            where sa.seqnc = en.ref_struc_aplic)
           ref_struc_aplic_formt
        , (select ref_prodt
             from vd_afw_12_struc_aplic sa
            where sa.seqnc = en.ref_struc_aplic)
           ref_prodt
        , (select ref_prodt_formt
             from vd_afw_12_struc_aplic sa
            where sa.seqnc = en.ref_struc_aplic)
           ref_prodt_formt
    from vd_i_afw_01_evenm_notfb en;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_MESG;

create or replace force view apexframework.vd_afw_01_mesg
(
  seqnc
 ,numr_mesg
 ,numr_mesg_formt
 ,ref_prodt
 ,ref_prodt_formt
 ,descr
 ,type_mesg
 ,type_mesg_formt
)
as
  select seqnc
        ,numr_mesg
        , (select mesg
             from vd_afw_01_mesg_lang ml
            where     ml.ref_mesg = mes.seqnc
                  and ml.ref_lang = afw_01_lang_pkg.obten_lang_sesn)
           numr_mesg_formt
        ,ref_prodt
        ,nvl ( (select    p.code
                       || ' - '
                       || p.nom
                  from vd_i_afw_11_prodt p
                 where p.seqnc = mes.ref_prodt)
             ,'- Global -')
           ref_prodt_formt
        ,descr
        ,type_mesg
        ,decode (type_mesg,  'E', 'Erreur',  'A', 'Aide',  'W', 'Avertissement',  'I', 'Informatif',  'C', 'Erreur critique',  null) type_mesg_formt
    from vd_i_afw_01_mesg mes;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_APLIC;

create or replace force view apexframework.vd_afw_11_aplic
(
  seqnc
 ,code
 ,nom
 ,nom_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,numr_aplic_apex
 ,ref_lang
 ,lang_formt
 ,date_dernr_maj_refrn_apex
 ,ref_versn
 ,ref_numr_versn_formt
 ,ref_nom_versn
 ,indic_aplic_authe
 ,ref_aplic_authe
 ,ref_page_conxn
 ,ref_page_acuei
 ,ref_prodt
)
as
  select a.seqnc
        ,a.code
        ,a.nom
        ,   a.numr_aplic_apex
         || ' - '
         || a.code
         || ' - '
         || a.nom
         || ' '
         || (select afw_11_versn_pkg.obten_versn (v.numr_versn_1
                                                 ,v.numr_versn_2
                                                 ,v.numr_versn_3
                                                 ,v.numr_versn_4)
               from vd_i_afw_11_versn v
              where v.seqnc = a.ref_versn)
           nom_formt
        ,a.date_creat
        ,a.utils_creat
        ,a.date_modfc
        ,a.utils_modfc
        ,a.numr_aplic_apex
        ,afw_11_aplic_pkg.obten_lang_deft (a.seqnc) ref_lang
        ,afw_11_aplic_pkg.obten_lang_deft_formt (a.seqnc) lang_formt
        ,a.date_dernr_maj_refrn_apex
        ,a.ref_versn
        , (select afw_11_versn_pkg.obten_versn (v.numr_versn_1
                                               ,v.numr_versn_2
                                               ,v.numr_versn_3
                                               ,v.numr_versn_4)
             from vd_i_afw_11_versn v
            where v.seqnc = a.ref_versn)
           ref_numr_versn_formt
        , (select v.nom
             from vd_afw_11_versn v
            where v.seqnc = a.ref_versn)
           ref_nom_versn
        ,a.indic_aplic_authe
        ,a.ref_aplic_authe
        ,a.ref_page_conxn
        ,a.ref_page_acuei
        ,a.ref_prodt
    from vd_i_afw_11_aplic a;


DROP VIEW APEXFRAMEWORK.VD_AFW_11_PRODT;

create or replace force view apexframework.vd_afw_11_prodt
(
  seqnc
 ,code
 ,nom
 ,nom_formt
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
 ,ref_numr_versn_formt
 ,ref_nom_versn
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
 ,ref_numr_aplic_acuei
 ,ref_page_acuei
 ,ref_numr_page_acuei
 ,ref_aplic_comnt_bogue
 ,ref_numr_aplic_comnt_bogue
 ,ref_page_comnt_bogue
 ,ref_numr_page_comnt_bogue
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
        ,   p.nom
         || ' '
         || (select afw_11_versn_pkg.obten_versn (v.numr_versn_1
                                                 ,v.numr_versn_2
                                                 ,v.numr_versn_3
                                                 ,v.numr_versn_4)
               from vd_i_afw_11_versn v
              where v.seqnc = p.ref_versn)
           nom_formt
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
        , (select afw_11_versn_pkg.obten_versn (v.numr_versn_1
                                               ,v.numr_versn_2
                                               ,v.numr_versn_3
                                               ,v.numr_versn_4)
             from vd_i_afw_11_versn v
            where v.seqnc = p.ref_versn)
           ref_numr_versn_formt
        , (select v.nom
             from vd_afw_11_versn v
            where v.seqnc = ref_versn)
           ref_nom_versn
        ,mesg_tout_droit_resrv
        ,jquer_ui_css_scope
        ,indic_afich_err_code
        , --afw_11_prodt_pkg.obten_lang_sesn ref_lang,
         --afw_11_prodt_pkg.obten_code_lang_sesn lang_formt,
         ref_mesg_sucs
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
        ,afw_11_prodt_pkg.obten_numr_apex_aplic_acuei
        , --afw_11_aplic_pkg.obten_numr_apex_aplic (p.ref_aplic_acuei) ref_numr_aplic_acuei,
         ref_page_acuei
        ,afw_11_prodt_pkg.obten_numr_apex_page_acuei
        , --afw_13_page_pkg.obten_numr_apex_page (p.ref_page_acuei) ref_numr_page_acuei,
         ref_aplic_comnt_bogue
        ,afw_11_aplic_pkg.obten_numr_apex_aplic (p.ref_aplic_comnt_bogue) ref_numr_aplic_comnt_bogue
        ,ref_page_comnt_bogue
        ,afw_13_page_pkg.obten_numr_apex_page (p.ref_page_comnt_bogue) ref_numr_page_comnt_bogue
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
    from vd_i_afw_11_prodt p;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC;

create or replace force view apexframework.vd_afw_12_atrib_struc_aplic
(
  seqnc
 ,nom_coln
 ,nom_fonct
 ,ref_dv_natr_infor
 ,ref_dv_natr_infor_code
 ,ref_dv_natr_infor_formt
 ,indic_valid
 ,indic_valid_formt
 ,ref_struc_aplic
 ,ref_atrib_struc_aplic
 ,ref_atrib_struc_aplic_nom_sa
 ,ref_atrib_struc_aplic_seqnc_sa
 ,indic_destn
)
as
  select seqnc
        ,nom_coln
        ,nom_fonct
        ,ref_dv_natr_infor
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_natr_infor)
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_natr_infor)
        ,indic_valid
        ,case when indic_valid = 'O' then '' else 'Inexistant dans la structure d''accès' end indic_valid_formt
        ,ref_struc_aplic
        ,ref_atrib_struc_aplic
        , (select sa.nom
             from vd_afw_12_struc_aplic sa
                 ,vd_i_afw_12_atrib_struc_aplic asa2
            where     sa.seqnc = asa2.ref_struc_aplic
                  and asa2.seqnc = asa.ref_atrib_struc_aplic)
           ref_atrib_struc_aplic_nom_sa
        , (select asa2.ref_struc_aplic
             from vd_i_afw_12_atrib_struc_aplic asa2
            where asa2.seqnc = asa.ref_atrib_struc_aplic)
           ref_atrib_struc_aplic_seqnc_sa
        ,indic_destn
    from vd_i_afw_12_atrib_struc_aplic asa;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT;

create or replace force view apexframework.vd_afw_12_domn_fonct
(
  seqnc
 ,ref_fonct
 ,ref_fonct_formt
 ,ref_domn
 ,ref_domn_formt
 ,indic_actif
 ,indic_actif_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_fonct
        , (select f.nom
             from vd_afw_12_fonct f
            where f.seqnc = ref_fonct)
        ,ref_domn
        ,afw_12_domn_pkg.obten_code_domn (ref_domn)
        ,indic_actif
        ,case indic_actif when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>' else null end
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_domn_fonct;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS;

create or replace force view apexframework.vd_afw_12_domn_utils
(
  seqnc
 ,ref_utils
 ,ref_utils_formt
 ,ref_code_utils
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
        , (select nom_formt
             from vd_afw_12_utils u
            where u.seqnc = du.ref_utils)
        , (select code_utils
             from vd_afw_12_utils u
            where u.seqnc = du.ref_utils)
        ,ref_domn
        ,date_debut_efect
        ,date_fin_efect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_domn_utils du;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM;

create or replace force view apexframework.vd_afw_12_gr_ut_opert_opt_dom
(
  seqnc
 ,ref_group_utils
 ,ref_group_utils_formt
 ,ref_group_utils_code
 ,ref_opert
 ,ref_opert_formt
 ,ref_opert_optio
 ,ref_opert_optio_formt
 ,ref_domn
 ,ref_domn_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_group_utils
        ,afw_12_group_utils_pkg.obten_nom (ref_group_utils)
        ,afw_12_group_utils_pkg.obten_code (ref_group_utils)
        ,ref_opert
        , (select o.nom
             from vd_afw_13_opert o
            where o.seqnc = ref_opert)
        ,ref_opert_optio
        , (select oo.nom
             from vd_afw_13_opert_optio oo
            where oo.seqnc = ref_opert_optio)
        ,ref_domn
        ,afw_12_domn_pkg.obten_code_domn (ref_domn)
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_g_u_opert_opt_dom;


DROP VIEW APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS;

create or replace force view apexframework.vd_afw_12_reqt_inter_utils
(
  seqnc
 ,ident
 ,ref_utils
 ,ref_utils_code
 ,ref_utils_formt
 ,ref_dv_type_reqt_inter
 ,ref_dv_type_reqt_inter_code
 ,ref_dv_type_reqt_inter_formt
 ,date_debut_efect
 ,date_fin_efect
 ,ref_domn
 ,ref_prodt
 ,numr_aplic_apex
 ,numr_page_apex
 ,url_inter
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_trait
 ,indic_trait_formt
 ,procd_persn_url_apres_authe
)
as
  select riu.seqnc
        ,riu.ident
        ,riu.ref_utils
        , (select u.code_utils
             from vd_afw_12_utils u
            where u.seqnc = riu.ref_utils)
        , (select u.nom_formt
             from vd_afw_12_utils u
            where u.seqnc = riu.ref_utils)
        ,riu.ref_dv_type_reqt_inter
        ,afw_14_domn_valr_pkg.obten_code (riu.ref_dv_type_reqt_inter)
        ,afw_14_domn_valr_pkg.obten_valr (riu.ref_dv_type_reqt_inter)
        ,riu.date_debut_efect
        ,riu.date_fin_efect
        ,riu.ref_domn
        ,riu.ref_prodt
        ,riu.numr_aplic_apex
        ,riu.numr_page_apex
        ,afw_12_reqt_inter_utils_pkg.obten_url_inter_formt_html (riu.seqnc)
        ,riu.date_creat
        ,riu.utils_creat
        ,riu.date_modfc
        ,riu.utils_modfc
        ,riu.date_trait
        ,case when riu.date_trait is not null then '<span class=ui-button-icon-primary ui-icon fff-icon-tick></span>' else null end indic_trait_formt
        ,procd_persn_url_apres_authe
    from vd_i_afw_12_reqt_inter_utils riu;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC;

create or replace force view apexframework.vd_afw_13_expor_aplic
(
  seqnc
 ,ref_sesn
 ,ref_aplic
 ,ref_aplic_formt
 ,ref_aplic_code
 ,ref_aplic_nom
 ,ref_aplic_aplic_authe
 ,numr_aplic_courn
 ,indic_maj_refrn
 ,numr_aplic_cible
 ,indic_ajout_aplic_apex
)
as
  select seqnc
        ,ref_sesn
        ,ref_aplic
        , (select nom_formt
             from vd_afw_11_aplic a
            where a.seqnc = ea.ref_aplic)
           ref_aplic_formt
        ,afw_11_aplic_pkg.obten_code_aplic (ea.ref_aplic) ref_aplic_code
        , (select nom
             from vd_afw_11_aplic a
            where a.seqnc = ea.ref_aplic)
           ref_aplic_nom
        , (select ref_aplic_authe
             from vd_afw_11_aplic a
            where a.seqnc = ea.ref_aplic)
           ref_aplic_aplic_authe
        ,afw_11_aplic_pkg.obten_numr_apex_aplic (ea.ref_aplic) numr_aplic_courn
        ,indic_maj_refrn
        ,numr_aplic_cible
        ,indic_ajout_aplic_apex
    from vd_i_afw_13_expor_aplic ea;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE;

create or replace force view apexframework.vd_afw_13_expor_page
(
  ref_page
 ,ref_sesn
 ,numr_apex
 ,nom
 ,seqnc
)
as
  select ref_page
        ,ref_sesn
        , (select numr_apex
             from vd_afw_13_page p
            where p.seqnc = ref_page)
           numr_apex
        , (select nom
             from vd_afw_13_page p
            where p.seqnc = ref_page)
           nom
        ,seqnc
    from vd_i_afw_13_expor_page
   where ref_sesn = afw_08_url_pkg.obten_sesn
  with check option;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_ITEM_MENU;

create or replace force view apexframework.vd_afw_13_item_menu
(
  seqnc
 ,code
 ,nom
 ,descr
 ,forml_libl
 ,forml_libl_formt
 ,ref_dv_valr_insta_libl
 ,ref_dv_vil_code
 ,aide_insta
 ,titre_aide_insta
 ,ordre_presn
 ,ref_page
 ,ref_page_formt
 ,ref_page_numr_apex
 ,ref_prodt_numr_apex_menu
 ,ref_page_struc_aplic
 ,ref_dv_valr_url
 ,forml_valr_url
 ,icone
 ,efacr_cache
 ,ref_menu
 ,ref_item_menu
 ,ref_item_menu_formt
 ,ref_dv_valr_reqst
 ,forml_valr_reqst
 ,indic_reint_pagnt
 ,indic_reint_page_ir
 ,indic_clear_page_ir
 ,indic_soums_page
 ,indic_reint_navgt
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
 ,liste_ref_page_activ
 ,ref_aplic
 ,ref_code_aplic_formt
 ,ref_aplic_formt
 ,ref_struc_aplic
 ,ref_resrc
 ,ref_ocurn_resrc
 ,ref_formt_resrc
 ,indic_gerer_sidf
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
        ,case
           when (select ddv.code_valr
                   from vd_i_afw_14_detl_domn_valr ddv
                  where ddv.seqnc = im.ref_dv_valr_insta_libl) in ('ITEM'
                                                                  ,'PL/SQL')
           then
             afw_13_menu_pkg.obten_libl (im.seqnc)
           else
             forml_libl
         end
           as forml_libl_formt
        ,ref_dv_valr_insta_libl
        , (select ddv.code_valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = im.ref_dv_valr_insta_libl)
           as ref_dv_vil_code
        ,aide_insta
        ,titre_aide_insta
        ,ordre_presn
        ,ref_page
        , (select p.nom
             from vd_i_afw_13_page p
            where p.seqnc = im.ref_page)
           as ref_page_formt
        , (select p.numr_apex
             from vd_i_afw_13_page p
            where p.seqnc = im.ref_page)
           as ref_page_numr_apex
        , (select p.app_id_formt
             from vd_afw_13_page p
            where p.seqnc = im.ref_page)
           as ref_prodt_numr_apex_menu
        , (select p.ref_struc_aplic
             from vd_i_afw_13_page p
            where p.seqnc = im.ref_page)
           as ref_page_struc_aplic
        ,ref_dv_valr_url
        ,forml_valr_url
        ,icone
        ,efacr_cache
        ,ref_menu
        ,ref_item_menu
        , (select im2.nom
             from vd_i_afw_13_item_menu im2
            where im2.seqnc = im.ref_item_menu)
           as ref_item_menu_formt
        ,ref_dv_valr_reqst
        ,forml_valr_reqst
        ,indic_reint_pagnt
        ,indic_reint_page_ir
        ,indic_clear_page_ir
        ,indic_soums_page
        ,indic_reint_navgt
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
        ,liste_ref_page_activ
        ,ref_aplic
        , (select p.code
             from vd_i_afw_11_aplic p
            where p.seqnc = im.ref_aplic)
           as ref_code_aplic_formt
        , (select a.nom
             from vd_afw_11_aplic a
            where a.seqnc = im.ref_aplic)
           as ref_aplic_formt
        ,ref_struc_aplic
        ,ref_resrc
        ,ref_ocurn_resrc
        ,ref_formt_resrc
        ,indic_gerer_sidf
        ,ref_dv_valr_insta_condt_afich
        ,forml_condt_afich
        ,lien_id_html
        ,lien_class_css_html
        ,lien_atrib_html
    from vd_i_afw_13_item_menu im;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN;

create or replace force view apexframework.vd_afw_13_page_ir_coln
(
  seqnc
 ,ref_page_ir
 ,ordre_afich
 ,libl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coln_table
 ,id_apex
 ,largr
 ,type_largr
 ,indic_exprt
 ,ref_mesg_aide
 ,ref_mesg_aide_numr
)
as
  select seqnc
        ,ref_page_ir
        ,ordre_afich
        ,libl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coln_table
        ,id_apex
        ,largr
        ,type_largr
        ,indic_exprt
        ,ref_mesg_aide
        , (select mes.numr_mesg
             from vd_afw_01_mesg mes
            where mes.seqnc = pic.ref_mesg_aide)
           ref_mesg_aide_numr
    from vd_i_afw_13_page_ir_coln pic;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_PREFR;

create or replace force view apexframework.vd_afw_13_prefr
(
  seqnc
 ,code
 ,ref_dv_condt_utils
 ,ref_dv_condt_utils_formt
 ,ref_dv_condt_utils_organ
 ,forml_condt_utils
 ,ref_dv_condt_sauvg
 ,ref_dv_condt_sauvg_formt
 ,ref_dv_condt_sauvg_organ
 ,forml_condt_sauvg
 ,ref_dv_type_insta
 ,ref_dv_type_insta_formt
 ,ref_dv_type_insta_organ
 ,indic_contx
 ,ref_dv_valr_insta
 ,ref_dv_valr_insta_formt
 ,ref_dv_valr_insta_organ
 ,forml_valr_insta
 ,descr_comnt
 ,ref_item
 ,ref_item_formt
 ,ref_aplic
 ,ref_code_aplic
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,ref_dv_condt_utils
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_condt_utils)
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_condt_utils)
        ,forml_condt_utils
        ,ref_dv_condt_sauvg
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_condt_sauvg)
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_condt_sauvg)
        ,forml_condt_sauvg
        ,ref_dv_type_insta
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_type_insta)
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_type_insta)
        ,indic_contx
        ,ref_dv_valr_insta
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_valr_insta)
        ,afw_14_domn_valr_pkg.obten_valr_organ (ref_dv_valr_insta)
        ,forml_valr_insta
        ,descr_comnt
        ,ref_item
        , (select pi.libl
             from vd_afw_13_page_item pi
            where pi.seqnc = pr.ref_item)
           ref_item_formt
        , (select a.seqnc
             from vd_afw_13_page p
                 ,vd_afw_11_aplic a
                 ,vd_afw_13_page_item pi
            where     pi.seqnc = pr.ref_item
                  and pi.ref_page = p.seqnc
                  and p.ref_aplic = a.seqnc)
           ref_aplic
        , (select a.code
             from vd_afw_13_page p
                 ,vd_afw_11_aplic a
                 ,vd_afw_13_page_item pi
            where     pi.seqnc = pr.ref_item
                  and pi.ref_page = p.seqnc
                  and p.ref_aplic = a.seqnc)
           ref_code_aplic
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_prefr pr;


DROP VIEW APEXFRAMEWORK.VD_AFW_13_RESRC;

create or replace force view apexframework.vd_afw_13_resrc
(
  seqnc
 ,code
 ,nom
 ,nom_formt
 ,nom_physq_comps
 ,ref_prodt
 ,descr
 ,ref_type_fichr
 ,ref_type_fichr_formt
 ,ref_struc_aplic
 ,indic_stock_meme_reprt
 ,ref_dosr_virtl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_resrc
 ,type_resrc_formt
 ,indic_publc
 ,empla_html
 ,ref_plugn
)
as
  select seqnc
        ,code
        ,nom
        ,case
           when ref_prodt is not null
           then
                '[Application] '
             || nom
           when ref_struc_aplic is not null
           then
                '[Structure applicative - '
             || (select sa.nom
                   from vd_i_afw_12_struc_aplic sa
                  where sa.seqnc = r.ref_struc_aplic)
             || '] '
             || nom
           when ref_plugn is not null
           then
                '[Plugin - '
             || (select p.nom
                   from vd_i_afw_11_plugn p
                  where p.seqnc = r.ref_plugn)
             || '] '
             || nom
           else
             nom
         end
           nom_formt
        ,nom_physq_comps
        ,ref_prodt
        ,descr
        ,ref_type_fichr
        , (select tf.nom
             from vd_i_afw_13_type_fichr tf
            where tf.seqnc = r.ref_type_fichr)
        ,ref_struc_aplic
        ,indic_stock_meme_reprt
        ,ref_dosr_virtl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_resrc
        , (select valr
             from vd_afw_14_detl_domn_valr ddv
            where     code_valr = type_resrc
                  and ref_code_domn_valr_formt = 'TYPE_RESRC'
                  and ddv.ref_prodt_dv = afw_11_prodt_pkg.obten_prodt_sesn)
        ,indic_publc
        ,empla_html
        ,ref_plugn
    from vd_i_afw_13_resrc r;


DROP VIEW APEXFRAMEWORK.VD_AFW_14_DOMN_VALR;

create or replace force view apexframework.vd_afw_14_domn_valr
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
 ,type_don_formt
 ,ref_formt
 ,ref_code_formt_formt
 ,ref_prodt
 ,ref_prodt_formt
 ,ref_type_domn_valr
 ,indic_systm
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
        ,decode (type_don,  'V', 'Alphanumérique',  'N', 'Numérique',  'D', 'Date',  null) type_don_formt
        ,ref_formt
        , (select defnt
             from vd_afw_14_formt f
            where f.seqnc = ref_formt)
           ref_code_formt_formt
        ,ref_prodt
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_11_prodt
            where seqnc = dv.ref_prodt)
           ref_prodt_formt
        ,ref_type_domn_valr
        ,indic_systm
        ,ref_domn
    from vd_i_afw_14_domn_valr dv;


DROP VIEW APEXFRAMEWORK.VD_AFW_20_DOCMN;

create or replace force view apexframework.vd_afw_20_docmn
(
  seqnc
 ,ref_prodt_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,ref_seqnc_struc_aplic
 ,ref_dv_type_modl
 ,ref_propr
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
        , (select ref_dv_type_modl
             from vd_i_afw_20_modl m
            where m.seqnc = ref_seqnc_struc_aplic)
        , (select m.seqnc
             from vd_afw_20_modl m
            where m.seqnc = (select ref_modl
                               from vd_afw_20_modl m2
                              where m2.seqnc = ref_seqnc_struc_aplic))
    from vd_i_afw_20_docmn d;


DROP VIEW APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR;

create or replace force view apexframework.vd_afw_23_aplic_modl_rechr
(
  seqnc
 ,ref_modl_rechr
 ,ref_struc_aplic_rechr
 ,ref_struc_aplic_rechr_formt
 ,ref_struc_aplic_lien
 ,ref_struc_aplic_lien_formt
 ,nombr_maxim_reslt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,ref_atrib_struc_aplic_afich
 ,ref_atrib_struc_aplic_af_formt
)
as
  select seqnc
        ,ref_modl_rechr
        ,ref_struc_aplic_rechr
        , (select sa.nom
             from vd_i_afw_11_prodt p
                 ,vd_i_afw_12_struc_aplic sa
            where     p.seqnc = sa.ref_prodt
                  and sa.seqnc = amr.ref_struc_aplic_rechr)
        ,ref_struc_aplic_lien
        , (select sa.nom
             from vd_i_afw_11_prodt p
                 ,vd_i_afw_12_struc_aplic sa
            where     p.seqnc = sa.ref_prodt
                  and sa.seqnc = amr.ref_struc_aplic_lien)
        ,nombr_maxim_reslt
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,ref_atrib_struc_aplic_afich
        , (select    '[ '
                  || nom_coln
                  || ' ]'
             from vd_afw_12_atrib_struc_aplic
            where seqnc = ref_atrib_struc_aplic_afich)
    from vd_i_afw_23_aplic_modl_rechr amr;


DROP VIEW APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE;

create or replace force view apexframework.vd_afw_23_detl_aplic_modl_re
(
  seqnc
 ,ref_aplic_modl_rechr
 ,ref_code_struc_aplic_formt
 ,ref_atrib_struc_aplic
 ,ref_atrib_struc_aplic_formt
 ,ref_patrn_rechr
 ,ref_patrn_rechr_formt
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
        , (select afw_12_struc_aplic_pkg.obten_code (amr.ref_struc_aplic_rechr)
             from vd_afw_23_aplic_modl_rechr amr
            where amr.seqnc = damr.ref_aplic_modl_rechr)
           ref_code_struc_aplic_formt
        ,ref_atrib_struc_aplic
        , (select asa.nom_coln
             from vd_afw_12_atrib_struc_aplic asa
            where asa.seqnc = damr.ref_atrib_struc_aplic)
        ,ref_patrn_rechr
        , (select pr.nom
             from vd_afw_23_patrn_rechr pr
            where pr.seqnc = damr.ref_patrn_rechr)
        ,ordre_exect
        ,pertn
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from vd_i_afw_23_detl_aplic_modl_re damr;


DROP VIEW APEXFRAMEWORK.VD_AFW_25_PUBLC;

create or replace force view apexframework.vd_afw_25_publc
(
  seqnc
 ,ref_type_publc
 ,ref_type_publc_fomrt
 ,ref_code_type_publc
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
        , (select nom
             from vd_afw_25_type_publc
            where seqnc = ref_type_publc)
        , (select code
             from vd_afw_25_type_publc
            where seqnc = ref_type_publc)
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_group_publc
    from vd_i_afw_25_publc;


DROP VIEW APEXFRAMEWORK.VD_AFW_37_GADGT;

create or replace force view apexframework.vd_afw_37_gadgt
(
  seqnc
 ,ref_prodt
 ,ref_struc_aplic
 ,ref_gadgt_catgr
 ,ref_gadgt_catgr_formt
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
        , (select    code
                  || ' - '
                  || nom
             from vd_afw_37_gadgt_catgr gc
            where gc.seqnc = g.ref_gadgt_catgr)
           as ref_gadgt_catgr_formt
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
    from vd_i_afw_37_gadgt g;


CREATE OR REPLACE TRIGGER APEXFRAMEWORK.vd_afw_13_page_ir_coln_iou_trg
  instead of update
  ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN
  for each row
declare
  vnu_ref_mesg_aide   number (10);
begin
  if :new.ref_mesg_aide_numr is not null
  then
    select m.seqnc
      into vnu_ref_mesg_aide
      from vd_afw_13_page_ir pi
          ,vd_afw_13_page p
          ,vd_afw_11_aplic ap
          ,vd_afw_01_mesg m
     where pi.seqnc = :new.ref_page_ir
           and pi.ref_page = p.seqnc
           and p.ref_aplic = ap.seqnc
           and ap.ref_prodt = m.ref_prodt
           and m.numr_mesg = :new.ref_mesg_aide_numr;
  end if;

  update afw_13_page_ir_coln
     set ordre_afich     = :new.ordre_afich
        ,libl            = :new.libl
        ,date_modfc      = :new.date_modfc
        ,utils_modfc     = :new.utils_modfc
        ,coln_table      = :new.coln_table
        ,id_apex         = :new.id_apex
        ,largr           = :new.largr
        ,type_largr      = :new.type_largr
        ,indic_exprt     = :new.indic_exprt
        ,ref_mesg_aide   = vnu_ref_mesg_aide
   where seqnc = :new.seqnc;
exception
  when others
  then
    raise;
end vd_afw_13_page_ir_coln_iou_trg;
/


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_MESG FOR APEXFRAMEWORK.VD_AFW_01_MESG;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_APLIC FOR APEXFRAMEWORK.VD_AFW_11_APLIC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_11_PRODT FOR APEXFRAMEWORK.VD_AFW_11_PRODT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_ATRIB_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_DOMN_FONCT FOR APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_DOMN_UTILS FOR APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_GR_UT_OPERT_OPT_DOM FOR APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_12_REQT_INTER_UTILS FOR APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_EXPOR_APLIC FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_EXPOR_PAGE FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_PAGE_IR_COLN FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_PREFR FOR APEXFRAMEWORK.VD_AFW_13_PREFR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_13_RESRC FOR APEXFRAMEWORK.VD_AFW_13_RESRC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_20_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DOCMN;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_23_APLIC_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_23_DETL_APLIC_MODL_RE FOR APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_25_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PUBLC;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_37_GADGT FOR APEXFRAMEWORK.VD_AFW_37_GADGT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_MESG FOR APEXFRAMEWORK.VD_AFW_01_MESG;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_APLIC FOR APEXFRAMEWORK.VD_AFW_11_APLIC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_11_PRODT FOR APEXFRAMEWORK.VD_AFW_11_PRODT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_ATRIB_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_DOMN_FONCT FOR APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_DOMN_UTILS FOR APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_GR_UT_OPERT_OPT_DOM FOR APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_12_REQT_INTER_UTILS FOR APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_EXPOR_APLIC FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_EXPOR_PAGE FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_PAGE_IR_COLN FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_PREFR FOR APEXFRAMEWORK.VD_AFW_13_PREFR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_13_RESRC FOR APEXFRAMEWORK.VD_AFW_13_RESRC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_20_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DOCMN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_23_APLIC_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_23_DETL_APLIC_MODL_RE FOR APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_25_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PUBLC;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_37_GADGT FOR APEXFRAMEWORK.VD_AFW_37_GADGT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_MESG FOR APEXFRAMEWORK.VD_AFW_01_MESG;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_APLIC FOR APEXFRAMEWORK.VD_AFW_11_APLIC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_11_PRODT FOR APEXFRAMEWORK.VD_AFW_11_PRODT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_ATRIB_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_DOMN_FONCT FOR APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_DOMN_UTILS FOR APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_GR_UT_OPERT_OPT_DOM FOR APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_12_REQT_INTER_UTILS FOR APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_EXPOR_APLIC FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_EXPOR_PAGE FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_PAGE_IR_COLN FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_PREFR FOR APEXFRAMEWORK.VD_AFW_13_PREFR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_13_RESRC FOR APEXFRAMEWORK.VD_AFW_13_RESRC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_20_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DOCMN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_23_APLIC_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_23_DETL_APLIC_MODL_RE FOR APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_25_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PUBLC;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_37_GADGT FOR APEXFRAMEWORK.VD_AFW_37_GADGT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_MESG FOR APEXFRAMEWORK.VD_AFW_01_MESG;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_APLIC FOR APEXFRAMEWORK.VD_AFW_11_APLIC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_11_PRODT FOR APEXFRAMEWORK.VD_AFW_11_PRODT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_ATRIB_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_DOMN_FONCT FOR APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_DOMN_UTILS FOR APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_GR_UT_OPERT_OPT_DOM FOR APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_12_REQT_INTER_UTILS FOR APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_EXPOR_APLIC FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_EXPOR_PAGE FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_PAGE_IR_COLN FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_PREFR FOR APEXFRAMEWORK.VD_AFW_13_PREFR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_13_RESRC FOR APEXFRAMEWORK.VD_AFW_13_RESRC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_20_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DOCMN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_23_APLIC_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_23_DETL_APLIC_MODL_RE FOR APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_25_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PUBLC;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_37_GADGT FOR APEXFRAMEWORK.VD_AFW_37_GADGT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_MESG FOR APEXFRAMEWORK.VD_AFW_01_MESG;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_APLIC FOR APEXFRAMEWORK.VD_AFW_11_APLIC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_11_PRODT FOR APEXFRAMEWORK.VD_AFW_11_PRODT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_ATRIB_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_DOMN_FONCT FOR APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_DOMN_UTILS FOR APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_GR_UT_OPERT_OPT_DOM FOR APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM;


CREATE OR REPLACE SYNONYM TC.VD_AFW_12_REQT_INTER_UTILS FOR APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_EXPOR_APLIC FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_EXPOR_PAGE FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_PAGE_IR_COLN FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_PREFR FOR APEXFRAMEWORK.VD_AFW_13_PREFR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_13_RESRC FOR APEXFRAMEWORK.VD_AFW_13_RESRC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_20_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DOCMN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_23_APLIC_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR;


CREATE OR REPLACE SYNONYM TC.VD_AFW_23_DETL_APLIC_MODL_RE FOR APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE;


CREATE OR REPLACE SYNONYM TC.VD_AFW_25_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PUBLC;


CREATE OR REPLACE SYNONYM TC.VD_AFW_37_GADGT FOR APEXFRAMEWORK.VD_AFW_37_GADGT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_EVENM_NOTFB FOR APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_MESG FOR APEXFRAMEWORK.VD_AFW_01_MESG;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_APLIC FOR APEXFRAMEWORK.VD_AFW_11_APLIC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_11_PRODT FOR APEXFRAMEWORK.VD_AFW_11_PRODT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_ATRIB_STRUC_APLIC FOR APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_DOMN_FONCT FOR APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_DOMN_UTILS FOR APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_GR_UT_OPERT_OPT_DOM FOR APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_12_REQT_INTER_UTILS FOR APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_EXPOR_APLIC FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_EXPOR_PAGE FOR APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VD_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_PAGE_IR_COLN FOR APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_PREFR FOR APEXFRAMEWORK.VD_AFW_13_PREFR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_13_RESRC FOR APEXFRAMEWORK.VD_AFW_13_RESRC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VD_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_20_DOCMN FOR APEXFRAMEWORK.VD_AFW_20_DOCMN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_23_APLIC_MODL_RECHR FOR APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_23_DETL_APLIC_MODL_RE FOR APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_25_PUBLC FOR APEXFRAMEWORK.VD_AFW_25_PUBLC;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_37_GADGT FOR APEXFRAMEWORK.VD_AFW_37_GADGT;


DROP VIEW APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN;

create or replace force view apexframework.vd_afw_01_destn_confg_en
(
  seqnc
 ,ref_dv_natr_destn
 ,ref_dv_natr_destn_code
 ,ref_dv_natr_destn_valr
 ,ref_confg_evenm_notfb
 ,ref_destn
 ,ref_reslt_destn
 ,ref_reslt_destn_formt
 ,ref_atrib_sa_nom_formt
 ,ref_atrib_sa_nom_formt_code
 ,ref_atrib_sa_adres_destn
 ,ref_atrib_sa_adres_destn_code
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_creat
)
as
  select seqnc
        ,ref_dv_natr_destn
        ,afw_14_domn_valr_pkg.obten_valr (ref_dv_natr_destn) ref_dv_natr_destn_valr
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_natr_destn) ref_dv_natr_destn_code
        ,ref_confg_evenm_notfb
        ,ref_destn
        ,ref_reslt_destn
        , (select rd.nom
             from vd_afw_01_reslt_destn rd
            where rd.seqnc = dc.ref_reslt_destn)
           ref_reslt_destn_formt
        ,ref_atrib_sa_nom_formt
        , (select asa.nom_coln
             from vd_afw_12_atrib_struc_aplic asa
            where asa.seqnc = dc.ref_atrib_sa_nom_formt)
           ref_atrib_sa_nom_formt_code
        ,ref_atrib_sa_adres_destn
        , (select asa.nom_coln
             from vd_afw_12_atrib_struc_aplic asa
            where asa.seqnc = dc.ref_atrib_sa_adres_destn)
           ref_atrib_sa_adres_destn_code
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,date_creat
    from vd_i_afw_01_destn_confg_en dc;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VD_AFW_01_DESTN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VD_AFW_01_DESTN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN;


CREATE OR REPLACE SYNONYM BASEBALL.VD_AFW_01_DESTN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN;


CREATE OR REPLACE SYNONYM INVENTORY.VD_AFW_01_DESTN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN;


CREATE OR REPLACE SYNONYM TC.VD_AFW_01_DESTN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN;


CREATE OR REPLACE SYNONYM TC_OPC.VD_AFW_01_DESTN_CONFG_EN FOR APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN;


GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_CODE_ERR_ORACL TO APEX_040200;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG_LANG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_AIDE TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_INFOR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_LANG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_COMNC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_NOTFC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_CLAS_INTER TO APEX_040200;

GRANT DELETE, SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_TRACE_EXECT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_TUTRL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ENTIT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PARMT_AFW TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PLUGN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_LANG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_VERSN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT TO APEX_040200;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE TO APEX_040200;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FAVR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS TO APEX_040200;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_GROUP_STAT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SESN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TUTRL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MENU TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_LANG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TUTRL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL_DESTN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PROFL_COURL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_BOUTN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_CLE TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT_LANG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DEPLM TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_PARMT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_CHAMP TO APEX_040200;

GRANT SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT TO APEX_040200;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT TO APEX_040200;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL TO APEX_040200;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_TRAVL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_29_CONTR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CAS_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_TABL_BORD TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_CODE_ERR_ORACL TO APEX_INVENTORY;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG_LANG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_AIDE TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_INFOR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_LANG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_COMNC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_NOTFC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_CLAS_INTER TO APEX_INVENTORY;

GRANT DELETE, SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_TRACE_EXECT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_TUTRL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ENTIT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PARMT_AFW TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PLUGN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_LANG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_VERSN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT TO APEX_INVENTORY;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE TO APEX_INVENTORY;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FAVR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS TO APEX_INVENTORY;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_GROUP_STAT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SESN TO APEX_INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_12_STAT TO APEX_INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TUTRL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC TO APEX_INVENTORY;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_UTILS TO APEX_INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MENU TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MIME_TYPE TO APEX_INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_LANG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TUTRL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR TO APEX_INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR TO APEX_INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_FORMT TO APEX_INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL_DESTN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PROFL_COURL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_BOUTN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_CLE TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT_LANG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DEPLM TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_PARMT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU TO APEX_INVENTORY;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR TO APEX_INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR TO APEX_INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_MODL_RECHR TO APEX_INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR TO APEX_INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RECHR TO APEX_INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR TO APEX_INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_CHAMP TO APEX_INVENTORY;

GRANT SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT TO APEX_INVENTORY;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT TO APEX_INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL TO APEX_INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_TRAVL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_29_CONTR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CAS_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_TABL_BORD TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_CODE_ERR_ORACL TO APEX_TOOLS;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG_LANG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_AIDE TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_INFOR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_LANG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_COMNC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_NOTFC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_CLAS_INTER TO APEX_TOOLS;

GRANT DELETE, SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_TRACE_EXECT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_TUTRL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ENTIT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PARMT_AFW TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PLUGN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_LANG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_VERSN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT TO APEX_TOOLS;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE TO APEX_TOOLS;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FAVR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS TO APEX_TOOLS;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_GROUP_STAT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SESN TO APEX_TOOLS;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_12_STAT TO APEX_TOOLS WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TUTRL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC TO APEX_TOOLS;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_UTILS TO APEX_TOOLS WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MENU TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MIME_TYPE TO APEX_TOOLS WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_LANG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TUTRL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR TO APEX_TOOLS;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR TO APEX_TOOLS WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_FORMT TO APEX_TOOLS WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL_DESTN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PROFL_COURL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_BOUTN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_CLE TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT_LANG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DEPLM TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_PARMT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU TO APEX_TOOLS;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR TO APEX_TOOLS WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR TO APEX_TOOLS WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_MODL_RECHR TO APEX_TOOLS WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR TO APEX_TOOLS WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RECHR TO APEX_TOOLS WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR TO APEX_TOOLS WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_CHAMP TO APEX_TOOLS;

GRANT SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT TO APEX_TOOLS;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT TO APEX_TOOLS;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL TO APEX_TOOLS;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_TRAVL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_29_CONTR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CAS_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_TABL_BORD TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_CODE_ERR_ORACL TO BASEBALL;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG_LANG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_AIDE TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_INFOR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_LANG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_COMNC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_NOTFC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_CLAS_INTER TO BASEBALL;

GRANT DELETE, SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_TRACE_EXECT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_TUTRL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ENTIT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PARMT_AFW TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PLUGN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_LANG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_VERSN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT TO BASEBALL;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE TO BASEBALL;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FAVR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS TO BASEBALL;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_GROUP_STAT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SESN TO BASEBALL;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_12_STAT TO BASEBALL WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TUTRL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC TO BASEBALL;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_UTILS TO BASEBALL WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MENU TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MIME_TYPE TO BASEBALL WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_LANG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TUTRL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR TO BASEBALL;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR TO BASEBALL WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_FORMT TO BASEBALL WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL_DESTN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PROFL_COURL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_BOUTN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_CLE TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT_LANG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DEPLM TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_PARMT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU TO BASEBALL;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR TO BASEBALL WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR TO BASEBALL WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_MODL_RECHR TO BASEBALL WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR TO BASEBALL WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RECHR TO BASEBALL WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR TO BASEBALL WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_CHAMP TO BASEBALL;

GRANT SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT TO BASEBALL;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT TO BASEBALL;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL TO BASEBALL;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_TRAVL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_29_CONTR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CAS_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_TABL_BORD TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_CODE_ERR_ORACL TO INVENTORY;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG_LANG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_AIDE TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_INFOR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_LANG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_COMNC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_NOTFC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_CLAS_INTER TO INVENTORY;

GRANT DELETE, SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_TRACE_EXECT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_TUTRL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ENTIT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PARMT_AFW TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PLUGN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_LANG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_VERSN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT TO INVENTORY;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE TO INVENTORY;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FAVR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS TO INVENTORY;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_GROUP_STAT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SESN TO INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_12_STAT TO INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TUTRL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC TO INVENTORY;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_UTILS TO INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MENU TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MIME_TYPE TO INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_LANG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TUTRL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR TO INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR TO INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_FORMT TO INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL_DESTN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PROFL_COURL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_BOUTN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_CLE TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT_LANG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DEPLM TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_PARMT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU TO INVENTORY;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR TO INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR TO INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_MODL_RECHR TO INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR TO INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RECHR TO INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR TO INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_CHAMP TO INVENTORY;

GRANT SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT TO INVENTORY;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT TO INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL TO INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_TRAVL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_29_CONTR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CAS_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_TABL_BORD TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_CODE_ERR_ORACL TO TC;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG_LANG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_AIDE TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_INFOR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_LANG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_COMNC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_NOTFC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_CLAS_INTER TO TC;

GRANT DELETE, SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_TRACE_EXECT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_TUTRL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ENTIT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PARMT_AFW TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PLUGN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_LANG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_VERSN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT TO TC;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE TO TC;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FAVR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS TO TC;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_GROUP_STAT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U TO TC;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SESN TO TC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_12_STAT TO TC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TUTRL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC TO TC;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_UTILS TO TC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MENU TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MIME_TYPE TO TC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_LANG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TUTRL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR TO TC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR TO TC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_FORMT TO TC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL_DESTN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PROFL_COURL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_BOUTN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_CLE TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT_LANG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DEPLM TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_PARMT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU TO TC;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR TO TC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR TO TC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_MODL_RECHR TO TC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR TO TC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RECHR TO TC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR TO TC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_CHAMP TO TC;

GRANT SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT TO TC;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT TO TC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL TO TC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_TRAVL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_29_CONTR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CAS_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_TABL_BORD TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ATRIB_MODL_COMNC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_CODE_ERR_ORACL TO TC_OPC;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_01_CONFG_EVENM_NOTFB TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_ELEMN_CONFG_EN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_HIERC_APLIC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_LANG_LANG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_AIDE TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_ERR_LIE TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_INFOR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_LANG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG_TRADC_APEX TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_AFICH_NOTFC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_COMNC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MODL_MESG_NOTFC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_NOTFC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_OSA_EVENM_NOTFB TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_PROPG_EVENM_NOTFB TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_RESLT_DESTN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_TYPE_COMNC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_CLAS_INTER TO TC_OPC;

GRANT DELETE, SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_JOURN_STRUC_APLIC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_LIEN_CLAS_INTER_UTIL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_03_TRACE_EXECT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_CONTX_ETEND TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_FIL_ARIAN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_NAVGT_HISTR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_04_TUTRL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_AUDIT_STRUC_APLIC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_07_VALR_AUDIT_STR_APL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ATRIB_ENTIT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_ENTIT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PARMT_AFW TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PLUGN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_LANG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT_RESRC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_VERSN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ACTIO_AUDIT TO TC_OPC;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE TO TC_OPC;

GRANT INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_ARBRE_NOEUD TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DEFNT_ACCES TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_SERVR_LDAP TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_EVOLT_STAT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FAVR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_FONCT_STRUC_APLIC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_GADGT_UTILS TO TC_OPC;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_GROUP_STAT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GROUP_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_ACCES TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_HISTR_TUTRL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GADGT_UTILS_P TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_GR_GADGT_GR_U TO TC_OPC;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_LIEN_GROUP_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_LIEN_STRUC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_MEMBR_STRUC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SERVR_LDAP TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_SESN TO TC_OPC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_12_STAT TO TC_OPC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_ADMIN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_DESTN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_STRUC_APLIC_LANG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TUTRL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_TYPE_STRUC TO TC_OPC;

GRANT DELETE, INSERT, SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_12_UTILS TO TC_OPC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_UTILS_AVATR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_EXECT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_CONDT_PILTB TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_DOSR_VIRTL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EMPLA_DOSR_VIRTL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ETAPE_TUTRL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_FORMT_RESRC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_INSTA_PREFR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LIEN_CONDT_PILTB TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_LISTE_NAVGT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MENU TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_MIME_TYPE TO TC_OPC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_NAVGT_ELEMN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OCURN_RESRC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_OPERT_OPTIO TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_ITEM_LANG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_LANG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_PREFR_NAVGT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_REGN_PILTB_LANG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TUTRL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_TYPE_FICHR TO TC_OPC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DETL_DOMN_VALR TO TC_OPC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_FORMT TO TC_OPC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_14_TYPE_DOMN_VALR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_AXIAT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COMPT_TWILI TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_COURL_DESTN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PIECE_TELCP_AXIAT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_PROFL_COURL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_SMS_TWILI_ENTRA TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_17_TELCP_AXIAT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_BOUTN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_CLE TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_DISPN_FONCT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_FONCT_LANG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_19_SPECF_FONCT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DEPLM TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DETL_DOCMN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_EXCEP TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_MODL_PARMT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_SECTN_DOCMN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ARBRE_NOEUD TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_COULR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_CALND_TYPE TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_ITEM_MENU TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_21_PLUGN_MENU TO TC_OPC;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_RESLT_RECHR TO TC_OPC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_ENONC_RECHR TO TC_OPC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_MODL_RECHR TO TC_OPC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_PATRN_RECHR TO TC_OPC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RECHR TO TC_OPC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_RESLT_RECHR TO TC_OPC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_CHAMP TO TC_OPC;

GRANT SELECT, UPDATE ON APEXFRAMEWORK.VD_AFW_25_DOMN_TYPE_PUBLC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ELEMN_CONFG_PUBLC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_ENGIN_VERSN_PUBLC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_GROUP_PUBLC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_JOURN_TRAVL_EXECT TO TC_OPC;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_25_OCURN_PARMT_PUBLC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_PUBLC_TRAVL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PARMT_TYPE_PUBLC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PAR_PUB_TRA_EXECT TO TC_OPC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_PUBLC_TRAVL TO TC_OPC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_25_TRAVL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_PUBLC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_TYPE_TRAVL TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_CHAMP TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VALR_ELEMN_CONFG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_VERSN_PUBLC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_29_CONTR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_AFECT_ITEM TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CARNT_SPRIN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_CAS_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_EFORT_ITEM TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_HISTR_EFORT_RESTN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_PRODT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_ITEM_CARNT_SPRIN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_30_PAGE_ITEM TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_CATGR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT_PARMT_RACRC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_LIEN_GADGT_PARMT_R TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_TABL_BORD TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_APLIC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ITEM_MENU TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PREFR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_RESRC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DOCMN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PUBLC TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_APLIC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ITEM_MENU TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PREFR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_RESRC TO APEX_INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DOMN_VALR TO APEX_INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DOCMN TO APEX_INVENTORY;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR TO APEX_INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE TO APEX_INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PUBLC TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_APLIC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ITEM_MENU TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PREFR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_RESRC TO APEX_TOOLS;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DOMN_VALR TO APEX_TOOLS WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DOCMN TO APEX_TOOLS;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR TO APEX_TOOLS WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE TO APEX_TOOLS WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PUBLC TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_APLIC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ITEM_MENU TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PREFR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_RESRC TO BASEBALL;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DOMN_VALR TO BASEBALL WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DOCMN TO BASEBALL;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR TO BASEBALL WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE TO BASEBALL WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PUBLC TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_APLIC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ITEM_MENU TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PREFR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_RESRC TO INVENTORY;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DOMN_VALR TO INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DOCMN TO INVENTORY;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR TO INVENTORY WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE TO INVENTORY WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PUBLC TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_APLIC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ITEM_MENU TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PREFR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_RESRC TO TC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DOMN_VALR TO TC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DOCMN TO TC;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR TO TC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE TO TC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PUBLC TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_EVENM_NOTFB TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_MESG TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_APLIC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_11_PRODT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_ATRIB_STRUC_APLIC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_FONCT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_DOMN_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_GR_UT_OPERT_OPT_DOM TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_12_REQT_INTER_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_APLIC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_EXPOR_PAGE TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_ITEM_MENU TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PAGE_IR_COLN TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_PREFR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_13_RESRC TO TC_OPC;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON APEXFRAMEWORK.VD_AFW_14_DOMN_VALR TO TC_OPC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_20_DOCMN TO TC_OPC;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_APLIC_MODL_RECHR TO TC_OPC WITH GRANT OPTION;

GRANT INSERT, SELECT ON APEXFRAMEWORK.VD_AFW_23_DETL_APLIC_MODL_RE TO TC_OPC WITH GRANT OPTION;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_25_PUBLC TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_37_GADGT TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN TO TC;

GRANT SELECT ON APEXFRAMEWORK.VD_AFW_01_DESTN_CONFG_EN TO TC_OPC;
