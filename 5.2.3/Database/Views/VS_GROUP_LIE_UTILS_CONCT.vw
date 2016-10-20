SET DEFINE OFF;
create or replace force view vs_group_lie_utils_conct (seqnc_group)
as
  with utils_sesn
       as (select sys_context ('ctx_infor_sesn'
                              ,'vnu_seqnc_utils')
                    as seqnc
             from dual)
      select distinct (ref_group) seqnc_group
        from afw_12_lien_group_utils lgu
  connect by     prior lgu.ref_group_utils_lie = lgu.ref_group
             and (   level != 1
                  or (    level = 1
                      and ref_utils is null))
             and lgu.date_debut_efect <= sysdate
             and (   lgu.date_fin_efect >= sysdate
                  or lgu.date_fin_efect is null)
  start with     lgu.ref_group in (select distinct ref_group
                                     from afw_12_lien_group_utils lgu2
                                         ,utils_sesn
                                    where     lgu2.ref_utils = utils_sesn.seqnc
                                          and lgu2.date_debut_efect <= sysdate
                                          and (   lgu2.date_fin_efect >= sysdate
                                               or lgu2.date_fin_efect is null))
             and lgu.ref_utils is null
             and lgu.date_debut_efect <= sysdate
             and (   lgu.date_fin_efect >= sysdate
                  or lgu.date_fin_efect is null)
  union
  select distinct ref_group
    from afw_12_lien_group_utils lgu
        ,utils_sesn
   where     lgu.ref_utils = utils_sesn.seqnc
         and lgu.date_debut_efect <= sysdate
         and (   lgu.date_fin_efect >= sysdate
              or lgu.date_fin_efect is null)
  union
  select distinct ref_group
    from afw_12_group_utils      gu
        ,afw_12_lien_group_utils lgu
   where     gu.indic_ignor_group_admin = 'N'
         and lgu.ref_group = gu.seqnc
         and exists
               (select null
                  from afw_12_group_utils      gu2
                      ,afw_12_lien_group_utils lgu2
                      ,utils_sesn
                 where     gu2.code = 'SUPER_UTILS'
                       and gu2.seqnc = lgu2.ref_group
                       and lgu2.ref_utils = utils_sesn.seqnc
                       and lgu2.date_debut_efect <= sysdate
                       and (   lgu2.date_fin_efect >= sysdate
                            or lgu2.date_fin_efect is null))
/
