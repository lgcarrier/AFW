SET DEFINE OFF;
create or replace force view vd_afw_17_compt_twili
(
  seqnc
 ,code
 ,nom
 ,descr
 ,acoun_id
 ,authe_token
 ,reprt_walt
 ,mot_passe_walt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,numr
 ,indic_partg
 ,ref_domn
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,acoun_id
        ,authe_token
        ,reprt_walt
        ,mot_passe_walt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,numr
        ,indic_partg
        ,ref_domn
    from vd_i_afw_17_compt_twili
/
