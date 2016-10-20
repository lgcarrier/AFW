SET DEFINE OFF;
create or replace force view vd_afw_11_aplic
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
        ,afw_11_aplic_pkg.obten_lang_deft (a.seqnc)       ref_lang
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
    from vd_i_afw_11_aplic a
/
