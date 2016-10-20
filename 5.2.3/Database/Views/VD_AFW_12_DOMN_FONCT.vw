SET DEFINE OFF;
create or replace force view vd_afw_12_domn_fonct
(
  seqnc
 ,ref_fonct
 ,ref_fonct_formt
 ,ref_domn
 ,ref_domn_formt
 ,indic_actif
 ,indic_actif_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_fonct
        , (select f.nom
             from vd_afw_12_fonct f
            where f.seqnc = ref_fonct)
        ,ref_domn
        ,afw_12_domn_pkg.obten_code_domn (ref_domn)
        ,indic_actif
        ,case indic_actif when 'O' then '<i class="fa fa-check"></i>' else null end
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_domn_fonct
/
