SET DEFINE OFF;
create or replace trigger afw_12_g_u_opr_o_d_biu_01_trg
  before insert or update
  on afw_12_gr_ut_opert_optio_domn
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_12_gr_ut_opert_opt_d_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_12_g_u_opr_o_d_biu_01_trg;
/
