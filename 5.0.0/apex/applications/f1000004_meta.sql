set define off
set serveroutput on
set feedback off


prompt ========================================
prompt Installation de l'application: SAFD - Domaine

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFD');
  afw$migrt$pkg.var_aplic(7) := afw_11_aplic_pkg.maj_aplic ('SAFD','Domaine',1000004, afw$migrt$pkg.vnu_seqnc_prodt);

  afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_aplic(7),'O');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFD');
end;
/


prompt ...Metadonnees des entites
prompt ......versn
--Debut - afw_11_versn
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_11_versn');
delete from tc$11$versn;

insert into tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 'O', null, 4, 4, 0, 0, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, null, 17);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_11_versn');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_11_versn');

merge into afw_11_versn t
                        using tc$11$versn tf
               on ((t.code = tf.code) and (t.ref_aplic = tf.ref_aplic or (t.ref_aplic is null and tf.ref_aplic is null) or tf.ref_aplic is null ) and (t.ref_plugn = tf.ref_plugn or (t.ref_plugn is null and tf.ref_plugn is null) or tf.ref_plugn is null ) and (t.ref_prodt = tf.ref_prodt or (t.ref_prodt is null and tf.ref_prodt is null) or tf.ref_prodt is null ))
when not matched then
              insert (t.code, t.dnr_ref_aplic, t.dnr_ref_prodt, t.indic_docmn_verl, t.nom, t.numr_versn_1, t.numr_versn_2, t.numr_versn_3, t.numr_versn_4, t.ref_aplic, t.ref_plugn, t.ref_prodt)
              values (tf.code, tf.dnr_ref_aplic, tf.dnr_ref_prodt, tf.indic_docmn_verl, tf.nom, tf.numr_versn_1, tf.numr_versn_2, tf.numr_versn_3, tf.numr_versn_4, tf.ref_aplic, tf.ref_plugn, tf.ref_prodt)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.dnr_ref_prodt = tf.dnr_ref_prodt, t.indic_docmn_verl = tf.indic_docmn_verl, t.nom = tf.nom, t.numr_versn_1 = tf.numr_versn_1, t.numr_versn_2 = tf.numr_versn_2, t.numr_versn_3 = tf.numr_versn_3, t.numr_versn_4 = tf.numr_versn_4
log errors into em$11_versn
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_versn;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Merge sur afw_11_versn');
  end if;
end;

delete afw_11_versn t
            where t.dnr_ref_aplic = afw$migrt$pkg.var_aplic(7)
              and not exists (select null
                                from tc$11$versn tf
                               where (t.code = tf.code) and (t.ref_aplic = tf.ref_aplic or (t.ref_aplic is null and tf.ref_aplic is null) or tf.ref_aplic is null ) and (t.ref_plugn = tf.ref_plugn or (t.ref_plugn is null and tf.ref_plugn is null) or tf.ref_plugn is null ) and (t.ref_prodt = tf.ref_prodt or (t.ref_prodt is null and tf.ref_prodt is null) or tf.ref_prodt is null ));

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_11_versn');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_11_versn');
select seqnc into afw$migrt$pkg.var_versn(17) from afw_11_versn where code = '0100' and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select') and ref_plugn is null and ref_prodt is null;
--Fin - afw_11_versn
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_11_versn');
end;
/

prompt ......page
--Debut - afw_13_page
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_page');
delete from tc$13$page;

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 173);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Tableau de board', 1, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 174);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 175);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'N', 'N', 'N', 'N', 'Commentaire', 102, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 176);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des utilisateurs', 12010, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 177);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Lier un utilisateur au domaine', 12011, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 178);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un utilisateur', 12020, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 179);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Historique des accès', 12021, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 180);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modifier le mot de passe', 12030, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 181);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des groupes utilisateur', 12121, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 182);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un groupe utilisateur', 12131, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 183);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des structures administratives', 12141, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 184);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour une structure administrative', 12151, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 185);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour les membres', 12181, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 186);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des domaines', 12200, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 187);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un domaine', 12210, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 188);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Opérations', 12220, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 189);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des types de structure', 12326, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 190);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un type de structure', 12336, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 191);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Créer et mettre à jour les autorisations', 13053, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 192);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modèle de recherche', 19020, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 193);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un modèle de recherche', 19030, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 194);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Application du modèle de recherche', 19040, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 195);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Détail de l''application du modèle de recherche', 19041, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 196);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des profils de courriels', 20000, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 197);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un profil de courriel', 20010, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 198);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'File d''attente', 20020, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 199);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un courriel', 20030, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 200);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des classes d''intervention', 21000, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 201);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour une classe d''intervention', 21010, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 202);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Applications', 30010, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 203);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Pages', 30020, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 204);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Items de pages', 30030, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 205);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Messages', 30040, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 206);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Pages Popup IR LOV', 30050, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 207);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des modèles de notification', 34000, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 208);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un modèle de notification', 34100, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 209);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des événements notifiables', 34200, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 210);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un destinataire', 34210, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 211);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des destinataires', 34211, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 212);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des modèles de message de notification', 34300, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 213);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:49', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour modèle de message de notification', 34310, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 214);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des modèles de communication', 34400, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 215);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un modèle de communication', 34500, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 216);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des comptes de notification sms', 34600, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 217);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un compte de notification sms', 34610, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 218);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des comptes de télécopie', 34700, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 219);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un compte de télécopie', 34710, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 220);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des événements notifiables', 34800, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 221);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un événement notifiable', 34810, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 222);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour une configuration', 34820, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 223);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Créer un élément de configuration d''événement notifiable', 34830, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 224);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Créer un destinataire de configuration d''événement notifiable', 34840, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 225);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des requêtes d''intervention', 34900, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 226);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des formats de réponse', 35010, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 227);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Format de réponse', 35011, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 228);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des courriels', 35020, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 229);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des produits', 35031, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 230);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des fonctionnalités', 35041, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 231);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modifier une fonctionnalité', 35042, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 232);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des pages d''une application', 35051, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 482);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des applications d''un produit', 35050, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 483);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour la liste navigation', 35052, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 484);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2015-09-13 16:32:50', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Vue globale de la sécurité', 12161, null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 1398);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page');

merge into afw_13_page t
                        using tc$13$page tf
               on ((t.numr_apex = tf.numr_apex) and (t.ref_aplic = tf.ref_aplic or (t.ref_aplic is null and tf.ref_aplic is null) or tf.ref_aplic is null ))
when not matched then
              insert (t.date_dernr_maj_refrn_apex, t.descr, t.dnr_ref_aplic, t.indic_prise_charg_afw01, t.indic_prise_charg_afw04, t.indic_prise_charg_afw13_confr, t.indic_prise_charg_afw13_navgt, t.indic_prise_charg_afw14_popup, t.indic_prise_charg_afw18, t.indic_prise_charg_afw19, t.nom, t.numr_apex, t.prefx_mesg, t.ref_aplic)
              values (tf.date_dernr_maj_refrn_apex, tf.descr, tf.dnr_ref_aplic, tf.indic_prise_charg_afw01, tf.indic_prise_charg_afw04, tf.indic_prise_charg_afw13_confr, tf.indic_prise_charg_afw13_navgt, tf.indic_prise_charg_afw14_popup, tf.indic_prise_charg_afw18, tf.indic_prise_charg_afw19, tf.nom, tf.numr_apex, tf.prefx_mesg, tf.ref_aplic)
when matched then
              update set t.date_dernr_maj_refrn_apex = tf.date_dernr_maj_refrn_apex, t.descr = tf.descr, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_prise_charg_afw01 = tf.indic_prise_charg_afw01, t.indic_prise_charg_afw04 = tf.indic_prise_charg_afw04, t.indic_prise_charg_afw13_confr = tf.indic_prise_charg_afw13_confr, t.indic_prise_charg_afw13_navgt = tf.indic_prise_charg_afw13_navgt, t.indic_prise_charg_afw14_popup = tf.indic_prise_charg_afw14_popup, t.indic_prise_charg_afw18 = tf.indic_prise_charg_afw18, t.indic_prise_charg_afw19 = tf.indic_prise_charg_afw19, t.nom = tf.nom, t.prefx_mesg = tf.prefx_mesg
log errors into em$13_page
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Merge sur afw_13_page');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page');
select seqnc into afw$migrt$pkg.var_page(173) from afw_13_page where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(174) from afw_13_page where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(175) from afw_13_page where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(176) from afw_13_page where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(177) from afw_13_page where numr_apex = 12010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(178) from afw_13_page where numr_apex = 12011 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(179) from afw_13_page where numr_apex = 12020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(180) from afw_13_page where numr_apex = 12021 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(181) from afw_13_page where numr_apex = 12030 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(182) from afw_13_page where numr_apex = 12121 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(183) from afw_13_page where numr_apex = 12131 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(184) from afw_13_page where numr_apex = 12141 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(185) from afw_13_page where numr_apex = 12151 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(186) from afw_13_page where numr_apex = 12181 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(187) from afw_13_page where numr_apex = 12200 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(188) from afw_13_page where numr_apex = 12210 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(189) from afw_13_page where numr_apex = 12220 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(190) from afw_13_page where numr_apex = 12326 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(191) from afw_13_page where numr_apex = 12336 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(192) from afw_13_page where numr_apex = 13053 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(193) from afw_13_page where numr_apex = 19020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(194) from afw_13_page where numr_apex = 19030 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(195) from afw_13_page where numr_apex = 19040 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(196) from afw_13_page where numr_apex = 19041 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(197) from afw_13_page where numr_apex = 20000 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(198) from afw_13_page where numr_apex = 20010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(199) from afw_13_page where numr_apex = 20020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(200) from afw_13_page where numr_apex = 20030 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(201) from afw_13_page where numr_apex = 21000 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(202) from afw_13_page where numr_apex = 21010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(203) from afw_13_page where numr_apex = 30010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(204) from afw_13_page where numr_apex = 30020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(205) from afw_13_page where numr_apex = 30030 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(206) from afw_13_page where numr_apex = 30040 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(207) from afw_13_page where numr_apex = 30050 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(208) from afw_13_page where numr_apex = 34000 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(209) from afw_13_page where numr_apex = 34100 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(210) from afw_13_page where numr_apex = 34200 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(211) from afw_13_page where numr_apex = 34210 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(212) from afw_13_page where numr_apex = 34211 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(213) from afw_13_page where numr_apex = 34300 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(214) from afw_13_page where numr_apex = 34310 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(215) from afw_13_page where numr_apex = 34400 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(216) from afw_13_page where numr_apex = 34500 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(217) from afw_13_page where numr_apex = 34600 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(218) from afw_13_page where numr_apex = 34610 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(219) from afw_13_page where numr_apex = 34700 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(220) from afw_13_page where numr_apex = 34710 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(221) from afw_13_page where numr_apex = 34800 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(222) from afw_13_page where numr_apex = 34810 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(223) from afw_13_page where numr_apex = 34820 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(224) from afw_13_page where numr_apex = 34830 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(225) from afw_13_page where numr_apex = 34840 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(226) from afw_13_page where numr_apex = 34900 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(227) from afw_13_page where numr_apex = 35010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(228) from afw_13_page where numr_apex = 35011 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(229) from afw_13_page where numr_apex = 35020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(230) from afw_13_page where numr_apex = 35031 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(231) from afw_13_page where numr_apex = 35041 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(232) from afw_13_page where numr_apex = 35042 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(482) from afw_13_page where numr_apex = 35051 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(483) from afw_13_page where numr_apex = 35050 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(484) from afw_13_page where numr_apex = 35052 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
select seqnc into afw$migrt$pkg.var_page(1398) from afw_13_page where numr_apex = 12161 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
--Fin - afw_13_page
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_page');
end;
/

prompt ......page_lang
--Debut - afw_13_page_lang
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_page_lang');
delete from tc$13$page$lang;

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Structures administratives', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(184, 'Insert'), 174);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Événements notifiables', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(221, 'Insert'), 175);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Modèles de notifiation', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(208, 'Insert'), 176);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Type de structure', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(191, 'Insert'), 177);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste des fonctionnalités', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(231, 'Insert'), 178);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Historique des accès', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(180, 'Insert'), 179);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Compte de télécopie', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(220, 'Insert'), 180);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Page de connexion', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(175, 'Insert'), 181);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Format de réponse', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(228, 'Insert'), 182);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Feedback', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(176, 'Insert'), 183);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Domaine', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(188, 'Insert'), 184);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Événement notifiable', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(222, 'Insert'), 185);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Compte de notification SMS', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(218, 'Insert'), 186);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Domaines', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(187, 'Insert'), 187);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Créer un élément', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(224, 'Insert'), 188);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste des produits', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(230, 'Insert'), 189);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste de valeurs interactive - Pages', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(204, 'Insert'), 190);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste de valeurs interactive - Applications', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(203, 'Insert'), 191);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_lang');
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Structure administrative', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(185, 'Insert'), 192);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Requêtes d''intervention', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(226, 'Insert'), 193);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Modèles de communication', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(215, 'Insert'), 194);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Gérer le mot de passe', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(181, 'Insert'), 195);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste de valeurs interactive - Messages', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(206, 'Insert'), 196);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Courriels', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(229, 'Insert'), 197);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Opération domaine', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(189, 'Insert'), 198);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Classes d''intervention', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(201, 'Insert'), 199);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Comptes de notification sms', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(217, 'Insert'), 200);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Utilisateurs', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(177, 'Insert'), 201);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Profil de courriel', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(198, 'Insert'), 202);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Modèle de communication', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(216, 'Insert'), 203);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Modèles de message de notification', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(213, 'Insert'), 204);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Configuration', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(223, 'Insert'), 205);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Détail de l''application du modèle de recherche', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(196, 'Insert'), 206);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Événements notifiables', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(210, 'Insert'), 207);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Profils de courriels', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(197, 'Insert'), 208);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste de valeurs interactive - Items de pages', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(205, 'Insert'), 209);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Destinataires', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(212, 'Insert'), 210);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Courriel', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(200, 'Insert'), 211);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Groupe utilisateur', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(183, 'Insert'), 212);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Destinataire', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(211, 'Insert'), 213);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Comptes de télécopie', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(219, 'Insert'), 214);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Application du modèle de recherche', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(195, 'Insert'), 215);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Accueil Domaine', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(174, 'Insert'), 216);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Groupes utilisateur', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(182, 'Insert'), 217);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Modèle de recherche', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(194, 'Insert'), 218);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Modèle de recherche', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(193, 'Insert'), 219);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Utilisateur', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(179, 'Insert'), 220);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Types de structure', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(190, 'Insert'), 221);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Modifier une fonctionnalité', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(232, 'Insert'), 222);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Modèle de notification', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(209, 'Insert'), 223);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Lier un utilisateur au domaine', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(178, 'Insert'), 224);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Modèle de message de notification', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(214, 'Insert'), 225);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Page commune', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(173, 'Insert'), 226);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste de valeurs interactive - Pages Popup IR LOV', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(207, 'Insert'), 227);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Classe d''intervention', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(202, 'Insert'), 228);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Mettre à jour les membres', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(186, 'Insert'), 229);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Formats de réponse', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(227, 'Insert'), 230);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Créer un destinataire', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(225, 'Insert'), 231);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Créer et mettre à jour les autorisations', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(192, 'Insert'), 232);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'File d''attente', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(199, 'Insert'), 233);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste des pages d''une application', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(482, 'Insert'), 482);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste des applications d''un produit', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(483, 'Insert'), 483);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Liste navigation', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(484, 'Insert'), 484);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'Vue globale de la sécurité', afw$migrt$pkg.obten_var_lang(1, 'Insert'), afw$migrt$pkg.obten_var_page(1398, 'Insert'), 1400);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page_lang');

merge into afw_13_page_lang t
                        using tc$13$page$lang tf
               on ((t.ref_lang = tf.ref_lang or (t.ref_lang is null and tf.ref_lang is null) or tf.ref_lang is null ) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.dnr_ref_aplic, t.nom, t.ref_lang, t.ref_page)
              values (tf.dnr_ref_aplic, tf.nom, tf.ref_lang, tf.ref_page)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.nom = tf.nom
