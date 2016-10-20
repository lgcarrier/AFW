SET DEFINE OFF;
create or replace trigger afw_25_par_pub_tra_exe_biu_trg
  before insert or update
  on afw_25_parmt_publc_travl_exect
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_25_parmt_publc_travl_e_seq.nextval;
  end if;
end afw_25_par_pub_tra_exe_biu_trg;
/
