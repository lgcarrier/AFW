SET DEFINE OFF;
create or replace force view vd_i_afw_37_tabl_bord
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
 ,nom_group_deft
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
        ,nom_group_deft
    from afw_37_tabl_bord
/