log errors into em$13_page_lang
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_lang;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Merge sur afw_13_page_lang');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page_lang');
select seqnc into afw$migrt$pkg.var_page_lang(174) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(184, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(175) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(221, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(176) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(208, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(177) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(178) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(231, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(179) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(180, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(180) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(181) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(182) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(183) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(184) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(185) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(186) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(218, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(187) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(187, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(188) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(189) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(230, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(190) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(204, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(191) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(203, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_lang');
select seqnc into afw$migrt$pkg.var_page_lang(192) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(193) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(226, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(194) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(215, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(195) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(196) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(206, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(197) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(229, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(198) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(199) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(201, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(200) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(217, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(201) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(202) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(203) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(204) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(213, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(205) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(206) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(207) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(210, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(208) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(197, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(209) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(205, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(210) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(212, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(211) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(212) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(213) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(214) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(219, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(215) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(216) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(174, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(217) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(218) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(219) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(193, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(220) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(221) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(190, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(222) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(223) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(224) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(225) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(226) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(227) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(207, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(228) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(229) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(230) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(227, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(231) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(232) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(192, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(233) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(199, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(482) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(483) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(483, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(484) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(484, 'Select');
select seqnc into afw$migrt$pkg.var_page_lang(1400) from afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_page(1398, 'Select');
--Fin - afw_13_page_lang
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_page_lang');
end;
/

prompt ......page_ir
--Debut - afw_13_page_ir
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_page_ir');
delete from tc$13$page$ir;

insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des évènements notifiables', 1, afw$migrt$pkg.obten_var_page(210, 'Insert'), 83, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des utilisateurs', 1, afw$migrt$pkg.obten_var_page(177, 'Insert'), 84, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des comptes de télécopies', 1, afw$migrt$pkg.obten_var_page(219, 'Insert'), 85, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des types de structure', 1, afw$migrt$pkg.obten_var_page(190, 'Insert'), 86, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des domaines', 1, afw$migrt$pkg.obten_var_page(187, 'Insert'), 87, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des messages', 1, afw$migrt$pkg.obten_var_page(206, 'Insert'), 88, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Historique des accès', 1, afw$migrt$pkg.obten_var_page(180, 'Insert'), 89, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Pages Popup IR LOV', 1, afw$migrt$pkg.obten_var_page(207, 'Insert'), 90, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Autorisations', 1, afw$migrt$pkg.obten_var_page(192, 'Insert'), 91, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des structures administratives', 1, afw$migrt$pkg.obten_var_page(184, 'Insert'), 92, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des groupes utilisateur', 1, afw$migrt$pkg.obten_var_page(182, 'Insert'), 93, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Pages', 1, afw$migrt$pkg.obten_var_page(204, 'Insert'), 94, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des modèles de notification', 1, afw$migrt$pkg.obten_var_page(208, 'Insert'), 95, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des profils de courriels', 1, afw$migrt$pkg.obten_var_page(197, 'Insert'), 96, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des destinataires', 1, afw$migrt$pkg.obten_var_page(212, 'Insert'), 97, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des autorisations', 1, afw$migrt$pkg.obten_var_page(183, 'Insert'), 98, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des évènements notifiables', 1, afw$migrt$pkg.obten_var_page(221, 'Insert'), 99, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des modèles de message de notification', 1, afw$migrt$pkg.obten_var_page(213, 'Insert'), 100, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Applications', 1, afw$migrt$pkg.obten_var_page(203, 'Insert'), 101, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Items de pages', 1, afw$migrt$pkg.obten_var_page(205, 'Insert'), 102, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des classes d''intervention', 1, afw$migrt$pkg.obten_var_page(201, 'Insert'), 103, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des modèles de communication', 1, afw$migrt$pkg.obten_var_page(215, 'Insert'), 104, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des courriels', 1, afw$migrt$pkg.obten_var_page(199, 'Insert'), 105, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des formats de réponse', 1, afw$migrt$pkg.obten_var_page(227, 'Insert'), 106, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des courriels', 1, afw$migrt$pkg.obten_var_page(229, 'Insert'), 107, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des requêtes d''intervention', 1, afw$migrt$pkg.obten_var_page(226, 'Insert'), 108, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des produits', 1, afw$migrt$pkg.obten_var_page(230, 'Insert'), 109, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste des fonctionnalités', 1, afw$migrt$pkg.obten_var_page(231, 'Insert'), 110, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Liste de modèle de recherche', 1, afw$migrt$pkg.obten_var_page(193, 'Insert'), 111, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Pages', 1, afw$migrt$pkg.obten_var_page(482, 'Insert'), 181, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Applications', 1, afw$migrt$pkg.obten_var_page(483, 'Insert'), 182, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', null, 'Vue globale de la sécurité', 1, afw$migrt$pkg.obten_var_page(1398, 'Insert'), 785, null);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page_ir');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page_ir');

merge into afw_13_page_ir t
                        using tc$13$page$ir tf
               on ((t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.dnr_ref_aplic, t.indic_forcr_ajust_page, t.largr_deft, t.libl_regn, t.nombr_page_largr, t.ref_page, t.unite_mesr_largr_deft)
              values (tf.dnr_ref_aplic, tf.indic_forcr_ajust_page, tf.largr_deft, tf.libl_regn, tf.nombr_page_largr, tf.ref_page, tf.unite_mesr_largr_deft)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_forcr_ajust_page = tf.indic_forcr_ajust_page, t.largr_deft = tf.largr_deft, t.libl_regn = tf.libl_regn, t.nombr_page_largr = tf.nombr_page_largr, t.unite_mesr_largr_deft = tf.unite_mesr_largr_deft
log errors into em$13_page_ir
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Merge sur afw_13_page_ir');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page_ir');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page_ir');
select seqnc into afw$migrt$pkg.var_page_ir(83) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(210, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(84) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(85) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(219, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(86) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(190, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(87) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(187, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(88) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(206, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(89) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(180, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(90) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(207, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(91) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(192, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(92) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(184, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(93) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(94) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(204, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(95) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(208, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(96) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(197, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(97) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(212, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(98) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(99) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(221, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(100) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(213, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(101) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(203, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(102) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(205, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(103) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(201, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(104) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(215, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(105) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(199, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(106) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(227, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(107) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(229, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(108) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(226, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(109) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(230, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(110) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(231, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(111) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(193, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(181) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(182) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(483, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir(785) from afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_page(1398, 'Select');
--Fin - afw_13_page_ir
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_page_ir');
end;
/

prompt ......page_ir_coln
--Debut - afw_13_page_ir_coln
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_page_ir_coln');
delete from tc$13$page$ir$coln;

insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('TYPE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 455669332186180902, 'O', null, 'Type', 1, afw$migrt$pkg.obten_var_page_ir(107, 'Insert'), 467, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('STAT_SOUMS', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 455669437117180907, 'O', null, 'Statut', 2, afw$migrt$pkg.obten_var_page_ir(107, 'Insert'), 468, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOMBR_TENTV', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 455669548641180908, 'O', null, 'Nombre tentatives', 3, afw$migrt$pkg.obten_var_page_ir(107, 'Insert'), 469, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SUJET', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 455669636790180908, 'O', null, 'Sujet', 4, afw$migrt$pkg.obten_var_page_ir(107, 'Insert'), 470, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_ENVOY', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 455669738069180908, 'O', null, 'Courriel envoi', 5, afw$migrt$pkg.obten_var_page_ir(107, 'Insert'), 471, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SERVR', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 455669843362180908, 'O', null, 'Serveur', 6, afw$migrt$pkg.obten_var_page_ir(107, 'Insert'), 472, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PORT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 455669957748180913, 'O', null, 'Port', 7, afw$migrt$pkg.obten_var_page_ir(107, 'Insert'), 473, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DOMN', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 455670061452180913, 'O', null, 'Domaine', 8, afw$migrt$pkg.obten_var_page_ir(107, 'Insert'), 474, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_CREAT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 455670140053180913, 'O', null, 'Date création', 9, afw$migrt$pkg.obten_var_page_ir(107, 'Insert'), 475, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 423390349766417408, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(111, 'Insert'), 476, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 423390452357417408, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(111, 'Insert'), 477, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 429166431938838417, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(108, 'Insert'), 478, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_REQT_INTER_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 429166639230838418, 'O', null, 'Type', 3, afw$migrt$pkg.obten_var_page_ir(108, 'Insert'), 479, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DEBUT_EFECT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 429166746728838418, 'O', null, 'Début effectivité', 4, afw$migrt$pkg.obten_var_page_ir(108, 'Insert'), 480, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_FIN_EFECT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 429166835320838418, 'O', null, 'Fin effectivité', 5, afw$migrt$pkg.obten_var_page_ir(108, 'Insert'), 481, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_TRAIT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 429166957030838418, 'O', null, 'Traitement', 6, afw$migrt$pkg.obten_var_page_ir(108, 'Insert'), 482, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422619260649875947, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(100, 'Insert'), 483, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422619361517875951, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(100, 'Insert'), 484, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422619453905875951, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(100, 'Insert'), 485, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422619560189875951, 'O', null, 'Description', 4, afw$migrt$pkg.obten_var_page_ir(100, 'Insert'), 486, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422661036113019192, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(83, 'Insert'), 487, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422661148953019193, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(83, 'Insert'), 488, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STRUC_APLIC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422661232358019193, 'O', null, 'Structure applicative', 4, afw$migrt$pkg.obten_var_page_ir(83, 'Insert'), 489, null);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_ir_coln');
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 428622746337006524, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(105, 'Insert'), 490, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('ADRES_ENVOY', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 428622857139006525, 'O', null, 'Adresse d''envoi', 2, afw$migrt$pkg.obten_var_page_ir(105, 'Insert'), 491, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SUJET', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 428622931825006526, 'O', null, 'Sujet', 3, afw$migrt$pkg.obten_var_page_ir(105, 'Insert'), 492, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('STAT_SOUMS_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 428627643573069070, 'O', null, 'Statut', 4, afw$migrt$pkg.obten_var_page_ir(105, 'Insert'), 493, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422660938446019191, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(83, 'Insert'), 494, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 425375148648051625, 'O', null, 'Produit', 5, afw$migrt$pkg.obten_var_page_ir(99, 'Insert'), 495, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_ACTIF_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 427655353361456550, 'O', null, 'Actif', 15, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 496, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 48447773766609313, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 497, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 48447878342609314, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 498, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PRENM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 48453477515683509, 'O', null, 'Prénom', 4, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 499, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE_UTILS', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 48453687164683511, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 500, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_EXPIR', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 48453881726683511, 'O', null, 'Date expiration', 7, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 501, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_CREAT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 48454194504683511, 'O', null, 'Date Creat', 10, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 502, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('UTILS_CREAT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 48454279506683513, 'O', null, 'Utils Creat', 11, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 503, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_VERL_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 48455692369735175, 'O', null, 'Verrouillé', 12, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 504, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_CHANG_MOT_PASSE_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 48455795071735175, 'O', null, 'Changer mot de passe', 13, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 505, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('MOT_PASSE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 51956672231668377, 'O', null, 'Mot de passe', 14, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 506, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24866077326957832, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(85, 'Insert'), 507, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24866148827957833, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(85, 'Insert'), 508, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24866264268957833, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(85, 'Insert'), 509, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24866450551957834, 'O', null, 'Numéro expéditeur', 5, afw$migrt$pkg.obten_var_page_ir(85, 'Insert'), 510, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PROFL_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24866570124957834, 'O', null, 'Profil de courriel expéditeur', 6, afw$migrt$pkg.obten_var_page_ir(85, 'Insert'), 511, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74894273964119124, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(101, 'Insert'), 512, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74894370660119129, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(101, 'Insert'), 513, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74894448832119129, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(101, 'Insert'), 514, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC_APEX', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74895152113119129, 'O', null, 'Numéro', 10, afw$migrt$pkg.obten_var_page_ir(101, 'Insert'), 515, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 51105185115837049, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(86, 'Insert'), 516, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 51105375602837050, 'O', null, 'Nom', 4, afw$migrt$pkg.obten_var_page_ir(86, 'Insert'), 517, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 51105474623837050, 'O', null, 'Description', 5, afw$migrt$pkg.obten_var_page_ir(86, 'Insert'), 518, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 51105574433837050, 'O', null, 'Code', 3, afw$migrt$pkg.obten_var_page_ir(86, 'Insert'), 519, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 21850153474469724, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(87, 'Insert'), 520, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 21850352866469727, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(87, 'Insert'), 521, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75080668343605113, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(88, 'Insert'), 522, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75080763984605113, 'O', null, 'Nom', 2, afw$migrt$pkg.obten_var_page_ir(88, 'Insert'), 523, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('MESG', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75084263909754723, 'O', null, 'Message', 4, afw$migrt$pkg.obten_var_page_ir(88, 'Insert'), 524, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('TYPE_MESG', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75084454829754723, 'O', null, 'Type', 5, afw$migrt$pkg.obten_var_page_ir(88, 'Insert'), 525, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75109047924197256, 'O', null, 'Ref Prodt', 7, afw$migrt$pkg.obten_var_page_ir(88, 'Insert'), 526, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75078551023592543, 'O', null, 'Numéro application', 1, afw$migrt$pkg.obten_var_page_ir(102, 'Insert'), 527, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PAGE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75078878489592545, 'O', null, 'Page', 4, afw$migrt$pkg.obten_var_page_ir(102, 'Insert'), 528, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75078949516592545, 'O', null, 'Seqnc', 5, afw$migrt$pkg.obten_var_page_ir(102, 'Insert'), 529, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75079049418592545, 'O', null, 'Nom', 6, afw$migrt$pkg.obten_var_page_ir(102, 'Insert'), 530, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_EVENM_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 56682859243634467, 'O', null, 'Événement', 2, afw$migrt$pkg.obten_var_page_ir(89, 'Insert'), 531, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('APLIC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 77669448547770074, 'O', null, 'Application', 2, afw$migrt$pkg.obten_var_page_ir(90, 'Insert'), 532, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 77669552705770074, 'O', null, 'Numéro page', 3, afw$migrt$pkg.obten_var_page_ir(90, 'Insert'), 533, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PAGE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 77669675779770074, 'O', null, 'Page', 4, afw$migrt$pkg.obten_var_page_ir(90, 'Insert'), 534, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 77669954654770074, 'O', null, 'Ref Prodt', 7, afw$migrt$pkg.obten_var_page_ir(90, 'Insert'), 535, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 69901380808677452, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(91, 'Insert'), 536, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 16523665072966779, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(103, 'Insert'), 537, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 16523754933966779, 'O', null, 'Nom', 2, afw$migrt$pkg.obten_var_page_ir(103, 'Insert'), 538, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PROFL_COURL_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 16523969043966781, 'O', null, 'Profil de courriel', 4, afw$migrt$pkg.obten_var_page_ir(103, 'Insert'), 539, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 50373793722705478, 'O', null, 'Éditer', 1, afw$migrt$pkg.obten_var_page_ir(92, 'Insert'), 540, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 50373897671705481, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(92, 'Insert'), 541, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_TYPE_STRUC_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 51100893817732697, 'O', null, 'Type', 6, afw$migrt$pkg.obten_var_page_ir(92, 'Insert'), 542, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 50345091104084819, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(93, 'Insert'), 543, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 50788989936657909, 'O', null, 'Code', 5, afw$migrt$pkg.obten_var_page_ir(93, 'Insert'), 544, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('APLIC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74906255000190949, 'O', null, 'Application', 2, afw$migrt$pkg.obten_var_page_ir(94, 'Insert'), 545, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74906370227190949, 'O', null, 'Numéro page', 3, afw$migrt$pkg.obten_var_page_ir(94, 'Insert'), 546, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PAGE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74906458254190949, 'O', null, 'Page', 4, afw$migrt$pkg.obten_var_page_ir(94, 'Insert'), 547, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74929370833330904, 'O', null, 'Seqnc', 5, afw$migrt$pkg.obten_var_page_ir(94, 'Insert'), 548, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74929448203330909, 'O', null, 'Nom', 6, afw$migrt$pkg.obten_var_page_ir(94, 'Insert'), 549, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75115468889316874, 'O', null, 'Ref Prodt', 7, afw$migrt$pkg.obten_var_page_ir(94, 'Insert'), 550, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24376158919321289, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(95, 'Insert'), 551, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24376278598321294, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(95, 'Insert'), 552, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24376358125321294, 'O', null, 'Description', 4, afw$migrt$pkg.obten_var_page_ir(95, 'Insert'), 553, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24690561511722350, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(95, 'Insert'), 554, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24722470545234075, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(104, 'Insert'), 555, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24722553235234078, 'O', null, 'Code', 3, afw$migrt$pkg.obten_var_page_ir(104, 'Insert'), 556, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24722663281234078, 'O', null, 'Nom', 4, afw$migrt$pkg.obten_var_page_ir(104, 'Insert'), 557, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24722777076234078, 'O', null, 'Description', 5, afw$migrt$pkg.obten_var_page_ir(104, 'Insert'), 558, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_TYPE_COMNC_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24722868919234078, 'O', null, 'Type', 2, afw$migrt$pkg.obten_var_page_ir(104, 'Insert'), 559, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 16512578059960087, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(96, 'Insert'), 560, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_ENVOY', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 16513048023960088, 'O', null, 'Nom expéditeur', 6, afw$migrt$pkg.obten_var_page_ir(96, 'Insert'), 561, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('ADRES_ENVOY', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 16513148425960088, 'O', null, 'Adresse expéditeur', 7, afw$migrt$pkg.obten_var_page_ir(96, 'Insert'), 562, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24841879758553763, 'O', null, 'Code', 11, afw$migrt$pkg.obten_var_page_ir(96, 'Insert'), 563, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 24841976160553765, 'O', null, 'Nom', 12, afw$migrt$pkg.obten_var_page_ir(96, 'Insert'), 564, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 25066872216665346, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(97, 'Insert'), 565, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 25066960377665349, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(97, 'Insert'), 566, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 25067062335665350, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(97, 'Insert'), 567, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 96900141429204955, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(98, 'Insert'), 568, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 96900248109204958, 'O', null, 'ref grp', 2, afw$migrt$pkg.obten_var_page_ir(98, 'Insert'), 569, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 299187138374240457, 'O', null, 'Utilisateur', 7, afw$migrt$pkg.obten_var_page_ir(98, 'Insert'), 570, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DEBUT_EFECT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 96900452641204958, 'O', null, 'Début effectivité', 4, afw$migrt$pkg.obten_var_page_ir(98, 'Insert'), 571, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_FIN_EFECT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 96900544095204959, 'O', null, 'Fin effectivité', 5, afw$migrt$pkg.obten_var_page_ir(98, 'Insert'), 572, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP_UTILS_LIE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 96900639199204959, 'O', null, 'Groupe', 6, afw$migrt$pkg.obten_var_page_ir(98, 'Insert'), 573, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DEBUT_EFECT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 111199557322316813, 'O', null, 'Début effectivité', 4, afw$migrt$pkg.obten_var_page_ir(91, 'Insert'), 574, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_FIN_EFECT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 111199644453316814, 'O', null, 'Fin effectivité', 5, afw$migrt$pkg.obten_var_page_ir(91, 'Insert'), 575, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 111256946174363265, 'O', null, 'Groupe', 6, afw$migrt$pkg.obten_var_page_ir(91, 'Insert'), 576, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 111257032241363265, 'O', null, 'Utilisateur', 7, afw$migrt$pkg.obten_var_page_ir(91, 'Insert'), 577, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP_UTILS_LIE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 111257146319363265, 'O', null, 'Groupe lié', 8, afw$migrt$pkg.obten_var_page_ir(91, 'Insert'), 578, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422663761288028812, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(99, 'Insert'), 579, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422663844155028812, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(99, 'Insert'), 580, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422663963297028812, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(99, 'Insert'), 581, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STRUC_APLIC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 422664063740028812, 'O', null, 'Structure applicative', 4, afw$migrt$pkg.obten_var_page_ir(99, 'Insert'), 582, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 423390254774417407, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(111, 'Insert'), 583, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75084379381754723, 'O', null, 'Application', 6, afw$migrt$pkg.obten_var_page_ir(88, 'Insert'), 584, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75078748024592545, 'O', null, 'Numéro page', 3, afw$migrt$pkg.obten_var_page_ir(102, 'Insert'), 585, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 77669358761770073, 'O', null, 'Numéro application', 1, afw$migrt$pkg.obten_var_page_ir(90, 'Insert'), 586, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 77669857017770074, 'O', null, 'Nom', 6, afw$migrt$pkg.obten_var_page_ir(90, 'Insert'), 587, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 429166562498838418, 'O', null, 'Utilisateur', 2, afw$migrt$pkg.obten_var_page_ir(108, 'Insert'), 588, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('ADRES_IP', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 440541035623938512, 'O', null, 'Adresse IP', 3, afw$migrt$pkg.obten_var_page_ir(89, 'Insert'), 589, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 21850256375469727, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(87, 'Insert'), 590, null);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_ir_coln');
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_MESG', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75084175977754715, 'O', null, 'Numéro', 3, afw$migrt$pkg.obten_var_page_ir(88, 'Insert'), 591, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('APLIC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 75078665009592545, 'O', null, 'Application', 2, afw$migrt$pkg.obten_var_page_ir(102, 'Insert'), 592, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_EVENM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 7788118345930338, 'O', null, 'Date', 4, afw$migrt$pkg.obten_var_page_ir(89, 'Insert'), 593, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 77669766701770074, 'O', null, 'Seqnc', 5, afw$migrt$pkg.obten_var_page_ir(90, 'Insert'), 594, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 16523851459966779, 'O', null, 'Application', 3, afw$migrt$pkg.obten_var_page_ir(103, 'Insert'), 595, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 50345186526084819, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(93, 'Insert'), 596, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 74906177872190943, 'O', null, 'Numéro application', 1, afw$migrt$pkg.obten_var_page_ir(94, 'Insert'), 597, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_DON_SAIS_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 453361431630866444, 'O', null, 'Type donnée', 4, afw$migrt$pkg.obten_var_page_ir(106, 'Insert'), 598, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_CHAMP_REPNS_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 453361547116866449, 'O', null, 'Type champ', 5, afw$migrt$pkg.obten_var_page_ir(106, 'Insert'), 599, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_REPNS_OBLIG_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 453364657612949606, 'O', null, 'Réponse obligatoire', 7, afw$migrt$pkg.obten_var_page_ir(106, 'Insert'), 600, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_AUTRE_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 453365662937960584, 'O', null, 'Autre réponse', 8, afw$migrt$pkg.obten_var_page_ir(106, 'Insert'), 601, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 453142038452813574, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(106, 'Insert'), 602, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 453142236643813578, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(106, 'Insert'), 603, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_ACTIF_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 558110336908919552, 'O', null, 'Actif', 3, afw$migrt$pkg.obten_var_page_ir(110, 'Insert'), 604, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 558046861100745733, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(109, 'Insert'), 605, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 558046958606745734, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(109, 'Insert'), 606, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 558046749064745725, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(109, 'Insert'), 607, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('GRP', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 558622239760511730, 'O', null, 'Grp', 6, afw$migrt$pkg.obten_var_page_ir(93, 'Insert'), 608, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 558064449532019060, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(110, 'Insert'), 609, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_FONCT_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 558064561190019062, 'O', null, 'Fonctionnalité', 2, afw$migrt$pkg.obten_var_page_ir(110, 'Insert'), 610, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE_CIBLE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82163728233118457, 'O', null, 'Numr Page Cible', 4, afw$migrt$pkg.obten_var_page_ir(109, 'Insert'), 741, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82167016878133654, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(181, 'Insert'), 742, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APEX', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82167113121133654, 'O', null, 'Numéro', 2, afw$migrt$pkg.obten_var_page_ir(181, 'Insert'), 743, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82167215617133654, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_page_ir(181, 'Insert'), 744, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82167328801133654, 'O', null, 'Description', 4, afw$migrt$pkg.obten_var_page_ir(181, 'Insert'), 745, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('LIEN', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82167429944133654, 'O', null, 'Lien', 9, afw$migrt$pkg.obten_var_page_ir(181, 'Insert'), 746, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STRUC_APLIC_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82167530865133654, 'O', null, 'Structure applicative', 10, afw$migrt$pkg.obten_var_page_ir(181, 'Insert'), 747, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_MESG_SUPRS_SPECF', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82167627297133655, 'O', null, 'Message suppression défaut', 11, afw$migrt$pkg.obten_var_page_ir(181, 'Insert'), 748, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_APLIC_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82167707596133655, 'O', null, 'Ref Aplic Formt', 12, afw$migrt$pkg.obten_var_page_ir(181, 'Insert'), 749, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('LISTE_FONCT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82167829764133655, 'O', null, 'Fonctionnalités', 13, afw$migrt$pkg.obten_var_page_ir(181, 'Insert'), 750, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82159522120091642, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_page_ir(182, 'Insert'), 751, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82159624088091658, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_page_ir(182, 'Insert'), 752, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_NUMR_VERSN_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82159709313091659, 'O', null, 'Version', 5, afw$migrt$pkg.obten_var_page_ir(182, 'Insert'), 753, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DERNR_MAJ_REFRN_APEX', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82159814422091660, 'O', null, 'Dernière MAJ Référentiel', 6, afw$migrt$pkg.obten_var_page_ir(182, 'Insert'), 754, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC_APEX', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82159901380091660, 'O', null, 'Numéro', 7, afw$migrt$pkg.obten_var_page_ir(182, 'Insert'), 755, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 82160009416091660, 'O', null, 'Nom', 8, afw$migrt$pkg.obten_var_page_ir(182, 'Insert'), 756, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_GROUP_ACCES', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 12903118561943128, 'O', null, 'Groupe utilisateur', 1, afw$migrt$pkg.obten_var_page_ir(785, 'Insert'), 3039, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC_GROUP_ACCES', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 12903201396943233, 'O', null, 'Seqnc Group Acces', 2, afw$migrt$pkg.obten_var_page_ir(785, 'Insert'), 3040, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_PROFL_ACCES', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 12903307177943234, 'O', null, 'Profil d''Accès', 3, afw$migrt$pkg.obten_var_page_ir(785, 'Insert'), 3041, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC_PROFL_ACCES', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 12903404824943234, 'O', null, 'Seqnc Profl Acces', 4, afw$migrt$pkg.obten_var_page_ir(785, 'Insert'), 3042, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_APART_SUPER_UTILS', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 12724702573812837, 'O', null, 'Super utilisateur', 16, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 3029, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_APART_AUTOR_CONXN_DERV', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 12724827754812839, 'O', null, 'Connexion dérivée', 17, afw$migrt$pkg.obten_var_page_ir(84, 'Insert'), 3030, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_SYSTM_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 12462014818811475, 'O', null, 'Système', 7, afw$migrt$pkg.obten_var_page_ir(93, 'Insert'), 3022, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_ACCES_GLOBL_FORMT', afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 12462405317831059, 'O', null, 'Produit', 8, afw$migrt$pkg.obten_var_page_ir(93, 'Insert'), 3023, null);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page_ir_coln');

merge into afw_13_page_ir_coln t
                        using tc$13$page$ir$coln tf
               on ((t.coln_table = tf.coln_table) and (t.ref_page_ir = tf.ref_page_ir or (t.ref_page_ir is null and tf.ref_page_ir is null) or tf.ref_page_ir is null ))
when not matched then
              insert (t.coln_table, t.dnr_ref_aplic, t.id_apex, t.indic_exprt, t.largr, t.libl, t.ordre_afich, t.ref_page_ir, t.type_largr)
              values (tf.coln_table, tf.dnr_ref_aplic, tf.id_apex, tf.indic_exprt, tf.largr, tf.libl, tf.ordre_afich, tf.ref_page_ir, tf.type_largr)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.id_apex = tf.id_apex, t.indic_exprt = tf.indic_exprt, t.largr = tf.largr, t.libl = tf.libl, t.ordre_afich = tf.ordre_afich, t.type_largr = tf.type_largr
log errors into em$13_page_ir_coln
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir_coln;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Merge sur afw_13_page_ir_coln');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page_ir_coln');
select seqnc into afw$migrt$pkg.var_page_ir_coln(467) from afw_13_page_ir_coln where coln_table = 'TYPE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(468) from afw_13_page_ir_coln where coln_table = 'STAT_SOUMS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(469) from afw_13_page_ir_coln where coln_table = 'NOMBR_TENTV' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(470) from afw_13_page_ir_coln where coln_table = 'SUJET' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(471) from afw_13_page_ir_coln where coln_table = 'NOM_ENVOY' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(472) from afw_13_page_ir_coln where coln_table = 'SERVR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(473) from afw_13_page_ir_coln where coln_table = 'PORT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(474) from afw_13_page_ir_coln where coln_table = 'DOMN' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(475) from afw_13_page_ir_coln where coln_table = 'DATE_CREAT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(476) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(111, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(477) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(111, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(478) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(479) from afw_13_page_ir_coln where coln_table = 'REF_DV_TYPE_REQT_INTER_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(480) from afw_13_page_ir_coln where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(481) from afw_13_page_ir_coln where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(482) from afw_13_page_ir_coln where coln_table = 'DATE_TRAIT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(483) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(100, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(484) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(100, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(485) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(100, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(486) from afw_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(100, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(487) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(83, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(488) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(83, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(489) from afw_13_page_ir_coln where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(83, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_ir_coln');
select seqnc into afw$migrt$pkg.var_page_ir_coln(490) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(105, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(491) from afw_13_page_ir_coln where coln_table = 'ADRES_ENVOY' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(105, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(492) from afw_13_page_ir_coln where coln_table = 'SUJET' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(105, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(493) from afw_13_page_ir_coln where coln_table = 'STAT_SOUMS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(105, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(494) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(83, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(495) from afw_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(496) from afw_13_page_ir_coln where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(497) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(498) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(499) from afw_13_page_ir_coln where coln_table = 'PRENM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(500) from afw_13_page_ir_coln where coln_table = 'CODE_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(501) from afw_13_page_ir_coln where coln_table = 'DATE_EXPIR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(502) from afw_13_page_ir_coln where coln_table = 'DATE_CREAT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(503) from afw_13_page_ir_coln where coln_table = 'UTILS_CREAT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(504) from afw_13_page_ir_coln where coln_table = 'INDIC_VERL_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(505) from afw_13_page_ir_coln where coln_table = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(506) from afw_13_page_ir_coln where coln_table = 'MOT_PASSE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(507) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(508) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(509) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(510) from afw_13_page_ir_coln where coln_table = 'NUMR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(511) from afw_13_page_ir_coln where coln_table = 'REF_PROFL_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(512) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(101, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(513) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(101, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(514) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(101, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(515) from afw_13_page_ir_coln where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(101, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(516) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(86, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(517) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(86, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(518) from afw_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(86, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(519) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(86, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(520) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(87, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(521) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(87, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(522) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(523) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(524) from afw_13_page_ir_coln where coln_table = 'MESG' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(525) from afw_13_page_ir_coln where coln_table = 'TYPE_MESG' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(526) from afw_13_page_ir_coln where coln_table = 'REF_PRODT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(527) from afw_13_page_ir_coln where coln_table = 'NUMR_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(528) from afw_13_page_ir_coln where coln_table = 'PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(529) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(530) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(531) from afw_13_page_ir_coln where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(89, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(532) from afw_13_page_ir_coln where coln_table = 'APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(533) from afw_13_page_ir_coln where coln_table = 'NUMR_PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(534) from afw_13_page_ir_coln where coln_table = 'PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(535) from afw_13_page_ir_coln where coln_table = 'REF_PRODT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(536) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(537) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(103, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(538) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(103, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(539) from afw_13_page_ir_coln where coln_table = 'REF_PROFL_COURL_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(103, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(540) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(92, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(541) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(92, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(542) from afw_13_page_ir_coln where coln_table = 'REF_TYPE_STRUC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(92, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(543) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(544) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(545) from afw_13_page_ir_coln where coln_table = 'APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(546) from afw_13_page_ir_coln where coln_table = 'NUMR_PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(547) from afw_13_page_ir_coln where coln_table = 'PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(548) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(549) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(550) from afw_13_page_ir_coln where coln_table = 'REF_PRODT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(551) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(95, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(552) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(95, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(553) from afw_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(95, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(554) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(95, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(555) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(556) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(557) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(558) from afw_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(559) from afw_13_page_ir_coln where coln_table = 'REF_TYPE_COMNC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(560) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(561) from afw_13_page_ir_coln where coln_table = 'NOM_ENVOY' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(562) from afw_13_page_ir_coln where coln_table = 'ADRES_ENVOY' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(563) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(564) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(565) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(97, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(566) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(97, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(567) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(97, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(568) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(569) from afw_13_page_ir_coln where coln_table = 'REF_GROUP' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(570) from afw_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(571) from afw_13_page_ir_coln where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(572) from afw_13_page_ir_coln where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(573) from afw_13_page_ir_coln where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(574) from afw_13_page_ir_coln where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(575) from afw_13_page_ir_coln where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(576) from afw_13_page_ir_coln where coln_table = 'REF_GROUP' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(577) from afw_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(578) from afw_13_page_ir_coln where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(579) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(580) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(581) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(582) from afw_13_page_ir_coln where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(583) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(111, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(584) from afw_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(585) from afw_13_page_ir_coln where coln_table = 'NUMR_PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(586) from afw_13_page_ir_coln where coln_table = 'NUMR_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(587) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(588) from afw_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(589) from afw_13_page_ir_coln where coln_table = 'ADRES_IP' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(89, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(590) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(87, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_ir_coln');
select seqnc into afw$migrt$pkg.var_page_ir_coln(591) from afw_13_page_ir_coln where coln_table = 'NUMR_MESG' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(592) from afw_13_page_ir_coln where coln_table = 'APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(593) from afw_13_page_ir_coln where coln_table = 'DATE_EVENM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(89, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(594) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(595) from afw_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(103, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(596) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(597) from afw_13_page_ir_coln where coln_table = 'NUMR_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(598) from afw_13_page_ir_coln where coln_table = 'REF_DV_TYPE_DON_SAIS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(599) from afw_13_page_ir_coln where coln_table = 'REF_DV_TYPE_CHAMP_REPNS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(600) from afw_13_page_ir_coln where coln_table = 'INDIC_REPNS_OBLIG_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(601) from afw_13_page_ir_coln where coln_table = 'INDIC_AUTRE_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(602) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(603) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(604) from afw_13_page_ir_coln where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(110, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(605) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(109, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(606) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(109, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(607) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(109, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(608) from afw_13_page_ir_coln where coln_table = 'GRP' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(609) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(110, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(610) from afw_13_page_ir_coln where coln_table = 'REF_FONCT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(110, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(741) from afw_13_page_ir_coln where coln_table = 'NUMR_PAGE_CIBLE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(109, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(742) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(743) from afw_13_page_ir_coln where coln_table = 'NUMR_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(744) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(745) from afw_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(746) from afw_13_page_ir_coln where coln_table = 'LIEN' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(747) from afw_13_page_ir_coln where coln_table = 'REF_STRUC_APLIC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(748) from afw_13_page_ir_coln where coln_table = 'REF_MESG_SUPRS_SPECF' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(749) from afw_13_page_ir_coln where coln_table = 'REF_APLIC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(750) from afw_13_page_ir_coln where coln_table = 'LISTE_FONCT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(751) from afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(752) from afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(753) from afw_13_page_ir_coln where coln_table = 'REF_NUMR_VERSN_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(754) from afw_13_page_ir_coln where coln_table = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(755) from afw_13_page_ir_coln where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(756) from afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(3039) from afw_13_page_ir_coln where coln_table = 'NOM_GROUP_ACCES' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(785, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(3040) from afw_13_page_ir_coln where coln_table = 'SEQNC_GROUP_ACCES' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(785, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(3041) from afw_13_page_ir_coln where coln_table = 'NOM_PROFL_ACCES' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(785, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(3042) from afw_13_page_ir_coln where coln_table = 'SEQNC_PROFL_ACCES' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(785, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(3029) from afw_13_page_ir_coln where coln_table = 'INDIC_APART_SUPER_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(3030) from afw_13_page_ir_coln where coln_table = 'INDIC_APART_AUTOR_CONXN_DERV' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(3022) from afw_13_page_ir_coln where coln_table = 'INDIC_SYSTM_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
select seqnc into afw$migrt$pkg.var_page_ir_coln(3023) from afw_13_page_ir_coln where coln_table = 'INDIC_ACCES_GLOBL_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
--Fin - afw_13_page_ir_coln
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_page_ir_coln');
end;
/

prompt ......page_prefr_navgt
--Debut - afw_13_page_prefr_navgt
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_page_prefr_navgt');
delete from tc$13$page$prefr$navgt;

--Fin - afw_13_page_prefr_navgt
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_page_prefr_navgt');
end;
/

prompt ......liste_navgt
--Debut - afw_13_liste_navgt
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_liste_navgt');
delete from tc$13$liste$navgt;

insert into tc$13$liste$navgt (aplic, code, css_icone_boots, dnr_ref_aplic, indic_reint_sidf, libl, ordre_presn, page, ref_domn, ref_page, sapc, sapi, seqnc, sspc, sspi) values ('1000006', 'DISPN_UTILS', null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', 'Disponibilité', 2, '1031', null, afw$migrt$pkg.obten_var_page(179, 'Insert'), null, null, 10, null, null);
insert into tc$13$liste$navgt (aplic, code, css_icone_boots, dnr_ref_aplic, indic_reint_sidf, libl, ordre_presn, page, ref_domn, ref_page, sapc, sapi, seqnc, sspc, sspi) values ('1000004', 'COURL', null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), 'N', 'Courriel', 1, '20020', null, afw$migrt$pkg.obten_var_page(179, 'Insert'), null, null, 11, null, null);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_liste_navgt');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_liste_navgt');

merge into afw_13_liste_navgt t
                        using tc$13$liste$navgt tf
               on ((t.code = tf.code) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.aplic, t.code, t.css_icone_boots, t.dnr_ref_aplic, t.indic_reint_sidf, t.libl, t.ordre_presn, t.page, t.ref_domn, t.ref_page, t.sapc, t.sapi, t.sspc, t.sspi)
              values (tf.aplic, tf.code, tf.css_icone_boots, tf.dnr_ref_aplic, tf.indic_reint_sidf, tf.libl, tf.ordre_presn, tf.page, tf.ref_domn, tf.ref_page, tf.sapc, tf.sapi, tf.sspc, tf.sspi)
when matched then
              update set t.aplic = tf.aplic, t.css_icone_boots = tf.css_icone_boots, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_reint_sidf = tf.indic_reint_sidf, t.libl = tf.libl, t.ordre_presn = tf.ordre_presn, t.page = tf.page, t.ref_domn = tf.ref_domn, t.sapc = tf.sapc, t.sapi = tf.sapi, t.sspc = tf.sspc, t.sspi = tf.sspi
log errors into em$13_liste_navgt
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_liste_navgt;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Merge sur afw_13_liste_navgt');
  end if;
end;

delete afw_13_liste_navgt t
            where t.dnr_ref_aplic = afw$migrt$pkg.var_aplic(7)
              and not exists (select null
                                from tc$13$liste$navgt tf
                               where (t.code = tf.code) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ));

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_liste_navgt');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_liste_navgt');
select seqnc into afw$migrt$pkg.var_liste_navgt(10) from afw_13_liste_navgt where code = 'DISPN_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_liste_navgt(11) from afw_13_liste_navgt where code = 'COURL' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
--Fin - afw_13_liste_navgt
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_liste_navgt');
end;
/

prompt ......page_item
--Debut - afw_13_page_item
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_page_item');
delete from tc$13$page$item;

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 18914372997698109, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1368, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48459372280779017, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1369, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48459599754779019, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1370, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48459774744779019, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1371, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48798593166398500, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1372, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 70283077157455164, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1373, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 93023393554622797, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1374, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 93023598749624320, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1375, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 93023803597625667, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1376, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 241484159569255018, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', afw$migrt$pkg.obten_var_page(173, 'Insert'), 1377, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 446747156066032423, 'O', null, null, null, null, 'N', null, '[P1_SEQNC]', 'P1_SEQNC', afw$migrt$pkg.obten_var_page(174, 'Insert'), 1378, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 446748143299057115, 'O', null, null, null, null, 'O', null, 'Nom', 'P1_NOM', afw$migrt$pkg.obten_var_page(174, 'Insert'), 1379, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 446748347801058473, 'O', null, null, null, null, 'O', null, 'Code', 'P1_CODE', afw$migrt$pkg.obten_var_page(174, 'Insert'), 1380, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 443197617922153878, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR', afw$migrt$pkg.obten_var_page(174, 'Insert'), 1381, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19399664018260242, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', afw$migrt$pkg.obten_var_page(175, 'Insert'), 1382, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19399860307260242, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', afw$migrt$pkg.obten_var_page(175, 'Insert'), 1383, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19400042833260253, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', afw$migrt$pkg.obten_var_page(175, 'Insert'), 1384, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19400236901260254, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', afw$migrt$pkg.obten_var_page(175, 'Insert'), 1385, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19400436664260255, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', afw$migrt$pkg.obten_var_page(175, 'Insert'), 1386, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19400635424260255, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', afw$migrt$pkg.obten_var_page(175, 'Insert'), 1387, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422481057225435252, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', afw$migrt$pkg.obten_var_page(176, 'Insert'), 1388, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422481564309435255, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', afw$migrt$pkg.obten_var_page(176, 'Insert'), 1389, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422482063955435256, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', afw$migrt$pkg.obten_var_page(176, 'Insert'), 1390, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422482241849435256, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', afw$migrt$pkg.obten_var_page(176, 'Insert'), 1391, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422482763985435256, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', afw$migrt$pkg.obten_var_page(176, 'Insert'), 1392, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422482932833435256, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', afw$migrt$pkg.obten_var_page(176, 'Insert'), 1393, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422483461629435256, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', afw$migrt$pkg.obten_var_page(176, 'Insert'), 1394, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 418927901783132831, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', afw$migrt$pkg.obten_var_page(176, 'Insert'), 1395, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48759275180715664, 'O', null, null, null, null, 'N', null, '&P12010_LIBL_CONTX.', 'P12010_CONTX', afw$migrt$pkg.obten_var_page(177, 'Insert'), 1396, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48759095828712141, 'O', null, null, null, null, 'N', null, 'Libl Contx', 'P12010_LIBL_CONTX', afw$migrt$pkg.obten_var_page(177, 'Insert'), 1397, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 449755816424282365, 'N', null, null, null, null, 'N', null, 'Lier', 'LIER', afw$migrt$pkg.obten_var_page(177, 'Insert'), 1398, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 44895769878306901, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(177, 'Insert'), 1399, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453305847515574226, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P12011_SEQNC', afw$migrt$pkg.obten_var_page(178, 'Insert'), 1400, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453306048399574235, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P12011_REF_UTILS', afw$migrt$pkg.obten_var_page(178, 'Insert'), 1401, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453306263245574238, 'O', null, null, null, null, 'O', null, 'Ref Domn', 'P12011_REF_DOMN', afw$migrt$pkg.obten_var_page(178, 'Insert'), 1402, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453306455409574238, 'O', null, null, null, null, 'O', null, 'Début effectivité', 'P12011_DATE_DEBUT_EFECT', afw$migrt$pkg.obten_var_page(178, 'Insert'), 1403, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453306641772574238, 'O', null, null, null, null, 'O', null, 'Fin effectivité', 'P12011_DATE_FIN_EFECT', afw$migrt$pkg.obten_var_page(178, 'Insert'), 1404, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 449752501089271802, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(178, 'Insert'), 1405, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16484861005644777, 'O', null, null, null, null, 'O', null, 'Courriel', 'P12020_COURL', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1406, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48491794913891841, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12020_SEQNC', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1407, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48492004135891842, 'O', null, null, null, null, 'O', null, 'Nom', 'P12020_NOM', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1408, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48492179448891844, 'O', null, null, null, null, 'O', null, 'Prénom', 'P12020_PRENM', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1409, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48492579677891844, 'O', null, null, null, null, 'O', null, 'Code', 'P12020_CODE_UTILS', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1410, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48493185874891847, 'O', null, null, null, null, 'O', null, 'Date expiration', 'P12020_DATE_EXPIR', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1411, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48493400798891847, 'O', null, null, null, null, 'O', null, 'Compte verrouillé', 'P12020_INDIC_VERL', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1412, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48493775768891847, 'O', null, null, null, null, 'O', null, 'Changer mot passe prochaine connexion', 'P12020_INDIC_CHANG_MOT_PASSE', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1413, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428164852725124486, 'O', null, null, null, null, 'O', null, 'Compte actif', 'P12020_INDIC_ACTIF', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1414, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428231659168684244, 'O', null, null, null, null, 'N', null, 'Groupe de droit', 'P12020_GROUP_DROIT', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1415, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428234042358915901, 'O', null, null, null, null, 'N', null, 'Groupe d''utilisateurs', 'P12020_GROUP_UTILS', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1416, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 456767237354450715, 'O', null, null, null, null, 'O', null, 'Complexité maximal', 'P12020_REF_DV_COMPL_MAXM', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1417, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 510889837540116463, 'O', null, null, null, null, 'O', null, 'Code utilisateur pour la base de données', 'P12020_CODE_UTILS_BASE_DON', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1418, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 567113254564053302, 'O', null, null, null, null, 'N', null, '[P12020_MESG_SUPER_UTILS]', 'P12020_MESG_SUPER_UTILS', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1419, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 567115531932113021, 'O', null, null, null, null, 'N', null, '[P12020_MESG_AUTOR_CONXN_DERV]', 'P12020_MESG_AUTOR_CONXN_DERV', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1420, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 44938271398589420, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1421, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 44937950124589419, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1422, 'BOUTN');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 44937853239589419, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1423, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 44943447918599286, 'N', null, null, null, null, 'N', null, 'Enregistrer et ajouter', 'CREATE_ADD', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1424, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 421659219728948947, 'N', null, null, null, null, 'N', null, 'Modifier le mot de passe', 'P12020_MOT_PASSE', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1425, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 44938041589589419, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(179, 'Insert'), 1426, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 49229274809790508, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12030_SEQNC', afw$migrt$pkg.obten_var_page(181, 'Insert'), 1427, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 49234092301815122, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P12030_NOUV_MOT_PASSE', afw$migrt$pkg.obten_var_page(181, 'Insert'), 1428, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 49234280457815124, 'O', null, null, null, null, 'N', null, 'Confirmation', 'P12030_CONFR_MOT_PASSE', afw$migrt$pkg.obten_var_page(181, 'Insert'), 1429, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 421652920271788257, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(181, 'Insert'), 1430, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 421653406896793935, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'DEFNR', afw$migrt$pkg.obten_var_page(181, 'Insert'), 1431, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50357281263172758, 'O', null, null, null, null, 'N', null, 'Espace de travail:', 'P12121_CONTX', afw$migrt$pkg.obten_var_page(182, 'Insert'), 1432, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46792965290782400, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(182, 'Insert'), 1433, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50348400881089916, 'O', null, null, null, null, 'O', null, 'Nom', 'P12131_NOM', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1434, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50348590852089916, 'O', null, null, null, null, 'O', null, 'Description', 'P12131_DESCR', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1435, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50349002956089916, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12131_SEQNC', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1436, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50788182186646225, 'O', null, null, null, null, 'O', null, 'Code', 'P12131_CODE', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1437, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 60019570682550110, 'O', null, null, null, null, 'O', null, 'Ignorer groupe administrateur', 'P12131_INDIC_IGNOR_GROUP_ADMIN', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1438, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 87241653874491700, 'O', null, null, null, null, 'N', null, '[P12131_MODE]', 'P12131_MODE', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1439, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 96007876358255878, 'O', null, null, null, null, 'O', null, 'domaine', 'P12131_REF_DOMN', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1440, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558613056617308383, 'O', null, null, null, null, 'O', null, '[P12131_INDIC_ACCES_GLOBL]', 'P12131_INDIC_ACCES_GLOBL', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1441, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46795452465787497, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1442, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46795041331787497, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1443, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46795252837787497, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1444, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 83362808150153045, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1445, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422687563995481426, 'O', null, null, null, null, 'O', null, 'Description', 'P34820_DESCR', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1686, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422820658471889578, 'O', null, null, null, null, 'O', null, 'SMS', 'P34820_MESG_SMS', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1687, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423264662887112130, 'O', null, null, null, null, 'N', null, '[P34820_SEQNC_TYPE_COURL]', 'P34820_SEQNC_TYPE_COURL', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1688, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423264942586115782, 'O', null, null, null, null, 'N', null, '[P34820_SEQNC_TYPE_SMS]', 'P34820_SEQNC_TYPE_SMS', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1689, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423267061380177979, 'O', null, null, null, null, 'N', null, '[P34820_SEQNC_TYPE_ECRAN]', 'P34820_SEQNC_TYPE_ECRAN', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1690, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423801962831920310, 'O', null, null, null, null, 'O', null, 'Compte d''envoi', 'P34820_REF_COMPT_COURL', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1691, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423802159632920310, 'O', null, null, null, null, 'O', null, 'Compte d''envoi', 'P34820_REF_COMPT_TWILI', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1692, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423857354890662305, 'O', null, null, null, null, 'N', null, '[P34820_MODE]', 'P34820_MODE', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1693, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423859848254906421, 'O', null, null, null, null, 'N', null, 'Destinataire', 'P34820_RESLT_DESTN', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1694, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423860554806031252, 'O', null, null, null, null, 'N', null, 'Nom formatté', 'P34820_CHAMP_NOM_FORMT', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1695, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423861134253091532, 'O', null, null, null, null, 'N', null, 'Courriel', 'P34820_CHAMP_ADRES_COURL', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1696, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423861556547107435, 'O', null, null, null, null, 'N', null, 'Numéro sms', 'P34820_CHAMP_NUMR_SMS', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1697, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423862832923195257, 'O', null, null, null, null, 'N', null, 'Nature', 'P34820_CHAMP_NATR_COURL', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1698, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419132315274178991, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1699, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419132008074178991, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1700, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419131925026178991, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1701, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419132103809178991, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1702, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 420297926943999494, 'N', null, null, null, null, 'N', null, 'Supprimer', 'SUPRM_ELEMN_CONFIG', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1703, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 420320005817258104, 'N', null, null, null, null, 'N', null, 'Supprimer', 'SUPRM_DESTN_CONFG', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1704, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423357716113908129, 'N', null, null, null, null, 'N', null, 'Éléments substitution', 'AFICH_ELEMN_SUBST_MESG', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1705, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419646008607820495, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREAT_ELEMN_CONFIG', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1706, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423335122021244107, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREAT_DESTN_CONFIG', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1707, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423185031918988645, 'O', null, null, null, null, 'N', null, '4. Résoudre vers', 'P34830_RESLT_4', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1708, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423185248735988645, 'O', null, null, null, null, 'N', null, '5. Résoudre vers', 'P34830_RESLT_5', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1709, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423185433358988645, 'O', null, null, null, null, 'N', null, '6. Résoudre vers', 'P34830_RESLT_6', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1710, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423185839132988646, 'O', null, null, null, null, 'N', null, 'Champ de données', 'P34830_CHAMP_1', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1711, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423186044208988646, 'O', null, null, null, null, 'N', null, '2. Résoudre vers', 'P34830_RESLT_2', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1712, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423186257970988646, 'O', null, null, null, null, 'N', null, '[P34830_AFICH_RESLT_1]', 'P34830_AFICH_RESLT_1', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1713, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423186663044988647, 'O', null, null, null, null, 'N', null, '3. Résoudre vers', 'P34830_RESLT_3', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1714, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426620653369031379, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34830_SEQNC', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1715, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426620862200031385, 'O', null, null, null, null, 'O', null, 'Ref Confg Evenm Notfb', 'P34830_REF_CONFG_EVENM_NOTFB', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1716, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426621040742031386, 'O', null, null, null, null, 'O', null, 'Code', 'P34830_CODE', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1717, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426621262805031386, 'O', null, null, null, null, 'O', null, 'Ident Acces', 'P34830_IDENT_ACCES', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1718, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426621436355031387, 'O', null, null, null, null, 'O', null, 'Ident Acces Formt', 'P34830_IDENT_ACCES_FORMT', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1719, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426681754050061576, 'O', null, null, null, null, 'N', null, '[P34830_RESLT_1]', 'P34830_RESLT_1', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1720, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426865556749450034, 'O', null, null, null, null, 'N', null, 'Chaîne de substitution', 'P34830_ELEMN_SUBST_MESG', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1721, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419631313768686222, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1722, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419631932723686225, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(224, 'Insert'), 1723, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426874639215187915, 'O', null, null, null, null, 'N', null, '[P34840_AFICH_RESLT_1]', 'P34840_AFICH_RESLT_1', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1724, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426875039917187917, 'O', null, null, null, null, 'N', null, 'Champ de données', 'P34840_CHAMP_1', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1725, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426875456272187918, 'O', null, null, null, null, 'N', null, 'Chaîne de substitution', 'P34840_ELEMN_SUBST_MESG', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1726, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426875635174187919, 'O', null, null, null, null, 'O', null, 'Code', 'P34840_CODE', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1727, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426876637743187922, 'O', null, null, null, null, 'N', null, '2. Résoudre vers', 'P34840_RESLT_2', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1728, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426876835078187922, 'O', null, null, null, null, 'N', null, '4. Résoudre vers', 'P34840_RESLT_4', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1729, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426877043006187923, 'O', null, null, null, null, 'N', null, '5. Résoudre vers', 'P34840_RESLT_5', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1730, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426877236674187923, 'O', null, null, null, null, 'N', null, '6. Résoudre vers', 'P34840_RESLT_6', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1731, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426877437889187923, 'O', null, null, null, null, 'N', null, '3. Résoudre vers', 'P34840_RESLT_3', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1732, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426877657900187924, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34840_SEQNC', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1733, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426877857675187924, 'O', null, null, null, null, 'O', null, 'Ref Confg Evenm Notfb', 'P34840_REF_CONFG_EVENM_NOTFB', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1734, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426878046498187924, 'O', null, null, null, null, 'O', null, 'Ident Acces', 'P34840_IDENT_ACCES', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1735, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426878254168187924, 'O', null, null, null, null, 'O', null, 'Ident Acces Formt', 'P34840_IDENT_ACCES_FORMT', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1736, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426878434950187925, 'O', null, null, null, null, 'N', null, '[P34840_RESLT_1]', 'P34840_RESLT_1', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1737, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423323306032885501, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1738, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423323515208885503, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(225, 'Insert'), 1739, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 449588817624511139, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(227, 'Insert'), 1740, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453162554487239322, 'O', null, null, null, null, 'O', null, 'Réponse obligatoire', 'P35011_INDIC_REPNS_OBLIG', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1741, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453162737842239322, 'O', null, null, null, null, 'O', null, 'Nom', 'P35011_NOM', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1742, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453162955916239324, 'O', null, null, null, null, 'O', null, 'Intervalle', 'P35011_INDIC_INTER', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1743, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453163148180239325, 'O', null, null, null, null, 'O', null, 'Type donnée saisie', 'P35011_REF_DV_TYPE_DON_SAIS', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1744, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453163364235239325, 'O', null, null, null, null, 'O', null, 'Réponses multiples', 'P35011_INDIC_REPNS_MULTP', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1745, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453163550748239325, 'O', null, null, null, null, 'O', null, 'Nombre minimum occurences', 'P35011_NOMBR_MINM_OCURN_INTER', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1746, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453163753474239325, 'O', null, null, null, null, 'O', null, 'Nombre maximum occurences', 'P35011_NOMBR_MAXM_OCURN_INTER', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1747, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453163937254239326, 'O', null, null, null, null, 'O', null, 'Type champ réponse', 'P35011_REF_DV_TYPE_CHAMP_REPNS', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1748, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453164359641239326, 'O', null, null, null, null, 'O', null, 'Nombre caractères', 'P35011_NOMBR_CARCT_REPNS', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1749, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453164532763239326, 'O', null, null, null, null, 'O', null, 'Masque', 'P35011_REF_DV_MASQ_FORMT_REPNS', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1750, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453164757979239326, 'O', null, null, null, null, 'O', null, 'Largeur champ', 'P35011_LARGR_REPNS', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1751, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453164948934239326, 'O', null, null, null, null, 'O', null, 'Nombre colonnes', 'P35011_NOMBR_COLN_REPNS', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1752, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453165138150239327, 'O', null, null, null, null, 'O', null, 'Nombre rangées', 'P35011_NOMBR_RANGE_REPNS', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1753, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453165351543239327, 'O', null, null, null, null, 'O', null, 'Autre réponse', 'P35011_INDIC_AUTRE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1754, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453165545385239327, 'O', null, null, null, null, 'O', null, 'Type champ réponse', 'P35011_REF_DV_TYPE_CHAMP_AUTRE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1755, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453165741063239328, 'O', null, null, null, null, 'O', null, 'Nombre caractère', 'P35011_NOMBR_CARCT_AUTRE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1756, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453165944886239328, 'O', null, null, null, null, 'O', null, 'Masque', 'P35011_REF_DV_MASQ_FORMT_AUTRE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1757, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453166135049239328, 'O', null, null, null, null, 'O', null, 'Largeur champ', 'P35011_LARGR_AUTRE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1758, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453166363502239328, 'O', null, null, null, null, 'O', null, 'Nombre colonnes', 'P35011_NOMBR_COLN_AUTRE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1759, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453166535319239329, 'O', null, null, null, null, 'O', null, 'Nombre rangées', 'P35011_NOMBR_RANGE_AUTRE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1760, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 453167755649239331, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P35011_SEQNC', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1761, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 449614214838936910, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1762, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 449614609442936911, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SAVE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1763, 'BOUTN');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 449614832239936911, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1764, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 449614426762936911, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(228, 'Insert'), 1765, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 554512125981716644, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(231, 'Insert'), 1766, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558061837132019031, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P35042_SEQNC', afw$migrt$pkg.obten_var_page(232, 'Insert'), 1767, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558062044685019040, 'O', null, null, null, null, 'O', null, 'Fonctionnalité', 'P35042_REF_FONCT', afw$migrt$pkg.obten_var_page(232, 'Insert'), 1768, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558062456347019043, 'O', null, null, null, null, 'O', null, 'Nom de domaine', 'P35042_REF_DOMN', afw$migrt$pkg.obten_var_page(232, 'Insert'), 1769, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558062836856019043, 'O', null, null, null, null, 'O', null, 'Actif', 'P35042_INDIC_ACTIF', afw$migrt$pkg.obten_var_page(232, 'Insert'), 1770, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 554508001715716605, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(232, 'Insert'), 1771, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 554507703027716604, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(232, 'Insert'), 1772, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 554507612060716604, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(232, 'Insert'), 1773, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 554507806075716604, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(232, 'Insert'), 1774, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 83362727510153045, 'N', null, null, null, null, 'N', null, 'Supprimer', 'MULTI_ROW_DELETE', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1446, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 425879509693917010, 'N', null, null, null, null, 'N', null, 'Liste', 'LISTR_GROUP', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1447, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 425880121598929973, 'N', null, null, null, null, 'N', null, 'Liste', 'LISTR_UTILS', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1448, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 425880326100931250, 'N', null, null, null, null, 'N', null, 'Liste', 'LISTR_DROIT', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1449, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 99832702727524388, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR_GROUP', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1450, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 99930603204533994, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR_UTILS', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1451, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 294591624407421332, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR_DROIT', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1452, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46794853159787495, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(183, 'Insert'), 1453, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50374594369705484, 'O', null, null, null, null, 'N', null, 'Espace de travail:', 'P12141_CONTX', afw$migrt$pkg.obten_var_page(184, 'Insert'), 1454, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46821657643403064, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(184, 'Insert'), 1455, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50384175810782456, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12151_SEQNC', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1456, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50384393381782456, 'O', null, null, null, null, 'O', null, 'Nom', 'P12151_NOM', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1457, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50390488440818280, 'O', null, null, null, null, 'N', null, 'Espace de travail:', 'P12151_CONTX', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1458, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50454681403625555, 'O', null, null, null, null, 'N', null, '[P12151_STRUC_LIE]', 'P12151_STRUC_LIE', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1459, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 51103174218812100, 'O', null, null, null, null, 'O', null, 'Type', 'P12151_REF_TYPE_STRUC', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1460, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 51244986656569952, 'O', null, null, null, null, 'O', null, 'Responsable', 'P12151_REF_RESPN', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1461, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 71505695880588303, 'O', null, null, null, null, 'O', null, 'Début effectivité', 'P12151_DEBUT_EFECT', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1462, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 71505878003592536, 'O', null, null, null, null, 'O', null, 'Fin effectivité', 'P12151_FIN_EFECT', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1463, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 80946106591054161, 'O', null, null, null, null, 'O', null, '[P12151_REF_DOMN]', 'P12151_REF_DOMN', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1464, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 103152394019791689, 'O', null, null, null, null, 'O', null, 'Défaut', 'P12151_INDIC_DEFT', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1465, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46831263830480037, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1466, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46830871356480037, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1467, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46831044440480037, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1468, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 46830670629480036, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(185, 'Insert'), 1469, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 48764197484807267, 'O', null, null, null, null, 'N', null, 'Struc Admin', 'P12181_STRUC_ADMIN', afw$migrt$pkg.obten_var_page(186, 'Insert'), 1470, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 51337091214242659, 'O', null, null, null, null, 'N', null, '[P12181_MEMBR_STRUC]', 'P12181_MEMBR_STRUC', afw$migrt$pkg.obten_var_page(186, 'Insert'), 1471, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 51337274853242663, 'O', null, null, null, null, 'N', null, 'Structure', 'P12181_CONTX', afw$migrt$pkg.obten_var_page(186, 'Insert'), 1472, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 47783957506940237, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(186, 'Insert'), 1473, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 47784158224940240, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SAVE', afw$migrt$pkg.obten_var_page(186, 'Insert'), 1474, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 18805541362464536, 'N', null, null, null, null, 'N', null, 'Créer', 'CREER', afw$migrt$pkg.obten_var_page(187, 'Insert'), 1475, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 22975263268226537, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P12210_SEQNC', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1476, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 22975471647226543, 'O', null, null, null, null, 'O', null, 'Code', 'P12210_CODE', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1477, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 22975677159226544, 'O', null, null, null, null, 'O', null, 'Nom', 'P12210_NOM', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1478, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 22975860534226545, 'O', null, null, null, null, 'O', null, 'Description', 'P12210_DESCR', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1479, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24845348263695958, 'O', null, null, null, null, 'O', null, 'Compte envoi télécopie défaut', 'P12210_REF_COMPT_AXIAT_DEFT', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1480, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 25059549904194159, 'O', null, null, null, null, 'O', null, 'Profil courriel notification', 'P12210_REF_PROFL_COURL_NOTFC', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1481, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 25060077440239985, 'O', null, null, null, null, 'O', null, 'Profil sms notification', 'P12210_REF_PROFL_SMS_NOTFC', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1482, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 434269646235606778, 'O', null, null, null, null, 'O', null, 'Procédure PL/SQL authentification externe', 'P12210_PROCD_AUTHE_EXTER_AFW', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1483, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 434270045327616028, 'O', null, null, null, null, 'O', null, 'Procédure PL/SQL niveau sécurité mot passe', 'P12210_PROCD_VALD_NIV_SECRT_MP', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1484, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 434475950628393040, 'O', null, null, null, null, 'N', null, '[P12210_MODE]', 'P12210_MODE', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1485, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19421743568924115, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1486, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19421419710924115, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1487, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19421341536924115, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1488, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 19421546187924115, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(188, 'Insert'), 1489, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558428158981797618, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P12220_SEQNC', afw$migrt$pkg.obten_var_page(189, 'Insert'), 1490, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558428544000797629, 'O', null, null, null, null, 'O', null, 'Groupe utilisateur', 'P12220_REF_GROUP_UTILS_FORMT', afw$migrt$pkg.obten_var_page(189, 'Insert'), 1491, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558428747618797629, 'O', null, null, null, null, 'O', null, 'Opération', 'P12220_REF_OPERT', afw$migrt$pkg.obten_var_page(189, 'Insert'), 1492, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558428963262797629, 'O', null, null, null, null, 'O', null, 'Option', 'P12220_REF_OPERT_OPTIO', afw$migrt$pkg.obten_var_page(189, 'Insert'), 1493, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558429136005797629, 'O', null, null, null, null, 'O', null, 'Ref Domn', 'P12220_REF_DOMN', afw$migrt$pkg.obten_var_page(189, 'Insert'), 1494, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 558433552474864615, 'O', null, null, null, null, 'O', null, 'Opération', 'P12220_REF_OPERT_FORMT', afw$migrt$pkg.obten_var_page(189, 'Insert'), 1495, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 554856702182060656, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(189, 'Insert'), 1496, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 554874824160495194, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(189, 'Insert'), 1497, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 47553241483534633, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(190, 'Insert'), 1498, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 51128901223975111, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12336_SEQNC', afw$migrt$pkg.obten_var_page(191, 'Insert'), 1499, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 51129100555975113, 'O', null, null, null, null, 'O', null, 'Code', 'P12336_CODE', afw$migrt$pkg.obten_var_page(191, 'Insert'), 1500, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 51129292575975113, 'O', null, null, null, null, 'O', null, 'Nom', 'P12336_NOM', afw$migrt$pkg.obten_var_page(191, 'Insert'), 1501, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 51129474786975113, 'O', null, null, null, null, 'O', null, 'Description', 'P12336_DESCR', afw$migrt$pkg.obten_var_page(191, 'Insert'), 1502, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 51129675792975113, 'O', null, null, null, null, 'O', null, 'Application', 'P12336_REF_DOMN', afw$migrt$pkg.obten_var_page(191, 'Insert'), 1503, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 47575963373672692, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(191, 'Insert'), 1504, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 47575563160672690, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(191, 'Insert'), 1505, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 47575746666672690, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(191, 'Insert'), 1506, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 47575366840672690, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(191, 'Insert'), 1507, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 50557086641823891, 'O', null, null, null, null, 'N', null, 'Type', 'P13053_TYPE_DEFNT_ACCES', afw$migrt$pkg.obten_var_page(192, 'Insert'), 1508, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 47032943616806984, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(192, 'Insert'), 1509, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419839530469182566, 'N', null, null, null, null, 'N', null, 'Créer', 'CREER', afw$migrt$pkg.obten_var_page(193, 'Insert'), 1510, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 80971116276870002, 'O', null, null, null, null, 'O', null, '[P19030_DNR_REF_PRODT]', 'P19030_DNR_REF_PRODT', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1511, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423410858213682542, 'O', null, null, null, null, 'O', null, '[P19030_SEQNC]', 'P19030_SEQNC', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1512, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423411041028687058, 'O', null, null, null, null, 'O', null, 'Domaine', 'P19030_REF_DOMN', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1513, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423411233541694343, 'O', null, null, null, null, 'O', null, 'Code', 'P19030_CODE', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1514, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423411455012700542, 'O', null, null, null, null, 'O', null, 'Nom', 'P19030_NOM', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1515, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423411638174705207, 'O', null, null, null, null, 'O', null, 'Description', 'P19030_DESCR', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1516, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 434471056667205555, 'O', null, null, null, null, 'O', null, 'Produit', 'P19030_REF_PRODT', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1517, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419842117843292486, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1518, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419842722045322079, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1519, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419842430094305463, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1520, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419894829676093125, 'N', null, null, null, null, 'N', null, 'Créer', 'CRÉER', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1521, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419843109148337265, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(194, 'Insert'), 1522, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423450843006598456, 'O', null, null, null, null, 'O', null, '[P19040_SEQNC]', 'P19040_SEQNC', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1523, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423451037297634592, 'O', null, null, null, null, 'O', null, 'Modèle de recherche', 'P19040_REF_MODL_RECHR', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1524, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423451239852644823, 'O', null, null, null, null, 'O', null, 'Structure applicative de la recherche ', 'P19040_REF_STRUC_APLIC_RECHR', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1525, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423451463017698842, 'O', null, null, null, null, 'O', null, 'Lien ', 'P19040_REF_STRUC_APLIC_LIEN', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1526, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423452263250840777, 'O', null, null, null, null, 'O', null, 'Affichage', 'P19040_REF_ATRIB_STRUC_APLIC_AFICH', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1527, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423459636931550036, 'O', null, null, null, null, 'O', null, 'Nombre maximum de résultats', 'P19040_NOMBR_MAXIM_RESLT', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1528, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419896810863229591, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1529, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419897020691241865, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1530, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419897224631252543, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1531, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419922304385127134, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE1', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1532, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419897417836260052, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(195, 'Insert'), 1533, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423477662285512864, 'O', null, null, null, null, 'O', null, '[P19041_SEQNC]', 'P19041_SEQNC', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1534, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423477851681519237, 'O', null, null, null, null, 'O', null, 'Application du modèle de recherche', 'P19041_REF_APLIC_MODL_RECHR', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1535, 'ITEM');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423478142377544954, 'O', null, null, null, null, 'O', null, 'Attribut de la structure applicative', 'P19041_REF_ATRIB_STRUC_APLIC', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1536, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423478464241579641, 'O', null, null, null, null, 'O', null, 'Patron de recherche', 'P19041_REF_PATRN_RECHR', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1537, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423478735891599826, 'O', null, null, null, null, 'O', null, 'Ordre d''execution', 'P19041_ORDRE_EXECT', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1538, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423478962903607618, 'O', null, null, null, null, 'O', null, 'Pertinence', 'P19041_PERTN', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1539, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419923428888153198, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1540, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419923725556161614, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1541, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419924322702179779, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1542, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419924023609170514, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(196, 'Insert'), 1543, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12961025750657680, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(197, 'Insert'), 1544, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16517075225964441, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P20010_SEQNC', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1545, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16517471978964443, 'O', null, null, null, null, 'O', null, 'Serveur', 'P20010_SERVR_SORTN', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1546, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16517680227964443, 'O', null, null, null, null, 'O', null, 'Port', 'P20010_PORT_SORTN', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1547, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16518071290964443, 'O', null, null, null, null, 'O', null, 'Nom expéditeur', 'P20010_NOM_ENVOY', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1548, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16518270419964443, 'O', null, null, null, null, 'O', null, 'Adresse expéditeur', 'P20010_ADRES_ENVOY', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1549, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16518461498964443, 'O', null, null, null, null, 'O', null, 'Méthode authentification', 'P20010_AUTHE_METHD_SORTN', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1550, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16518674329964443, 'O', null, null, null, null, 'O', null, 'Utilisateur authentification', 'P20010_AUTHE_USAGR_SORTN', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1551, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16518853265964443, 'O', null, null, null, null, 'O', null, 'Mot de passe authentification', 'P20010_AUTHE_MDP_SORTN', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1552, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24838259102481552, 'O', null, null, null, null, 'O', null, 'Code', 'P20010_CODE', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1553, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24838468027481553, 'O', null, null, null, null, 'O', null, 'Nom', 'P20010_NOM', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1554, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24838660137481553, 'O', null, null, null, null, 'O', null, 'Descritpion', 'P20010_DESCR', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1555, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 25375267054774219, 'O', null, null, null, null, 'O', null, 'Serveur', 'P20010_SERVR_ENTRA', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1556, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 25375456491774220, 'O', null, null, null, null, 'O', null, 'Port', 'P20010_PORT_ENTRA', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1557, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 25375666453774220, 'O', null, null, null, null, 'O', null, 'Méthode authentification', 'P20010_AUTHE_METHD_ENTRA', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1558, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 25375868672774220, 'O', null, null, null, null, 'O', null, 'Utilisateur authentification', 'P20010_AUTHE_USAGR_ENTRA', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1559, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 25376071727774220, 'O', null, null, null, null, 'O', null, 'Mot de passe authentification', 'P20010_AUTHE_MDP_ENTRA', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1560, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426981234550301057, 'O', null, null, null, null, 'O', null, 'domaine', 'P20010_REF_DOMN', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1561, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 427684132762881665, 'O', null, null, null, null, 'O', null, 'Domaine', 'P20010_DOMN', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1562, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12963742065662022, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1563, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12963525085662021, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1564, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12963933994662022, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1565, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12964130561662022, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(198, 'Insert'), 1566, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428639456527226847, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P20030_SEQNC', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1567, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428639643050226855, 'O', null, null, null, null, 'O', null, 'Serveur', 'P20030_SERVR', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1568, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428639859809226856, 'O', null, null, null, null, 'O', null, 'Port', 'P20030_PORT', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1569, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428640046360226857, 'O', null, null, null, null, 'O', null, 'Domaine', 'P20030_DOMN', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1570, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428640251082226857, 'O', null, null, null, null, 'O', null, 'Nom d''envoi', 'P20030_NOM_ENVOY', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1571, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428640439798226857, 'O', null, null, null, null, 'O', null, 'Adresse d''envoi', 'P20030_ADRES_ENVOY', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1572, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428640659224226857, 'O', null, null, null, null, 'O', null, 'Sujet', 'P20030_SUJET', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1573, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428640853351226858, 'O', null, null, null, null, 'O', null, 'Format HTML', 'P20030_INDIC_FORMT_HTML', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1574, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428641035682226858, 'O', null, null, null, null, 'O', null, 'Corps', 'P20030_CORPS', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1575, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428641232608226858, 'O', null, null, null, null, 'O', null, 'Nombre de tentative', 'P20030_NOMBR_TENTV', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1576, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428641435135226858, 'O', null, null, null, null, 'O', null, 'Nombre de tentative maximale', 'P20030_NOMBR_TENTV_MAX', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1577, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428641643005226858, 'O', null, null, null, null, 'O', null, 'Sens', 'P20030_SENS', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1578, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 428641841329226859, 'O', null, null, null, null, 'O', null, 'Statut', 'P20030_STAT_SOUMS', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1579, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 425086303750924427, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1580, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 425086103636924427, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(200, 'Insert'), 1581, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12971540060664362, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(201, 'Insert'), 1582, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16529148787972201, 'O', null, null, null, null, 'N', null, '[P21010_UTILS]', 'P21010_UTILS', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1583, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16529561940972201, 'O', null, null, null, null, 'N', null, '[P21010_GROUP_UTILS]', 'P21010_GROUP_UTILS', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1584, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16527555135972199, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P21010_SEQNC', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1585, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16527763317972199, 'O', null, null, null, null, 'O', null, 'Code', 'P21010_CODE', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1586, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16527954469972199, 'O', null, null, null, null, 'O', null, 'Nom', 'P21010_NOM', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1587, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16528158664972199, 'O', null, null, null, null, 'O', null, 'Description', 'P21010_DESCR', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1588, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16528348849972199, 'O', null, null, null, null, 'O', null, 'Application', 'P21010_REF_PRODT', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1589, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16528566240972199, 'O', null, null, null, null, 'O', null, 'Profil de courriel', 'P21010_REF_PROFL_COURL', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1590, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16528769144972201, 'O', null, null, null, null, 'O', null, 'Avertir auteur uniquement', 'P21010_INDIC_AVERT_AUTR_UNIQ', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1591, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12974246998669780, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1592, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12974039960669779, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1593, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12974440396669780, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1594, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12974628640669780, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(202, 'Insert'), 1595, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 20867865856555143, 'O', null, null, null, null, 'N', null, '[P30010_SEQNC]', 'P30010_SEQNC', afw$migrt$pkg.obten_var_page(203, 'Insert'), 1596, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 20868074860557712, 'O', null, null, null, null, 'N', null, '[P30020_SEQNC]', 'P30020_SEQNC', afw$migrt$pkg.obten_var_page(204, 'Insert'), 1597, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 20868257676562170, 'O', null, null, null, null, 'N', null, '[P30030_SEQNC]', 'P30030_SEQNC', afw$migrt$pkg.obten_var_page(205, 'Insert'), 1598, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16930953643902987, 'O', null, null, null, null, 'N', null, '[P30040_SEQNC]', 'P30040_SEQNC', afw$migrt$pkg.obten_var_page(206, 'Insert'), 1599, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 16844378771037104, 'O', null, null, null, null, 'N', null, '[P30050_SEQNC]', 'P30050_SEQNC', afw$migrt$pkg.obten_var_page(207, 'Insert'), 1600, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 20824841696039803, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT', afw$migrt$pkg.obten_var_page(208, 'Insert'), 1601, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24381363146737675, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34100_SEQNC', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1602, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24381548633737684, 'O', null, null, null, null, 'O', null, 'Code', 'P34100_CODE', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1603, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24381763552737685, 'O', null, null, null, null, 'O', null, 'Nom', 'P34100_NOM', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1604, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24381976223737686, 'O', null, null, null, null, 'O', null, 'Description', 'P34100_DESCR', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1605, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24382151055737688, 'O', null, null, null, null, 'O', null, 'Couleur texte', 'P34100_COULR_TEXTE', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1606, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24382366758737689, 'O', null, null, null, null, 'O', null, 'Taille texte', 'P34100_TAIL_TEXTE', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1607, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24382555060737689, 'O', null, null, null, null, 'O', null, 'Couleur titre', 'P34100_COULR_TITRE', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1608, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24382768211737689, 'O', null, null, null, null, 'O', null, 'Taille titre', 'P34100_TAIL_TITRE', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1609, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24382979790737689, 'O', null, null, null, null, 'O', null, 'Temps affichage', 'P34100_TEMPS_AFICH', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1610, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24383170224737689, 'O', null, null, null, null, 'O', null, 'Icône', 'P34100_REF_RESRC_ICON', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1611, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24383359769737690, 'O', null, null, null, null, 'O', null, 'Format icône', 'P34100_REF_FORMT_RESRC_ICON', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1612, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24383569178737690, 'O', null, null, null, null, 'O', null, 'Occurence icône', 'P34100_REF_OCURN_RESRC_ICON', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1613, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24684877751424292, 'O', null, null, null, null, 'O', null, 'Type', 'P34100_REF_TYPE_COMNC', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1614, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24688472883621542, 'O', null, null, null, null, 'N', null, '[P34100_SEQNC_TYPE_COMNC_ECRAN]', 'P34100_SEQNC_TYPE_COMNC_ECRAN', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1615, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24742753516472224, 'O', null, null, null, null, 'O', null, 'Modèle', 'P34100_REF_MODL_COMNC', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1616, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 20827835614435252, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1617, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 20827533416435251, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1618, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 20827440218435251, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1619, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 20827627445435251, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(209, 'Insert'), 1620, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419107710491716766, 'N', null, null, null, null, 'N', null, 'Créer', 'CRÉER', afw$migrt$pkg.obten_var_page(210, 'Insert'), 1621, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24810360431655312, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34210_SEQNC', afw$migrt$pkg.obten_var_page(211, 'Insert'), 1622, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24810547780655319, 'O', null, null, null, null, 'O', null, 'Code', 'P34210_CODE', afw$migrt$pkg.obten_var_page(211, 'Insert'), 1623, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24810748028655320, 'O', null, null, null, null, 'O', null, 'Nom', 'P34210_NOM', afw$migrt$pkg.obten_var_page(211, 'Insert'), 1624, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24810972226655320, 'O', null, null, null, null, 'O', null, 'Ref Evenm Notfb', 'P34210_REF_EVENM_NOTFB', afw$migrt$pkg.obten_var_page(211, 'Insert'), 1625, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21256830189352890, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(211, 'Insert'), 1626, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21256535261352890, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(211, 'Insert'), 1627, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21256435566352890, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_page(211, 'Insert'), 1628, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21256642070352890, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(211, 'Insert'), 1629, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21514429363384627, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT', afw$migrt$pkg.obten_var_page(212, 'Insert'), 1630, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419073002881985767, 'N', null, null, null, null, 'N', null, 'Créer', 'CRÉER', afw$migrt$pkg.obten_var_page(213, 'Insert'), 1631, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422623146855113149, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34310_SEQNC', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1632, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422623346548113156, 'O', null, null, null, null, 'O', null, 'Code', 'P34310_CODE', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1633, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422623560847113156, 'O', null, null, null, null, 'O', null, 'Nom', 'P34310_NOM', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1634, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422623734016113157, 'O', null, null, null, null, 'O', null, 'Description', 'P34310_DESCR', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1635, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422623939654113157, 'O', null, null, null, null, 'O', null, 'Objet', 'P34310_OBJET', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1636, 'ITEM');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422624151710113158, 'O', null, null, null, null, 'O', null, 'Corps Message', 'P34310_CORPS_MESG', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1637, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422632563804365738, 'O', null, null, null, null, 'O', null, '[P34310_REF_DOMN]', 'P34310_REF_DOMN', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1638, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419069305089810725, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1639, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419069023647810724, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1640, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419068923885810724, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1641, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419069111226810724, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(214, 'Insert'), 1642, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21170335386943690, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT', afw$migrt$pkg.obten_var_page(215, 'Insert'), 1643, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24702150586401067, 'O', null, null, null, null, 'O', null, 'Type', 'P34500_REF_TYPE_COMNC', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1644, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24702378371401067, 'O', null, null, null, null, 'O', null, 'Indic Systm', 'P34500_INDIC_SYSTM', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1645, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24701372468401060, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34500_SEQNC', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1646, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24701567107401066, 'O', null, null, null, null, 'O', null, 'Code', 'P34500_CODE', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1647, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24701753242401066, 'O', null, null, null, null, 'O', null, 'Nom', 'P34500_NOM', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1648, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24701958943401067, 'O', null, null, null, null, 'O', null, 'Description', 'P34500_DESCR', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1649, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21147819917098639, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1650, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21147542117098638, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1651, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21147435966098638, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1652, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21154216945227431, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1653, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21147623945098638, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1654, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21154136737227431, 'N', null, null, null, null, 'N', null, 'Supprimer', 'MULTI_ROW_DELETE', afw$migrt$pkg.obten_var_page(216, 'Insert'), 1655, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21314028482666003, 'N', null, null, null, null, 'N', null, 'Créer', 'CREER', afw$migrt$pkg.obten_var_page(219, 'Insert'), 1656, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24869053315981727, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34710_SEQNC', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1657, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24869265452981734, 'O', null, null, null, null, 'O', null, 'Code', 'P34710_CODE', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1658, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24869456683981735, 'O', null, null, null, null, 'O', null, 'Nom', 'P34710_NOM', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1659, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24869668403981736, 'O', null, null, null, null, 'O', null, 'Description', 'P34710_DESCR', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1660, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24869866837981736, 'O', null, null, null, null, 'O', null, 'Numéro expéditeur', 'P34710_NUMR', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1661, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24870068901981737, 'O', null, null, null, null, 'O', null, 'Profil de courriel expéditeur', 'P34710_REF_PROFL_COURL', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1662, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 24870279207981737, 'O', null, null, null, null, 'O', null, '[P34710_REF_DOMN]', 'P34710_REF_DOMN', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1663, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 25306969741871775, 'O', null, null, null, null, 'O', null, 'Page de garde ', 'P34710_REF_PUBLC_PAGE_GARDE', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1664, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21315519347679306, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1665, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21315236305679306, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1666, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21315131190679306, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1667, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 21315340920679306, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_page(220, 'Insert'), 1668, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422671542291037671, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34810_SEQNC', afw$migrt$pkg.obten_var_page(222, 'Insert'), 1669, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422667863084037666, 'O', null, null, null, null, 'O', null, 'Code', 'P34810_CODE', afw$migrt$pkg.obten_var_page(222, 'Insert'), 1670, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422668034524037666, 'O', null, null, null, null, 'O', null, 'Nom', 'P34810_NOM', afw$migrt$pkg.obten_var_page(222, 'Insert'), 1671, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422668252493037667, 'O', null, null, null, null, 'O', null, 'Description', 'P34810_DESCR', afw$migrt$pkg.obten_var_page(222, 'Insert'), 1672, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422668443127037667, 'O', null, null, null, null, 'O', null, 'Structure applicative', 'P34810_REF_STRUC_APLIC', afw$migrt$pkg.obten_var_page(222, 'Insert'), 1673, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419118226166735251, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(222, 'Insert'), 1674, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 419143108497393210, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT_CONFG', afw$migrt$pkg.obten_var_page(222, 'Insert'), 1675, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422686155749481413, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34820_SEQNC', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1676, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422686342428481421, 'O', null, null, null, null, 'O', null, 'Type', 'P34820_REF_TYPE_COMNC', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1677, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422686535984481425, 'O', null, null, null, null, 'O', null, 'Objet', 'P34820_OBJET', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1678, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422686748719481425, 'O', null, null, null, null, 'O', null, 'Message', 'P34820_MESG', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1679, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422686956080481426, 'O', null, null, null, null, 'O', null, 'Ref Evenm Notfb', 'P34820_REF_EVENM_NOTFB', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1680, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423869136099266837, 'O', null, null, null, null, 'O', null, '[P34820_REF_DOMN]', 'P34820_REF_DOMN', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1681, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 423953753353245396, 'O', null, null, null, null, 'N', null, 'Ajouter', 'AJOUT_DESTN', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1682, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426928743107054106, 'O', null, null, null, null, 'N', null, '[P34820_STRUC_APLIC]', 'P34820_STRUC_APLIC', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1683, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 426931263520258604, 'O', null, null, null, null, 'O', null, 'Défaut', 'P34820_INDIC_DEFT', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1684, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 422687350627481426, 'O', null, null, null, null, 'O', null, 'Nom', 'P34820_NOM', afw$migrt$pkg.obten_var_page(223, 'Insert'), 1685, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82076231921713827, 'O', null, null, null, null, 'O', null, 'Adresse courriel', 'P20010_ADRES_SUPRT', afw$migrt$pkg.obten_var_page(198, 'Insert'), 2312, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82076424588717266, 'O', null, null, null, null, 'O', null, 'Nom', 'P20010_NOM_SUPRT', afw$migrt$pkg.obten_var_page(198, 'Insert'), 2313, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82077018753735137, 'O', null, null, null, null, 'O', null, 'Ajouter en Cci', 'P20010_INDIC_AJOUT_SUPRT_CCI', afw$migrt$pkg.obten_var_page(198, 'Insert'), 2314, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82168321731133657, 'O', null, null, null, null, 'O', null, 'Nom', 'P35051_NOM', afw$migrt$pkg.obten_var_page(482, 'Insert'), 2315, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82168502389133657, 'O', null, null, null, null, 'O', null, 'Code', 'P35051_CODE', afw$migrt$pkg.obten_var_page(482, 'Insert'), 2316, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82168704630133658, 'O', null, null, null, null, 'O', null, 'Version', 'P35051_REF_NOM_VERSN', afw$migrt$pkg.obten_var_page(482, 'Insert'), 2317, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82168930712133658, 'O', null, null, null, null, 'O', null, 'Numéro APEX', 'P35051_NUMR_APLIC_APEX', afw$migrt$pkg.obten_var_page(482, 'Insert'), 2318, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82169111076133664, 'O', null, null, null, null, 'N', null, '[P35051_SEQNC]', 'P35051_SEQNC', afw$migrt$pkg.obten_var_page(482, 'Insert'), 2319, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82160515099091674, 'O', null, null, null, null, 'O', null, 'Code', 'P35050_CODE', afw$migrt$pkg.obten_var_page(483, 'Insert'), 2320, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82160726933091690, 'O', null, null, null, null, 'O', null, 'Nom', 'P35050_NOM', afw$migrt$pkg.obten_var_page(483, 'Insert'), 2321, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82161526483091717, 'O', null, null, null, null, 'N', null, '[P35050_SEQNC]', 'P35050_SEQNC', afw$migrt$pkg.obten_var_page(483, 'Insert'), 2322, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82175213071177858, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_page(484, 'Insert'), 2323, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82175427742177858, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SUBMIT', afw$migrt$pkg.obten_var_page(484, 'Insert'), 2324, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82174820523177857, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', afw$migrt$pkg.obten_var_page(484, 'Insert'), 2325, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 82174606597177857, 'N', null, null, null, null, 'N', null, 'Supprimer', 'MULTI_ROW_DELETE', afw$migrt$pkg.obten_var_page(484, 'Insert'), 2326, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_aplic(7, 'Insert'), null, 12461809224798921, 'O', null, null, null, null, 'O', null, 'Système', 'P12131_INDIC_SYSTM', afw$migrt$pkg.obten_var_page(183, 'Insert'), 6109, 'ITEM');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page_item');

merge into afw_13_page_item t
                        using tc$13$page$item tf
               on ((t.nom_apex = tf.nom_apex) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.depsm_alias_coln, t.dnr_ref_aplic, t.icone_bulle_aide, t.id_apex, t.indic_confr_sauvg, t.indic_creat, t.indic_en_creat, t.indic_en_modfc, t.indic_modfc, t.indic_rechr, t.indic_suprs, t.libl, t.nom_apex, t.ref_page, t.type_item)
              values (tf.depsm_alias_coln, tf.dnr_ref_aplic, tf.icone_bulle_aide, tf.id_apex, tf.indic_confr_sauvg, tf.indic_creat, tf.indic_en_creat, tf.indic_en_modfc, tf.indic_modfc, tf.indic_rechr, tf.indic_suprs, tf.libl, tf.nom_apex, tf.ref_page, tf.type_item)
when matched then
              update set t.depsm_alias_coln = tf.depsm_alias_coln, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.icone_bulle_aide = tf.icone_bulle_aide, t.id_apex = tf.id_apex, t.indic_confr_sauvg = tf.indic_confr_sauvg, t.indic_creat = tf.indic_creat, t.indic_en_creat = tf.indic_en_creat, t.indic_en_modfc = tf.indic_en_modfc, t.indic_modfc = tf.indic_modfc, t.indic_rechr = tf.indic_rechr, t.indic_suprs = tf.indic_suprs, t.libl = tf.libl, t.type_item = tf.type_item
log errors into em$13_page_item
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Merge sur afw_13_page_item');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin partie - afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut partie - afw_13_page_item');
select seqnc into afw$migrt$pkg.var_page_item(1368) from afw_13_page_item where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1369) from afw_13_page_item where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1370) from afw_13_page_item where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1371) from afw_13_page_item where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1372) from afw_13_page_item where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1373) from afw_13_page_item where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1374) from afw_13_page_item where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1375) from afw_13_page_item where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1376) from afw_13_page_item where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1377) from afw_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1378) from afw_13_page_item where nom_apex = 'P1_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(174, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1379) from afw_13_page_item where nom_apex = 'P1_NOM' and ref_page = afw$migrt$pkg.obten_var_page(174, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1380) from afw_13_page_item where nom_apex = 'P1_CODE' and ref_page = afw$migrt$pkg.obten_var_page(174, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1381) from afw_13_page_item where nom_apex = 'EDITR' and ref_page = afw$migrt$pkg.obten_var_page(174, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1382) from afw_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1383) from afw_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1384) from afw_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1385) from afw_13_page_item where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1386) from afw_13_page_item where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1387) from afw_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1388) from afw_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1389) from afw_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1390) from afw_13_page_item where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1391) from afw_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1392) from afw_13_page_item where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1393) from afw_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1394) from afw_13_page_item where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1395) from afw_13_page_item where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1396) from afw_13_page_item where nom_apex = 'P12010_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1397) from afw_13_page_item where nom_apex = 'P12010_LIBL_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1398) from afw_13_page_item where nom_apex = 'LIER' and ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1399) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1400) from afw_13_page_item where nom_apex = 'P12011_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1401) from afw_13_page_item where nom_apex = 'P12011_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1402) from afw_13_page_item where nom_apex = 'P12011_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1403) from afw_13_page_item where nom_apex = 'P12011_DATE_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1404) from afw_13_page_item where nom_apex = 'P12011_DATE_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1405) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1406) from afw_13_page_item where nom_apex = 'P12020_COURL' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1407) from afw_13_page_item where nom_apex = 'P12020_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1408) from afw_13_page_item where nom_apex = 'P12020_NOM' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1409) from afw_13_page_item where nom_apex = 'P12020_PRENM' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1410) from afw_13_page_item where nom_apex = 'P12020_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1411) from afw_13_page_item where nom_apex = 'P12020_DATE_EXPIR' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1412) from afw_13_page_item where nom_apex = 'P12020_INDIC_VERL' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1413) from afw_13_page_item where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1414) from afw_13_page_item where nom_apex = 'P12020_INDIC_ACTIF' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1415) from afw_13_page_item where nom_apex = 'P12020_GROUP_DROIT' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1416) from afw_13_page_item where nom_apex = 'P12020_GROUP_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1417) from afw_13_page_item where nom_apex = 'P12020_REF_DV_COMPL_MAXM' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1418) from afw_13_page_item where nom_apex = 'P12020_CODE_UTILS_BASE_DON' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1419) from afw_13_page_item where nom_apex = 'P12020_MESG_SUPER_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1420) from afw_13_page_item where nom_apex = 'P12020_MESG_AUTOR_CONXN_DERV' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1421) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1422) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
select seqnc into afw$migrt$pkg.var_page_item(1423) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1424) from afw_13_page_item where nom_apex = 'CREATE_ADD' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1425) from afw_13_page_item where nom_apex = 'P12020_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1426) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1427) from afw_13_page_item where nom_apex = 'P12030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1428) from afw_13_page_item where nom_apex = 'P12030_NOUV_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1429) from afw_13_page_item where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1430) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1431) from afw_13_page_item where nom_apex = 'DEFNR' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1432) from afw_13_page_item where nom_apex = 'P12121_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1433) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(182, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1434) from afw_13_page_item where nom_apex = 'P12131_NOM' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1435) from afw_13_page_item where nom_apex = 'P12131_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1436) from afw_13_page_item where nom_apex = 'P12131_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1437) from afw_13_page_item where nom_apex = 'P12131_CODE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1438) from afw_13_page_item where nom_apex = 'P12131_INDIC_IGNOR_GROUP_ADMIN' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1439) from afw_13_page_item where nom_apex = 'P12131_MODE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1440) from afw_13_page_item where nom_apex = 'P12131_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1441) from afw_13_page_item where nom_apex = 'P12131_INDIC_ACCES_GLOBL' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1442) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1443) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1444) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1445) from afw_13_page_item where nom_apex = 'ADD' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1686) from afw_13_page_item where nom_apex = 'P34820_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1687) from afw_13_page_item where nom_apex = 'P34820_MESG_SMS' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1688) from afw_13_page_item where nom_apex = 'P34820_SEQNC_TYPE_COURL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1689) from afw_13_page_item where nom_apex = 'P34820_SEQNC_TYPE_SMS' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1690) from afw_13_page_item where nom_apex = 'P34820_SEQNC_TYPE_ECRAN' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1691) from afw_13_page_item where nom_apex = 'P34820_REF_COMPT_COURL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1692) from afw_13_page_item where nom_apex = 'P34820_REF_COMPT_TWILI' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1693) from afw_13_page_item where nom_apex = 'P34820_MODE' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1694) from afw_13_page_item where nom_apex = 'P34820_RESLT_DESTN' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1695) from afw_13_page_item where nom_apex = 'P34820_CHAMP_NOM_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1696) from afw_13_page_item where nom_apex = 'P34820_CHAMP_ADRES_COURL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1697) from afw_13_page_item where nom_apex = 'P34820_CHAMP_NUMR_SMS' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1698) from afw_13_page_item where nom_apex = 'P34820_CHAMP_NATR_COURL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1699) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1700) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1701) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1702) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1703) from afw_13_page_item where nom_apex = 'SUPRM_ELEMN_CONFIG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1704) from afw_13_page_item where nom_apex = 'SUPRM_DESTN_CONFG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1705) from afw_13_page_item where nom_apex = 'AFICH_ELEMN_SUBST_MESG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1706) from afw_13_page_item where nom_apex = 'CREAT_ELEMN_CONFIG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1707) from afw_13_page_item where nom_apex = 'CREAT_DESTN_CONFIG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1708) from afw_13_page_item where nom_apex = 'P34830_RESLT_4' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1709) from afw_13_page_item where nom_apex = 'P34830_RESLT_5' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1710) from afw_13_page_item where nom_apex = 'P34830_RESLT_6' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1711) from afw_13_page_item where nom_apex = 'P34830_CHAMP_1' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1712) from afw_13_page_item where nom_apex = 'P34830_RESLT_2' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1713) from afw_13_page_item where nom_apex = 'P34830_AFICH_RESLT_1' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1714) from afw_13_page_item where nom_apex = 'P34830_RESLT_3' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1715) from afw_13_page_item where nom_apex = 'P34830_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1716) from afw_13_page_item where nom_apex = 'P34830_REF_CONFG_EVENM_NOTFB' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1717) from afw_13_page_item where nom_apex = 'P34830_CODE' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1718) from afw_13_page_item where nom_apex = 'P34830_IDENT_ACCES' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1719) from afw_13_page_item where nom_apex = 'P34830_IDENT_ACCES_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1720) from afw_13_page_item where nom_apex = 'P34830_RESLT_1' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1721) from afw_13_page_item where nom_apex = 'P34830_ELEMN_SUBST_MESG' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1722) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1723) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1724) from afw_13_page_item where nom_apex = 'P34840_AFICH_RESLT_1' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1725) from afw_13_page_item where nom_apex = 'P34840_CHAMP_1' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1726) from afw_13_page_item where nom_apex = 'P34840_ELEMN_SUBST_MESG' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1727) from afw_13_page_item where nom_apex = 'P34840_CODE' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1728) from afw_13_page_item where nom_apex = 'P34840_RESLT_2' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1729) from afw_13_page_item where nom_apex = 'P34840_RESLT_4' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1730) from afw_13_page_item where nom_apex = 'P34840_RESLT_5' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1731) from afw_13_page_item where nom_apex = 'P34840_RESLT_6' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1732) from afw_13_page_item where nom_apex = 'P34840_RESLT_3' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1733) from afw_13_page_item where nom_apex = 'P34840_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1734) from afw_13_page_item where nom_apex = 'P34840_REF_CONFG_EVENM_NOTFB' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1735) from afw_13_page_item where nom_apex = 'P34840_IDENT_ACCES' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1736) from afw_13_page_item where nom_apex = 'P34840_IDENT_ACCES_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1737) from afw_13_page_item where nom_apex = 'P34840_RESLT_1' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1738) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1739) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1740) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(227, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1741) from afw_13_page_item where nom_apex = 'P35011_INDIC_REPNS_OBLIG' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1742) from afw_13_page_item where nom_apex = 'P35011_NOM' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1743) from afw_13_page_item where nom_apex = 'P35011_INDIC_INTER' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1744) from afw_13_page_item where nom_apex = 'P35011_REF_DV_TYPE_DON_SAIS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1745) from afw_13_page_item where nom_apex = 'P35011_INDIC_REPNS_MULTP' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1746) from afw_13_page_item where nom_apex = 'P35011_NOMBR_MINM_OCURN_INTER' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1747) from afw_13_page_item where nom_apex = 'P35011_NOMBR_MAXM_OCURN_INTER' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1748) from afw_13_page_item where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1749) from afw_13_page_item where nom_apex = 'P35011_NOMBR_CARCT_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1750) from afw_13_page_item where nom_apex = 'P35011_REF_DV_MASQ_FORMT_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1751) from afw_13_page_item where nom_apex = 'P35011_LARGR_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1752) from afw_13_page_item where nom_apex = 'P35011_NOMBR_COLN_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1753) from afw_13_page_item where nom_apex = 'P35011_NOMBR_RANGE_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1754) from afw_13_page_item where nom_apex = 'P35011_INDIC_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1755) from afw_13_page_item where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1756) from afw_13_page_item where nom_apex = 'P35011_NOMBR_CARCT_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1757) from afw_13_page_item where nom_apex = 'P35011_REF_DV_MASQ_FORMT_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1758) from afw_13_page_item where nom_apex = 'P35011_LARGR_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1759) from afw_13_page_item where nom_apex = 'P35011_NOMBR_COLN_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1760) from afw_13_page_item where nom_apex = 'P35011_NOMBR_RANGE_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1761) from afw_13_page_item where nom_apex = 'P35011_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1762) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1763) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
select seqnc into afw$migrt$pkg.var_page_item(1764) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1765) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1766) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(231, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1767) from afw_13_page_item where nom_apex = 'P35042_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1768) from afw_13_page_item where nom_apex = 'P35042_REF_FONCT' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1769) from afw_13_page_item where nom_apex = 'P35042_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1770) from afw_13_page_item where nom_apex = 'P35042_INDIC_ACTIF' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1771) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1772) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1773) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1774) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1446) from afw_13_page_item where nom_apex = 'MULTI_ROW_DELETE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1447) from afw_13_page_item where nom_apex = 'LISTR_GROUP' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1448) from afw_13_page_item where nom_apex = 'LISTR_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1449) from afw_13_page_item where nom_apex = 'LISTR_DROIT' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1450) from afw_13_page_item where nom_apex = 'EDITR_GROUP' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1451) from afw_13_page_item where nom_apex = 'EDITR_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1452) from afw_13_page_item where nom_apex = 'EDITR_DROIT' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1453) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1454) from afw_13_page_item where nom_apex = 'P12141_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(184, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1455) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(184, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1456) from afw_13_page_item where nom_apex = 'P12151_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1457) from afw_13_page_item where nom_apex = 'P12151_NOM' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1458) from afw_13_page_item where nom_apex = 'P12151_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1459) from afw_13_page_item where nom_apex = 'P12151_STRUC_LIE' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1460) from afw_13_page_item where nom_apex = 'P12151_REF_TYPE_STRUC' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1461) from afw_13_page_item where nom_apex = 'P12151_REF_RESPN' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1462) from afw_13_page_item where nom_apex = 'P12151_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1463) from afw_13_page_item where nom_apex = 'P12151_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1464) from afw_13_page_item where nom_apex = 'P12151_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1465) from afw_13_page_item where nom_apex = 'P12151_INDIC_DEFT' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1466) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1467) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1468) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1469) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1470) from afw_13_page_item where nom_apex = 'P12181_STRUC_ADMIN' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1471) from afw_13_page_item where nom_apex = 'P12181_MEMBR_STRUC' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1472) from afw_13_page_item where nom_apex = 'P12181_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1473) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1474) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1475) from afw_13_page_item where nom_apex = 'CREER' and ref_page = afw$migrt$pkg.obten_var_page(187, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1476) from afw_13_page_item where nom_apex = 'P12210_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1477) from afw_13_page_item where nom_apex = 'P12210_CODE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1478) from afw_13_page_item where nom_apex = 'P12210_NOM' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1479) from afw_13_page_item where nom_apex = 'P12210_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1480) from afw_13_page_item where nom_apex = 'P12210_REF_COMPT_AXIAT_DEFT' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1481) from afw_13_page_item where nom_apex = 'P12210_REF_PROFL_COURL_NOTFC' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1482) from afw_13_page_item where nom_apex = 'P12210_REF_PROFL_SMS_NOTFC' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1483) from afw_13_page_item where nom_apex = 'P12210_PROCD_AUTHE_EXTER_AFW' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1484) from afw_13_page_item where nom_apex = 'P12210_PROCD_VALD_NIV_SECRT_MP' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1485) from afw_13_page_item where nom_apex = 'P12210_MODE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1486) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1487) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1488) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1489) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1490) from afw_13_page_item where nom_apex = 'P12220_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1491) from afw_13_page_item where nom_apex = 'P12220_REF_GROUP_UTILS_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1492) from afw_13_page_item where nom_apex = 'P12220_REF_OPERT' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1493) from afw_13_page_item where nom_apex = 'P12220_REF_OPERT_OPTIO' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1494) from afw_13_page_item where nom_apex = 'P12220_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1495) from afw_13_page_item where nom_apex = 'P12220_REF_OPERT_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1496) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1497) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1498) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(190, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1499) from afw_13_page_item where nom_apex = 'P12336_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1500) from afw_13_page_item where nom_apex = 'P12336_CODE' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1501) from afw_13_page_item where nom_apex = 'P12336_NOM' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1502) from afw_13_page_item where nom_apex = 'P12336_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1503) from afw_13_page_item where nom_apex = 'P12336_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1504) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1505) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1506) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1507) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1508) from afw_13_page_item where nom_apex = 'P13053_TYPE_DEFNT_ACCES' and ref_page = afw$migrt$pkg.obten_var_page(192, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1509) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(192, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1510) from afw_13_page_item where nom_apex = 'CREER' and ref_page = afw$migrt$pkg.obten_var_page(193, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1511) from afw_13_page_item where nom_apex = 'P19030_DNR_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1512) from afw_13_page_item where nom_apex = 'P19030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1513) from afw_13_page_item where nom_apex = 'P19030_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1514) from afw_13_page_item where nom_apex = 'P19030_CODE' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1515) from afw_13_page_item where nom_apex = 'P19030_NOM' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1516) from afw_13_page_item where nom_apex = 'P19030_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1517) from afw_13_page_item where nom_apex = 'P19030_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1518) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1519) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1520) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1521) from afw_13_page_item where nom_apex = 'CRÉER' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1522) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1523) from afw_13_page_item where nom_apex = 'P19040_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1524) from afw_13_page_item where nom_apex = 'P19040_REF_MODL_RECHR' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1525) from afw_13_page_item where nom_apex = 'P19040_REF_STRUC_APLIC_RECHR' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1526) from afw_13_page_item where nom_apex = 'P19040_REF_STRUC_APLIC_LIEN' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1527) from afw_13_page_item where nom_apex = 'P19040_REF_ATRIB_STRUC_APLIC_AFICH' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1528) from afw_13_page_item where nom_apex = 'P19040_NOMBR_MAXIM_RESLT' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1529) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1530) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1531) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1532) from afw_13_page_item where nom_apex = 'CREATE1' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1533) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1534) from afw_13_page_item where nom_apex = 'P19041_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1535) from afw_13_page_item where nom_apex = 'P19041_REF_APLIC_MODL_RECHR' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
select seqnc into afw$migrt$pkg.var_page_item(1536) from afw_13_page_item where nom_apex = 'P19041_REF_ATRIB_STRUC_APLIC' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1537) from afw_13_page_item where nom_apex = 'P19041_REF_PATRN_RECHR' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1538) from afw_13_page_item where nom_apex = 'P19041_ORDRE_EXECT' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1539) from afw_13_page_item where nom_apex = 'P19041_PERTN' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1540) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1541) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1542) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1543) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1544) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(197, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1545) from afw_13_page_item where nom_apex = 'P20010_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1546) from afw_13_page_item where nom_apex = 'P20010_SERVR_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1547) from afw_13_page_item where nom_apex = 'P20010_PORT_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1548) from afw_13_page_item where nom_apex = 'P20010_NOM_ENVOY' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1549) from afw_13_page_item where nom_apex = 'P20010_ADRES_ENVOY' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1550) from afw_13_page_item where nom_apex = 'P20010_AUTHE_METHD_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1551) from afw_13_page_item where nom_apex = 'P20010_AUTHE_USAGR_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1552) from afw_13_page_item where nom_apex = 'P20010_AUTHE_MDP_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1553) from afw_13_page_item where nom_apex = 'P20010_CODE' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1554) from afw_13_page_item where nom_apex = 'P20010_NOM' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1555) from afw_13_page_item where nom_apex = 'P20010_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1556) from afw_13_page_item where nom_apex = 'P20010_SERVR_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1557) from afw_13_page_item where nom_apex = 'P20010_PORT_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1558) from afw_13_page_item where nom_apex = 'P20010_AUTHE_METHD_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1559) from afw_13_page_item where nom_apex = 'P20010_AUTHE_USAGR_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1560) from afw_13_page_item where nom_apex = 'P20010_AUTHE_MDP_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1561) from afw_13_page_item where nom_apex = 'P20010_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1562) from afw_13_page_item where nom_apex = 'P20010_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1563) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1564) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1565) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1566) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1567) from afw_13_page_item where nom_apex = 'P20030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1568) from afw_13_page_item where nom_apex = 'P20030_SERVR' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1569) from afw_13_page_item where nom_apex = 'P20030_PORT' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1570) from afw_13_page_item where nom_apex = 'P20030_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1571) from afw_13_page_item where nom_apex = 'P20030_NOM_ENVOY' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1572) from afw_13_page_item where nom_apex = 'P20030_ADRES_ENVOY' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1573) from afw_13_page_item where nom_apex = 'P20030_SUJET' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1574) from afw_13_page_item where nom_apex = 'P20030_INDIC_FORMT_HTML' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1575) from afw_13_page_item where nom_apex = 'P20030_CORPS' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1576) from afw_13_page_item where nom_apex = 'P20030_NOMBR_TENTV' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1577) from afw_13_page_item where nom_apex = 'P20030_NOMBR_TENTV_MAX' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1578) from afw_13_page_item where nom_apex = 'P20030_SENS' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1579) from afw_13_page_item where nom_apex = 'P20030_STAT_SOUMS' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1580) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1581) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1582) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(201, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1583) from afw_13_page_item where nom_apex = 'P21010_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1584) from afw_13_page_item where nom_apex = 'P21010_GROUP_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1585) from afw_13_page_item where nom_apex = 'P21010_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1586) from afw_13_page_item where nom_apex = 'P21010_CODE' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1587) from afw_13_page_item where nom_apex = 'P21010_NOM' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1588) from afw_13_page_item where nom_apex = 'P21010_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1589) from afw_13_page_item where nom_apex = 'P21010_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1590) from afw_13_page_item where nom_apex = 'P21010_REF_PROFL_COURL' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1591) from afw_13_page_item where nom_apex = 'P21010_INDIC_AVERT_AUTR_UNIQ' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1592) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1593) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1594) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1595) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1596) from afw_13_page_item where nom_apex = 'P30010_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(203, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1597) from afw_13_page_item where nom_apex = 'P30020_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(204, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1598) from afw_13_page_item where nom_apex = 'P30030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(205, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1599) from afw_13_page_item where nom_apex = 'P30040_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(206, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1600) from afw_13_page_item where nom_apex = 'P30050_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(207, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1601) from afw_13_page_item where nom_apex = 'CREAT' and ref_page = afw$migrt$pkg.obten_var_page(208, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1602) from afw_13_page_item where nom_apex = 'P34100_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1603) from afw_13_page_item where nom_apex = 'P34100_CODE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1604) from afw_13_page_item where nom_apex = 'P34100_NOM' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1605) from afw_13_page_item where nom_apex = 'P34100_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1606) from afw_13_page_item where nom_apex = 'P34100_COULR_TEXTE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1607) from afw_13_page_item where nom_apex = 'P34100_TAIL_TEXTE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1608) from afw_13_page_item where nom_apex = 'P34100_COULR_TITRE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1609) from afw_13_page_item where nom_apex = 'P34100_TAIL_TITRE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1610) from afw_13_page_item where nom_apex = 'P34100_TEMPS_AFICH' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1611) from afw_13_page_item where nom_apex = 'P34100_REF_RESRC_ICON' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1612) from afw_13_page_item where nom_apex = 'P34100_REF_FORMT_RESRC_ICON' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1613) from afw_13_page_item where nom_apex = 'P34100_REF_OCURN_RESRC_ICON' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1614) from afw_13_page_item where nom_apex = 'P34100_REF_TYPE_COMNC' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1615) from afw_13_page_item where nom_apex = 'P34100_SEQNC_TYPE_COMNC_ECRAN' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1616) from afw_13_page_item where nom_apex = 'P34100_REF_MODL_COMNC' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1617) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1618) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1619) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1620) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1621) from afw_13_page_item where nom_apex = 'CRÉER' and ref_page = afw$migrt$pkg.obten_var_page(210, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1622) from afw_13_page_item where nom_apex = 'P34210_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1623) from afw_13_page_item where nom_apex = 'P34210_CODE' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1624) from afw_13_page_item where nom_apex = 'P34210_NOM' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1625) from afw_13_page_item where nom_apex = 'P34210_REF_EVENM_NOTFB' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1626) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1627) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1628) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1629) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1630) from afw_13_page_item where nom_apex = 'CREAT' and ref_page = afw$migrt$pkg.obten_var_page(212, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1631) from afw_13_page_item where nom_apex = 'CRÉER' and ref_page = afw$migrt$pkg.obten_var_page(213, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1632) from afw_13_page_item where nom_apex = 'P34310_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1633) from afw_13_page_item where nom_apex = 'P34310_CODE' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1634) from afw_13_page_item where nom_apex = 'P34310_NOM' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1635) from afw_13_page_item where nom_apex = 'P34310_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1636) from afw_13_page_item where nom_apex = 'P34310_OBJET' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
select seqnc into afw$migrt$pkg.var_page_item(1637) from afw_13_page_item where nom_apex = 'P34310_CORPS_MESG' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1638) from afw_13_page_item where nom_apex = 'P34310_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1639) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1640) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1641) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1642) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1643) from afw_13_page_item where nom_apex = 'CREAT' and ref_page = afw$migrt$pkg.obten_var_page(215, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1644) from afw_13_page_item where nom_apex = 'P34500_REF_TYPE_COMNC' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1645) from afw_13_page_item where nom_apex = 'P34500_INDIC_SYSTM' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1646) from afw_13_page_item where nom_apex = 'P34500_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1647) from afw_13_page_item where nom_apex = 'P34500_CODE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1648) from afw_13_page_item where nom_apex = 'P34500_NOM' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1649) from afw_13_page_item where nom_apex = 'P34500_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1650) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1651) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1652) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1653) from afw_13_page_item where nom_apex = 'ADD' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1654) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1655) from afw_13_page_item where nom_apex = 'MULTI_ROW_DELETE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1656) from afw_13_page_item where nom_apex = 'CREER' and ref_page = afw$migrt$pkg.obten_var_page(219, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1657) from afw_13_page_item where nom_apex = 'P34710_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1658) from afw_13_page_item where nom_apex = 'P34710_CODE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1659) from afw_13_page_item where nom_apex = 'P34710_NOM' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1660) from afw_13_page_item where nom_apex = 'P34710_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1661) from afw_13_page_item where nom_apex = 'P34710_NUMR' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1662) from afw_13_page_item where nom_apex = 'P34710_REF_PROFL_COURL' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1663) from afw_13_page_item where nom_apex = 'P34710_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1664) from afw_13_page_item where nom_apex = 'P34710_REF_PUBLC_PAGE_GARDE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1665) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1666) from afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1667) from afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1668) from afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1669) from afw_13_page_item where nom_apex = 'P34810_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1670) from afw_13_page_item where nom_apex = 'P34810_CODE' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1671) from afw_13_page_item where nom_apex = 'P34810_NOM' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1672) from afw_13_page_item where nom_apex = 'P34810_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1673) from afw_13_page_item where nom_apex = 'P34810_REF_STRUC_APLIC' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1674) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1675) from afw_13_page_item where nom_apex = 'CREAT_CONFG' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1676) from afw_13_page_item where nom_apex = 'P34820_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1677) from afw_13_page_item where nom_apex = 'P34820_REF_TYPE_COMNC' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1678) from afw_13_page_item where nom_apex = 'P34820_OBJET' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1679) from afw_13_page_item where nom_apex = 'P34820_MESG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1680) from afw_13_page_item where nom_apex = 'P34820_REF_EVENM_NOTFB' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1681) from afw_13_page_item where nom_apex = 'P34820_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1682) from afw_13_page_item where nom_apex = 'AJOUT_DESTN' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1683) from afw_13_page_item where nom_apex = 'P34820_STRUC_APLIC' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1684) from afw_13_page_item where nom_apex = 'P34820_INDIC_DEFT' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(1685) from afw_13_page_item where nom_apex = 'P34820_NOM' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2312) from afw_13_page_item where nom_apex = 'P20010_ADRES_SUPRT' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2313) from afw_13_page_item where nom_apex = 'P20010_NOM_SUPRT' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2314) from afw_13_page_item where nom_apex = 'P20010_INDIC_AJOUT_SUPRT_CCI' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2315) from afw_13_page_item where nom_apex = 'P35051_NOM' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2316) from afw_13_page_item where nom_apex = 'P35051_CODE' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2317) from afw_13_page_item where nom_apex = 'P35051_REF_NOM_VERSN' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2318) from afw_13_page_item where nom_apex = 'P35051_NUMR_APLIC_APEX' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2319) from afw_13_page_item where nom_apex = 'P35051_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2320) from afw_13_page_item where nom_apex = 'P35050_CODE' and ref_page = afw$migrt$pkg.obten_var_page(483, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2321) from afw_13_page_item where nom_apex = 'P35050_NOM' and ref_page = afw$migrt$pkg.obten_var_page(483, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2322) from afw_13_page_item where nom_apex = 'P35050_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(483, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2323) from afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(484, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2324) from afw_13_page_item where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_page(484, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2325) from afw_13_page_item where nom_apex = 'ADD' and ref_page = afw$migrt$pkg.obten_var_page(484, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(2326) from afw_13_page_item where nom_apex = 'MULTI_ROW_DELETE' and ref_page = afw$migrt$pkg.obten_var_page(484, 'Select');
select seqnc into afw$migrt$pkg.var_page_item(6109) from afw_13_page_item where nom_apex = 'P12131_INDIC_SYSTM' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
--Fin - afw_13_page_item
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_page_item');
end;
/

