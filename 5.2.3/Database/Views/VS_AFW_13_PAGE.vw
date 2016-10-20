SET DEFINE OFF;
create or replace force view vs_afw_13_page
(
  seqnc_prodt
 ,code_prodt
 ,nom_prodt
 ,numr_aplic
 ,numr
 ,nom
)
as
  select pro.seqnc
        ,pro.code
        ,pro.nom            nom_prodt
        ,ap.numr_aplic_apex numr_aplic
        ,aap.numr_apex
        ,aap.nom
    from vd_i_afw_13_page  aap
        ,vd_i_afw_11_prodt pro
        ,vd_i_afw_11_aplic ap
   where     ap.ref_prodt = pro.seqnc
         and aap.ref_aplic = ap.seqnc
/
