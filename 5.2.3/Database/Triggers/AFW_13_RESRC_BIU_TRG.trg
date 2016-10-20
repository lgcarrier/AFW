SET DEFINE OFF;
create or replace trigger afw_13_resrc_biu_trg
  before insert or update
  on afw_13_resrc
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_13_resrc_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if    inserting
     or (    updating
         and :old.code != :new.code)
  then
    :new.code   := upper (:new.code);
  end if;

  if :new.type_resrc is null
  then
    :new.type_resrc   := 'SIMPL';
  end if;

  if     :new.type_resrc = 'SIMPL'
     and :new.indic_stock_meme_reprt is null
  then
    :new.indic_stock_meme_reprt   := 'O';
  end if;
end afw_13_resrc_biu_trg;
/
