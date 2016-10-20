SET DEFINE OFF;
create or replace trigger afw_07_insta_semph_bi_trg
  before insert
  on afw_07_insta_semph
  for each row
declare
  vda_date    date;
  vva_varch   varchar2 (30);
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_07_insta_semph_seq.nextval;
  end if;

  :new.id_sesn   := afw_07_util_pkg.nv ('APP_SESSION');

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,vva_varch
                                  ,vda_date);
end afw_07_insta_semph_bi_trg;
/
