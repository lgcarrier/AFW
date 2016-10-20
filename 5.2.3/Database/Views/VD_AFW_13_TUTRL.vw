SET DEFINE OFF;
create or replace force view vd_afw_13_tutrl
(
  seqnc
 ,code
 ,nom
 ,descr
 ,indic_premr_charg
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,indic_premr_charg
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_13_tutrl
/
