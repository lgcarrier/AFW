SET DEFINE OFF;
create or replace force view vd_afw_13_opert_optio
(
  seqnc
 ,ref_opert
 ,ref_opert_formt
 ,code
 ,nom
 ,descr
 ,dnr_ref_prodt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,prepn
)
as
  select seqnc
        ,ref_opert
        , (select o.nom
             from vd_afw_13_opert o
            where o.seqnc = ref_opert)
        ,code
        ,nom
        ,descr
        ,dnr_ref_prodt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,prepn
    from vd_i_afw_13_opert_optio
/
