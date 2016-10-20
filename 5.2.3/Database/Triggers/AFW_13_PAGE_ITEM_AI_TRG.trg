SET DEFINE OFF;
create or replace trigger afw_13_page_item_ai_trg
  after insert
  on afw_13_page_item
  for each row
begin
  if not afw_13_condt_piltb_pkg.vbo_en_charg
  then
    afw_13_condt_piltb_pkg.ajout_lien_cas_lectr_item (:new.seqnc
                                                     ,:new.ref_page
                                                     ,:new.dnr_ref_aplic);
  end if;
end afw_13_page_item_ai_trg;
/
