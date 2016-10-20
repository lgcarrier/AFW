SET DEFINE OFF;
create or replace force view vd_afw_13_navgt_elemn
(
  seqnc
 ,numr_elemn
 ,indic_courn
 ,seqnc_elemn
 ,ref_navgt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,numr_elemn
        ,indic_courn
        ,seqnc_elemn
        ,ref_navgt
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_13_navgt_elemn ne
   where exists
           (select 1
              from vd_afw_13_navgt n
             where n.seqnc = ne.ref_navgt)
  with check option
/
