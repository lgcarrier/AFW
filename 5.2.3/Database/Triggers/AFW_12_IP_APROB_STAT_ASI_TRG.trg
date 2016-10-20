SET DEFINE OFF;
create or replace trigger afw_12_ip_aprob_stat_asi_trg
  after insert
  on afw_12_insta_procs_aprob_stat
declare
  vnu_seqnc         number (10);

  vva_indic_final   varchar2 (1);
  vva_evenm_notfb   varchar2 (23);
begin
  afw_09_pile_pkg.mode_depil ('EVOLT_STAT');
  vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('EVOLT_STAT');

  while vnu_seqnc is not null
  loop
    select s.indic_final
          ,gs.ref_evenm_notfb_code
      into vva_indic_final
          ,vva_evenm_notfb
      from vd_i_afw_12_ip_aprob_stat ipas
          ,vd_i_afw_12_stat          s
          ,vd_afw_12_group_stat      gs
     where     ipas.seqnc = vnu_seqnc
           and s.seqnc = ipas.ref_stat
           and gs.seqnc = s.ref_group_stat;

    if     vva_indic_final = 'N'
       and vva_evenm_notfb is not null
    then
      afw_01_evenm_notfb_cu_pkg.propg_evenm_notfb (vva_evenm_notfb
                                                  ,vnu_seqnc
                                                  ,'AFW');
    end if;

    vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('EVOLT_STAT');
  end loop;

  afw_09_pile_pkg.termn_utils_pile ('EVOLT_STAT');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_ip_aprob_stat_asi_trg;
/
