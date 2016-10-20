SET DEFINE OFF;
create or replace force view vd_afw_25_parmt_type_publc
(
  seqnc
 ,ref_type_publc
 ,ref_type_publc_formt
 ,ref_engin
 ,ref_engin_formt
 ,code
 ,nom
 ,descr
 ,indic_presn_appel
 ,indic_presn_appel_formt
 ,indic_fixe
 ,indic_fixe_formt
 ,valr_deft
 ,type_valr_deft
 ,type_valr_deft_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,type_don
 ,type_don_formt
 ,ordre_presn
 ,cardn
 ,cardn_formt
)
as
  select seqnc
        ,ref_type_publc
        , (select nom
             from vd_i_afw_25_type_publc tp
            where tp.seqnc = ref_type_publc)
        ,ref_engin
        , (select code
             from vd_i_afw_25_engin e
            where e.seqnc = ref_engin)
        ,code
        ,nom
        ,descr
        ,indic_presn_appel
        ,case indic_presn_appel when 'O' then 'Oui' else 'Non' end                                           indic_presn_appel_formt
        ,indic_fixe
        ,case indic_fixe when 'O' then 'Oui' else 'Non' end                                                  indic_fixe_formt
        ,valr_deft
        ,type_valr_deft
        ,case type_valr_deft when 'ITEM' then 'Item de page' when 'LITRL' then 'Littéral' else 'PL/SQL' end type_valr_deft_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,type_don
        ,case type_don when 'D' then 'Date' when 'N' then 'Numérique' else 'Alphanumérique' end            type_don_formt
        ,ordre_presn
        ,cardn
        ,case cardn when 'L' then 'Littéral' else 'Vecteur' end                                             cardn_formt
    from vd_i_afw_25_parmt_type_publc
/
