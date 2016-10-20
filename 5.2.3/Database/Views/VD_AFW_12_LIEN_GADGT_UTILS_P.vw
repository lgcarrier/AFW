SET DEFINE OFF;
create or replace force view vd_afw_12_lien_gadgt_utils_p
(
  seqnc
 ,ref_lien_gadgt_utils
 ,ref_gadgt_parmt
 ,ref_dv_forml_don
 ,ref_lien_gadgt_parmt_racrc
 ,ref_gadgt_parmt_racrc
 ,forml_don
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_lien_gadgt_utils
        ,ref_gadgt_parmt
        ,ref_dv_forml_don
        ,ref_lien_gadgt_parmt_racrc
        ,ref_gadgt_parmt_racrc
        ,forml_don
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_lien_gadgt_utils_p
/
