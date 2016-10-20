SET DEFINE OFF;
create or replace force view vd_afw_30_efort_item
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
    from vd_i_afw_30_efort_item
/
