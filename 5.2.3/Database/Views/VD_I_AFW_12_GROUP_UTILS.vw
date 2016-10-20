SET DEFINE OFF;
create or replace force view vd_i_afw_12_group_utils
(
  seqnc
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,code
 ,indic_ignor_group_admin
 ,indic_systm
 ,dnr_ref_prodt
 ,ref_domn
 ,indic_acces_globl
 ,ref_fonct
 ,indic_group_aplic
)
as
  select seqnc
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,code
        ,indic_ignor_group_admin
        ,indic_systm
        ,dnr_ref_prodt
        ,ref_domn
        ,indic_acces_globl
        ,ref_fonct
        ,indic_group_aplic
    from afw_12_group_utils
/
