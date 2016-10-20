SET DEFINE OFF;
create or replace force view vd_i_afw_12_arbre_noeud
(
  seqnc
 ,ref_arbre
 ,noeud_ouver
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_arbre
        ,noeud_ouver
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_12_arbre_noeud
/
