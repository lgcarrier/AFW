SET DEFINE OFF;
create or replace trigger afw_01_mesg_lang_biu_trg
  before insert or update
  on afw_01_mesg_lang
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_01_mesg_lang_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if :new.ref_lang is null
  then
    afw_01_err_apex_pkg.lever_err_apex_code ('LAN.000029'
                                            ,pva_code_prodt   => 'SEM');
  end if;
end afw_01_mesg_lang_biu_trg;
/
