SET DEFINE OFF;
create or replace force view vd_afw_11_prodt_lang
(
  seqnc
 ,ref_prodt
 ,ref_lang
 ,indic_deft
 ,indic_deft_formt
 ,ordre_presn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_prodt
        ,ref_lang
        ,indic_deft
        ,case indic_deft when 'O' then '<i class="fa fa-check"></i>' else null end as indic_deft_formt
        ,ordre_presn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_11_prodt_lang
/
