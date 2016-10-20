SET DEFINE OFF;
create or replace force view vd_afw_12_group_utils
(
  seqnc
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,ref_prodt_formt
 ,ref_code_prodt_formt
 ,code
 ,indic_ignor_group_admin
 ,indic_ignor_group_admin_formt
 ,indic_systm
 ,indic_systm_formt
 ,ref_domn
 ,ref_domn_formt
 ,indic_acces_globl
 ,indic_acces_globl_formt
 ,indic_opert_exist_formt
 ,indic_struc_aplic_exist_formt
 ,indic_group_utils_exist_formt
 ,ref_fonct
 ,indic_group_aplic
 ,indic_group_aplic_formt
)
as
  select seqnc
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        , (select    sp.code
                  || ' - '
                  || sp.nom
             from vd_i_afw_11_prodt sp
            where sp.seqnc = sgu.ref_prodt)
           as ref_prodt_formt
        , (select sp.code
             from vd_i_afw_11_prodt sp
            where sp.seqnc = sgu.ref_prodt)
           as ref_code_prodt_formt
        ,code
        ,indic_ignor_group_admin
        ,case indic_ignor_group_admin when 'O' then '<i class="fa fa-check"></i>' else null end as indic_ignor_group_admin_formt
        ,indic_systm
        ,case indic_systm when 'O' then '<i class="fa fa-check"></i>' else null end             as indic_systm_formt
        ,ref_domn
        , (select sd.nom_formt
             from vd_afw_12_domn sd
            where sd.seqnc = sgu.ref_domn)
           as ref_domn_formt
        ,indic_acces_globl
        ,case indic_acces_globl when 'O' then '<i class="fa fa-check"></i>' else null end       as indic_acces_globl_formt
        ,case (select 1
                 from vd_afw_12_defnt_acces sda
                where     sda.ref_group_utils = sgu.seqnc
                      and sda.ref_opert is not null
                      and rownum = 1)
           when 1 then '<i class="fa fa-check"></i>'
           else null
         end
           as indic_opert_exist_formt
        ,case (select 1
                 from vd_afw_12_defnt_acces sda
                where     sda.ref_group_utils = sgu.seqnc
                      and sda.ref_struc_aplic is not null
                      and rownum = 1)
           when 1 then '<i class="fa fa-check"></i>'
           else null
         end
           as indic_struc_aplic_exist_formt
        ,case (select 1
                 from vd_i_afw_12_lien_group_utils slgu
                where     slgu.ref_group = sgu.seqnc
                      and slgu.ref_group_utils_lie is not null
                      and rownum = 1)
           when 1 then '<i class="fa fa-check"></i>'
           else null
         end
           as indic_group_utils_exist_formt
        ,ref_fonct
        ,indic_group_aplic
        ,case indic_group_aplic when 'O' then '<i class="fa fa-check"></i>' else null end       as indic_group_aplic_formt
    from vd_i_afw_12_group_utils sgu
/
