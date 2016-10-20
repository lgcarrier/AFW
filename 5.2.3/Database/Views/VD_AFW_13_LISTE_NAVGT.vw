SET DEFINE OFF;
create or replace force view vd_afw_13_liste_navgt
(
  seqnc
 ,ref_page
 ,libl
 ,aplic
 ,page
 ,sspc
 ,sapc
 ,sspi
 ,sapi
 ,scpi
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ordre_presn
 ,code
 ,indic_reint_sidf
 ,css_icone_boots
 ,ref_domn
)
as
  select seqnc
        ,ref_page
        ,libl
        ,aplic
        ,page
        ,sspc
        ,sapc
        ,sspi
        ,sapi
        ,scpi
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ordre_presn
        ,code
        ,indic_reint_sidf
        ,css_icone_boots
        ,ref_domn
    from vd_i_afw_13_liste_navgt
/
