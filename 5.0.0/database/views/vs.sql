DROP VIEW APEXFRAMEWORK.VS_AFW_01_COLN_TABLE;

create or replace force view apexframework.vs_afw_01_coln_table
(
  seqnc_prodt
 ,code_prodt
 ,nom_prodt
 ,nom_table
 ,nom
)
as
  select pro.seqnc
        ,pro.code
        ,pro.nom
        ,atc.table_name
        ,atc.column_name
    from all_tab_columns atc
        ,apex_aplic app
        ,vd_i_afw_11_prodt pro
        ,vd_i_afw_11_aplic ap
   where     atc.owner = app.owner
         and app.id = ap.numr_aplic_apex
         and ap.ref_prodt = pro.seqnc;


DROP VIEW APEXFRAMEWORK.VS_AFW_01_CONTR;

create or replace force view apexframework.vs_afw_01_contr
(
  seqnc_prodt
 ,code_prodt
 ,nom_prodt
 ,nom_table
 ,nom
 ,type
 ,schem
)
as
  select pro.seqnc
        ,pro.code
        ,pro.nom
        ,ac.table_name
        ,ac.constraint_name
        ,decode (constraint_type
                ,'P', 'Clé primaire'
                ,'R', 'Clé étrangère'
                ,'U', 'Clé unique'
                ,'C', 'Contrainte de vérification'
                ,constraint_type)
           type
        ,ac.owner
    from all_constraints ac
        ,afw_11_prodt pro
   where     ac.constraint_name not like 'BIN$%'
         and ac.constraint_name not like 'SYS_%';


DROP VIEW APEXFRAMEWORK.VS_AFW_01_TABLE;

create or replace force view apexframework.vs_afw_01_table
(
  seqnc_prodt
 ,code_prodt
 ,nom_prodt
 ,nom
)
as
  select pro.seqnc
        ,pro.code
        ,pro.nom
        ,tab.table_name
    from all_tables tab
        ,apex_aplic app
        ,vd_i_afw_11_prodt pro
        ,vd_i_afw_11_aplic ap
   where     tab.owner = app.owner
         and app.id = ap.numr_aplic_apex
         and ap.ref_prodt = pro.seqnc;


DROP VIEW APEXFRAMEWORK.VS_AFW_07_CONDT_APEX;

create or replace force view apexframework.vs_afw_07_condt_apex
(
  d
 ,r
 ,tri
)
as
  select lov_disp_value d
        ,lov_return_value r
        ,lov_disp_sequence tri
    from apex_valr_lov detl
        ,apex_lov lov
   where     detl.lov_id = lov.id
         and lov_name = 'STANDARD_CONDITION_TYPES'
         and detl.flow_id = afw_11_aplic_pkg.obten_aplic_tradc_courn (4000)
  with read only;


DROP VIEW APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS;

create or replace force view apexframework.vs_afw_12_group_gadgt_utils
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
    from vd_afw_12_group_gadgt_utils ggu
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
                                    and lgggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct ())));


DROP VIEW APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS;

create or replace force view apexframework.vs_afw_12_lien_gadgt_utils
(
  tabl_bord_code
 ,gadgt_icone
 ,gadgt_procd_genrt
 ,gadgt_procd_ajax
 ,gadgt_class_css
 ,seqnc
 ,ref_utils
 ,ref_group_gadgt
 ,ref_tabl_bord
 ,ref_gadgt
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_sesn
)
as
  select tb.code tabl_bord_code
        ,gad.icone gadgt_icone
        ,gad.procd_genrt gadgt_procd_genrt
        ,gad.procd_ajax gadgt_procd_ajax
        ,gad.class_css gadgt_class_css
        ,lgu.seqnc
        ,ggu.ref_utils
        ,ggu.seqnc ref_group_gadgt
        ,ggu.ref_tabl_bord
        ,lgu.ref_gadgt
        ,lgu.nom
        ,lgu.descr
        ,lgu.date_creat
        ,lgu.utils_creat
        ,lgu.date_modfc
        ,lgu.utils_modfc
        ,lgu.ref_sesn
    from vd_afw_12_lien_gadgt_utils lgu
        ,vd_afw_12_group_gadgt_utils ggu
        ,vd_afw_37_tabl_bord tb
        ,vd_afw_37_gadgt gad
   where     (   afw_12_utils_pkg.obten_usagr_conct () in (ggu.ref_utils
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
                                        and lgggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct ())))
         and ggu.seqnc = lgu.ref_group_gadgt_utils
         and ggu.ref_tabl_bord = tb.seqnc
         and tb.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
         and gad.seqnc = lgu.ref_gadgt;


