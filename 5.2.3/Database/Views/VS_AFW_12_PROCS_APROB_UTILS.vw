SET DEFINE OFF;
create or replace force view vs_afw_12_procs_aprob_utils
(
  seqnc
 ,code
 ,nom
 ,descr
 ,ref_struc_aplic
 ,ref_struc_aplic_code
)
as
  select gs.seqnc
        ,gs.code
        ,gs.nom
        ,gs.descr
        ,gs.ref_struc_aplic
        ,gs.ref_struc_aplic_code
    from vd_afw_12_group_stat gs
   where     gs.ref_domn = afw_12_domn_pkg.obten_domn_sesn ()
         and gs.indic_dispn = 'O'
         and sysdate between gs.date_debut_efect and nvl (gs.date_fin_efect, sysdate + 1)
         and (   afw_12_secrt_pkg.verfc_droit_acces_numrq (gs.ref_struc_aplic_code) = 1
              or gs.ref_struc_aplic is null)
/
