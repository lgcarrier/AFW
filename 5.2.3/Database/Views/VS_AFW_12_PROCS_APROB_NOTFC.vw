SET DEFINE OFF;
create or replace force view vs_afw_12_procs_aprob_notfc
(
  seqnc
 ,ref_stat
 ,ref_stat_formt
 ,date_debut_efect
 ,url_formt
 ,ref_insta_procs_aprob
 ,ref_struc_aplic_formt
 ,descr_table
)
as
  select ipas.seqnc
        ,ipas.ref_stat
        ,ipas.ref_stat_formt
        ,ipas.date_debut_efect
        ,null url_formt
        ,ipas.ref_insta_procs_aprob
        ,ipa.ref_struc_aplic_formt
        ,   '<table style="width: 100%;"><tr><th style="text-align:left;">Item</th><th style="text-align:left;">Status</th><th style="text-align:left;">Date</th></tr><tr><td>'
         || ipa.ref_struc_aplic_formt
         || '</td><td>'
         || ipas.ref_stat_formt
         || '</td><td>'
         || to_char (ipas.date_debut_efect
                    ,'YYYY-MM-DD HH24:MI')
         || '</td></tr></table>'
           descr_table
    from vd_afw_12_ip_aprob_stat     ipas
        ,vd_afw_12_insta_procs_aprob ipa
   where     ipa.seqnc = ipas.ref_insta_procs_aprob
         and ipas.date_fin_efect is null
/
