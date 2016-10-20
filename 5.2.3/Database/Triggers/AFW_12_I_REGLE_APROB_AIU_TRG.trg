SET DEFINE OFF;
create or replace trigger afw_12_i_regle_aprob_aiu_trg
  after insert or update
  on afw_12_insta_regle_aprob
  for each row
declare
begin
  /*  Lorsqu'on instancie un nouveau processus à partir d'un statut en cours,
   *  une approbation dummy est créée pour conserver la personne qui a posé l'action.
   *  Dans ce cas, on n'exécute pas l'évolution de statut.
   */
  if     inserting
     and (   :new.ref_evolt_stat is not null
          or :new.ref_regle_aprob is not null)
  then
    afw_09_pile_pkg.empil_numbr ('EXECT_EVOLT_STAT'
                                ,:new.seqnc);
  end if;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_i_regle_aprob_aiu_trg;
/