DROP VIEW APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P;

create or replace force view apexframework.vs_afw_12_lien_gadgt_utils_p
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
  select lgup.seqnc
        ,lgup.ref_lien_gadgt_utils
        ,lgup.ref_gadgt_parmt
        ,lgup.ref_dv_forml_don
        ,lgup.ref_lien_gadgt_parmt_racrc
        ,lgup.ref_gadgt_parmt_racrc
        ,lgup.forml_don
        ,lgup.date_creat
        ,lgup.utils_creat
        ,lgup.date_modfc
        ,lgup.utils_modfc
    from vd_afw_12_lien_gadgt_utils_p lgup
        ,vd_afw_12_lien_gadgt_utils lgu
        ,vd_afw_12_group_gadgt_utils ggu
        ,vd_afw_37_tabl_bord tb
   where     lgu.seqnc = lgup.ref_lien_gadgt_utils
         and ggu.seqnc = lgu.ref_group_gadgt_utils
         and ggu.ref_utils = afw_12_utils_pkg.obten_usagr_conct
         and ggu.ref_tabl_bord = tb.seqnc
         and tb.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn;


DROP VIEW APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS;

create or replace force view apexframework.vs_afw_12_parmt_gadgt_utils
(
  ref_utils
 ,ggu_seqnc
 ,lgu_seqnc
 ,gp_seqnc
 ,ref_gadgt
 ,code
 ,nom
 ,ordre_presn
 ,indic_oblig
 ,ref_dv_type_don
 ,ref_dv_type_don_code
 ,ref_dv_type_don_formt
 ,ref_domn_valr
 ,descr
 ,lgup_seqnc
 ,lgup_dv_forml_don
 ,lgup_dv_forml_don_formt
 ,lgup_lien_gadgt_parmt_racrc
 ,lgup_gadgt_parmt_racrc
 ,lgup_forml_don
)
as
  select ggu.ref_utils
        ,ggu.seqnc ggu_seqnc
        ,lgu.seqnc lgu_seqnc
        ,gp.seqnc gp_seqnc
        ,gp.ref_gadgt
        ,gp.code
        ,gp.nom
        ,gp.ordre_presn
        ,gp.indic_oblig
        ,gp.ref_dv_type_don
        ,afw_14_domn_valr_pkg.obten_code (gp.ref_dv_type_don) ref_dv_type_don_code
        , (select ddv.valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = gp.ref_dv_type_don)
           as ref_dv_type_don_formt
        ,gp.ref_domn_valr
        ,gp.descr
        ,lgup.seqnc lgup_seqnc
        ,lgup.ref_dv_forml_don lgup_dv_forml_don
        , (select ddv.valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = lgup.ref_dv_forml_don)
           as lgup_dv_forml_don_formt
        ,lgup.ref_lien_gadgt_parmt_racrc lgup_lien_gadgt_parmt_racrc
        ,lgup.ref_gadgt_parmt_racrc lgup_gadgt_parmt_racrc
        ,lgup.forml_don lgup_forml_don
    from vd_i_afw_37_gadgt_parmt gp
        ,vd_i_afw_12_group_gadgt_utils ggu
        ,vd_i_afw_12_lien_gadgt_utils lgu
        ,vd_i_afw_12_lien_gadgt_utils_p lgup
   where     lgu.ref_gadgt = gp.ref_gadgt
         and ggu.seqnc = lgu.ref_group_gadgt_utils
         and lgup.ref_lien_gadgt_utils(+) = lgu.seqnc
         and lgup.ref_gadgt_parmt = gp.seqnc
  union
  select ggu.ref_utils
        ,ggu.seqnc ggu_seqnc
        ,lgu.seqnc lgu_seqnc
        ,gp.seqnc gp_seqnc
        ,gp.ref_gadgt
        ,gp.code
        ,gp.nom
        ,gp.ordre_presn
        ,gp.indic_oblig
        ,gp.ref_dv_type_don
        ,afw_14_domn_valr_pkg.obten_code (gp.ref_dv_type_don) ref_dv_type_don_code
        , (select ddv.valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = gp.ref_dv_type_don)
           as ref_dv_type_don_formt
        ,gp.ref_domn_valr
        ,gp.descr
        ,null lgup_seqnc
        ,null lgup_lien_gadgt_parmt_racrc
        ,null lgup_gadgt_parmt_racrc
        ,null lgup_dv_forml_don
        ,null lgup_dv_forml_don_formt
        ,null lgup_forml_don
    from vd_i_afw_37_gadgt_parmt gp
        ,vd_i_afw_12_lien_gadgt_utils lgu
        ,vd_i_afw_12_group_gadgt_utils ggu
   where     lgu.ref_gadgt = gp.ref_gadgt
         and ggu.seqnc = lgu.ref_group_gadgt_utils
         and not exists
               (select null
                  from vd_i_afw_12_lien_gadgt_utils_p lgup
                 where     lgup.ref_lien_gadgt_utils = lgu.seqnc
                       and lgup.ref_gadgt_parmt = gp.seqnc);


