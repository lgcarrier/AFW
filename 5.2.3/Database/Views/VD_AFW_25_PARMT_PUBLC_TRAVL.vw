SET DEFINE OFF;
create or replace force view vd_afw_25_parmt_publc_travl
(
  seqnc
 ,ref_publc_travl
 ,ref_parmt_type_publc
 ,ref_code_parmt_tp_formt
 ,indic_presn_appel
 ,ordre_presn
 ,valr_varch
 ,valr_date
 ,valr_numbr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ref_publc_travl
        ,ref_parmt_type_publc
        , (select ptp.code
             from vd_i_afw_25_parmt_type_publc ptp
            where ptp.seqnc = ppt.ref_parmt_type_publc)
        , (select ptp.indic_presn_appel
             from vd_i_afw_25_parmt_type_publc ptp
            where ptp.seqnc = ppt.ref_parmt_type_publc)
        , (select ptp.ordre_presn
             from vd_i_afw_25_parmt_type_publc ptp
            where ptp.seqnc = ppt.ref_parmt_type_publc)
        ,valr_varch
        ,valr_date
        ,valr_numbr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_25_parmt_publc_travl ppt
/
