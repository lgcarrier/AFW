SET DEFINE OFF;
create or replace trigger afw_12_i_regle_aprob_asi_trg
  after insert
  on afw_12_insta_regle_aprob
declare
  vnu_seqnc               number (10);
  vnu_insta_procs_aprob   number (10);
  vnu_evolt_stat          number (10);
begin
  afw_09_pile_pkg.mode_depil ('EXECT_EVOLT_STAT');
  vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('EXECT_EVOLT_STAT');

  while vnu_seqnc is not null
  loop
    select ira.ref_insta_procs_aprob
          ,nvl ( (select ra.ref_evolt_stat
                    from vd_i_afw_12_regle_aprob ra
                   where ra.seqnc = ira.ref_regle_aprob)
               ,ira.ref_evolt_stat)
      into vnu_insta_procs_aprob
          ,vnu_evolt_stat
      from vd_i_afw_12_insta_regle_aprob ira
     where ira.seqnc = vnu_seqnc;

    afw_12_regle_aprob_pkg.exect_evolt_stat (vnu_insta_procs_aprob
                                            ,vnu_evolt_stat);

    vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('EXECT_EVOLT_STAT');
  end loop;

  afw_09_pile_pkg.termn_utils_pile ('EXECT_EVOLT_STAT');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_i_regle_aprob_asi_trg;
/