DROP VIEW APEXFRAMEWORK.VS_AFW_13_ITEM_MENU;

create or replace force view apexframework.vs_afw_13_item_menu
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
 ,ref_aplic_formt
 ,ref_struc_aplic
 ,ref_resrc
 ,ref_ocurn_resrc
 ,ref_formt_resrc
 ,lien_id_html
 ,lien_class_css_html
 ,lien_atrib_html
)
as
  select im.seqnc
        ,im.code
        ,im.nom
        ,im.descr
        ,im.forml_libl
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
           forml_libl_formt
        ,im.ref_dv_valr_insta_libl
        , (select ddv.code_valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = im.ref_dv_valr_insta_libl)
           ref_dv_vil_code
        ,im.aide_insta
        ,im.titre_aide_insta
        ,im.ordre_presn
        ,im.ref_page
        ,p.nom
        ,p.numr_apex
        ,p.app_id_formt
        ,p.ref_struc_aplic
        ,im.ref_dv_valr_url
        ,im.forml_valr_url
        ,im.icone
        ,im.efacr_cache
        ,im.ref_menu
        ,im.ref_item_menu
        , (select im2.nom
             from vd_i_afw_13_item_menu im2
            where im2.seqnc = im.ref_item_menu)
           ref_item_menu_formt
        ,im.ref_dv_valr_reqst
        ,im.forml_valr_reqst
        ,im.indic_reint_pagnt
        ,im.indic_reint_page_ir
        ,im.indic_clear_page_ir
        ,im.indic_soums_page
        ,im.indic_reint_navgt
        ,im.ref_dv_valr_scpc
        ,im.forml_valr_scpc
        ,im.ref_dv_valr_sspc
        ,im.forml_valr_sspc
        ,im.ref_dv_valr_sapc
        ,im.forml_valr_sapc
        ,im.ref_dv_valr_scpi
        ,im.forml_valr_scpi
        ,im.ref_dv_valr_sspi
        ,im.forml_valr_sspi
        ,im.ref_dv_valr_sapi
        ,im.forml_valr_sapi
        ,im.ref_dv_valr_snpi
        ,im.forml_valr_snpi
        ,im.date_creat
        ,im.utils_creat
        ,im.date_modfc
        ,im.utils_modfc
        ,im.liste_ref_page_activ
        ,im.ref_aplic
        ,a.code ref_aplic_formt
        ,im.ref_struc_aplic
        ,im.ref_resrc
        ,im.ref_ocurn_resrc
        ,im.ref_formt_resrc
        ,im.lien_id_html
        ,im.lien_class_css_html
        ,im.lien_atrib_html
    from vd_afw_11_aplic a
        ,vd_afw_13_page p
        ,vd_i_afw_13_item_menu im
   where     a.seqnc(+) = im.ref_aplic
         and p.seqnc(+) = im.ref_page;


