SET DEFINE OFF;
create or replace trigger afw_12_domn_asi_trg
  after insert
  on afw_12_domn
declare
  vnu_seqnc   number (10);
begin
  afw_09_pile_pkg.mode_depil ('DOMN_TYPE_TRAVL');
  vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('DOMN_TYPE_TRAVL');

  while vnu_seqnc is not null
  loop
    update afw_12_domn
       set type_travl_deft      =
             (select seqnc
                from vd_afw_25_type_travl
               where     code = 'FILE_ATENT'
                     and ref_domn = vnu_seqnc)
     where seqnc = vnu_seqnc;

    --Ajouter AFW_ADMIN au domaine
    afw_12_group_utils_pkg.ajout_utils_super_utils (afw_12_utils_pkg.obten_utils_de_code ('AFW_ADMIN')
                                                   ,pnu_domn   => vnu_seqnc);

    vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('DOMN_TYPE_TRAVL');
  end loop;

  afw_09_pile_pkg.termn_utils_pile ('DOMN_TYPE_TRAVL');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_domn_asi_trg;
/
