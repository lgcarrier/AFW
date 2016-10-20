SET DEFINE OFF;
create or replace force view vd_i_afw_12_domn_fonct
(
  seqnc
 ,ref_fonct
 ,ref_domn
 ,indic_actif
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_fonct
        ,ref_domn
        ,indic_actif
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_domn_fonct
/
