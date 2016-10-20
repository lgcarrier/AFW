SET DEFINE OFF;
create or replace force view vs_sgpu_super_utils
(
  seqnc_utils
 ,code_utils
 ,seqnc_prodt
 ,domn_lien
 ,domn_code
 ,indic_acces
 ,indic_creat
 ,indic_modfc
 ,indic_suprs
 ,indic_acces_nombr
 ,indic_creat_nombr
 ,indic_modfc_nombr
 ,indic_suprs_nombr
 ,seqnc_struc_aplic
 ,code_struc_aplic
 ,sourc
)
as
  select u.seqnc      seqnc_utils
        ,u.code_utils code_utils
        ,gu.ref_prodt seqnc_prodt
        ,lgu.ref_domn domn_lien
        ,d.code       domn_code
        ,'ACORD'      indic_acces
        ,'ACORD'      indic_creat
        ,'ACORD'      indic_modfc
        ,'ACORD'      indic_suprs
        ,1            indic_acces_nombr
        ,1            indic_creat_nombr
        ,1            indic_modfc_nombr
        ,1            indic_suprs_nombr
        ,null         seqnc_struc_aplic
        ,null         code_struc_aplic
        ,'SU'         sourc
    from vd_i_afw_12_utils            u
        ,vd_i_afw_12_lien_group_utils lgu
        ,vd_i_afw_12_group_utils      gu
        ,vd_i_afw_12_domn             d
        ,(select afw_12_secrt_pkg.obten_code_utils code_utils
                ,afw_12_secrt_pkg.obten_code_domn  code_domn
            from dual) utils_actue
   where     u.seqnc = lgu.ref_utils
         and gu.seqnc = lgu.ref_group
         and d.seqnc = lgu.ref_domn
         and gu.code = 'SUPER_UTILS'
         and lgu.date_debut_efect <= sysdate
         and (   lgu.date_fin_efect >= sysdate
              or lgu.date_fin_efect is null)
         and u.code_utils = utils_actue.code_utils
         and d.code = utils_actue.code_domn
  union all
  select seqnc_utils
        ,code_utils
        ,seqnc_prodt
        ,domn_lien
        ,domn_code
        ,indic_acces
        ,indic_creat
        ,indic_modfc
        ,indic_suprs
        ,indic_acces_nombr
        ,indic_creat_nombr
        ,indic_modfc_nombr
        ,indic_suprs_nombr
        ,seqnc_struc_aplic
        ,code_struc_aplic
        ,'SG' sourc
    from vs_secrt_group_par_user
/
