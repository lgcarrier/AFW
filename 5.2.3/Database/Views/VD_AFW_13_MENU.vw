SET DEFINE OFF;
create or replace force view vd_afw_13_menu
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_prodt
 ,ref_prodt_formt
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
        ,ref_prodt
        , (select    p.code
                  || ' - '
                  || p.nom
             from vd_i_afw_11_prodt p
            where p.seqnc = m.ref_prodt)
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_menu m
/
