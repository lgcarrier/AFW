SET DEFINE OFF;
create or replace trigger afw_04_contx_biu_trg
  before insert or update
  on afw_04_contx
  for each row
begin
  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  --Valider les contextes
  if :new.contx is not null
  then
    afw_04_contx_pkg.valdr_contx (:new.ref_fil_arian
                                 ,:new.contx);
  end if;

  if :new.contx_inter is not null
  then
    afw_04_contx_pkg.valdr_contx (:new.ref_fil_arian
                                 ,:new.contx_inter);
  end if;

  -- Si une modification est faite post-insertion, on ne veut plus ignorer le contexte
  if     updating
     and :old.indic_ignor = 'O'
  then
    :new.indic_ignor   := 'N';
  end if;
end afw_04_contx_biu_trg;
/
