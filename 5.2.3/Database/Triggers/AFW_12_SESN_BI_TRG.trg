SET DEFINE OFF;
create or replace trigger afw_12_sesn_bi_trg
  before insert
  on afw_12_sesn
  for each row
begin
  if inserting
  then
    if :new.id_sesn is null
    then
      :new.id_sesn   := afw_07_util_pkg.nv ('SESSION');
    end if;

    if :new.app_user is null
    then
      :new.app_user   := afw_07_util_pkg.v ('APP_USER');
    end if;
  end if;
end afw_12_sesn_bi_trg;
/