prompt ......page_item_lang
--Debut - afw_13_page_item_lang
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_page_item_lang');
delete from tc$13$page$item$lang;

--Fin - afw_13_page_item_lang
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_page_item_lang');
end;
/

prompt ......condt_piltb
--Debut - afw_13_condt_piltb
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_condt_piltb');
delete from tc$13$condt$piltb;

--Fin - afw_13_condt_piltb
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_condt_piltb');
end;
/

prompt ......lien_condt_piltb
--Debut - afw_13_lien_condt_piltb
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_lien_condt_piltb');
delete from tc$13$lien$condt$piltb;

--Fin - afw_13_lien_condt_piltb
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_lien_condt_piltb');
end;
/

prompt ......regn_piltb
--Debut - afw_13_regn_piltb
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_regn_piltb');
delete from tc$13$regn$piltb;

--Fin - afw_13_regn_piltb
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_regn_piltb');
end;
/

prompt ......regn_piltb_lang
--Debut - afw_13_regn_piltb_lang
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_regn_piltb_lang');
delete from tc$13$regn$piltb$lang;

--Fin - afw_13_regn_piltb_lang
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_regn_piltb_lang');
end;
/

prompt ......prefr
--Debut - afw_13_prefr
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_prefr');
delete from tc$13$prefr;

