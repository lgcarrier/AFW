SET DEFINE OFF;
create or replace trigger afw_04_navgt_histr_bi_trg
  before insert
  on afw_04_navgt_histr
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_04_navgt_histr_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_04_navgt_histr_bi_trg;
/
