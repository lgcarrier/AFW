set define off
set serveroutput on
set feedback off


prompt ========================================
prompt Installation de l'application: SAFM - Methodologie

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFM');
  afw$migrt$pkg.var_3928(8) := afw_11_aplic_pkg.maj_aplic ('SAFM','Méthodologie',1000006, afw$migrt$pkg.vnu_seqnc_prodt);

  afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_3928(8),'O');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFM');
end;
/


prompt ...Metadonnees des entites
prompt ......versn
--Debut - afw_11_versn
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_11_versn');
delete from tc$11$versn;

insert into APEXFRAMEWORK.tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 'O', null, 4, 4, 0, 0, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, null, 18);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_11_versn');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_11_versn');
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
            where t.dnr_ref_aplic = afw$migrt$pkg.var_3928(8)
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
select seqnc into afw$migrt$pkg.var_4086(18) from apexframework.afw_11_versn where code = '0100' and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select') and ref_plugn is null and ref_prodt is null;
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

insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 233);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Accueil', 1, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 234);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Planification', 2, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 235);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 236);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Commentaire', 102, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 237);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des produits', 1001, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 238);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Équipes', 1011, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 239);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Équipe', 1012, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 240);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Lien équipe', 1013, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 241);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Jalons', 1021, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 242);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Jalon', 1022, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 243);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Équipe jalon', 1023, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 244);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Disponibilités', 1031, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 245);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Disponibilité', 1032, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 246);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Rôles', 1041, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 247);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Rôle', 1042, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 248);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Rôle utilisateur', 1043, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 249);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Tâches', 1051, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 250);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page');
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Tâche', 1052, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 251);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Affectations', 1053, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 252);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Planification efforts', 1054, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 253);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mes tâches', 1055, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 254);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Consulter une tâche', 1056, null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), 255);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_page');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_page');
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
select seqnc into afw$migrt$pkg.var_3918(233) from apexframework.afw_13_page where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(234) from apexframework.afw_13_page where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(235) from apexframework.afw_13_page where numr_apex = 2 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(236) from apexframework.afw_13_page where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(237) from apexframework.afw_13_page where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(238) from apexframework.afw_13_page where numr_apex = 1001 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(239) from apexframework.afw_13_page where numr_apex = 1011 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(240) from apexframework.afw_13_page where numr_apex = 1012 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(241) from apexframework.afw_13_page where numr_apex = 1013 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(242) from apexframework.afw_13_page where numr_apex = 1021 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(243) from apexframework.afw_13_page where numr_apex = 1022 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(244) from apexframework.afw_13_page where numr_apex = 1023 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(245) from apexframework.afw_13_page where numr_apex = 1031 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(246) from apexframework.afw_13_page where numr_apex = 1032 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(247) from apexframework.afw_13_page where numr_apex = 1041 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(248) from apexframework.afw_13_page where numr_apex = 1042 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(249) from apexframework.afw_13_page where numr_apex = 1043 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(250) from apexframework.afw_13_page where numr_apex = 1051 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page');
select seqnc into afw$migrt$pkg.var_3918(251) from apexframework.afw_13_page where numr_apex = 1052 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(252) from apexframework.afw_13_page where numr_apex = 1053 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(253) from apexframework.afw_13_page where numr_apex = 1054 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(254) from apexframework.afw_13_page where numr_apex = 1055 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
select seqnc into afw$migrt$pkg.var_3918(255) from apexframework.afw_13_page where numr_apex = 1056 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Tâche', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(251, 'Insert'), 234);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Rôle utilisateur', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(249, 'Insert'), 235);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Équipe', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(244, 'Insert'), 236);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Jalons', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(242, 'Insert'), 237);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Rôle', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(248, 'Insert'), 238);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Jalon', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(243, 'Insert'), 239);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Affectations', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(253, 'Insert'), 240);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Page de connexion', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(236, 'Insert'), 241);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Disponibilités', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(245, 'Insert'), 242);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Méthodologie', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(234, 'Insert'), 243);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Disponibilité', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(246, 'Insert'), 244);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Page commune', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(233, 'Insert'), 245);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Planification', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(235, 'Insert'), 246);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Équipe', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(240, 'Insert'), 247);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Consulter une tâche', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(255, 'Insert'), 248);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Effort', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(252, 'Insert'), 249);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Équipes', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(239, 'Insert'), 250);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Tâches', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(250, 'Insert'), 251);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Produits', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(238, 'Insert'), 252);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Membre', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(241, 'Insert'), 253);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Rôles', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(247, 'Insert'), 254);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Commentaire', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(237, 'Insert'), 255);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'Mes tâches', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(254, 'Insert'), 256);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_page_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_page_lang');
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
              insert (t.dnr_ref_aplic, t.nom, t.ref_dv_type_expre, t.ref_lang, t.ref_page)
              values (tf.dnr_ref_aplic, tf.nom, tf.ref_dv_type_expre, tf.ref_lang, tf.ref_page)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.nom = tf.nom, t.ref_dv_type_expre = tf.ref_dv_type_expre
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
select seqnc into afw$migrt$pkg.var_4041(234) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_4041(235) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_4041(236) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_4041(237) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(242, 'Select');
select seqnc into afw$migrt$pkg.var_4041(238) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_4041(239) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_4041(240) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
select seqnc into afw$migrt$pkg.var_4041(241) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
select seqnc into afw$migrt$pkg.var_4041(242) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(245, 'Select');
select seqnc into afw$migrt$pkg.var_4041(243) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(234, 'Select');
select seqnc into afw$migrt$pkg.var_4041(244) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_4041(245) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_4041(246) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(235, 'Select');
select seqnc into afw$migrt$pkg.var_4041(247) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_4041(248) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_4041(249) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(252, 'Select');
select seqnc into afw$migrt$pkg.var_4041(250) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(239, 'Select');
select seqnc into afw$migrt$pkg.var_4041(251) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(250, 'Select');
select seqnc into afw$migrt$pkg.var_4041(252) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(238, 'Select');
select seqnc into afw$migrt$pkg.var_4041(253) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_4041(254) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(247, 'Select');
select seqnc into afw$migrt$pkg.var_4041(255) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
select seqnc into afw$migrt$pkg.var_4041(256) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(254, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Liste des produits', 1, afw$migrt$pkg.obten_var_3918(238, 'Insert'), 2420, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Membres', 1, afw$migrt$pkg.obten_var_3918(240, 'Insert'), 2421, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Équipes', 1, afw$migrt$pkg.obten_var_3918(243, 'Insert'), 2422, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Affectation', 1, afw$migrt$pkg.obten_var_3918(248, 'Insert'), 2423, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Équipes', 1, afw$migrt$pkg.obten_var_3918(239, 'Insert'), 114, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Jalons', 1, afw$migrt$pkg.obten_var_3918(242, 'Insert'), 115, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Mes tâches', 1, afw$migrt$pkg.obten_var_3918(254, 'Insert'), 2424, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Disponibilités utilisateurs', 1, afw$migrt$pkg.obten_var_3918(245, 'Insert'), 117, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Rôles', 1, afw$migrt$pkg.obten_var_3918(247, 'Insert'), 118, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(8, 'Insert'), 'N', null, 'Tâches', 1, afw$migrt$pkg.obten_var_3918(250, 'Insert'), 120, null);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_page_ir');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_page_ir');
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
select seqnc into afw$migrt$pkg.var_3919(2420) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(238, 'Select');
select seqnc into afw$migrt$pkg.var_3919(2421) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3919(2422) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3919(2423) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3919(114) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(239, 'Select');
select seqnc into afw$migrt$pkg.var_3919(115) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(242, 'Select');
select seqnc into afw$migrt$pkg.var_3919(2424) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(254, 'Select');
select seqnc into afw$migrt$pkg.var_3919(117) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(245, 'Select');
select seqnc into afw$migrt$pkg.var_3919(118) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(247, 'Select');
select seqnc into afw$migrt$pkg.var_3919(120) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(250, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456766239635401708, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(117, 'Insert'), 619, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456766344688401710, 'O', null, 'Utilisateur', 2, afw$migrt$pkg.obten_var_3919(117, 'Insert'), 620, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456766446609401711, 'O', null, 'Debut effectivité', 3, afw$migrt$pkg.obten_var_3919(117, 'Insert'), 621, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('EFORT_DISPN_SEMN', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456766537222401711, 'O', null, 'Effort disponible', 4, afw$migrt$pkg.obten_var_3919(117, 'Insert'), 622, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456766630657401711, 'O', null, 'Fin effectivité', 5, afw$migrt$pkg.obten_var_3919(117, 'Insert'), 623, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456804625609591164, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(118, 'Insert'), 624, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456804730253591165, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_3919(118, 'Insert'), 625, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456804834924591165, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_3919(118, 'Insert'), 626, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456804945120591165, 'O', null, 'Description', 4, afw$migrt$pkg.obten_var_3919(118, 'Insert'), 627, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_INSCR', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 479300123339227584, 'O', null, 'Date inscription', 14, afw$migrt$pkg.obten_var_3919(120, 'Insert'), 628, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456604726227000102, 'O', null, 'Nom', 4, afw$migrt$pkg.obten_var_3919(115, 'Insert'), 634, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456902423851104448, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(120, 'Insert'), 636, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_SIGNF', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456902541441104448, 'O', null, 'Numéro', 2, afw$migrt$pkg.obten_var_3919(120, 'Insert'), 637, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456902723966104449, 'O', null, 'Nom', 4, afw$migrt$pkg.obten_var_3919(120, 'Insert'), 638, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_ENVIR_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456903420186104451, 'O', null, 'Environnement', 11, afw$migrt$pkg.obten_var_3919(120, 'Insert'), 639, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_PRIOR_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456903528923104451, 'O', null, 'Priorité', 12, afw$migrt$pkg.obten_var_3919(120, 'Insert'), 640, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STAT_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456903633911104451, 'O', null, 'Statut', 13, afw$migrt$pkg.obten_var_3919(120, 'Insert'), 641, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456613147364082191, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(114, 'Insert'), 649, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456613241608082192, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_3919(114, 'Insert'), 650, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456613331618082192, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_3919(114, 'Insert'), 651, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456613441886082192, 'O', null, 'Description', 4, afw$migrt$pkg.obten_var_3919(114, 'Insert'), 652, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456603039842955400, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(115, 'Insert'), 653, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_PREVU', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456603247432955401, 'O', null, 'Date prévue', 3, afw$migrt$pkg.obten_var_3919(115, 'Insert'), 654, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_NATR_TACHE_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 486034219560213597, 'O', null, 'Nature', 21, afw$migrt$pkg.obten_var_3919(120, 'Insert'), 655, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 486034338406213598, 'O', null, 'Produit', 22, afw$migrt$pkg.obten_var_3919(120, 'Insert'), 656, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456630419351618337, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(2420, 'Insert'), 17801, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456630545061618338, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_3919(2420, 'Insert'), 17802, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456630628450618340, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_3919(2420, 'Insert'), 17803, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456675448652875891, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(2421, 'Insert'), 17804, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_EQUIP', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456675531745875891, 'O', null, 'Équipe', 2, afw$migrt$pkg.obten_var_3919(2421, 'Insert'), 17805, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456675643324875892, 'O', null, 'Utilisateur', 3, afw$migrt$pkg.obten_var_3919(2421, 'Insert'), 17806, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456675735863875892, 'O', null, 'Début effectivité', 4, afw$migrt$pkg.obten_var_3919(2421, 'Insert'), 17807, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456675819768875892, 'O', null, 'Fin effectivité', 5, afw$migrt$pkg.obten_var_3919(2421, 'Insert'), 17808, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('POURC_IMPLI_EQUIP', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456675950708875892, 'O', null, 'Pourcentage', 6, afw$migrt$pkg.obten_var_3919(2421, 'Insert'), 17809, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456713934433037159, 'O', null, 'Utilisateur', 7, afw$migrt$pkg.obten_var_3919(2421, 'Insert'), 17810, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456665924366694157, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(2422, 'Insert'), 17811, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_EQUIP_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456666048204694158, 'O', null, 'Équipe', 2, afw$migrt$pkg.obten_var_3919(2422, 'Insert'), 17812, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456666225777694158, 'O', null, 'Début effectivité', 4, afw$migrt$pkg.obten_var_3919(2422, 'Insert'), 17813, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456666319564694158, 'O', null, 'Fin effectivité', 5, afw$migrt$pkg.obten_var_3919(2422, 'Insert'), 17814, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('POURC_AFECT_EQUIP_JALON', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456666449024694158, 'O', null, 'Pourcentage affecté', 6, afw$migrt$pkg.obten_var_3919(2422, 'Insert'), 17815, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456846724906257114, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(2423, 'Insert'), 17816, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_ROLE', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456846837944257115, 'O', null, 'Ref Role', 2, afw$migrt$pkg.obten_var_3919(2423, 'Insert'), 17817, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456846927031257115, 'O', null, 'Ref Utils', 3, afw$migrt$pkg.obten_var_3919(2423, 'Insert'), 17818, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456847049296257115, 'O', null, 'Début effectivité', 4, afw$migrt$pkg.obten_var_3919(2423, 'Insert'), 17819, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456847127458257115, 'O', null, 'Fin effectivité', 5, afw$migrt$pkg.obten_var_3919(2423, 'Insert'), 17820, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 456881834660813370, 'O', null, 'Utilisateur', 6, afw$migrt$pkg.obten_var_3919(2423, 'Insert'), 17821, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 532983727436719382, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17822, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_SIGNF', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 532983847431719386, 'O', null, 'Numéro', 2, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17823, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 532983933484719386, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17824, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_ENVIR_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 532984022677719386, 'O', null, 'Environnement', 4, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17825, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 532984134125719387, 'O', null, 'Produit', 5, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17826, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_NATR_TACHE_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 532984222612719388, 'O', null, 'Nature ', 6, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17827, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_PRIOR_FORMT', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 532984321187719388, 'O', null, 'Priorité', 7, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17828, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_PRIOR', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 532998931021736655, 'O', null, 'Ref Dv Prior', 8, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17829, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 532999641167872100, 'O', null, 'Ref Utils', 9, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17830, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STAT_REALS', afw$migrt$pkg.obten_var_3928(8, 'Insert'), 533564440395110972, 'O', null, 'Ref Stat Reals', 10, afw$migrt$pkg.obten_var_3919(2424, 'Insert'), 17831, null);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_page_ir_coln');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_page_ir_coln');
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
select seqnc into afw$migrt$pkg.var_3895(619) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
select seqnc into afw$migrt$pkg.var_3895(620) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
select seqnc into afw$migrt$pkg.var_3895(621) from apexframework.afw_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
select seqnc into afw$migrt$pkg.var_3895(622) from apexframework.afw_13_page_ir_coln where coln_table = 'EFORT_DISPN_SEMN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
select seqnc into afw$migrt$pkg.var_3895(623) from apexframework.afw_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
select seqnc into afw$migrt$pkg.var_3895(624) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(118, 'Select');
select seqnc into afw$migrt$pkg.var_3895(625) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(118, 'Select');
select seqnc into afw$migrt$pkg.var_3895(626) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(118, 'Select');
select seqnc into afw$migrt$pkg.var_3895(627) from apexframework.afw_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(118, 'Select');
select seqnc into afw$migrt$pkg.var_3895(628) from apexframework.afw_13_page_ir_coln where coln_table = 'DATE_INSCR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
select seqnc into afw$migrt$pkg.var_3895(634) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(115, 'Select');
select seqnc into afw$migrt$pkg.var_3895(636) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
select seqnc into afw$migrt$pkg.var_3895(637) from apexframework.afw_13_page_ir_coln where coln_table = 'NUMR_SIGNF' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
select seqnc into afw$migrt$pkg.var_3895(638) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
select seqnc into afw$migrt$pkg.var_3895(639) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
select seqnc into afw$migrt$pkg.var_3895(640) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
select seqnc into afw$migrt$pkg.var_3895(641) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_STAT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
select seqnc into afw$migrt$pkg.var_3895(649) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(114, 'Select');
select seqnc into afw$migrt$pkg.var_3895(650) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(114, 'Select');
select seqnc into afw$migrt$pkg.var_3895(651) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(114, 'Select');
select seqnc into afw$migrt$pkg.var_3895(652) from apexframework.afw_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(114, 'Select');
select seqnc into afw$migrt$pkg.var_3895(653) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(115, 'Select');
select seqnc into afw$migrt$pkg.var_3895(654) from apexframework.afw_13_page_ir_coln where coln_table = 'DATE_PREVU' and ref_page_ir = afw$migrt$pkg.obten_var_3919(115, 'Select');
select seqnc into afw$migrt$pkg.var_3895(655) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
select seqnc into afw$migrt$pkg.var_3895(656) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17801) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2420, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17802) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2420, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17803) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2420, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17804) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17805) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_EQUIP' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17806) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17807) from apexframework.afw_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17808) from apexframework.afw_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17809) from apexframework.afw_13_page_ir_coln where coln_table = 'POURC_IMPLI_EQUIP' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17810) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17811) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17812) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_EQUIP_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17813) from apexframework.afw_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17814) from apexframework.afw_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17815) from apexframework.afw_13_page_ir_coln where coln_table = 'POURC_AFECT_EQUIP_JALON' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17816) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17817) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_ROLE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17818) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17819) from apexframework.afw_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17820) from apexframework.afw_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17821) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17822) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17823) from apexframework.afw_13_page_ir_coln where coln_table = 'NUMR_SIGNF' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17824) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17825) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17826) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17827) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17828) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17829) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_DV_PRIOR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17830) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17831) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_STAT_REALS' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
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

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_page_prefr_navgt');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_page_prefr_navgt');
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

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_liste_navgt');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_liste_navgt');
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

insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1929812243662374433, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', afw$migrt$pkg.obten_var_3918(237, 'Insert'), 1795, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1929812451604374433, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', afw$migrt$pkg.obten_var_3918(237, 'Insert'), 1796, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1929812951375374433, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', afw$migrt$pkg.obten_var_3918(237, 'Insert'), 1797, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1262400684601292385, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', afw$migrt$pkg.obten_var_3918(237, 'Insert'), 1798, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453030800639773745, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_3918(239, 'Insert'), 1799, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456610638012082171, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1012_SEQNC', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1800, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456610827753082180, 'O', null, null, null, null, 'O', null, 'Code', 'P1012_CODE', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1801, 'ITEM');
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
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456611028177082181, 'O', null, null, null, null, 'O', null, 'Nom', 'P1012_NOM', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1802, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456611221099082181, 'O', null, null, null, null, 'O', null, 'Description', 'P1012_DESCR', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1803, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456704419419749073, 'O', null, null, null, null, 'N', null, '[P1012_LIEN_EQUIP]', 'P1012_LIEN_EQUIP', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1804, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453026615784773718, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1805, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453026317409773718, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1806, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453026207016773718, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1807, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453087218067470956, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREER_LIEN_EQUIP', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1808, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453026416313773718, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(240, 'Insert'), 1809, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456690931971383727, 'O', null, null, null, null, 'O', null, '[P1013_SEQNC]', 'P1013_SEQNC', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1810, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456691123445390704, 'O', null, null, null, null, 'O', null, '[P1013_REF_EQUIP]', 'P1013_REF_EQUIP', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1811, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456691922714437799, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P1013_REF_UTILS', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1812, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456692525270447998, 'O', null, null, null, null, 'O', null, 'Date début effectif', 'P1013_DEBUT_EFECT', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1813, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456692718821455555, 'O', null, null, null, null, 'O', null, 'Date fin effectif', 'P1013_FIN_EFECT', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1814, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456693128995467941, 'O', null, null, null, null, 'O', null, 'Pourcentage d''implication', 'P1013_POURC_IMPLI_EQUIP', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1815, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453098019657736236, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1816, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453099325245766291, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1817, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453107507621063928, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1818, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453107211514046104, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(241, 'Insert'), 1819, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453020922802646956, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_3918(242, 'Insert'), 1820, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456600848134955374, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1022_SEQNC', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1821, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456601018129955381, 'O', null, null, null, null, 'O', null, 'Nom', 'P1022_NOM', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1822, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456601224925955382, 'O', null, null, null, null, 'O', null, '[P1022_REF_PRODT]', 'P1022_REF_PRODT', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1823, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456601437732955382, 'O', null, null, null, null, 'O', null, 'Date prévue', 'P1022_DATE_PREVU', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1824, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456695642594528611, 'O', null, null, null, null, 'N', null, '[P1022_JALON_EQUIP]', 'P1022_JALON_EQUIP', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1825, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453016923090646910, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1826, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453086032349456133, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREER_JALON_EQUIP', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1827, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453016611514646910, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1828, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453016509512646910, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1829, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453016709197646910, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(243, 'Insert'), 1830, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456679018288991833, 'O', null, null, null, null, 'O', null, '[P1023_REF_JALON]', 'P1023_REF_JALON', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1831, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456681238337044917, 'O', null, null, null, null, 'O', null, '[P1023_SEQNC]', 'P1023_SEQNC', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1832, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456681730157052015, 'O', null, null, null, null, 'O', null, 'Début effectivité', 'P1023_DEBUT_EFEC', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1833, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456681942277055513, 'O', null, null, null, null, 'O', null, 'Fin effectivité', 'P1023_FIN_EFECT', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1834, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456682634490091113, 'O', null, null, null, null, 'O', null, 'Équipe', 'P1023_REF_EQUIP', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1835, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456702227637694630, 'O', null, null, null, null, 'O', null, 'Pourcentage affecté', 'P1023_POURC_AFECT_EQUIP_JALON', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1836, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453095208089647752, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1837, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453093626050624590, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1838, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453094324927643248, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1839, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453093925489633922, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(244, 'Insert'), 1840, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456772830630578836, 'O', null, null, null, null, 'N', null, '[P1031_DISPN_UTILS]', 'P1031_DISPN_UTILS', afw$migrt$pkg.obten_var_3918(245, 'Insert'), 1841, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453183915405093263, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREATE', afw$migrt$pkg.obten_var_3918(245, 'Insert'), 1842, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456763639232401682, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1032_SEQNC', afw$migrt$pkg.obten_var_3918(246, 'Insert'), 1843, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456764226065401692, 'O', null, null, null, null, 'O', null, 'Début effectivitée', 'P1032_DEBUT_EFECT', afw$migrt$pkg.obten_var_3918(246, 'Insert'), 1844, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456764435406401692, 'O', null, null, null, null, 'O', null, 'Effort disponible', 'P1032_EFORT_DISPN_SEMN', afw$migrt$pkg.obten_var_3918(246, 'Insert'), 1845, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456764634476401692, 'O', null, null, null, null, 'O', null, 'Date début effectivitée', 'P1032_FIN_EFECT', afw$migrt$pkg.obten_var_3918(246, 'Insert'), 1846, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456796643807434129, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P1032_REF_UTILS', afw$migrt$pkg.obten_var_3918(246, 'Insert'), 1847, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453179605616093230, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(246, 'Insert'), 1848, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453179300461093230, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(246, 'Insert'), 1849, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453179232342093230, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(246, 'Insert'), 1850, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453179428170093230, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(246, 'Insert'), 1851, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453222218032282718, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_3918(247, 'Insert'), 1852, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456802431386591143, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1042_SEQNC', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1853, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456802632555591151, 'O', null, null, null, null, 'O', null, 'Code', 'P1042_CODE', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1854, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456802821128591152, 'O', null, null, null, null, 'O', null, 'Nom', 'P1042_NOM', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1855, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456803031294591152, 'O', null, null, null, null, 'O', null, 'Description', 'P1042_DESCR', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1856, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456848419190316916, 'O', null, null, null, null, 'N', null, '[P1042_ROLE_UTILS]', 'P1042_ROLE_UTILS', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1857, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453218401688282688, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1858, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453218126000282688, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1859, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453218029888282688, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1860, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453266413933031103, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREER_ROLE_UTILS', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1861, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453218200548282688, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(248, 'Insert'), 1862, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456871046500646537, 'O', null, null, null, null, 'O', null, '[P1043_SEQNC]', 'P1043_SEQNC', afw$migrt$pkg.obten_var_3918(249, 'Insert'), 1863, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456871438320653640, 'O', null, null, null, null, 'O', null, '[P1043_REF_ROLE]', 'P1043_REF_ROLE', afw$migrt$pkg.obten_var_3918(249, 'Insert'), 1864, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456873735166699972, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P1043_REF_UTILS', afw$migrt$pkg.obten_var_3918(249, 'Insert'), 1865, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456874230926717688, 'O', null, null, null, null, 'O', null, 'Date début effectif', 'P1043_DEBUT_EFECT', afw$migrt$pkg.obten_var_3918(249, 'Insert'), 1866, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456874433481727899, 'O', null, null, null, null, 'O', null, 'Date fin effectif', 'P1043_FIN_EFECT', afw$migrt$pkg.obten_var_3918(249, 'Insert'), 1867, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453284129591291116, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(249, 'Insert'), 1868, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453286705612303102, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(249, 'Insert'), 1869, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453287731154329400, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(249, 'Insert'), 1870, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453287418556316304, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(249, 'Insert'), 1871, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453321028221796006, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_3918(250, 'Insert'), 1872, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456897136743104413, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1052_SEQNC', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1873, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456897330602104422, 'O', null, null, null, null, 'O', null, 'Numéro', 'P1052_NUMR_SIGNF', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1874, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456897730270104424, 'O', null, null, null, null, 'O', null, 'Nom', 'P1052_NOM', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1875, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456897941653104424, 'O', null, null, null, null, 'O', null, 'Description', 'P1052_DESCR', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1876, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456899122852104428, 'O', null, null, null, null, 'O', null, 'Environnement', 'P1052_REF_ENVIR', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1877, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456899338930104428, 'O', null, null, null, null, 'O', null, 'Priorité', 'P1052_REF_DV_PRIOR', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1878, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456899531811104428, 'O', null, null, null, null, 'O', null, 'Statut', 'P1052_REF_STAT', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1879, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 456899750186104429, 'O', null, null, null, null, 'O', null, 'Commentaire', 'P1052_COMNT', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1880, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 485937428808966829, 'O', null, null, null, null, 'N', null, 'Date inscription', 'P1052_DATE_INSCR', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1881, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 485942720441210381, 'O', null, null, null, null, 'O', null, 'Nature de la tâche', 'P1052_REF_NATR_TACHE', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1882, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 485944139797263209, 'O', null, null, null, null, 'O', null, 'Produit', 'P1052_REF_PRODT', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1883, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 486806641102875421, 'O', null, null, null, null, 'N', null, 'Complexité', 'P1052_REF_DV_COMPL', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1884, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 486911323064087529, 'O', null, null, null, null, 'N', null, '[P1052_PLANIF_EFORT]', 'P1052_PLANIF_EFORT', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1885, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 488769730767881068, 'O', null, null, null, null, 'N', null, 'Jalon', 'P1052_REF_JALON', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1886, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 510280222891290485, 'O', null, null, null, null, 'N', null, '[P1052_AFECT]', 'P1052_AFECT', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1887, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453313108711795955, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1888, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453312832067795955, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1889, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453312707860795955, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1890, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453312932508795955, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1891, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 483321628205530330, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITER_PLANIF_EFORT', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1892, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 483354329336287519, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITER_AFECT', afw$migrt$pkg.obten_var_3918(251, 'Insert'), 1893, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 487145247485475576, 'O', null, null, null, null, 'O', null, 'Utilisateurs', 'P1053_REF_UTILS', afw$migrt$pkg.obten_var_3918(252, 'Insert'), 1894, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 487147323918667427, 'O', null, null, null, null, 'O', null, '[P1053_SEQNC]', 'P1053_SEQNC', afw$migrt$pkg.obten_var_3918(252, 'Insert'), 1895, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453477800247562723, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(252, 'Insert'), 1896, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 453477510045562723, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(252, 'Insert'), 1897, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 487119232249771153, 'O', null, null, null, null, 'O', null, 'Rôle', 'P1054_REF_ROLE_FORMT', afw$migrt$pkg.obten_var_3918(253, 'Insert'), 1898, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 483379803047163082, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', afw$migrt$pkg.obten_var_3918(253, 'Insert'), 1900, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 483379531770163082, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(253, 'Insert'), 1901, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 483379606561163082, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SUBMIT', afw$migrt$pkg.obten_var_3918(253, 'Insert'), 1902, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533009821953419858, 'O', null, null, null, null, 'O', null, 'Numéro', 'P1056_NUMR_SIGNF', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1903, 'ITEM');
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
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533010026866419861, 'O', null, null, null, null, 'O', null, 'Nom', 'P1056_NOM', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1904, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533010244450419861, 'O', null, null, null, null, 'O', null, 'Description', 'P1056_DESCR', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1905, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533010427815419862, 'O', null, null, null, null, 'O', null, 'Priorité', 'P1056_REF_DV_PRIOR', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1906, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533010624826419862, 'O', null, null, null, null, 'O', null, 'Statut', 'P1056_REF_STAT', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1907, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533010844224419862, 'O', null, null, null, null, 'O', null, 'Commentaire', 'P1056_COMNT', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1908, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533011041359419863, 'O', null, null, null, null, 'N', null, 'Complexité', 'P1056_REF_DV_COMPL', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1909, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533011242380419863, 'O', null, null, null, null, 'O', null, 'Date inscription', 'P1056_DATE_INSCR', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1910, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533011432112419863, 'O', null, null, null, null, 'N', null, 'Jalon', 'P1056_REF_JALON', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1911, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533011649461419864, 'O', null, null, null, null, 'O', null, 'Nature de la tâche', 'P1056_REF_NATR_TACHE', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1912, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533012643215419869, 'O', null, null, null, null, 'O', null, 'Environnement', 'P1056_REF_ENVIR', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1913, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533012829108419869, 'O', null, null, null, null, 'O', null, 'Produit', 'P1056_REF_PRODT', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1914, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533015048123419875, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1056_SEQNC', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1915, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533015232086419876, 'O', null, null, null, null, 'N', null, '[P1056_PLANIF_EFORT]', 'P1056_PLANIF_EFORT', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1916, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 533572518988634574, 'O', null, null, null, null, 'O', null, 'Précision de réalisation', 'P1056_REF_STAT_REALS', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1917, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 529431527620111425, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1918, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 529431706585111425, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1919, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 529431908869111425, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1920, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 529431324720111424, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1921, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 529448821260849714, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITER', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1922, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 529984310109111121, 'N', null, null, null, null, 'N', null, 'Consulter', 'CONSULTER', afw$migrt$pkg.obten_var_3918(255, 'Insert'), 1923, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1555815858696562817, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1775, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1556154677118182298, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1776, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1577639161109238962, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1777, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1600379477506406595, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1778, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1600379682701408118, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1779, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1600379887549409465, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1780, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1672093221206470408, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1781, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1526270456949481907, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1782, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1555815456232562815, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1783, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1555815683706562817, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', afw$migrt$pkg.obten_var_3918(233, 'Insert'), 1784, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1526569236949039059, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', afw$migrt$pkg.obten_var_3918(236, 'Insert'), 1785, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1526569445333039060, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', afw$migrt$pkg.obten_var_3918(236, 'Insert'), 1786, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1526569837217039060, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', afw$migrt$pkg.obten_var_3918(236, 'Insert'), 1788, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1526570037181039061, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', afw$migrt$pkg.obten_var_3918(236, 'Insert'), 1789, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1526570230662039061, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', afw$migrt$pkg.obten_var_3918(236, 'Insert'), 1790, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1929810544890374428, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', afw$migrt$pkg.obten_var_3918(237, 'Insert'), 1791, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1929811048714374431, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', afw$migrt$pkg.obten_var_3918(237, 'Insert'), 1792, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1929811528641374431, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', afw$migrt$pkg.obten_var_3918(237, 'Insert'), 1793, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1929811745567374432, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', afw$migrt$pkg.obten_var_3918(237, 'Insert'), 1794, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 1526569634664039060, 'N', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', afw$migrt$pkg.obten_var_3918(236, 'Insert'), 12771, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(8, 'Insert'), null, 487120522253796591, 'N', null, null, null, null, 'N', null, 'Ajouter', 'P1054_AJOUTER', afw$migrt$pkg.obten_var_3918(253, 'Insert'), 12772, 'BOUTN');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_page_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_page_item');
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
select seqnc into afw$migrt$pkg.var_3909(1795) from apexframework.afw_13_page_item where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1796) from apexframework.afw_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1797) from apexframework.afw_13_page_item where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1798) from apexframework.afw_13_page_item where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1799) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(239, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1800) from apexframework.afw_13_page_item where nom_apex = 'P1012_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1801) from apexframework.afw_13_page_item where nom_apex = 'P1012_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
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
select seqnc into afw$migrt$pkg.var_3909(1802) from apexframework.afw_13_page_item where nom_apex = 'P1012_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1803) from apexframework.afw_13_page_item where nom_apex = 'P1012_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1804) from apexframework.afw_13_page_item where nom_apex = 'P1012_LIEN_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1805) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1806) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1807) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1808) from apexframework.afw_13_page_item where nom_apex = 'CREER_LIEN_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1809) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1810) from apexframework.afw_13_page_item where nom_apex = 'P1013_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1811) from apexframework.afw_13_page_item where nom_apex = 'P1013_REF_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1812) from apexframework.afw_13_page_item where nom_apex = 'P1013_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1813) from apexframework.afw_13_page_item where nom_apex = 'P1013_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1814) from apexframework.afw_13_page_item where nom_apex = 'P1013_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1815) from apexframework.afw_13_page_item where nom_apex = 'P1013_POURC_IMPLI_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1816) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1817) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1818) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1819) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1820) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(242, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1821) from apexframework.afw_13_page_item where nom_apex = 'P1022_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1822) from apexframework.afw_13_page_item where nom_apex = 'P1022_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1823) from apexframework.afw_13_page_item where nom_apex = 'P1022_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1824) from apexframework.afw_13_page_item where nom_apex = 'P1022_DATE_PREVU' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1825) from apexframework.afw_13_page_item where nom_apex = 'P1022_JALON_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1826) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1827) from apexframework.afw_13_page_item where nom_apex = 'CREER_JALON_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1828) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1829) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1830) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1831) from apexframework.afw_13_page_item where nom_apex = 'P1023_REF_JALON' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1832) from apexframework.afw_13_page_item where nom_apex = 'P1023_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1833) from apexframework.afw_13_page_item where nom_apex = 'P1023_DEBUT_EFEC' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1834) from apexframework.afw_13_page_item where nom_apex = 'P1023_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1835) from apexframework.afw_13_page_item where nom_apex = 'P1023_REF_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1836) from apexframework.afw_13_page_item where nom_apex = 'P1023_POURC_AFECT_EQUIP_JALON' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1837) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1838) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1839) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1840) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1841) from apexframework.afw_13_page_item where nom_apex = 'P1031_DISPN_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(245, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1842) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(245, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1843) from apexframework.afw_13_page_item where nom_apex = 'P1032_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1844) from apexframework.afw_13_page_item where nom_apex = 'P1032_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1845) from apexframework.afw_13_page_item where nom_apex = 'P1032_EFORT_DISPN_SEMN' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1846) from apexframework.afw_13_page_item where nom_apex = 'P1032_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1847) from apexframework.afw_13_page_item where nom_apex = 'P1032_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1848) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1849) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1850) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1851) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1852) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(247, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1853) from apexframework.afw_13_page_item where nom_apex = 'P1042_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1854) from apexframework.afw_13_page_item where nom_apex = 'P1042_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1855) from apexframework.afw_13_page_item where nom_apex = 'P1042_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1856) from apexframework.afw_13_page_item where nom_apex = 'P1042_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1857) from apexframework.afw_13_page_item where nom_apex = 'P1042_ROLE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1858) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1859) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1860) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1861) from apexframework.afw_13_page_item where nom_apex = 'CREER_ROLE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1862) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1863) from apexframework.afw_13_page_item where nom_apex = 'P1043_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1864) from apexframework.afw_13_page_item where nom_apex = 'P1043_REF_ROLE' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1865) from apexframework.afw_13_page_item where nom_apex = 'P1043_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1866) from apexframework.afw_13_page_item where nom_apex = 'P1043_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1867) from apexframework.afw_13_page_item where nom_apex = 'P1043_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1868) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1869) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1870) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1871) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1872) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(250, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1873) from apexframework.afw_13_page_item where nom_apex = 'P1052_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1874) from apexframework.afw_13_page_item where nom_apex = 'P1052_NUMR_SIGNF' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1875) from apexframework.afw_13_page_item where nom_apex = 'P1052_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1876) from apexframework.afw_13_page_item where nom_apex = 'P1052_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1877) from apexframework.afw_13_page_item where nom_apex = 'P1052_REF_ENVIR' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1878) from apexframework.afw_13_page_item where nom_apex = 'P1052_REF_DV_PRIOR' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1879) from apexframework.afw_13_page_item where nom_apex = 'P1052_REF_STAT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1880) from apexframework.afw_13_page_item where nom_apex = 'P1052_COMNT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1881) from apexframework.afw_13_page_item where nom_apex = 'P1052_DATE_INSCR' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1882) from apexframework.afw_13_page_item where nom_apex = 'P1052_REF_NATR_TACHE' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1883) from apexframework.afw_13_page_item where nom_apex = 'P1052_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1884) from apexframework.afw_13_page_item where nom_apex = 'P1052_REF_DV_COMPL' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1885) from apexframework.afw_13_page_item where nom_apex = 'P1052_PLANIF_EFORT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1886) from apexframework.afw_13_page_item where nom_apex = 'P1052_REF_JALON' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1887) from apexframework.afw_13_page_item where nom_apex = 'P1052_AFECT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1888) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1889) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1890) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1891) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1892) from apexframework.afw_13_page_item where nom_apex = 'EDITER_PLANIF_EFORT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1893) from apexframework.afw_13_page_item where nom_apex = 'EDITER_AFECT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1894) from apexframework.afw_13_page_item where nom_apex = 'P1053_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(252, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1895) from apexframework.afw_13_page_item where nom_apex = 'P1053_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(252, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1896) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(252, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1897) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(252, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1898) from apexframework.afw_13_page_item where nom_apex = 'P1054_REF_ROLE_FORMT' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1900) from apexframework.afw_13_page_item where nom_apex = 'ADD' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1901) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1902) from apexframework.afw_13_page_item where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1903) from apexframework.afw_13_page_item where nom_apex = 'P1056_NUMR_SIGNF' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
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
select seqnc into afw$migrt$pkg.var_3909(1904) from apexframework.afw_13_page_item where nom_apex = 'P1056_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1905) from apexframework.afw_13_page_item where nom_apex = 'P1056_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1906) from apexframework.afw_13_page_item where nom_apex = 'P1056_REF_DV_PRIOR' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1907) from apexframework.afw_13_page_item where nom_apex = 'P1056_REF_STAT' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1908) from apexframework.afw_13_page_item where nom_apex = 'P1056_COMNT' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1909) from apexframework.afw_13_page_item where nom_apex = 'P1056_REF_DV_COMPL' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1910) from apexframework.afw_13_page_item where nom_apex = 'P1056_DATE_INSCR' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1911) from apexframework.afw_13_page_item where nom_apex = 'P1056_REF_JALON' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1912) from apexframework.afw_13_page_item where nom_apex = 'P1056_REF_NATR_TACHE' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1913) from apexframework.afw_13_page_item where nom_apex = 'P1056_REF_ENVIR' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1914) from apexframework.afw_13_page_item where nom_apex = 'P1056_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1915) from apexframework.afw_13_page_item where nom_apex = 'P1056_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1916) from apexframework.afw_13_page_item where nom_apex = 'P1056_PLANIF_EFORT' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1917) from apexframework.afw_13_page_item where nom_apex = 'P1056_REF_STAT_REALS' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1918) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1919) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1920) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1921) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1922) from apexframework.afw_13_page_item where nom_apex = 'EDITER' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1923) from apexframework.afw_13_page_item where nom_apex = 'CONSULTER' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1775) from apexframework.afw_13_page_item where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1776) from apexframework.afw_13_page_item where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1777) from apexframework.afw_13_page_item where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1778) from apexframework.afw_13_page_item where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1779) from apexframework.afw_13_page_item where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1780) from apexframework.afw_13_page_item where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1781) from apexframework.afw_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1782) from apexframework.afw_13_page_item where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1783) from apexframework.afw_13_page_item where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1784) from apexframework.afw_13_page_item where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1785) from apexframework.afw_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1786) from apexframework.afw_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1788) from apexframework.afw_13_page_item where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1789) from apexframework.afw_13_page_item where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1790) from apexframework.afw_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1791) from apexframework.afw_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1792) from apexframework.afw_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1793) from apexframework.afw_13_page_item where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1794) from apexframework.afw_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12771) from apexframework.afw_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12772) from apexframework.afw_13_page_item where nom_apex = 'P1054_AJOUTER' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
--Fin - afw_13_page_item
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_page_item');
end;
/

