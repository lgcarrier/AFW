SET DEFINE OFF;
create or replace trigger afw_12_domn_fonct_biu_01_trg
  before insert or update
  on afw_12_domn_fonct
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_12_domn_fonct_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_12_domn_fonct_biu_01_trg;
/
