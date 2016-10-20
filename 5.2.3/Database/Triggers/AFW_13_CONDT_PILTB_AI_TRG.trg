SET DEFINE OFF;
create or replace trigger afw_13_condt_piltb_ai_trg
  after insert
  on afw_13_condt_piltb
  for each row
begin
  if     not afw_13_condt_piltb_pkg.vbo_en_charg
     and afw_11_migrt_pkg.gva_indic_migrt = 'N'
  then
    afw_13_condt_piltb_pkg.ajout_lien_cas_lectr (:new.seqnc
                                                ,:new.ref_page);
  end if;
end afw_13_condt_piltb_ai_trg;
/