--Fin - afw_13_prefr
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_prefr');
end;
/

prompt ......tutrl
--Debut - afw_13_tutrl
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_tutrl');
delete from tc$13$tutrl;

--Fin - afw_13_tutrl
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_tutrl');
end;
/

prompt ......etape_tutrl
--Debut - afw_13_etape_tutrl
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_etape_tutrl');
delete from tc$13$etape$tutrl;

--Fin - afw_13_etape_tutrl
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_etape_tutrl');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_versn;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_11_versn');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_versn');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(11, 'Update') where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(118, 'Update') where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(105, 'Update') where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Update') where numr_apex = 12010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Update') where numr_apex = 12011 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Update') where numr_apex = 12020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(135, 'Update') where numr_apex = 12021 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(134, 'Update') where numr_apex = 12030 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(28, 'Update') where numr_apex = 12121 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(28, 'Update') where numr_apex = 12131 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(3, 'Update') where numr_apex = 12141 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(3, 'Update') where numr_apex = 12151 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(126, 'Update') where numr_apex = 12181 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(11, 'Update') where numr_apex = 12200 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(11, 'Update') where numr_apex = 12210 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(20, 'Update') where numr_apex = 12220 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(127, 'Update') where numr_apex = 12326 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(127, 'Update') where numr_apex = 12336 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(64, 'Update') where numr_apex = 13053 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(78, 'Update') where numr_apex = 19020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(78, 'Update') where numr_apex = 19030 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(109, 'Update') where numr_apex = 19040 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(110, 'Update') where numr_apex = 19041 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Update') where numr_apex = 20000 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Update') where numr_apex = 20010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(128, 'Update') where numr_apex = 20020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(128, 'Update') where numr_apex = 20030 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(129, 'Update') where numr_apex = 21000 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(129, 'Update') where numr_apex = 21010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(96, 'Update') where numr_apex = 30010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(96, 'Update') where numr_apex = 30020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(96, 'Update') where numr_apex = 30030 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(96, 'Update') where numr_apex = 30040 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(96, 'Update') where numr_apex = 30050 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(130, 'Update') where numr_apex = 34000 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(130, 'Update') where numr_apex = 34100 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(18, 'Update') where numr_apex = 34200 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(107, 'Update') where numr_apex = 34210 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(107, 'Update') where numr_apex = 34211 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(131, 'Update') where numr_apex = 34300 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(131, 'Update') where numr_apex = 34310 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(132, 'Update') where numr_apex = 34400 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(132, 'Update') where numr_apex = 34500 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(84, 'Update') where numr_apex = 34600 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(84, 'Update') where numr_apex = 34610 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(136, 'Update') where numr_apex = 34700 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(136, 'Update') where numr_apex = 34710 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(18, 'Update') where numr_apex = 34800 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(18, 'Update') where numr_apex = 34810 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Update') where numr_apex = 34820 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Update') where numr_apex = 34830 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Update') where numr_apex = 34840 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Update') where numr_apex = 34900 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Update') where numr_apex = 35010 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Update') where numr_apex = 35011 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(125, 'Update') where numr_apex = 35020 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Update') where numr_apex = 35031 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Update') where numr_apex = 35041 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Update') where numr_apex = 35042 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Update') where numr_apex = 35051 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Update') where numr_apex = 35050 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(55, 'Update') where numr_apex = 35052 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(28, 'Update') where numr_apex = 12161 and ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_lang;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_lang');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_ir');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_ir');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'TYPE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'STAT_SOUMS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOMBR_TENTV' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SUJET' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_ENVOY' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SERVR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PORT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DOMN' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_CREAT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(107, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(111, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(111, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_REQT_INTER_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_TRAIT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(100, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(100, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(100, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(100, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(83, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(83, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(83, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_ir_coln');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(105, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'ADRES_ENVOY' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(105, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SUJET' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(105, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'STAT_SOUMS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(105, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(83, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PRENM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_EXPIR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_CREAT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'UTILS_CREAT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_VERL_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'MOT_PASSE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PROFL_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(85, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(101, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(101, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(101, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(101, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(86, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(86, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(86, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(86, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(87, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(87, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'MESG' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'TYPE_MESG' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(89, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(103, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(103, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PROFL_COURL_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(103, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(92, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(92, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_TYPE_STRUC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(92, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(95, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(95, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(95, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(95, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_TYPE_COMNC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(104, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_ENVOY' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'ADRES_ENVOY' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(96, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(97, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(97, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(97, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(98, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(91, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(99, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(111, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(108, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'ADRES_IP' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(89, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(87, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_ir_coln');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_MESG' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(88, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(102, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_EVENM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(89, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(90, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(103, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(94, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_DON_SAIS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_CHAMP_REPNS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_REPNS_OBLIG_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_AUTRE_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(106, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(110, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(109, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(109, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(109, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'GRP' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(110, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_FONCT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(110, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE_CIBLE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(109, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'LIEN' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STRUC_APLIC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_MESG_SUPRS_SPECF' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_APLIC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'LISTE_FONCT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(181, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_NUMR_VERSN_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(182, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_GROUP_ACCES' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(785, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC_GROUP_ACCES' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(785, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_PROFL_ACCES' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(785, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC_PROFL_ACCES' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(785, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_APART_SUPER_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_APART_AUTOR_CONXN_DERV' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(84, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_SYSTM_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_ACCES_GLOBL_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_page_ir(93, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir_coln;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_ir_coln');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_prefr_navgt;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_prefr_navgt');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_prefr_navgt');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_liste_navgt;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_liste_navgt');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_liste_navgt');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_page(173, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(174, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_NOM' and ref_page = afw$migrt$pkg.obten_var_page(174, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_CODE' and ref_page = afw$migrt$pkg.obten_var_page(174, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR' and ref_page = afw$migrt$pkg.obten_var_page(174, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(175, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_page(176, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12010_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12010_LIBL_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LIER' and ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(177, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_DATE_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_DATE_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(178, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_COURL' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_NOM' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_PRENM' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_DATE_EXPIR' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_VERL' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_ACTIF' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_GROUP_DROIT' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_GROUP_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_REF_DV_COMPL_MAXM' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_CODE_UTILS_BASE_DON' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MESG_SUPER_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MESG_AUTOR_CONXN_DERV' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE_ADD' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(179, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_NOUV_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DEFNR' and ref_page = afw$migrt$pkg.obten_var_page(181, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12121_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(182, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(182, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_NOM' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_CODE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_INDIC_IGNOR_GROUP_ADMIN' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_MODE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_INDIC_ACCES_GLOBL' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_MESG_SMS' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC_TYPE_COURL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC_TYPE_SMS' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC_TYPE_ECRAN' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_COMPT_COURL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_COMPT_TWILI' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_MODE' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_RESLT_DESTN' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_NOM_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_ADRES_COURL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_NUMR_SMS' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_NATR_COURL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUPRM_ELEMN_CONFIG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUPRM_DESTN_CONFG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AFICH_ELEMN_SUBST_MESG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT_ELEMN_CONFIG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT_DESTN_CONFIG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_4' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_5' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_6' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_CHAMP_1' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_2' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_AFICH_RESLT_1' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_3' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_REF_CONFG_EVENM_NOTFB' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_CODE' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_IDENT_ACCES' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_IDENT_ACCES_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_1' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_ELEMN_SUBST_MESG' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(224, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_AFICH_RESLT_1' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_CHAMP_1' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_ELEMN_SUBST_MESG' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_CODE' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_2' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_4' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_5' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_6' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_3' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_REF_CONFG_EVENM_NOTFB' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_IDENT_ACCES' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_IDENT_ACCES_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_1' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(225, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(227, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_REPNS_OBLIG' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOM' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_INTER' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_TYPE_DON_SAIS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_REPNS_MULTP' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_MINM_OCURN_INTER' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_MAXM_OCURN_INTER' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_CARCT_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_MASQ_FORMT_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_LARGR_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_COLN_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_RANGE_REPNS' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_CARCT_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_MASQ_FORMT_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_LARGR_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_COLN_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_RANGE_AUTRE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(228, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(231, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_REF_FONCT' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_INDIC_ACTIF' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(232, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'MULTI_ROW_DELETE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LISTR_GROUP' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LISTR_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LISTR_DROIT' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR_GROUP' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR_DROIT' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12141_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(184, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(184, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_NOM' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_STRUC_LIE' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_REF_TYPE_STRUC' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_REF_RESPN' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_INDIC_DEFT' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(185, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12181_STRUC_ADMIN' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12181_MEMBR_STRUC' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12181_CONTX' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(186, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER' and ref_page = afw$migrt$pkg.obten_var_page(187, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_CODE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_NOM' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_REF_COMPT_AXIAT_DEFT' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_REF_PROFL_COURL_NOTFC' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_REF_PROFL_SMS_NOTFC' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_PROCD_AUTHE_EXTER_AFW' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_PROCD_VALD_NIV_SECRT_MP' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_MODE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(188, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_GROUP_UTILS_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_OPERT' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_OPERT_OPTIO' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_OPERT_FORMT' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(189, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(190, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_CODE' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_NOM' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(191, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P13053_TYPE_DEFNT_ACCES' and ref_page = afw$migrt$pkg.obten_var_page(192, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(192, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER' and ref_page = afw$migrt$pkg.obten_var_page(193, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_DNR_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_CODE' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_NOM' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CRÉER' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(194, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_MODL_RECHR' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_STRUC_APLIC_RECHR' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_STRUC_APLIC_LIEN' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_ATRIB_STRUC_APLIC_AFICH' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_NOMBR_MAXIM_RESLT' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE1' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(195, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_REF_APLIC_MODL_RECHR' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_REF_ATRIB_STRUC_APLIC' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_REF_PATRN_RECHR' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_ORDRE_EXECT' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_PERTN' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(196, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(197, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_SERVR_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_PORT_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_NOM_ENVOY' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_ADRES_ENVOY' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_METHD_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_USAGR_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_MDP_SORTN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_CODE' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_NOM' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_SERVR_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_PORT_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_METHD_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_USAGR_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_MDP_ENTRA' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SERVR' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_PORT' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_NOM_ENVOY' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_ADRES_ENVOY' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SUJET' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_INDIC_FORMT_HTML' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_CORPS' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_NOMBR_TENTV' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_NOMBR_TENTV_MAX' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SENS' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_STAT_SOUMS' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(200, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(201, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_GROUP_UTILS' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_CODE' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_NOM' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_REF_PROFL_COURL' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_INDIC_AVERT_AUTR_UNIQ' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(202, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30010_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(203, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30020_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(204, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(205, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30040_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(206, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30050_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(207, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT' and ref_page = afw$migrt$pkg.obten_var_page(208, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_CODE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_NOM' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_COULR_TEXTE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_TAIL_TEXTE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_COULR_TITRE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_TAIL_TITRE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_TEMPS_AFICH' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_RESRC_ICON' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_FORMT_RESRC_ICON' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_OCURN_RESRC_ICON' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_TYPE_COMNC' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_SEQNC_TYPE_COMNC_ECRAN' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_MODL_COMNC' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(209, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CRÉER' and ref_page = afw$migrt$pkg.obten_var_page(210, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_CODE' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_NOM' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_REF_EVENM_NOTFB' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(211, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT' and ref_page = afw$migrt$pkg.obten_var_page(212, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CRÉER' and ref_page = afw$migrt$pkg.obten_var_page(213, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_CODE' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_NOM' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_OBJET' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_item');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_CORPS_MESG' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(214, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT' and ref_page = afw$migrt$pkg.obten_var_page(215, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_REF_TYPE_COMNC' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_INDIC_SYSTM' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_CODE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_NOM' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'MULTI_ROW_DELETE' and ref_page = afw$migrt$pkg.obten_var_page(216, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER' and ref_page = afw$migrt$pkg.obten_var_page(219, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_CODE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_NOM' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_NUMR' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_REF_PROFL_COURL' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_REF_PUBLC_PAGE_GARDE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_page(220, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_CODE' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_NOM' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_DESCR' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_REF_STRUC_APLIC' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT_CONFG' and ref_page = afw$migrt$pkg.obten_var_page(222, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_TYPE_COMNC' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_OBJET' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_MESG' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_EVENM_NOTFB' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_DOMN' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AJOUT_DESTN' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_STRUC_APLIC' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_INDIC_DEFT' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_NOM' and ref_page = afw$migrt$pkg.obten_var_page(223, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_ADRES_SUPRT' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_NOM_SUPRT' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_INDIC_AJOUT_SUPRT_CCI' and ref_page = afw$migrt$pkg.obten_var_page(198, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35051_NOM' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35051_CODE' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35051_REF_NOM_VERSN' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35051_NUMR_APLIC_APEX' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35051_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(482, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35050_CODE' and ref_page = afw$migrt$pkg.obten_var_page(483, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35050_NOM' and ref_page = afw$migrt$pkg.obten_var_page(483, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35050_SEQNC' and ref_page = afw$migrt$pkg.obten_var_page(483, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_page(484, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_page(484, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = afw$migrt$pkg.obten_var_page(484, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'MULTI_ROW_DELETE' and ref_page = afw$migrt$pkg.obten_var_page(484, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_INDIC_SYSTM' and ref_page = afw$migrt$pkg.obten_var_page(183, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_item');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item_lang;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_item_lang');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_page_item_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_condt_piltb;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_condt_piltb');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_condt_piltb');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_lien_condt_piltb;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_lien_condt_piltb');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_lien_condt_piltb');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_regn_piltb;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_regn_piltb');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_regn_piltb');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_regn_piltb_lang;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_regn_piltb_lang');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_regn_piltb_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_prefr;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_prefr');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_prefr');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_tutrl;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_tutrl');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_tutrl');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_etape_tutrl;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_etape_tutrl');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_etape_tutrl');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_11_aplic
                       set ref_versn = afw$migrt$pkg.obten_var_versn(17, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = afw$migrt$pkg.obten_var_aplic(1, 'Update'),
                           ref_page_conxn = afw$migrt$pkg.obten_var_page(175, 'Update')
                     where seqnc = afw$migrt$pkg.obten_var_aplic(7);
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_aplic');
end;
/
begin
  if afw$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('...Mise a jour du referentiel APEX');
    afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_aplic(7),'O');
  end if;
end;
/

