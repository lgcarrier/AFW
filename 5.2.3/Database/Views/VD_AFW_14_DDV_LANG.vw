SET DEFINE OFF;
create or replace force view vd_afw_14_ddv_lang
(
  seqnc
 ,ref_detl_domn_valr
 ,ref_domn_valr
 ,ref_lang
 ,ref_lang_code
 ,ref_lang_formt
 ,valr
 ,valr_court
 ,valr_organ
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_detl_domn_valr
        , (select ddv.ref_domn_valr
             from vd_i_afw_14_detl_domn_valr ddv
            where ddv.seqnc = ddvl.ref_detl_domn_valr)
           ref_domn_valr
        ,ref_lang
        , (select l.code
             from vd_i_afw_01_lang l
            where l.seqnc = ddvl.ref_lang)
           ref_lang_code
        , (select ll.nom
             from vd_i_afw_01_lang_lang ll
            where     ll.ref_lang = ddvl.ref_lang
                  and ll.ref_lang_cible = sys_context ('ctx_infor_sesn'
                                                      ,'vnu_seqnc_lang'))
           ref_lang_formt
        ,valr
        ,valr_court
        ,valr_organ
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_14_ddv_lang ddvl
/
