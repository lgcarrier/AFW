SET DEFINE OFF;
create or replace trigger afw_13_item_menu_biu_trg
  before insert or update
  on afw_13_item_menu
  for each row
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_13_item_menu_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  if :new.indic_reint_pagnt is null
  then
    :new.indic_reint_pagnt   := 'N';
  end if;

  if :new.indic_reint_page_ir is null
  then
    :new.indic_reint_page_ir   := 'N';
  end if;

  if :new.indic_clear_page_ir is null
  then
    :new.indic_clear_page_ir   := 'N';
  end if;
end afw_13_item_menu_biu_trg;
/
