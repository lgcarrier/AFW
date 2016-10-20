SET DEFINE OFF;
create or replace trigger afw_01_confg_evenm_notfb_biu_t
  before insert or update
  on afw_01_confg_evenm_notfb
  for each row
declare
  vva_code_type_comnc   varchar2 (23);
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_01_confg_evenm_notfb_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  --Validation à ajouter
  --Si le type de communication est SMS et que ref_compt_twili est null, lever message
  --Si le type de communication est COURL et que ref_profl_courl est null, lever message
  select code
    into vva_code_type_comnc
    from vd_i_afw_01_type_comnc
   where seqnc = :new.ref_type_comnc;

  if     vva_code_type_comnc = 'SMS'
     and :new.ref_compt_twili is null
  then
    afw_01_err_apex_pkg.lever_err_apex_code ('EVM.000001'
                                            ,'SMS'
                                            ,pva_code_prodt   => 'AFW');
  end if;

  if     vva_code_type_comnc = 'COURL'
     and :new.ref_profl_courl is null
  then
    afw_01_err_apex_pkg.lever_err_apex_code ('EVM.000001'
                                            ,'Courriel'
                                            ,pva_code_prodt   => 'AFW');
  end if;
end afw_01_confg_evenm_notfb_biu_t;
/
