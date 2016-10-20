SET DEFINE OFF;
create or replace force view vd_afw_25_publc_travl
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
             from vd_i_afw_25_type_publc  tp
                 ,vd_i_afw_25_publc       p
                 ,vd_i_afw_25_versn_publc vp
            where     tp.seqnc = p.ref_type_publc
                  and vp.seqnc = pt.ref_versn_publc
                  and p.seqnc = vp.ref_publc)
        , (select tp.code
             from vd_i_afw_25_type_publc  tp
                 ,vd_i_afw_25_publc       p
                 ,vd_i_afw_25_versn_publc vp
            where     tp.seqnc = p.ref_type_publc
                  and vp.seqnc = pt.ref_versn_publc
                  and p.seqnc = vp.ref_publc)
        , (select p.code
             from vd_i_afw_25_publc       p
                 ,vd_i_afw_25_versn_publc vp
            where     vp.seqnc = pt.ref_versn_publc
                  and p.seqnc = vp.ref_publc)
        , (select tp.nom
             from vd_i_afw_25_type_publc  tp
                 ,vd_i_afw_25_publc       p
                 ,vd_i_afw_25_versn_publc vp
            where     tp.seqnc = p.ref_type_publc
                  and vp.seqnc = pt.ref_versn_publc
                  and p.seqnc = vp.ref_publc)
        , (select p.nom
             from vd_i_afw_25_publc       p
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
    from vd_i_afw_25_publc_travl pt
/
