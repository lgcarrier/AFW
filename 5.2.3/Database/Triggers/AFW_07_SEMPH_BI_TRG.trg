SET DEFINE OFF;
create or replace trigger afw_07_semph_bi_trg
  before insert
  on afw_07_semph
  for each row
declare
  vda_date    date;
  vva_varch   varchar2 (30);
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_07_semph_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,vva_varch
                                  ,vda_date);

  if    inserting
     or (    updating
         and :old.code != :new.code)
  then
    :new.code   := upper (:new.code);
  end if;
end afw_07_semph_bi_trg;
/
