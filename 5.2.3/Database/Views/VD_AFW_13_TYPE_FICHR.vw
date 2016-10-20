SET DEFINE OFF;
create or replace force view vd_afw_13_type_fichr
(
  seqnc
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,nom_icon
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,nom_icon
    from vd_i_afw_13_type_fichr
/
