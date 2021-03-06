SET DEFINE OFF;
create or replace force view vd_i_afw_12_struc_aplic
(
  seqnc
 ,nom
 ,descr
 ,ref_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,code
 ,ref_mesg_err_suprs
 ,indic_extra_tout
 ,tail_tabl_extra
 ,nom_struc_acces_don
 ,ref_page_liste
 ,ref_page_forml
 ,nom_packg
 ,dnr_ref_prodt
 ,indic_dispn_docmn
 ,nom_schem
 ,icon_font_awesm
 ,indic_dispn_procs_aprob
)
as
  select seqnc
        ,nom
        ,descr
        ,ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,code
        ,ref_mesg_err_suprs
        ,indic_extra_tout
        ,tail_tabl_extra
        ,nom_struc_acces_don
        ,ref_page_liste
        ,ref_page_forml
        ,nom_packg
        ,dnr_ref_prodt
        ,indic_dispn_docmn
        ,nom_schem
        ,icon_font_awesm
        ,indic_dispn_procs_aprob
    from afw_12_struc_aplic
/
