SET DEFINE OFF;
create or replace force view vd_afw_37_gadgt_catgr
(
  seqnc
 ,ref_prodt
 ,ref_gadgt_catgr
 ,ref_gadgt_catgr_formt
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
        , (select gc2.nom
             from vd_i_afw_37_gadgt_catgr gc2
            where gc2.seqnc = gc1.ref_gadgt_catgr)
           as ref_gadgt_catgr_formt
        ,code
        ,nom
        ,ordre_presn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_gadgt_catgr gc1
/
