SET DEFINE OFF;
create or replace trigger afw_04_tutrl_bi_trg
  before insert
  on afw_04_tutrl
  for each row
declare
  vva_utils_bidon   varchar2 (30);
  vda_date_bidon    date;
  vnu_seqnc         number (10);
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_04_tutrl_seq.nextval;
  end if;

  if :new.timst is null
  then
    :new.timst   := systimestamp;
  end if;


  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,vva_utils_bidon
                                  ,vda_date_bidon);
end afw_04_tutrl_bi_trg;
/
