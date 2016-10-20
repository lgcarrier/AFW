SET DEFINE OFF;
create or replace trigger afw_07_etat_sesn_bsiu_trg
  before insert or update
  on afw_07_etat_sesn
begin
  afw_12_utils_pkg.init ();
end afw_07_etat_sesn_bsiu_trg;
/
