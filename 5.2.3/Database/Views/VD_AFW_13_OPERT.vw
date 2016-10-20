SET DEFINE OFF;
create or replace force view vd_afw_13_opert
(
  seqnc
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,ref_prodt_formt
 ,code
 ,ref_fonct
)
as
  select seqnc
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_11_prodt
            where seqnc = ope.ref_prodt)
           ref_prodt_formt
        ,code
        ,ref_fonct
    from vd_i_afw_13_opert ope
/