prompt ......atrib_scenr_notfc_item
--Debut - afw_12_atrib_scenr_notfc_item
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_12_atrib_scenr_notfc_item');
delete from tc$12$atrib$scenr$notfc$item;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_12_atrib_scenr_notfc_item');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_12_atrib_scenr_notfc_item');
--Fin - afw_12_atrib_scenr_notfc_item
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_12_atrib_scenr_notfc_item');
end;
/

prompt ......page_item_lang
--Debut - afw_13_page_item_lang
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_13_page_item_lang');
delete from tc$13$page$item$lang;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_page_item_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_page_item_lang');
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

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_condt_piltb');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_condt_piltb');
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

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_lien_condt_piltb');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_lien_condt_piltb');
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

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_regn_piltb');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_regn_piltb');
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

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_regn_piltb_lang');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_regn_piltb_lang');
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

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Début Clob - afw_13_prefr');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Fin Clob - afw_13_prefr');
--Fin - afw_13_prefr
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - afw_13_prefr');
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
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 2 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(118, 'Update') where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(105, 'Update') where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(86, 'Update') where numr_apex = 1001 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(144, 'Update') where numr_apex = 1011 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(144, 'Update') where numr_apex = 1012 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(142, 'Update') where numr_apex = 1013 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(143, 'Update') where numr_apex = 1021 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(143, 'Update') where numr_apex = 1022 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(139, 'Update') where numr_apex = 1023 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(145, 'Update') where numr_apex = 1031 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(145, 'Update') where numr_apex = 1032 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(137, 'Update') where numr_apex = 1041 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(137, 'Update') where numr_apex = 1042 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(146, 'Update') where numr_apex = 1043 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(140, 'Update') where numr_apex = 1051 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(140, 'Update') where numr_apex = 1052 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(141, 'Update') where numr_apex = 1053 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(141, 'Update') where numr_apex = 1054 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(140, 'Update') where numr_apex = 1055 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(140, 'Update') where numr_apex = 1056 and ref_aplic = afw$migrt$pkg.obten_var_3928(8, 'Select');
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
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'EFORT_DISPN_SEMN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(117, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(118, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(118, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(118, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(118, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_INSCR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(115, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_SIGNF' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STAT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(114, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(114, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(114, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(114, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(115, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_PREVU' and ref_page_ir = afw$migrt$pkg.obten_var_3919(115, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(120, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2420, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2420, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2420, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_EQUIP' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'POURC_IMPLI_EQUIP' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2421, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_EQUIP_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'POURC_AFECT_EQUIP_JALON' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2422, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_ROLE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2423, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_SIGNF' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_PRIOR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STAT_REALS' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2424, 'Select');
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
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(239, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
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
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_LIEN_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER_LIEN_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(240, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_REF_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_POURC_IMPLI_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(241, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(242, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_DATE_PREVU' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_JALON_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER_JALON_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(243, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_REF_JALON' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_DEBUT_EFEC' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_REF_EQUIP' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_POURC_AFECT_EQUIP_JALON' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(244, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1031_DISPN_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(245, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(245, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_EFORT_DISPN_SEMN' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(246, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(247, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_ROLE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER_ROLE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(248, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_REF_ROLE' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_DEBUT_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_FIN_EFECT' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(249, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(250, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_NUMR_SIGNF' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_ENVIR' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_DV_PRIOR' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_STAT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_COMNT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_DATE_INSCR' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_NATR_TACHE' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_DV_COMPL' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_PLANIF_EFORT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_JALON' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_AFECT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITER_PLANIF_EFORT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITER_AFECT' and ref_page = afw$migrt$pkg.obten_var_3918(251, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1053_REF_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(252, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1053_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(252, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(252, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(252, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1054_REF_ROLE_FORMT' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_NUMR_SIGNF' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
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
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_DV_PRIOR' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_STAT' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_COMNT' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_DV_COMPL' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_DATE_INSCR' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_JALON' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_NATR_TACHE' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_ENVIR' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_PRODT' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_PLANIF_EFORT' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_STAT_REALS' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITER' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CONSULTER' and ref_page = afw$migrt$pkg.obten_var_3918(255, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_3918(233, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_3918(237, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_3918(236, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1054_AJOUTER' and ref_page = afw$migrt$pkg.obten_var_3918(253, 'Select');
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
  select count(1) into vnu_count from em$12_atrib_scenr_notfc_item;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_atrib_scenr_notfc_item');
  end if;
end;

null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_atrib_scenr_notfc_item');
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
update afw_11_aplic
                       set ref_versn = afw$migrt$pkg.obten_var_4086(18, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = afw$migrt$pkg.obten_var_3928(1, 'Update'),
                           ref_page_conxn = afw$migrt$pkg.obten_var_3918(236, 'Update'),
                           ref_page_acuei = null
                     where seqnc = afw$migrt$pkg.var_3928(8);
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_aplic');
end;
/
begin
  if afw$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('...Mise a jour du referentiel APEX');
    afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_3928(8),'O');
  end if;
end;
/

