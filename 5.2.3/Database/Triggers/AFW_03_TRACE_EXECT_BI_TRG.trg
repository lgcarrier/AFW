SET DEFINE OFF;
create or replace trigger afw_03_trace_exect_bi_trg
  before insert
  on afw_03_trace_exect
  for each row
begin
  if inserting
  then
    :new.seqnc   := afw_03_trace_exect_seq.nextval;
  end if;

  :new.page       := afw_07_util_pkg.v ('APP_PAGE_ID');
  :new.app        := afw_07_util_pkg.v ('APP_ID');
  :new.app_user   := afw_07_util_pkg.v ('APP_USER');
end afw_03_trace_exect_bi_trg;
/
