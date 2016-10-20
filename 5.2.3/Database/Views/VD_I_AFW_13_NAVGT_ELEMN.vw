SET DEFINE OFF;
create or replace force view vd_i_afw_13_navgt_elemn
(
  seqnc
 ,numr_elemn
 ,indic_courn
 ,seqnc_elemn
 ,ref_navgt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,numr_elemn
        ,indic_courn
        ,seqnc_elemn
        ,ref_navgt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_13_navgt_elemn
/
