SET DEFINE OFF;
create or replace force view vs_profl_par_utils
(
  seqnc_utils
 ,code_utils
 ,seqnc_prodt
 ,seqnc_group
 ,code_group_utils
 ,domn_lien
 ,domn_code
)
as
  select distinct seqnc_utils --Portion profils lie a user
                 ,code_utils
                 ,seqnc_prodt
                 ,seqnc_group
                 ,code_group_utils
                 ,domn_lien
                 ,domn_code
    from (select ubug.seqnc_utils seqnc_utils
                ,u.code_utils     code_utils
                ,gu.ref_prodt     seqnc_prodt
                ,gu.seqnc         seqnc_group
                ,gu.code          code_group_utils
                ,ubug.domn_lien   domn_lien
                ,d.code           domn_code
            from (    select lgu.ref_utils       seqnc_utils
                            ,lgu.ref_group       seqnc_group
                            ,lgu.ref_group_utils_lie seqnc_group_lie
                            ,lgu.ref_domn        domn_lien
                        from vd_i_afw_12_lien_group_utils lgu
                       where     lgu.date_debut_efect <= sysdate
                             and (   lgu.date_fin_efect >= sysdate
                                  or lgu.date_fin_efect is null)
                  start with lgu.ref_utils is not null
                  connect by prior ref_group = ref_group_utils_lie) ubug
                ,vd_i_afw_12_group_utils gu
                ,vd_i_afw_12_utils       u
                ,vd_i_afw_12_domn        d
           where     ubug.seqnc_group = gu.seqnc
                 and u.seqnc = ubug.seqnc_utils
                 and gu.indic_acces_globl = 'O'
                 and ubug.domn_lien = d.seqnc
          union all
          select ubug.seqnc_utils --Portion profils lie au groupe utilisateur lie au user
                ,u.code_utils code_utils
                ,gu.ref_prodt seqnc_prodt
                ,gu.seqnc     seqnc_group
                ,gu.code      code_group_utils
                ,ubug.domn_lien
                ,d.code       domn_code
            from (    select lgu.ref_utils       seqnc_utils
                            ,lgu.ref_group       seqnc_group
                            ,lgu.ref_group_utils_lie seqnc_group_lie
                            ,lgu.ref_domn        domn_lien
                        from vd_i_afw_12_lien_group_utils lgu
                       where     lgu.date_debut_efect <= sysdate
                             and (   lgu.date_fin_efect >= sysdate
                                  or lgu.date_fin_efect is null)
                  start with lgu.ref_utils is not null
                  connect by prior ref_group = ref_group_utils_lie) ubug
                ,vd_i_afw_12_lien_group_utils lgu
                ,vd_i_afw_12_group_utils      gu
                ,vd_i_afw_12_utils            u
                ,vd_i_afw_12_domn             d
           where     ubug.seqnc_group = lgu.ref_group
                 and gu.seqnc = lgu.ref_group_utils_lie
                 and gu.indic_acces_globl = 'O'
                 and ubug.domn_lien = d.seqnc
                 and u.seqnc = ubug.seqnc_utils
                 and lgu.date_debut_efect <= sysdate
                 and (   lgu.date_fin_efect >= sysdate
                      or lgu.date_fin_efect is null))
/
