SET DEFINE OFF;
create or replace force view vd_i_afw_19_boutn
(
  seqnc
 ,ref_lang
 ,ref_dispn_fonct
 ,item_subst
 ,id_templ_boutn
 ,templ_boutn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,libl
 ,indic_actif
 ,ref_dv_type_mesg_aide_contx
 ,mesg_aide_contx
)
as
  select seqnc
        ,ref_lang
        ,ref_dispn_fonct
        ,item_subst
        ,id_templ_boutn
        ,templ_boutn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,libl
        ,indic_actif
        ,ref_dv_type_mesg_aide_contx
        ,mesg_aide_contx
    from afw_19_boutn
/