DROP VIEW APEXFRAMEWORK.VS_AFW_13_PAGE;

create or replace force view apexframework.vs_afw_13_page
(
  seqnc_prodt
 ,code_prodt
 ,nom_prodt
 ,numr_aplic
 ,numr
 ,nom
)
as
  select pro.seqnc
        ,pro.code
        ,pro.nom nom_prodt
        ,ap.numr_aplic_apex numr_aplic
        ,aap.numr_apex
        ,aap.nom
    from vd_i_afw_13_page aap
        ,vd_i_afw_11_prodt pro
        ,vd_i_afw_11_aplic ap
   where     ap.ref_prodt = pro.seqnc
         and aap.ref_aplic = ap.seqnc;


DROP VIEW APEXFRAMEWORK.VS_AFW_13_SEQNC_IR_COURN;

create or replace force view apexframework.vs_afw_13_seqnc_ir_courn (seqnc)
as
  select column_value seqnc
    from table (afw_13_raprt_inter_cu_pkg.obten_seqnc_raprt_courn);


DROP VIEW APEXFRAMEWORK.VS_AFW_14_DOMN_VALR;

create or replace force view apexframework.vs_afw_14_domn_valr
(
  code
 ,ref_prodt
 ,code_valr
 ,valr
)
as
  select dv.code
        ,dv.ref_prodt
        ,ddv.code_valr
        ,ddv.valr
    from vd_i_afw_14_domn_valr dv
        ,vd_i_afw_14_detl_domn_valr ddv
   where     ddv.ref_domn_valr = dv.seqnc
         and dv.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn;


DROP VIEW APEXFRAMEWORK.VS_AFW_20_DOCMN;

create or replace force view apexframework.vs_afw_20_docmn
(
  seqnc
 ,ref_prodt_lang
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,ref_seqnc_struc_aplic
 ,ref_docmn_formt
 ,ref_propr
 ,ref_propr_formt
 ,ref_dv_type_modl_formt
)
as
  select d.seqnc
        ,d.ref_prodt_lang
        ,d.date_creat
        ,d.utils_creat
        ,d.date_modfc
        ,d.utils_modfc
        ,d.ref_struc_aplic
        ,sa.nom ref_struc_aplic_formt
        ,d.ref_seqnc_struc_aplic
        ,afw_20_docmn_pkg.formt_propr_docmn (d.seqnc) ref_docmn_formt
        ,case
           when d.ref_struc_aplic != afw_12_struc_aplic_pkg.obten_seqnc ('MODL_PARMT')
           then
             d.ref_propr
           else
             (select ref_modl
                from vd_afw_20_modl_parmt
               where seqnc = d.ref_seqnc_struc_aplic)
         end
        ,case
           when d.ref_struc_aplic != afw_12_struc_aplic_pkg.obten_seqnc ('MODL_PARMT') then afw_20_modl_pkg.obten_propr_sous_modl_formt (d.seqnc)
           else null
         end
        ,case
           when d.ref_struc_aplic != afw_12_struc_aplic_pkg.obten_seqnc ('MODL_PARMT') then afw_14_domn_valr_pkg.obten_valr (d.ref_dv_type_modl)
           else null
         end
    from vd_afw_20_docmn d
        ,vd_i_afw_12_struc_aplic sa
   where sa.seqnc = d.ref_struc_aplic;


