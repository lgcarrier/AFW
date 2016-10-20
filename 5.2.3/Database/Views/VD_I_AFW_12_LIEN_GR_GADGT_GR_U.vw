SET DEFINE OFF;
create or replace force view vd_i_afw_12_lien_gr_gadgt_gr_u
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
    from afw_12_lien_gr_gadgt_gr_utils
/
