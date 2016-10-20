SET DEFINE OFF;
create or replace force view vd_afw_36_opert_filtr
(
  seqnc
 ,code
 ,nom
 ,texte_afich
 ,condt_sql
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,indic_valr2
 ,indic_auto_lancr_rechr
)
as
  select seqnc
        ,code
        ,nom
        ,texte_afich
        ,condt_sql
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,indic_valr2
        ,indic_auto_lancr_rechr
    from vd_i_afw_36_opert_filtr
/
