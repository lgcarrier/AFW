SET DEFINE OFF;
create or replace force view vd_i_afw_11_plugn
(
  seqnc
 ,code_inter
 ,nom
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,date_creat
 ,descr
 ,ref_versn
)
as
  select seqnc
        ,code_inter
        ,nom
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,date_creat
        ,descr
        ,ref_versn
    from afw_11_plugn
/
