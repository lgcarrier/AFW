SET DEFINE OFF;
create or replace trigger afw_12_atri_stru_apli_asu_trg
  after update
  on afw_12_atrib_struc_aplic
declare
  vnu_seqnc        number;
  vnu_natr_infor   number;
  vnu_ref_parnt    number;
  vva_nom_coln     varchar2 (50);

  cursor cur_atrib_parnt
  is
    select distinct ref_atrib_struc_aplic
      from vd_i_afw_12_atrib_struc_aplic
     where ref_atrib_struc_aplic is not null;
begin
  afw_09_pile_pkg.init_pile ('ATRIB_PARNT');

  for rec_atrib_parnt in cur_atrib_parnt
  loop
    afw_09_pile_pkg.empil_numbr ('ATRIB_PARNT'
                                ,rec_atrib_parnt.ref_atrib_struc_aplic);
  end loop;

  afw_09_pile_pkg.mode_depil ('ATRIB_STRUC_APLIC');
  afw_09_pile_pkg.mode_depil ('ATRIB_PARNT');

  vnu_ref_parnt   := afw_09_pile_pkg.depil_numbr ('ATRIB_PARNT');

  while vnu_ref_parnt is not null
  loop
    select ref_dv_natr_infor
          ,nom_coln
      into vnu_natr_infor
          ,vva_nom_coln
      from vd_i_afw_12_atrib_struc_aplic
     where seqnc = vnu_ref_parnt;

    if (   vnu_natr_infor != afw_14_domn_valr_pkg.obten_seqnc ('NATR_INFOR_STRUC_APLIC'
                                                              ,'CLE_PRIMR'
                                                              ,'AFW')
        or vnu_natr_infor is null)
    then
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('STR.000002'
                                                     ,pva_code_prodt    => 'AFW'
                                                     ,pva_valr_subst1   => vva_nom_coln);

      update vd_i_afw_12_atrib_struc_aplic
         set ref_dv_natr_infor      =
               afw_14_domn_valr_pkg.obten_seqnc ('NATR_INFOR_STRUC_APLIC'
                                                ,'CLE_PRIMR'
                                                ,'AFW')
       where seqnc = vnu_ref_parnt;
    end if;

    vnu_ref_parnt   := afw_09_pile_pkg.depil_numbr ('ATRIB_PARNT');
  end loop;

  /*vnu_seqnc := afw_09_pile_pkg.depil_numbr ('ATRIB_STRUC_APLIC');

  while vnu_seqnc is not null loop
    --traitement ici

  select natr_infor into vnu_natr_infor from afw_12_atrib_struc_aplic where seqnc = vnu_seqnc;

  if (vnu_natr_infor != afw_14_domn_valr_pkg.obten_seqnc (
                'NATR_INFOR_STRUC_APLIC',
                'CLE_PRIMR',
                afw_11_prodt_pkg.obten_code_prodt (
                   afw_07_util_pkg.v ('A_SAFP_PRODT'))) or vnu_natr_infor is null) then
UPDATE afw_12_atrib_struc_aplic
         SET ref_atrib_struc_aplic = NULL
       WHERE ref_atrib_struc_aplic = vnu_seqnc;
 end if;
    vnu_seqnc := afw_09_pile_pkg.depil_numbr ('ATRIB_STRUC_APLIC');
  end loop;*/

  afw_09_pile_pkg.termn_utils_pile ('ATRIB_STRUC_APLIC');
  afw_09_pile_pkg.termn_utils_pile ('ATRIB_PARNT');
exception
  when others
  then
    afw_09_pile_pkg.vider_pile ();
    raise;
end afw_12_atri_stru_apli_asu_trg;
/
