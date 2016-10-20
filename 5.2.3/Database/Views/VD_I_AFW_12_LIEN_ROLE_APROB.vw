SET DEFINE OFF;
create or replace force view vd_i_afw_12_lien_role_aprob
(
  seqnc
 ,ref_role_aprob
 ,ref_aprob
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_role_aprob
        ,ref_aprob
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from afw_12_lien_role_aprob
/
