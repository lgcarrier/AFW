SET DEFINE OFF;
create or replace trigger afw_17_profl_courl_biu_trg
  before insert or update
  on afw_17_profl_courl
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_17_profl_courl_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_17_profl_courl_biu_trg;
/
