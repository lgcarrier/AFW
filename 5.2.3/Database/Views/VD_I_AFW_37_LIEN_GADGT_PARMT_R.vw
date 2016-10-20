SET DEFINE OFF;
create or replace force view vd_i_afw_37_lien_gadgt_parmt_r
(
  seqnc
 ,ref_gadgt_parmt
 ,ref_gadgt_parmt_racrc
 ,nom
 ,forml_don
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_gadgt_parmt
        ,ref_gadgt_parmt_racrc
        ,nom
        ,forml_don
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_lien_gadgt_parmt_racrc
/
