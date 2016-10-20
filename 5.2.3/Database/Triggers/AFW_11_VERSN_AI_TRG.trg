SET DEFINE OFF;
create or replace trigger afw_11_versn_ai_trg
  after insert
  on afw_11_versn
  for each row
declare
  vva_code_prodt   varchar2 (23) default null;
  vnu_versn_afw    number (10) default null;
begin
  --Création des entités de la version actuelle
  if     :new.ref_prodt is not null
     and afw_11_migrt_pkg.gva_indic_migrt = 'N'
  then
    select code
          ,ref_versn
      into vva_code_prodt
          ,vnu_versn_afw
      from vd_i_afw_11_prodt
     where seqnc = :new.ref_prodt;

    if vva_code_prodt = 'AFW'
    then
      -- Ajout schémas
      insert into vd_i_afw_11_schem_prodt (code
                                          ,nom
                                          ,descr
                                          ,ref_versn
                                          ,dnr_ref_prodt
                                          ,indic_deplm)
        select code
              ,nom
              ,descr
              ,:new.seqnc
              ,dnr_ref_prodt
              ,'N'
          from vd_i_afw_11_schem_prodt
         where ref_versn = vnu_versn_afw;

      --Ajout entité
      insert into vd_i_afw_11_entit (nom
                                    ,nom_table_tempr
                                    ,nom_table_ereur
                                    ,indic_creer_ocurn
                                    ,indic_modif_ocurn
                                    ,indic_suprm_ocurn
                                    ,ref_versn
                                    ,date_creat
                                    ,utils_creat
                                    ,date_modfc
                                    ,utils_modfc
                                    ,ordre_exect
                                    ,dnr_ref_prodt
                                    ,code
                                    ,indic_force_selct
                                    ,longr_bloc
                                    ,indic_nouvl_entit
                                    ,niv_inclu_migrt
                                    ,confg_inclu_migrt
                                    ,indic_expor_tabl_index
                                    ,indic_suprm_don_prodt
                                    ,ref_schem_prodt)
        select nom
              ,nom_table_tempr
              ,nom_table_ereur
              ,indic_creer_ocurn
              ,indic_modif_ocurn
              ,indic_suprm_ocurn
              ,:new.seqnc
              ,date_creat
              ,utils_creat
              ,date_modfc
              ,utils_modfc
              ,ordre_exect
              ,dnr_ref_prodt
              ,code
              ,indic_force_selct
              ,longr_bloc
              ,indic_nouvl_entit
              ,niv_inclu_migrt
              ,confg_inclu_migrt
              ,indic_expor_tabl_index
              ,indic_suprm_don_prodt
              , (select s.seqnc
                   from vd_i_afw_11_schem_prodt s
                  where     s.ref_versn = :new.seqnc
                        and s.code = (select s2.code
                                        from vd_i_afw_11_schem_prodt s2
                                       where s2.seqnc = e.ref_schem_prodt))
                 ref_schem_prodt
          from vd_i_afw_11_entit e
         where e.ref_versn = vnu_versn_afw;

      --Ajout attribut
      insert into vd_i_afw_11_atrib_entit (nom
                                          ,type_don
                                          ,compr_migrt
                                          ,ref_entit
                                          ,dnr_ref_prodt
                                          ,code
                                          ,ref_entit_refrn
                                          ,indic_nouvl_atrib)
        select ae.nom
              ,ae.type_don
              ,ae.compr_migrt
              ,e_new.seqnc ref_entit
              ,ae.dnr_ref_prodt
              ,ae.code
              , (select e_new2.seqnc
                   from vd_i_afw_11_entit e2
                       ,vd_i_afw_11_entit e_new2
                  where     e2.seqnc = ae.ref_entit_refrn
                        and e2.ref_versn = e.ref_versn
                        and e_new2.ref_versn = e_new.ref_versn
                        and e2.code = e_new2.code)
                 ref_entit_refrn
              ,ae.indic_nouvl_atrib
          from vd_i_afw_11_atrib_entit ae
              ,vd_i_afw_11_entit       e
              ,vd_i_afw_11_entit       e_new
         where     e.ref_versn = vnu_versn_afw
               and e.seqnc = ae.ref_entit
               and e_new.ref_versn = :new.seqnc
               and e.code = e_new.code;
    --update atrib_entit_supr
    end if;
  end if;
end afw_11_versn_ai_trg;
/
