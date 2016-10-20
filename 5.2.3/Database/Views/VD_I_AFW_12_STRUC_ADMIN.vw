SET DEFINE OFF;
create or replace force view vd_i_afw_12_struc_admin
(
  seqnc
 ,nom
 ,indic_deft
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_type_struc
 ,ref_respn
 ,debut_efect
 ,fin_efect
 ,ref_domn
)
as
  select seqnc
        ,nom
        ,indic_deft
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_type_struc
        ,ref_respn
        ,debut_efect
        ,fin_efect
        ,ref_domn
    from afw_12_struc_admin
/