DROP VIEW APEXFRAMEWORK.VS_AFW_20_MODL_ENFAN;

create or replace force view apexframework.vs_afw_20_modl_enfan
(
  seqnc
 ,ref_dv_type_modl
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
)
as
  select seqnc
        ,ref_dv_type_modl
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
    from vd_i_afw_20_modl
   where ref_modl is not null;


DROP VIEW APEXFRAMEWORK.VS_AFW_20_MODL_PARNT;

create or replace force view apexframework.vs_afw_20_modl_parnt
(
  seqnc
 ,ref_dv_type_modl
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
)
as
  select seqnc
        ,ref_dv_type_modl
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
    from vd_i_afw_20_modl
   where ref_modl is null;


DROP VIEW APEXFRAMEWORK.VS_AFW_20_RAPRT_FCT_PRC;

create or replace force view apexframework.vs_afw_20_raprt_fct_prc
(
  numrt
 ,seqnc
 ,ref_dv_type_modl
 ,ref_dv_type_modl_formt
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
  select null
        ,seqnc
        ,ref_dv_type_modl
        ,ref_dv_type_modl_formt
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
    from vd_afw_20_modl m
   where    m.ref_dv_type_modl_formt = 'Fonction'
         or m.ref_dv_type_modl_formt = 'Procédure';


DROP VIEW APEXFRAMEWORK.VS_AFW_20_RAPRT_FCT_PRC_PARMT;

create or replace force view apexframework.vs_afw_20_raprt_fct_prc_parmt
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
 ,indic_retr
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
        ,indic_retr
    from vd_i_afw_20_modl_parmt m;


DROP VIEW APEXFRAMEWORK.VS_AFW_20_RAPRT_PKG;

create or replace force view apexframework.vs_afw_20_raprt_pkg
(
  numrt
 ,seqnc
 ,ref_dv_type_modl
 ,ref_dv_type_modl_formt
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
  select null
        ,seqnc
        ,ref_dv_type_modl
        ,ref_dv_type_modl_formt
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
    from vd_afw_20_modl m
   where m.ref_dv_type_modl_formt = 'Package';


DROP VIEW APEXFRAMEWORK.VS_AFW_23_SOMR_RESLT_RECHR;

create or replace force view apexframework.vs_afw_23_somr_reslt_rechr
(
  nom_formt
 ,ref_struc_aplic
 ,ref_rechr
)
as
    select    sa.nom
           || ' [décompte '
           || count (1)
           || ', pertinence maximum '
           || max (rr.dnr_pertn)
           || '%]'
             nom_formt
          ,sa.seqnc ref_struc_aplic
          ,rr.ref_rechr
      from vd_afw_23_reslt_rechr rr
          ,vd_afw_12_struc_aplic sa
     where sa.seqnc = rr.dnr_ref_struc_aplic
  group by sa.nom
          ,sa.seqnc
          ,rr.ref_rechr;


DROP VIEW APEXFRAMEWORK.VS_AFW_25_PAR_PUB_TRA_EXECT;

create or replace force view apexframework.vs_afw_25_par_pub_tra_exect
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
        ,t.seqnc
    from afw_25_parmt_publc_travl_exect pte
        ,(select afw_25_travl_publc_pkg.obten_travl_exect seqnc
            from dual) t
        ,(select afw_25_travl_publc_pkg.obten_publc_travl_exect seqncc
            from dual) pt
   where     pte.ref_travl = t.seqnc
         and (   pte.ref_travl_publc = pt.seqncc
              or (    pt.seqncc is null
                  and afw_12_stat_pkg.obten_stat ('PUBLC_TRAVL'
                                                 ,'ANUL'
                                                 ,'AFW') != afw_25_travl_publc_pkg.obten_stat_publc_travl (pte.ref_travl_publc)));


DROP VIEW APEXFRAMEWORK.VS_AFW_36_ATRIB_DISPN;

create or replace force view apexframework.vs_afw_36_atrib_dispn
(
  seqnc
 ,ref_page
 ,ref_type_don
 ,ref_type_don_code
 ,indic_dispn
 ,nom_afich
 ,nom_sql
 ,dnr_ref_aplic
 ,ordre
 ,indic_presn_vue
)
as
  select seqnc
        ,ref_page
        ,ref_type_don
        , (select code
             from vd_i_afw_36_type_don td
            where td.seqnc = ad.ref_type_don)
           ref_type_don_code
        ,indic_dispn
        ,nom_afich
        ,nom_sql
        ,dnr_ref_aplic
        , (select vad.ordre
             from vd_i_afw_36_vue_atrib vad
            where     vad.ref_vue = sys_context ('afw_36_filtr'
                                                ,'ref_vue')
                  and vad.ref_atrib_dispn = ad.seqnc)
           ordre
        ,nvl ( (select 'O'
                  from vd_i_afw_36_vue_atrib vad
                 where     vad.ref_vue = sys_context ('afw_36_filtr'
                                                     ,'ref_vue')
                       and vad.ref_atrib_dispn = ad.seqnc)
             ,'N')
           indic_presn_vue
    from vd_i_afw_36_atrib_dispn ad
   where     ad.ref_page = sys_context ('afw_36_filtr'
                                       ,'ref_page')
         and indic_dispn = 'O'
  with read only;


DROP VIEW APEXFRAMEWORK.VS_AFW_36_FILTR_SESN;

create or replace force view apexframework.vs_afw_36_filtr_sesn
(
  seqnc
 ,ref_opert_filtr
 ,ref_atrib_dispn
 ,ref_page
 ,dnr_condt_sql
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
        ,ref_opert_filtr
        ,ref_atrib_dispn
        ,ref_page
        ,dnr_condt_sql
        ,dnr_condt_afich
        ,valr_varch1
        ,valr_varch2
        ,valr_numbr1
        ,valr_numbr2
        ,valr_date1
        ,valr_date2
    from vd_i_afw_36_filtr_sesn fs
   where     fs.ref_page = sys_context ('afw_36_filtr'
                                       ,'ref_page')
         and fs.ref_sesn = afw_12_sesn_pkg.obten_sesn
  with read only;


DROP VIEW APEXFRAMEWORK.VS_AFW_36_VUE_DISPN;

create or replace force view apexframework.vs_afw_36_vue_dispn
(
  seqnc
 ,ref_page
 ,code
 ,nom
 ,nom_afich
 ,ref_vue
)
as
  select seqnc
        ,ref_page
        ,code
        ,nom
        ,nom_afich
        ,ref_vue
    from vd_afw_36_vue v
   where v.ref_page = sys_context ('afw_36_filtr'
                                  ,'ref_page')
  with read only;


DROP VIEW APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR;

create or replace force view apexframework.vs_afw_37_gadgt_par_catgr
(
  ident
 ,ident_parnt
 ,titre
 ,code_type
 ,toltp_titre
 ,toltp_text
 ,catgr_ordre_presn
 ,gadgt_ordre_presn
)
as
      select    'CATGR_'
             || gc.seqnc
               as ident
            ,nvl2 (ref_gadgt_catgr
                  ,   'CATGR_'
                   || ref_gadgt_catgr
                  ,null)
               as ident_parnt
            ,gc.nom as titre
            ,'CATGR' as code_type
            ,null as toltp_titre
            ,null as toltp_text
            ,gc.ordre_presn as cagtr_ordre_presn
            ,null as gadgt_ordre_presn
        from vd_afw_37_gadgt_catgr gc
  start with     gc.ref_gadgt_catgr is null
             and ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
  connect by prior gc.seqnc = gc.ref_gadgt_catgr
  union all
  select to_char (seqnc) as ident
        ,   'CATGR_'
         || ref_gadgt_catgr
           as ident_parnt
        ,nom as titre
        ,'GADGT' as code_type
        ,nom as toltp_titre
        ,descr as toltp_text
        ,null as cagtr_ordre_presn
        ,gad.ordre_presn as gadgt_ordre_presn
    from vd_afw_37_gadgt gad
   where     ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
         and (   ref_struc_aplic is null
              or afw_12_secrt_pkg.verfc_droit_acces_numrq (afw_12_struc_aplic_pkg.obten_code (ref_struc_aplic)
                                                          ,'O') = 1);


DROP VIEW APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R;

create or replace force view apexframework.vs_afw_37_lien_gadgt_parmt_r
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
        ,case
           when ref_gadgt_parmt_racrc is null
           then
             nom
           else
             (select nom
                from vd_afw_37_gadgt_parmt_racrc
               where seqnc = ref_gadgt_parmt_racrc)
         end
           nom
        ,case
           when ref_gadgt_parmt_racrc is null
           then
             forml_don
           else
             (select forml_don
                from vd_afw_37_gadgt_parmt_racrc
               where seqnc = ref_gadgt_parmt_racrc)
         end
           forml_don
        ,case
           when ref_gadgt_parmt_racrc is null
           then
             descr
           else
             (select descr
                from vd_afw_37_gadgt_parmt_racrc
               where seqnc = ref_gadgt_parmt_racrc)
         end
           descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_lien_gadgt_parmt_r lgpr;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_01_COLN_TABLE FOR APEXFRAMEWORK.VS_AFW_01_COLN_TABLE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_01_CONTR FOR APEXFRAMEWORK.VS_AFW_01_CONTR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_01_TABLE FOR APEXFRAMEWORK.VS_AFW_01_TABLE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_07_CONDT_APEX FOR APEXFRAMEWORK.VS_AFW_07_CONDT_APEX;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_12_PARMT_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VS_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_13_PAGE FOR APEXFRAMEWORK.VS_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VS_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VS_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_37_GADGT_PAR_CATGR FOR APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR;


CREATE OR REPLACE SYNONYM APEX_INVENTORY.VS_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_01_COLN_TABLE FOR APEXFRAMEWORK.VS_AFW_01_COLN_TABLE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_01_CONTR FOR APEXFRAMEWORK.VS_AFW_01_CONTR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_01_TABLE FOR APEXFRAMEWORK.VS_AFW_01_TABLE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_07_CONDT_APEX FOR APEXFRAMEWORK.VS_AFW_07_CONDT_APEX;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_12_PARMT_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VS_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_13_PAGE FOR APEXFRAMEWORK.VS_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VS_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VS_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_37_GADGT_PAR_CATGR FOR APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR;


CREATE OR REPLACE SYNONYM APEX_TOOLS.VS_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_01_COLN_TABLE FOR APEXFRAMEWORK.VS_AFW_01_COLN_TABLE;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_01_CONTR FOR APEXFRAMEWORK.VS_AFW_01_CONTR;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_01_TABLE FOR APEXFRAMEWORK.VS_AFW_01_TABLE;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_07_CONDT_APEX FOR APEXFRAMEWORK.VS_AFW_07_CONDT_APEX;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_12_PARMT_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VS_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_13_PAGE FOR APEXFRAMEWORK.VS_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VS_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VS_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_37_GADGT_PAR_CATGR FOR APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR;


CREATE OR REPLACE SYNONYM BASEBALL.VS_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_01_COLN_TABLE FOR APEXFRAMEWORK.VS_AFW_01_COLN_TABLE;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_01_CONTR FOR APEXFRAMEWORK.VS_AFW_01_CONTR;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_01_TABLE FOR APEXFRAMEWORK.VS_AFW_01_TABLE;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_07_CONDT_APEX FOR APEXFRAMEWORK.VS_AFW_07_CONDT_APEX;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_12_PARMT_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VS_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_13_PAGE FOR APEXFRAMEWORK.VS_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VS_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VS_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_37_GADGT_PAR_CATGR FOR APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR;


CREATE OR REPLACE SYNONYM INVENTORY.VS_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM TC.VS_AFW_01_COLN_TABLE FOR APEXFRAMEWORK.VS_AFW_01_COLN_TABLE;


CREATE OR REPLACE SYNONYM TC.VS_AFW_01_CONTR FOR APEXFRAMEWORK.VS_AFW_01_CONTR;


CREATE OR REPLACE SYNONYM TC.VS_AFW_01_TABLE FOR APEXFRAMEWORK.VS_AFW_01_TABLE;


CREATE OR REPLACE SYNONYM TC.VS_AFW_07_CONDT_APEX FOR APEXFRAMEWORK.VS_AFW_07_CONDT_APEX;


CREATE OR REPLACE SYNONYM TC.VS_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC.VS_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC.VS_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM TC.VS_AFW_12_PARMT_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC.VS_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VS_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM TC.VS_AFW_13_PAGE FOR APEXFRAMEWORK.VS_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM TC.VS_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VS_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM TC.VS_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VS_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM TC.VS_AFW_37_GADGT_PAR_CATGR FOR APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR;


CREATE OR REPLACE SYNONYM TC.VS_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_01_COLN_TABLE FOR APEXFRAMEWORK.VS_AFW_01_COLN_TABLE;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_01_CONTR FOR APEXFRAMEWORK.VS_AFW_01_CONTR;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_01_TABLE FOR APEXFRAMEWORK.VS_AFW_01_TABLE;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_07_CONDT_APEX FOR APEXFRAMEWORK.VS_AFW_07_CONDT_APEX;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_12_GROUP_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_12_LIEN_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_12_LIEN_GADGT_UTILS_P FOR APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_12_PARMT_GADGT_UTILS FOR APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_13_ITEM_MENU FOR APEXFRAMEWORK.VS_AFW_13_ITEM_MENU;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_13_PAGE FOR APEXFRAMEWORK.VS_AFW_13_PAGE;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_14_DOMN_VALR FOR APEXFRAMEWORK.VS_AFW_14_DOMN_VALR;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_25_PAR_PUB_TRA_EXECT FOR APEXFRAMEWORK.VS_AFW_25_PAR_PUB_TRA_EXECT;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_37_GADGT_PAR_CATGR FOR APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR;


CREATE OR REPLACE SYNONYM TC_OPC.VS_AFW_37_LIEN_GADGT_PARMT_R FOR APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R;


GRANT SELECT ON APEXFRAMEWORK.VS_AFW_01_CONTR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_ITEM_MENU TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_PAGE TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_14_DOMN_VALR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R TO APEX_040200;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_01_CONTR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_ITEM_MENU TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_PAGE TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_14_DOMN_VALR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R TO APEX_INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_01_CONTR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_ITEM_MENU TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_PAGE TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_14_DOMN_VALR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R TO APEX_TOOLS;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_01_CONTR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_ITEM_MENU TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_PAGE TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_14_DOMN_VALR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R TO BASEBALL;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_01_CONTR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_ITEM_MENU TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_PAGE TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_14_DOMN_VALR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R TO INVENTORY;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_01_CONTR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_ITEM_MENU TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_PAGE TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_14_DOMN_VALR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R TO TC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_01_CONTR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_GROUP_GADGT_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_LIEN_GADGT_UTILS_P TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_12_PARMT_GADGT_UTILS TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_ITEM_MENU TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_13_PAGE TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_14_DOMN_VALR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_GADGT_PAR_CATGR TO TC_OPC;

GRANT SELECT ON APEXFRAMEWORK.VS_AFW_37_LIEN_GADGT_PARMT_R TO TC_OPC;
