SET DEFINE OFF;
create or replace force view vd_afw_30_afect_item
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
    from vd_i_afw_30_afect_item
/
