SET DEFINE OFF;
create or replace force view vs_afw_12_ip_aprob_stat_temps
(
  seqnc
 ,ref_insta_procs_aprob
 ,ref_stat
 ,ref_stat_code
 ,ref_stat_formt
 ,date_debut_efect
 ,date_fin_efect
 ,duree_formt
 ,duree_numbr
 ,duree_prevu_formt
 ,duree_prevu_numbr
 ,duree_restn_formt
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,dnr_ref_domn
)
as
  select seqnc
        ,ref_insta_procs_aprob
        ,ref_stat
        ,ref_stat_code
        ,ref_stat_formt
        ,date_debut_efect
        ,date_fin_efect
        ,   duree_jour
         || 'd '
         || to_char (duree_heure
                    ,'FM00')
         || 'h '
         || to_char (duree_mint
                    ,'FM00')
         || 'm'
           duree_formt
        ,to_number (   duree_jour
                    || to_char (nvl (duree_heure, 0)
                               ,'FM00')
                    || to_char (nvl (duree_mint, 0)
                               ,'FM00'))
           duree_numbr
        ,case
           when duree_prevu_numbr != 0
           then
                nvl (duree_prevu_jour, 0)
             || 'd '
             || to_char (nvl (duree_prevu_heure, 0)
                        ,'FM00')
             || 'h '
             || to_char (nvl (duree_prevu_mint, 0)
                        ,'FM00')
             || 'm'
           else
             null
         end
           duree_prevu_formt
        ,duree_prevu_numbr
        ,case
           when duree_prevu_numbr != 0
           then
                case when date_fin_prevu - sysdate < 0 then '-' else null end
             || case
                  when abs (date_fin_prevu - sysdate) > 1
                  then
                       abs (trunc (date_fin_prevu - sysdate))
                    || 'd '
                  else
                    null
                end
             || to_char (abs (extract (hour from (  to_timestamp (to_char (date_fin_prevu
                                                                          ,'YYYY.MM.DD:HH24:MI:SS')
                                                                 ,'YYYY.MM.DD:HH24:MI:SS')
                                                  - systimestamp)))
                        ,'FM00')
             || ':'
             || to_char (abs (extract (minute from (  to_timestamp (to_char (date_fin_prevu
                                                                            ,'YYYY.MM.DD:HH24:MI:SS')
                                                                   ,'YYYY.MM.DD:HH24:MI:SS')
                                                    - systimestamp)))
                        ,'FM00')
           else
             null
         end
           duree_restn_formt
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,dnr_ref_domn
    from (select ipas.seqnc
                ,ipas.ref_insta_procs_aprob
                ,ipas.ref_stat
                ,s.code                                                                  ref_stat_code
                ,s.nom                                                                   ref_stat_formt
                ,ipas.date_debut_efect
                ,ipas.date_fin_efect
                ,trunc (nvl (ipas.date_fin_efect, dj.date_jour) - ipas.date_debut_efect) duree_jour
                ,trunc (
                     (  (nvl (ipas.date_fin_efect, dj.date_jour) - ipas.date_debut_efect)
                      - trunc (nvl (ipas.date_fin_efect, dj.date_jour) - ipas.date_debut_efect))
                   * 24)
                   duree_heure
                ,trunc (
                       (  (nvl (ipas.date_fin_efect, dj.date_jour) - ipas.date_debut_efect)
                        - trunc (nvl (ipas.date_fin_efect, dj.date_jour) - ipas.date_debut_efect))
                     * 24
                     * 60
                   - (  trunc (
                            (  (nvl (ipas.date_fin_efect, dj.date_jour) - ipas.date_debut_efect)
                             - trunc (nvl (ipas.date_fin_efect, dj.date_jour) - ipas.date_debut_efect))
                          * 24)
                      * 60))
                   duree_mint
                ,s.jour_prevu                                                            duree_prevu_jour
                ,s.heure_prevu                                                           duree_prevu_heure
                ,s.mint_prevu                                                            duree_prevu_mint
                ,s.temps_prevu_numbr                                                     duree_prevu_numbr
                ,case
                   when s.temps_prevu_numbr > 0
                   then
                     ipas.date_debut_efect + nvl (s.jour_prevu, 0) + nvl (s.heure_prevu / 24, 0) + nvl (s.mint_prevu / 1440, 0)
                   else
                     null
                 end
                   date_fin_prevu
                ,ipas.utils_creat
                ,ipas.date_creat
                ,ipas.utils_modfc
                ,ipas.date_modfc
                ,ipas.dnr_ref_domn
            from vd_i_afw_12_ip_aprob_stat ipas
                ,vd_afw_12_stat            s
                ,(select sysdate date_jour
                    from dual) dj
           where s.seqnc = ipas.ref_stat)
/
