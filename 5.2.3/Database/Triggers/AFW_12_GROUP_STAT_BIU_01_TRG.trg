SET DEFINE OFF;
create or replace trigger afw_12_group_stat_biu_01_trg
  before insert or update
  on afw_12_group_stat
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_12_group_stat_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if :new.code is null
  then
    :new.code   := :new.seqnc;
  else
    if    inserting
       or (    updating
           and :old.code != :new.code)
    then
      :new.code   := upper (:new.code);
    end if;
  end if;
end afw_12_group_stat_biu_01_trg;
/
