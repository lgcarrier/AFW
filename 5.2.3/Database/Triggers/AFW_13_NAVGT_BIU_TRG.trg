SET DEFINE OFF;
create or replace trigger afw_13_navgt_biu_trg
  before insert or update
  on afw_13_navgt
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_13_navgt_seq.nextval;
  end if;

  :new.ref_id_sesn   := afw_07_util_pkg.nv ('SESSION');

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_13_navgt_biu_trg;
/
