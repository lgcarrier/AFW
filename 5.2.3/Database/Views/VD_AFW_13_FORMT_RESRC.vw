SET DEFINE OFF;
create or replace force view vd_afw_13_formt_resrc
(
  seqnc
 ,code
 ,nom
 ,ref_prodt
 ,descr
 ,ref_type_fichr
 ,ref_type_fichr_formt
 ,ref_type_fichr_code
 ,largr
 ,hautr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,ref_prodt
        ,descr
        ,ref_type_fichr
        , (select nom
             from vd_i_afw_13_type_fichr
            where seqnc = ref_type_fichr)
        , (select code
             from vd_i_afw_13_type_fichr
            where seqnc = ref_type_fichr)
        ,largr
        ,hautr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_formt_resrc
/
