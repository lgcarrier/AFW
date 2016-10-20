SET DEFINE OFF;
create or replace force view vd_afw_19_boutn
(
  seqnc
 ,ref_lang
 ,ref_dispn_fonct
 ,item_subst
 ,libl
 ,id_templ_boutn
 ,templ_boutn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_actif
 ,ref_dv_type_mesg_aide_contx
 ,ref_code_type_mesg_aide_contx
 ,mesg_aide_contx
)
as
  select seqnc
        ,ref_lang
        ,ref_dispn_fonct
        ,item_subst
        ,libl
        ,id_templ_boutn
        ,templ_boutn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_actif
        ,ref_dv_type_mesg_aide_contx
        ,afw_14_domn_valr_pkg.obten_code (ref_dv_type_mesg_aide_contx)
        ,mesg_aide_contx
    from vd_i_afw_19_boutn
/
