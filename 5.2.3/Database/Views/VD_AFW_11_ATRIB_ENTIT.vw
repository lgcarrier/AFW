SET DEFINE OFF;
create or replace force view vd_afw_11_atrib_entit
(
  seqnc
 ,nom
 ,type_don
 ,type_don_formt
 ,compr_migrt
 ,ref_entit
 ,ref_entit_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,code
 ,ref_entit_refrn
 ,ref_entit_refrn_formt
 ,indic_nouvl_atrib_formt
)
as
  select seqnc
        ,nom
        ,type_don
        , (case type_don when 'C' then 'CLOB' when 'B' then 'BLOB' when 'V' then 'Varchar2' when 'N' then 'Number' when 'D' then 'Date' end)
        ,compr_migrt
        ,ref_entit
        , (select nom
             from vd_i_afw_11_entit e
            where e.seqnc = ae.ref_entit)
           ref_entit_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,code
        ,ref_entit_refrn
        , (select nom
             from vd_i_afw_11_entit e
            where e.seqnc = ae.ref_entit_refrn)
           ref_entit_refrn_formt
        ,decode (indic_nouvl_atrib,  'O', 'Oui',  'N', 'Non')
    from vd_i_afw_11_atrib_entit ae
/
