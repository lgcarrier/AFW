SET DEFINE OFF;
create or replace force view vd_afw_12_utils_avatr
(
  seqnc
 ,ref_utils
 ,ref_domn
 ,logo_tail_large
 ,logo_tail_moyn
 ,logo_tail_pet
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_utils
        ,ref_domn
        ,logo_tail_large
        ,logo_tail_moyn
        ,logo_tail_pet
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_utils_avatr
/
