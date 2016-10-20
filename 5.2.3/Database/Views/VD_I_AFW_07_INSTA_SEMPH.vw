SET DEFINE OFF;
create or replace force view vd_i_afw_07_insta_semph
(
  seqnc
 ,ref_semph
 ,id_sesn
 ,date_creat
 ,utils_creat
 ,indic_seqnc
 ,page_perst
)
as
  select seqnc
        ,ref_semph
        ,id_sesn
        ,date_creat
        ,utils_creat
        ,indic_seqnc
        ,page_perst
    from afw_07_insta_semph
/
