set define off
set serveroutput on
set feedback off


prompt ========================================
prompt Installation de l'application: SAFC - Configuration

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFC');
  afw$migrt$pkg.var_3928(6) := afw_11_aplic_pkg.maj_aplic ('SAFC','Configuration',1000007, afw$migrt$pkg.vnu_seqnc_prodt);

  afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_3928(6),'O');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFC');
end;
/


prompt ...Metadonnees des entites
prompt ......versn
--Debut - afw_11_versn
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_11_versn');
delete from tc$11$versn;

insert into APEXFRAMEWORK.tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 'O', null, 4, 4, 0, 0, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, null, 16);
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
            where t.dnr_ref_aplic = afw$migrt$pkg.var_3928(6)
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
select seqnc into afw$migrt$pkg.var_4086(16) from apexframework.afw_11_versn where code = '0100' and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select') and ref_plugn is null and ref_prodt is null;
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

insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 161);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Accueil', 1, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 162);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 163);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Commentaire', 102, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 164);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Environnements', 1011, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 165);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Environnement', 1012, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 166);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Schéma', 1022, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 167);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Définitions de capture', 1032, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 168);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modèles de capture', 1041, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 169);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modèle de capture', 1042, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 170);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Paramètres', 1051, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 171);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:42', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Paramètre', 1052, null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), 172);
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
select seqnc into afw$migrt$pkg.var_3918(161) from apexframework.afw_13_page where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(162) from apexframework.afw_13_page where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(163) from apexframework.afw_13_page where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(164) from apexframework.afw_13_page where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(165) from apexframework.afw_13_page where numr_apex = 1011 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(166) from apexframework.afw_13_page where numr_apex = 1012 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(167) from apexframework.afw_13_page where numr_apex = 1022 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(168) from apexframework.afw_13_page where numr_apex = 1032 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(169) from apexframework.afw_13_page where numr_apex = 1041 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(170) from apexframework.afw_13_page where numr_apex = 1042 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(171) from apexframework.afw_13_page where numr_apex = 1051 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
select seqnc into afw$migrt$pkg.var_3918(172) from apexframework.afw_13_page where numr_apex = 1052 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Pilotage', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(162, 'Insert'), 162);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Paramètre', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(172, 'Insert'), 163);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Modèle de capture', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(170, 'Insert'), 164);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Page de connexion', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(163, 'Insert'), 165);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Modèles de capture', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(169, 'Insert'), 166);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Environnement', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(166, 'Insert'), 167);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Définitions de captures', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(168, 'Insert'), 168);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Environnements', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(165, 'Insert'), 169);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Commentaire', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(164, 'Insert'), 170);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Page commune', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(161, 'Insert'), 171);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Paramètres', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(171, 'Insert'), 172);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'Schéma', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(167, 'Insert'), 173);
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
select seqnc into afw$migrt$pkg.var_4041(162) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(162, 'Select');
select seqnc into afw$migrt$pkg.var_4041(163) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
select seqnc into afw$migrt$pkg.var_4041(164) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_4041(165) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
select seqnc into afw$migrt$pkg.var_4041(166) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(169, 'Select');
select seqnc into afw$migrt$pkg.var_4041(167) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_4041(168) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
select seqnc into afw$migrt$pkg.var_4041(169) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(165, 'Select');
select seqnc into afw$migrt$pkg.var_4041(170) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
select seqnc into afw$migrt$pkg.var_4041(171) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_4041(172) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(171, 'Select');
select seqnc into afw$migrt$pkg.var_4041(173) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'N', null, 'Liste des environnements', 1, afw$migrt$pkg.obten_var_3918(165, 'Insert'), 79, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'N', null, 'Schemas', 1, afw$migrt$pkg.obten_var_3918(166, 'Insert'), 81, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'N', null, 'Liste des modèles de capture', 1, afw$migrt$pkg.obten_var_3918(169, 'Insert'), 2425, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(6, 'Insert'), 'N', null, 'Paramètres', 1, afw$migrt$pkg.obten_var_3918(171, 'Insert'), 80, null);
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
select seqnc into afw$migrt$pkg.var_3919(79) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(165, 'Select');
select seqnc into afw$migrt$pkg.var_3919(81) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3919(2425) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(169, 'Select');
select seqnc into afw$migrt$pkg.var_3919(80) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(171, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 455981820798048168, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(79, 'Insert'), 453, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE_ESPAC_TRAVL_APEX', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 455981923536048171, 'O', null, 'Espace travail APEX', 2, afw$migrt$pkg.obten_var_3919(79, 'Insert'), 454, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 455982021255048171, 'O', null, 'Code', 3, afw$migrt$pkg.obten_var_3919(79, 'Insert'), 455, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 455982135261048171, 'O', null, 'Nom', 4, afw$migrt$pkg.obten_var_3919(79, 'Insert'), 456, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_NATR_ENVIR_FORMT', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 455989141142111806, 'O', null, 'Nature', 5, afw$migrt$pkg.obten_var_3919(79, 'Insert'), 457, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('LIEN_DEFN', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 486038528973174089, 'O', null, 'Captures', 4, afw$migrt$pkg.obten_var_3919(81, 'Insert'), 458, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 510914531893831757, 'O', null, 'Code du paramètre', 2, afw$migrt$pkg.obten_var_3919(80, 'Insert'), 462, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 510914437357831740, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(80, 'Insert'), 463, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 485970425461731849, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(81, 'Insert'), 464, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 485970526931731854, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_3919(81, 'Insert'), 465, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 485970611278731854, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_3919(81, 'Insert'), 466, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 487114932845474614, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(2425, 'Insert'), 17832, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 487115012557474614, 'O', null, 'Nom', 2, afw$migrt$pkg.obten_var_3919(2425, 'Insert'), 17833, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_3928(6, 'Insert'), 487115139068474614, 'O', null, 'Code', 3, afw$migrt$pkg.obten_var_3919(2425, 'Insert'), 17834, null);
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
select seqnc into afw$migrt$pkg.var_3895(453) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
select seqnc into afw$migrt$pkg.var_3895(454) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE_ESPAC_TRAVL_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
select seqnc into afw$migrt$pkg.var_3895(455) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
select seqnc into afw$migrt$pkg.var_3895(456) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
select seqnc into afw$migrt$pkg.var_3895(457) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_DV_NATR_ENVIR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
select seqnc into afw$migrt$pkg.var_3895(458) from apexframework.afw_13_page_ir_coln where coln_table = 'LIEN_DEFN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(81, 'Select');
select seqnc into afw$migrt$pkg.var_3895(462) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(80, 'Select');
select seqnc into afw$migrt$pkg.var_3895(463) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(80, 'Select');
select seqnc into afw$migrt$pkg.var_3895(464) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(81, 'Select');
select seqnc into afw$migrt$pkg.var_3895(465) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(81, 'Select');
select seqnc into afw$migrt$pkg.var_3895(466) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(81, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17832) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2425, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17833) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2425, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17834) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2425, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1073270127125152298, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1297, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1102815126408233206, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1298, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1102815353882233208, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1299, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1102815528872233208, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1300, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1103154347293852689, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1301, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1124638831284909353, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1302, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1147379147682076986, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1303, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1147379352877078509, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1304, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1147379557725079856, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1305, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1219092891382140799, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', afw$migrt$pkg.obten_var_3918(161, 'Insert'), 1306, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1073568907124709450, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', afw$migrt$pkg.obten_var_3918(163, 'Insert'), 1307, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1073569115508709451, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', afw$migrt$pkg.obten_var_3918(163, 'Insert'), 1308, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1073569507392709451, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', afw$migrt$pkg.obten_var_3918(163, 'Insert'), 1310, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1073569707356709452, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', afw$migrt$pkg.obten_var_3918(163, 'Insert'), 1311, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1073569900837709452, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', afw$migrt$pkg.obten_var_3918(163, 'Insert'), 1312, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1476810215066044819, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', afw$migrt$pkg.obten_var_3918(164, 'Insert'), 1313, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1476810718890044822, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', afw$migrt$pkg.obten_var_3918(164, 'Insert'), 1314, 'ITEM');
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
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1476811198817044822, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', afw$migrt$pkg.obten_var_3918(164, 'Insert'), 1315, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1476811415743044823, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', afw$migrt$pkg.obten_var_3918(164, 'Insert'), 1316, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1476811913838044824, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', afw$migrt$pkg.obten_var_3918(164, 'Insert'), 1317, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1476812121780044824, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', afw$migrt$pkg.obten_var_3918(164, 'Insert'), 1318, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1476812621551044824, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', afw$migrt$pkg.obten_var_3918(164, 'Insert'), 1319, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1473223908467733293, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', afw$migrt$pkg.obten_var_3918(164, 'Insert'), 1320, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 452393516794736641, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_3918(165, 'Insert'), 1321, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 455979116395048139, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1012_SEQNC', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1322, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 455979317818048147, 'O', null, null, null, null, 'O', null, 'Espace travail APEX', 'P1012_CODE_ESPAC_TRAVL_APEX', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1323, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 455979512122048148, 'O', null, null, null, null, 'O', null, 'Code', 'P1012_CODE', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1324, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 455979717357048148, 'O', null, null, null, null, 'O', null, 'Nom', 'P1012_NOM', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1325, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 455979933699048149, 'O', null, null, null, null, 'O', null, 'Description', 'P1012_DESCR', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1326, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 455980143700048149, 'O', null, null, null, null, 'O', null, 'Nature environnement', 'P1012_REF_DV_NATR_ENVIR', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1327, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 485967626586709139, 'O', null, null, null, null, 'N', null, '[P1012_MODE]', 'P1012_MODE', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1328, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 452389104643736573, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1329, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 452388830862736572, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1330, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 452388701638736572, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1331, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 452388924530736572, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1332, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 482393729634571954, 'N', null, null, null, null, 'N', null, 'Ajouter', 'AJOUT_SCHEM', afw$migrt$pkg.obten_var_3918(166, 'Insert'), 1333, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 485995741829936464, 'O', null, null, null, null, 'O', null, 'Code', 'P1022_CODE', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1334, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 485995924465936467, 'O', null, null, null, null, 'O', null, 'Nom', 'P1022_NOM', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1335, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 485996136725936467, 'O', null, null, null, null, 'O', null, 'Environnement', 'P1022_REF_ENVIR', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1336, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 485996324608936467, 'O', null, null, null, null, 'O', null, 'Capture DDL', 'P1022_INDIC_CAPTR_DDL', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1337, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 485996523691936469, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1022_SEQNC', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1338, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 488836643706839445, 'O', null, null, null, null, 'O', null, 'Modèle de capture', 'P1022_REF_DEFNT_CAPTR_DEFT', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1339, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 482406027935624932, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1340, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 482406429579624933, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1341, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 482406603923624933, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1342, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 482406223719624932, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(167, 'Insert'), 1343, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 486041515869274314, 'O', null, null, null, null, 'N', null, 'Schéma', 'P1032_REF_SCHEM', afw$migrt$pkg.obten_var_3918(168, 'Insert'), 1344, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 486042126089315149, 'O', null, null, null, null, 'N', null, 'Évènement', 'P1032_REF_EVENM', afw$migrt$pkg.obten_var_3918(168, 'Insert'), 1345, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 487180336690263432, 'O', null, null, null, null, 'N', null, 'Modèle de capture', 'P1032_REF_DEFNT_CAPTR_DEFT', afw$migrt$pkg.obten_var_3918(168, 'Insert'), 1346, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 482455910905028060, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(168, 'Insert'), 1348, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 482456030877028060, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SUBMIT', afw$migrt$pkg.obten_var_3918(168, 'Insert'), 1349, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 483526708254177064, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_3918(169, 'Insert'), 1350, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 487118728939627939, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1042_SEQNC', afw$migrt$pkg.obten_var_3918(170, 'Insert'), 1351, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 487118940468627948, 'O', null, null, null, null, 'O', null, 'Nom', 'P1042_NOM', afw$migrt$pkg.obten_var_3918(170, 'Insert'), 1352, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 487119125782627949, 'O', null, null, null, null, 'O', null, 'Code', 'P1042_CODE', afw$migrt$pkg.obten_var_3918(170, 'Insert'), 1353, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 487170143401924834, 'O', null, null, null, null, 'N', null, 'Évènement', 'P1042_REF_EVENM', afw$migrt$pkg.obten_var_3918(170, 'Insert'), 1354, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 483528701573316397, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(170, 'Insert'), 1355, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 483528431747316397, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(170, 'Insert'), 1356, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 483528304333316397, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(170, 'Insert'), 1357, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 483528522695316397, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(170, 'Insert'), 1358, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 483546913832679717, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SUBMIT', afw$migrt$pkg.obten_var_3918(170, 'Insert'), 1359, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 507327428403565088, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_3918(171, 'Insert'), 1360, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 510919132732910683, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1052_SEQNC', afw$migrt$pkg.obten_var_3918(172, 'Insert'), 1361, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 510919322216910705, 'O', null, null, null, null, 'O', null, 'Code du paramètre', 'P1052_CODE', afw$migrt$pkg.obten_var_3918(172, 'Insert'), 1362, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 510919523392910706, 'O', null, null, null, null, 'O', null, 'Valeur', 'P1052_VALR', afw$migrt$pkg.obten_var_3918(172, 'Insert'), 1363, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 507329111987599141, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(172, 'Insert'), 1364, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 507328817419599141, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(172, 'Insert'), 1365, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 507328718753599141, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', afw$migrt$pkg.obten_var_3918(172, 'Insert'), 1366, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 507328906672599141, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(172, 'Insert'), 1367, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 1073569304839709451, 'N', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', afw$migrt$pkg.obten_var_3918(163, 'Insert'), 12773, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(6, 'Insert'), null, 488774441734454117, 'N', null, null, null, null, 'N', null, 'Concilier', 'P1032_CONCILIER', afw$migrt$pkg.obten_var_3918(168, 'Insert'), 12774, 'BOUTN');
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
select seqnc into afw$migrt$pkg.var_3909(1297) from apexframework.afw_13_page_item where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1298) from apexframework.afw_13_page_item where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1299) from apexframework.afw_13_page_item where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1300) from apexframework.afw_13_page_item where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1301) from apexframework.afw_13_page_item where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1302) from apexframework.afw_13_page_item where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1303) from apexframework.afw_13_page_item where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1304) from apexframework.afw_13_page_item where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1305) from apexframework.afw_13_page_item where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1306) from apexframework.afw_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1307) from apexframework.afw_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1308) from apexframework.afw_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1310) from apexframework.afw_13_page_item where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1311) from apexframework.afw_13_page_item where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1312) from apexframework.afw_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1313) from apexframework.afw_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1314) from apexframework.afw_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
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
select seqnc into afw$migrt$pkg.var_3909(1315) from apexframework.afw_13_page_item where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1316) from apexframework.afw_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1317) from apexframework.afw_13_page_item where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1318) from apexframework.afw_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1319) from apexframework.afw_13_page_item where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1320) from apexframework.afw_13_page_item where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1321) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(165, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1322) from apexframework.afw_13_page_item where nom_apex = 'P1012_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1323) from apexframework.afw_13_page_item where nom_apex = 'P1012_CODE_ESPAC_TRAVL_APEX' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1324) from apexframework.afw_13_page_item where nom_apex = 'P1012_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1325) from apexframework.afw_13_page_item where nom_apex = 'P1012_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1326) from apexframework.afw_13_page_item where nom_apex = 'P1012_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1327) from apexframework.afw_13_page_item where nom_apex = 'P1012_REF_DV_NATR_ENVIR' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1328) from apexframework.afw_13_page_item where nom_apex = 'P1012_MODE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1329) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1330) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1331) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1332) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1333) from apexframework.afw_13_page_item where nom_apex = 'AJOUT_SCHEM' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1334) from apexframework.afw_13_page_item where nom_apex = 'P1022_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1335) from apexframework.afw_13_page_item where nom_apex = 'P1022_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1336) from apexframework.afw_13_page_item where nom_apex = 'P1022_REF_ENVIR' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1337) from apexframework.afw_13_page_item where nom_apex = 'P1022_INDIC_CAPTR_DDL' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1338) from apexframework.afw_13_page_item where nom_apex = 'P1022_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1339) from apexframework.afw_13_page_item where nom_apex = 'P1022_REF_DEFNT_CAPTR_DEFT' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1340) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1341) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1342) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1343) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1344) from apexframework.afw_13_page_item where nom_apex = 'P1032_REF_SCHEM' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1345) from apexframework.afw_13_page_item where nom_apex = 'P1032_REF_EVENM' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1346) from apexframework.afw_13_page_item where nom_apex = 'P1032_REF_DEFNT_CAPTR_DEFT' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1348) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1349) from apexframework.afw_13_page_item where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1350) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(169, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1351) from apexframework.afw_13_page_item where nom_apex = 'P1042_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1352) from apexframework.afw_13_page_item where nom_apex = 'P1042_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1353) from apexframework.afw_13_page_item where nom_apex = 'P1042_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1354) from apexframework.afw_13_page_item where nom_apex = 'P1042_REF_EVENM' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1355) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1356) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1357) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1358) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1359) from apexframework.afw_13_page_item where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1360) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(171, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1361) from apexframework.afw_13_page_item where nom_apex = 'P1052_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1362) from apexframework.afw_13_page_item where nom_apex = 'P1052_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1363) from apexframework.afw_13_page_item where nom_apex = 'P1052_VALR' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1364) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1365) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1366) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1367) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12773) from apexframework.afw_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12774) from apexframework.afw_13_page_item where nom_apex = 'P1032_CONCILIER' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
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
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(138, 'Update') where numr_apex = 1011 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(138, 'Update') where numr_apex = 1012 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(147, 'Update') where numr_apex = 1022 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(148, 'Update') where numr_apex = 1032 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1041 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1042 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1051 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1052 and ref_aplic = afw$migrt$pkg.obten_var_3928(6, 'Select');
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
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE_ESPAC_TRAVL_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_NATR_ENVIR_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(79, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'LIEN_DEFN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(81, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(80, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(80, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(81, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(81, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(81, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2425, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2425, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2425, 'Select');
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
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_3918(161, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
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
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(164, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(165, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_CODE_ESPAC_TRAVL_APEX' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_DESCR' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_REF_DV_NATR_ENVIR' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_MODE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AJOUT_SCHEM' and ref_page = afw$migrt$pkg.obten_var_3918(166, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_REF_ENVIR' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_INDIC_CAPTR_DDL' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_REF_DEFNT_CAPTR_DEFT' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(167, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_REF_SCHEM' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_REF_EVENM' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_REF_DEFNT_CAPTR_DEFT' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(169, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_REF_EVENM' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(170, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(171, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_CODE' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_VALR' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(172, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_3918(163, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_CONCILIER' and ref_page = afw$migrt$pkg.obten_var_3918(168, 'Select');
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
                       set ref_versn = afw$migrt$pkg.obten_var_4086(16, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = afw$migrt$pkg.obten_var_3928(1, 'Update'),
                           ref_page_conxn = afw$migrt$pkg.obten_var_3918(163, 'Update'),
                           ref_page_acuei = null
                     where seqnc = afw$migrt$pkg.var_3928(6);
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_aplic');
end;
/
begin
  if afw$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('...Mise a jour du referentiel APEX');
    afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_3928(6),'O');
  end if;
end;
/

