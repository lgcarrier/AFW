SET DEFINE OFF;
create or replace force view vd_afw_20_detl_docmn
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
    from vd_i_afw_20_detl_docmn dd
/
