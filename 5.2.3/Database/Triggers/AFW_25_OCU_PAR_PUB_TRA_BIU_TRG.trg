SET DEFINE OFF;
create or replace trigger afw_25_ocu_par_pub_tra_biu_trg
  before insert or update
  on afw_25_ocurn_parmt_publc_travl
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_25_ocurn_parmt_pub_tra_seq.nextval;
  end if;
end afw_25_ocu_par_pub_tra_biu_trg;
/
