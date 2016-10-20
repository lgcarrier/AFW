SET DEFINE OFF;
create or replace force view vs_optio_entet_calnd
(
  d
 ,r
 ,o
)
as
  select    '[Action] '
         || valr
           d
        ,   ref_code_domn_valr_formt
         || ','
         || code_valr
           r
        ,1 o
    from vd_afw_14_detl_domn_valr
   where ref_code_domn_valr_formt = 'OPTIO_ENTET_CALND'
  union all
  select    '[Vue] '
         || valr
           d
        ,   ref_code_domn_valr_formt
         || ','
         || code_valr
           r
        ,2 o
    from vd_afw_14_detl_domn_valr
   where ref_code_domn_valr_formt = 'VUE_DISPN_CALND'
  union all
      select '[Espace] ' d
            ,   ','
             || to_char (-rownum)
               r
            ,3       o
        from dual
  connect by level <   (select count (*)
                          from (select 1
                                  from vd_afw_14_detl_domn_valr
                                 where ref_code_domn_valr_formt = 'OPTIO_ENTET_CALND'
                                union all
                                select 1
                                  from vd_afw_14_detl_domn_valr
                                 where ref_code_domn_valr_formt = 'VUE_DISPN_CALND'))
                     - 1
/
