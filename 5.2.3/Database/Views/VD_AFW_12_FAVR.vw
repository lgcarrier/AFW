SET DEFINE OFF;
create or replace force view vd_afw_12_favr
(
  seqnc
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,numr_page
 ,ref_seqnc_struc_aplic
 ,ref_utils
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select f.seqnc
        ,f.ref_struc_aplic
        ,sa.code     ref_struc_aplic_formt
        ,p.numr_apex numr_page
        ,f.ref_seqnc_struc_aplic
        ,f.ref_utils
        ,f.date_creat
        ,f.utils_creat
        ,f.date_modfc
        ,f.utils_modfc
    from vd_i_afw_12_favr        f
        ,vd_i_afw_12_struc_aplic sa
        ,vd_i_afw_13_page        p
   where     f.ref_struc_aplic = sa.seqnc
         and p.seqnc = sa.ref_page_forml
/
