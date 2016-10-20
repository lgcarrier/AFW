SET DEFINE OFF;
create or replace force view vd_afw_12_type_struc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_domn
 ,ref_domn_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,ref_domn
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_12_domn
            where seqnc = tst.ref_domn)
           ref_prodt_formt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_12_type_struc tst
/
