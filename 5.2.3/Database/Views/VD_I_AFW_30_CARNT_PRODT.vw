SET DEFINE OFF;
create or replace force view vd_i_afw_30_carnt_prodt
(
  seqnc
 ,ref_prodt
 ,docmn_refrc
 ,ref_utils_respn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,docmn_refrc
        ,ref_utils_respn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_30_carnt_prodt
/
