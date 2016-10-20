SET DEFINE OFF;
create or replace force view vs_afw_37_lien_gadgt_parmt_r
(
  seqnc
 ,ref_gadgt_parmt
 ,ref_gadgt_parmt_racrc
 ,ref_gadgt_parmt_racrc_formt
 ,nom
 ,forml_don
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,dnr_ref_prodt
)
as
  select seqnc
        ,ref_gadgt_parmt
        ,ref_gadgt_parmt_racrc
        , (select    gpr.code
                  || ' - '
                  || gpr.nom
             from vd_afw_37_gadgt_parmt_racrc gpr
            where gpr.seqnc = lgpr.ref_gadgt_parmt_racrc)
           as ref_gadgt_parmt_racrc_formt
        ,case
           when ref_gadgt_parmt_racrc is null
           then
             nom
           else
             (select nom
                from vd_afw_37_gadgt_parmt_racrc
               where seqnc = ref_gadgt_parmt_racrc)
         end
           nom
        ,case
           when ref_gadgt_parmt_racrc is null
           then
             forml_don
           else
             (select forml_don
                from vd_afw_37_gadgt_parmt_racrc
               where seqnc = ref_gadgt_parmt_racrc)
         end
           forml_don
        ,case
           when ref_gadgt_parmt_racrc is null
           then
             descr
           else
             (select descr
                from vd_afw_37_gadgt_parmt_racrc
               where seqnc = ref_gadgt_parmt_racrc)
         end
           descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,dnr_ref_prodt
    from vd_i_afw_37_lien_gadgt_parmt_r lgpr
/
