SET DEFINE OFF;
create or replace trigger afw_21_plugn_calnd_biu_trg
  before insert or update
  on afw_21_plugn_calnd
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_21_plugn_calnd_seq.nextval;
  end if;

  if :new.code is null
  then
    :new.code   := :new.seqnc;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if    inserting
     or     updating
        and (   :new.heure_debut_norml <> :old.heure_debut_norml
             or :new.heure_fin_norml <> :old.heure_fin_norml
             or (       :new.heure_debut_exten <> :old.heure_debut_exten
                    and :new.heure_debut_exten is not null
                 or :new.heure_debut_exten is null)
             or (       :new.heure_fin_exten <> :old.heure_fin_exten
                    and :new.heure_fin_exten is not null
                 or :new.heure_fin_exten is null))
  then
    afw_21_plugn_calnd_pkg.valdr_heure (:new.heure_debut_norml
                                       ,:new.heure_fin_norml
                                       ,:new.heure_debut_exten
                                       ,:new.heure_fin_exten);
  end if;
end afw_21_plugn_calnd_biu_trg;
/
