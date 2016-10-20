SET DEFINE OFF;
create or replace force view vd_afw_12_arbre
(
  seqnc
 ,noeud_actif
 ,ref_sesn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_rafrc
 ,id_apex_regn
)
as
  select seqnc
        ,noeud_actif
        ,ref_sesn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_rafrc
        ,id_apex_regn
    from vd_i_afw_12_arbre
/
