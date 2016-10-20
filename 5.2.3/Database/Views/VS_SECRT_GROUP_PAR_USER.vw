SET DEFINE OFF;
create or replace force view vs_secrt_group_par_user
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
)
as
  select distinct seqnc_utils
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
    from (with user_by_secrt_group (seqnc_utils
                                   ,code_utils
                                   ,seqnc_prodt
                                   ,seqnc_group
                                   ,code_group_utils
                                   ,domn_lien
                                   ,domn_code)
               as (select ppu.seqnc_utils      seqnc_utils --Cas de base
                         ,ppu.code_utils       code_utils
                         ,ppu.seqnc_prodt      seqnc_prodt
                         ,ppu.seqnc_group      seqnc_group
                         ,ppu.code_group_utils code_group_utils
                         ,ppu.domn_lien        domn_lien
                         ,ppu.domn_code        domn_code
                     from vs_profl_par_utils ppu
                         ,(select afw_12_secrt_pkg.obten_code_utils code_utils
                                 ,afw_12_secrt_pkg.obten_code_domn  code_domn
                             from dual) utils_actue
                    where     utils_actue.code_utils = ppu.code_utils
                          and utils_actue.code_domn = ppu.domn_code
                   union all
                   select ubsg.seqnc_utils seqnc_utils --Cas d'induction
                         ,ubsg.code_utils  code_utils
                         ,gu.ref_prodt     seqnc_prodt
                         ,gu.seqnc         seqnc_group
                         ,gu.code          code_group_utils
                         ,ubsg.domn_lien   domn_lien
                         ,ubsg.domn_code   domn_code
                     from user_by_secrt_group          ubsg
                         ,vd_i_afw_12_lien_group_utils lgu
                         ,vd_i_afw_12_group_utils      gu
                    where     ubsg.seqnc_group = lgu.ref_group
                          and gu.seqnc = lgu.ref_group_utils_lie
                          and lgu.date_debut_efect <= sysdate
                          and (   lgu.date_fin_efect >= sysdate
                               or lgu.date_fin_efect is null))
          select seqnc_utils
                ,code_utils
                ,seqnc_prodt
                ,domn_lien
                ,domn_code
                ,da.indic_acces
                ,da.indic_creat
                ,da.indic_modfc
                ,da.indic_suprs
                ,case da.indic_acces when 'ACORD' then 1 else 0 end indic_acces_nombr
                ,case da.indic_creat when 'ACORD' then 1 else 0 end indic_creat_nombr
                ,case da.indic_modfc when 'ACORD' then 1 else 0 end indic_modfc_nombr
                ,case da.indic_suprs when 'ACORD' then 1 else 0 end indic_suprs_nombr
                ,sa.seqnc                                           seqnc_struc_aplic
                ,sa.code                                            code_struc_aplic
            from user_by_secrt_group     ubsg
                ,vd_i_afw_12_defnt_acces da
                ,vd_i_afw_12_struc_aplic sa
           where     ubsg.seqnc_group = da.ref_group_utils
                 and sa.seqnc = da.ref_struc_aplic)
/
