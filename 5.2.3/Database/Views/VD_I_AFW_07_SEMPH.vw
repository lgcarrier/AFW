SET DEFINE OFF;
create or replace force view vd_i_afw_07_semph
(
  seqnc
 ,code
 ,varbl1
 ,varbl2
 ,varbl3
 ,date_creat
 ,utils_creat
 ,indic_exclu
)
as
  select seqnc
        ,code
        ,varbl1
        ,varbl2
        ,varbl3
        ,date_creat
        ,utils_creat
        ,indic_exclu
    from afw_07_semph
/
