SET DEFINE OFF;
create or replace force view vs_group_lie_utils_conct_all (seqnc_group)
as
      select distinct (ref_group_utils_lie) seqnc_group
        from vd_afw_12_lien_group_utils lgu
  connect by     prior lgu.ref_group_utils_lie = lgu.ref_group
             and lgu.date_debut_efect <= sysdate
             and (   lgu.date_fin_efect >= sysdate
                  or lgu.date_fin_efect is null)
  start with     lgu.ref_group in (select seqnc_group
                                     from vs_group_lie_utils_conct)
             and lgu.ref_utils is null
             and lgu.date_debut_efect <= sysdate
             and (   lgu.date_fin_efect >= sysdate
                  or lgu.date_fin_efect is null)
  union all
  select seqnc_group
    from vs_group_lie_utils_conct
/
