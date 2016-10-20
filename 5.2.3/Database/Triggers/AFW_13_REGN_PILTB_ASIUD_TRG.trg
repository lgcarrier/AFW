SET DEFINE OFF;
create or replace trigger afw_13_regn_piltb_asiud_trg
  after insert or update
  on afw_13_regn_piltb
declare
  vro_rowid   rowid;
  vnu_count   number (6);
begin
  if inserting
  then
    afw_09_pile_pkg.mode_depil ('VALDR_TYPE_REGN_INSER');
    vro_rowid   := afw_09_pile_pkg.depil_rowid ('VALDR_TYPE_REGN_INSER');
  elsif updating
  then
    afw_09_pile_pkg.mode_depil ('VALDR_TYPE_REGN_UPDAT');
    vro_rowid   := afw_09_pile_pkg.depil_rowid ('VALDR_TYPE_REGN_UPDAT');
  end if;


  while vro_rowid is not null
  loop
    --traitement ici
    select count (1)
      into vnu_count
      from afw_13_regn_piltb rp
     where     rp.rowid <> vro_rowid
           and exists
                 (select rp2.ref_page
                    from afw_13_regn_piltb rp2
                   where     rp2.rowid = vro_rowid
                         and rp2.ref_dv_type_regn_piltb = afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REGN_PILTB'
                                                                                           ,'AIDE_PAGE')
                         and rp.ref_page = rp2.ref_page
                         and rp.ref_dv_type_regn_piltb = rp2.ref_dv_type_regn_piltb);

    if vnu_count > 0
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SAF.000025');
    end if;

    if inserting
    then
      vro_rowid   := afw_09_pile_pkg.depil_rowid ('VALDR_TYPE_REGN_INSER');
    elsif updating
    then
      vro_rowid   := afw_09_pile_pkg.depil_rowid ('VALDR_TYPE_REGN_UPDAT');
    end if;
  end loop;

  if inserting
  then
    afw_09_pile_pkg.termn_utils_pile ('VALDR_TYPE_REGN_INSER');
  elsif updating
  then
    afw_09_pile_pkg.termn_utils_pile ('VALDR_TYPE_REGN_UPDAT');
  end if;
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_13_regn_piltb_asiud_trg;
/
