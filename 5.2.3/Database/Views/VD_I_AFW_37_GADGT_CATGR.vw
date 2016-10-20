SET DEFINE OFF;
create or replace force view vd_i_afw_37_gadgt_catgr
(
  seqnc
 ,ref_prodt
 ,ref_gadgt_catgr
 ,code
 ,nom
 ,ordre_presn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_prodt
        ,ref_gadgt_catgr
        ,code
        ,nom
        ,ordre_presn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_gadgt_catgr
/
