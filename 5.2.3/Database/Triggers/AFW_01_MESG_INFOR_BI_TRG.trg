SET DEFINE OFF;
create or replace trigger afw_01_mesg_infor_bi_trg
  before insert
  on afw_01_mesg_infor
  for each row
declare
  vva_utils_bidon   varchar2 (30);
  vda_date_bidon    date;
begin
  if inserting
  then
    if :new.seqnc is null
    then
      :new.seqnc   := afw_01_mesg_infor_seq.nextval;
    end if;

    if :new.ref_utils is null
    then
      :new.sess_id   := afw_07_util_pkg.nv ('APP_SESSION');
    end if;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,vva_utils_bidon
                                  ,vda_date_bidon);
end afw_01_mesg_infor_bi_trg;
/
