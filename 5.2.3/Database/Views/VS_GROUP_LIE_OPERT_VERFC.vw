SET DEFINE OFF;
create or replace force view vs_group_lie_opert_verfc (seqnc_group)
as
      select distinct (o.ref_group) seqnc_group
        from afw_12_lien_group_utils o
  connect by     o.ref_group_utils_lie = prior o.ref_group
             and (   level != 1
                  or (    level = 1
                      and ref_utils is null))
             and o.date_debut_efect <= sysdate
             and (   o.date_fin_efect >= sysdate
                  or o.date_fin_efect is null)
  start with o.ref_group_utils_lie in (select ref_group_utils
                                         from afw_12_defnt_acces o2
                                             ,afw_13_opert       lgu2
                                             ,(select afw_12_secrt_pkg.obten_opert_en_cours_verfc () code
                                                 from dual) opert
                                        where     o2.ref_opert = lgu2.seqnc
                                              and lgu2.code = opert.code)
  union
  select distinct (ref_group_utils) seqnc_group
    from afw_12_defnt_acces o2
        ,afw_13_opert       lgu2
        ,(select afw_12_secrt_pkg.obten_opert_en_cours_verfc () code
            from dual) opert
   where     o2.ref_opert = lgu2.seqnc
         and lgu2.code = opert.code
/
