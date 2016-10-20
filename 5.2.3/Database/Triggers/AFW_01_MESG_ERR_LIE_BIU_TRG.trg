SET DEFINE OFF;
create or replace trigger afw_01_mesg_err_lie_biu_trg
  before insert or update
  on afw_01_mesg_err_lie
  for each row
declare
  vnu_code_err   number (5);
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_01_mesg_err_lie_seq.nextval;
  end if;

  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,:new.utils_modfc
                                  ,:new.date_modfc);

  begin
    select err_code
      into vnu_code_err
      from vd_i_afw_01_code_err_oracl
     where seqnc = :new.ref_code_err_oracl;
  exception
    when no_data_found
    then
      vnu_code_err   := null;
  end;

  --  if vnu_code_err in (1, 2291, 2292, 2290)
  --     and (:new.nom_table is null
  --          or :new.nom_coln is null) then
  --    afw_01_err_apex_pkg.lever_err_apex_code ('MES.000011',
  --                                             pva_code_prodt  => 'SAFP');
  --  end if;
  --
  --  if vnu_code_err in (1407, 1438, 1841, 1861, 20507, 12899)
  --     and :new.nom_contr is null then
  --    afw_01_err_apex_pkg.lever_err_apex_code ('MES.000012',
  --                                             pva_code_prodt  => 'SAFP');
  --  end if;

  if    (    :new.type_liais = 1
         and (   :new.ref_prodt is null
              or :new.page is null
              or :new.ref_code_err_oracl is null)
         and (   :new.nom_contr is null
              or     :new.nom_table is null
                 and :new.nom_coln is null))
     or (    :new.type_liais = 2
         and (   :new.ref_prodt is null
              or :new.page is null
              or :new.ref_code_err_oracl is null))
     or (    :new.type_liais = 3
         and (   :new.ref_prodt is null
              or :new.page is null))
     or (    :new.type_liais = 4
         and (   :new.ref_prodt is null
              or :new.ref_code_err_oracl is null)
         and (   :new.nom_contr is null
              or     :new.nom_table is null
                 and :new.nom_coln is null))
     or (    :new.type_liais = 5
         and (   :new.ref_prodt is null
              or :new.ref_code_err_oracl is null))
     or (    :new.type_liais = 8
         and (   :new.ref_prodt is null
              or :new.page is not null
              or :new.ref_code_err_oracl is not null
              or :new.nom_contr is not null
              or :new.nom_table is not null
              or :new.nom_coln is not null))
  then
    afw_01_err_apex_pkg.lever_err_apex_code ('MES.000013'
                                            ,pva_code_prodt   => 'AFW');
  end if;
end afw_01_mesg_err_lie_biu_trg;
/
