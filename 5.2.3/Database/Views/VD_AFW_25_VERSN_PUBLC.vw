SET DEFINE OFF;
create or replace force view vd_afw_25_versn_publc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_publc
 ,date_debut_efect
 ,date_fin_efect
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_publc
        ,date_debut_efect
        ,date_fin_efect
    from vd_i_afw_25_versn_publc
/
