SET DEFINE OFF;
create or replace force view vd_i_afw_30_carnt_aplic
(
  seqnc
 ,nom
 ,ref_carnt_prodt
 ,ref_aplic
 ,ref_utils_respn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,docmn_refrc
)
as
  select seqnc
        ,nom
        ,ref_carnt_prodt
        ,ref_aplic
        ,ref_utils_respn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,docmn_refrc
    from afw_30_carnt_aplic
/
