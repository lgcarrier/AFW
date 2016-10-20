SET DEFINE OFF;
create or replace force view vd_afw_37_tabl_bord
(
  seqnc
 ,ref_prodt
 ,code
 ,nom
 ,nom_group_deft
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,code
        ,nom
        ,nom_group_deft
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_tabl_bord
/
