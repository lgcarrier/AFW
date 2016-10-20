SET DEFINE OFF;
create or replace force view vd_i_afw_25_versn_publc
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_debut_efect
 ,date_fin_efect
 ,ref_publc
 ,code
 ,nom
 ,descr
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,date_debut_efect
        ,date_fin_efect
        ,ref_publc
        ,code
        ,nom
        ,descr
    from afw_25_versn_publc
/
