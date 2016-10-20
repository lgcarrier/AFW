SET DEFINE OFF;
create or replace trigger afw_11_entit_biu_trg
  before insert or update
  on afw_11_entit
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_11_entit_seq.nextval;
  end if;

  if     inserting
     and :new.ordre_exect is null
  then
    :new.ordre_exect   := 1;
  end if;

  if     inserting
     and :new.code is null
  then
    :new.code   := :new.nom;
  end if;

  if     updating
     and :new.indic_nouvl_entit = 'O'
  then
    :new.indic_nouvl_entit   := 'N';
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_11_entit_biu_trg;
/
