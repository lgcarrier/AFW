SET DEFINE OFF;
create or replace force view vd_afw_12_stat
(
  seqnc
 ,ref_struc_aplic
 ,ref_struc_aplic_formt
 ,ref_group_stat
 ,ref_group_stat_formt
 ,ordre
 ,code
 ,nom
 ,descr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,indic_initl
 ,indic_stat_utils
 ,libl_actio
 ,catgr_stat
 ,indic_final
 ,indic_insta_procs_aprob
 ,jour_prevu
 ,heure_prevu
 ,mint_prevu
 ,temps_prevu_numbr
 ,icone_catgr
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_struc_aplic
        , (select code
             from vd_i_afw_12_struc_aplic sa
            where sa.seqnc = s.ref_struc_aplic)
           ref_struc_aplic_formt
        ,ref_group_stat
        , (select code
             from vd_i_afw_12_group_stat gs
            where gs.seqnc = s.ref_group_stat)
           ref_group_stat_formt
        ,ordre
        ,code
        ,nom
        ,descr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,indic_initl
        ,indic_stat_utils
        ,libl_actio
        ,catgr_stat
        ,indic_final
        ,indic_insta_procs_aprob
        ,jour_prevu
        ,heure_prevu
        ,mint_prevu
        ,to_number (   jour_prevu
                    || to_char (nvl (heure_prevu, 0)
                               ,'FM00')
                    || to_char (nvl (mint_prevu, 0)
                               ,'FM00'))
           temps_prevu_numbr
        ,case
           when indic_initl = 'O' then '<i class="fa fa-lg fa-circle-thin"></i>'
           when indic_final = 'O' then '<i class="fa fa-lg fa-circle"></i>'
           when catgr_stat = 'ACTIO' then '<i class="fa fa-lg fa-bolt"></i>'
           when catgr_stat = 'ATENT' then '<i class="fa fa-lg fa-clock-o"></i>'
         end
           icone_catgr
        ,dnr_ref_domn
    from vd_i_afw_12_stat s
/
