SET DEFINE OFF;
create or replace force view vd_i_afw_20_detl_docmn
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
    from afw_20_detl_docmn
/
