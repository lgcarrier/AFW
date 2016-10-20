SET DEFINE OFF;
create or replace force view vd_i_afw_19_dispn_fonct
(
  seqnc
 ,ref_prodt
 ,ref_fonct
 ,valr_atrib_1
 ,valr_atrib_2
 ,valr_atrib_3
 ,valr_atrib_4
 ,valr_atrib_5
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,ref_fonct
        ,valr_atrib_1
        ,valr_atrib_2
        ,valr_atrib_3
        ,valr_atrib_4
        ,valr_atrib_5
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_19_dispn_fonct
/
