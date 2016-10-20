SET DEFINE OFF;
create or replace force view vd_afw_12_lien_gadgt_utils
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
    from vd_i_afw_12_lien_gadgt_utils
/
