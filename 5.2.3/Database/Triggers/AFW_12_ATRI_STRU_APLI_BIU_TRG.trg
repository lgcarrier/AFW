SET DEFINE OFF;
create or replace trigger afw_12_atri_stru_apli_biu_trg
  before insert or update
  on afw_12_atrib_struc_aplic
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_12_atrib_struc_aplic_seq.nextval;
  end if;

  if :new.ref_dv_natr_infor != afw_14_domn_valr_pkg.obten_seqnc ('NATR_INFOR_STRUC_APLIC'
                                                                ,'CLE_PRIMR'
                                                                ,'AFW')
  then
    :new.indic_destn   := 'N';
  end if;

  if :new.ref_dv_natr_infor is null
  then
    :new.ref_atrib_struc_aplic   := null;
    :new.indic_destn             := 'N';
  end if;


  --Gérer les destinataires
  if     updating
     and :new.indic_destn = 'O'
     and :old.indic_destn = 'N'
     and afw_11_migrt_pkg.gva_indic_migrt = 'N'
  then
    insert into vd_i_afw_01_destn (ref_atrib_struc_aplic
                                  ,dnr_ref_prodt)
         values (:new.seqnc
                ,:new.dnr_ref_prodt);
  elsif     updating
        and :new.indic_destn = 'N'
        and :old.indic_destn = 'O'
        and afw_11_migrt_pkg.gva_indic_migrt = 'N'
  then
    delete from vd_i_afw_01_destn
          where ref_atrib_struc_aplic = :new.seqnc;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_12_atri_stru_apli_biu_trg;
/
