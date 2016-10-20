SET DEFINE OFF;
create or replace force view vd_i_afw_37_gadgt_parmt
(
  seqnc
 ,ref_gadgt
 ,code
 ,nom
 ,ordre_presn
 ,indic_oblig
 ,ref_dv_type_don
 ,ref_domn_valr
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_gadgt
        ,code
        ,nom
        ,ordre_presn
        ,indic_oblig
        ,ref_dv_type_don
        ,ref_domn_valr
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from afw_37_gadgt_parmt
/
