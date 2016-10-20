SET DEFINE OFF;
create or replace force view vd_i_afw_23_enonc_rechr
(
  seqnc
 ,ref_rechr
 ,mot
 ,ordre_apart
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
)
as
  select seqnc
        ,ref_rechr
        ,mot
        ,ordre_apart
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
    from afw_23_enonc_rechr
/
