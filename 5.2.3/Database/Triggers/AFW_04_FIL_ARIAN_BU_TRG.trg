SET DEFINE OFF;
create or replace trigger afw_04_fil_arian_bu_trg
  before update
  on afw_04_fil_arian
  for each row
declare
  vva_utils_bidon   varchar2 (30);
  vda_date_bidon    date;
  vnu_seqnc         number (10);
begin
  :new.timst   := systimestamp;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_04_fil_arian_bu_trg;
/
