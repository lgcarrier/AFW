SET DEFINE OFF;
create or replace trigger afw_13_page_item_biu_trg
  before insert or update
  on afw_13_page_item
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_13_page_item_seq.nextval;

    if :new.indic_confr_sauvg is null
    then
      case :new.type_item
        when 'ITEM'
        then
          :new.indic_confr_sauvg   := 'O';
        when 'BOUTN'
        then
          :new.indic_confr_sauvg   := 'N';
        else
          null;
      end case;
    end if;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);
end afw_13_page_item_biu_trg;
/
