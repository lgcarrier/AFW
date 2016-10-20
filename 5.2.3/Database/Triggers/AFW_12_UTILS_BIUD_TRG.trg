SET DEFINE OFF;
create or replace trigger afw_12_utils_biud_trg
  before insert or update or delete
  on afw_12_utils
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_12_utils_seq.nextval;
  end if;

  if    inserting
     or updating
  then
    :new.code_utils   := upper (:new.code_utils);
    :new.courl        := lower (:new.courl);

    afw_07_util_pkg.genr_valr_audit (inserting
                                    ,updating
                                    ,:new.utils_creat
                                    ,:new.date_creat
                                    ,:new.utils_modfc
                                    ,:new.date_modfc);
  end if;

  if     deleting
     and :old.code_utils = afw_07_util_pkg.v ('APP_USER')
  then
    afw_01_err_apex_pkg.lever_err_apex_code ('AFW.000003'
                                            ,pva_code_prodt   => 'AFW');
  end if;
end afw_12_utils_biud_trg;
/
