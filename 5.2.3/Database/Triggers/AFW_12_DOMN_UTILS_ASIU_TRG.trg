SET DEFINE OFF;
create or replace trigger afw_12_domn_utils_asiu_trg
  after insert or update
  on afw_12_domn_utils
declare
  vnu_seqnc        number;
  vda_date_debut   date;
  vda_date_fin     date;
  vnu_ref_domn     number;
  vnu_ref_utils    number;
  vnu_count        number;
begin
  afw_09_pile_pkg.mode_depil ('DOMN_UTILS');
  vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('DOMN_UTILS');

  while vnu_seqnc is not null
  loop
    begin
      select date_debut_efect
            ,date_fin_efect
            ,ref_domn
            ,ref_utils
        into vda_date_debut
            ,vda_date_fin
            ,vnu_ref_domn
            ,vnu_ref_utils
        from afw_12_domn_utils
       where seqnc = vnu_seqnc;

      afw_12_domn_pkg.valdr_chevc_date_domn_utils (vnu_seqnc
                                                  ,vnu_ref_domn
                                                  ,vnu_ref_utils
                                                  ,vda_date_debut
                                                  ,vda_date_fin);
    end;

    vnu_seqnc   := afw_09_pile_pkg.depil_numbr ('DOMN_UTILS');
  end loop;

  afw_09_pile_pkg.termn_utils_pile ('DOMN_UTILS');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_domn_utils_asiu_trg;
/
