SET DEFINE OFF;
create or replace force view vd_i_afw_01_mesg_err_lie
(
  seqnc
 ,nom_table
 ,nom_coln
 ,nom_contr
 ,page
 ,comnt
 ,ref_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_liais
 ,ref_mesg
 ,dnr_ref_prodt
 ,ref_code_err_oracl
)
as
  select seqnc
        ,nom_table
        ,nom_coln
        ,nom_contr
        ,page
        ,comnt
        ,ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_liais
        ,ref_mesg
        ,dnr_ref_prodt
        ,ref_code_err_oracl
    from afw_01_mesg_err_lie
/
