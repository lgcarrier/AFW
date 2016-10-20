set define off
set serveroutput on
set feedback off


prompt ========================================
prompt Installation de l'application: SAFU - Utilisateur

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFU');
  afw$migrt$pkg.var_3928(5) := afw_11_aplic_pkg.maj_aplic ('SAFU','Utilisateur',1000005, afw$migrt$pkg.vnu_seqnc_prodt);

  afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_3928(5),'O');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFU');
end;
/


prompt ...Metadonnees des entites
prompt ......versn
--Debut - afw_11_versn
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_11_versn');
delete from tc$11$versn;

insert into APEXFRAMEWORK.tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('3000', afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 'O', null, 4, 4, 0, 0, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, null, 84);
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
            where t.dnr_ref_aplic = afw$migrt$pkg.var_3928(5)
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
select seqnc into afw$migrt$pkg.var_4086(84) from apexframework.afw_11_versn where code = '3000' and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select') and ref_plugn is null and ref_prodt is null;
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

insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 151);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Accueil', 1, null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 152);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mes recherches', 6, null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 153);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mes impressions', 50, null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 154);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un travail d''impression', 51, null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 155);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 156);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'N', 'N', 'N', 'N', 'Commentaire', 102, null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 157);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un utilisateur', 12020, 'ASD', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 158);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Historique des accès', 12021, null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 159);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Gérer le mot de passe', 12030, null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), 160);
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
select seqnc into afw$migrt$pkg.var_3918(151) from apexframework.afw_13_page where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
select seqnc into afw$migrt$pkg.var_3918(152) from apexframework.afw_13_page where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
select seqnc into afw$migrt$pkg.var_3918(153) from apexframework.afw_13_page where numr_apex = 6 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
select seqnc into afw$migrt$pkg.var_3918(154) from apexframework.afw_13_page where numr_apex = 50 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
select seqnc into afw$migrt$pkg.var_3918(155) from apexframework.afw_13_page where numr_apex = 51 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
select seqnc into afw$migrt$pkg.var_3918(156) from apexframework.afw_13_page where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
select seqnc into afw$migrt$pkg.var_3918(157) from apexframework.afw_13_page where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
select seqnc into afw$migrt$pkg.var_3918(158) from apexframework.afw_13_page where numr_apex = 12020 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
select seqnc into afw$migrt$pkg.var_3918(159) from apexframework.afw_13_page where numr_apex = 12021 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
select seqnc into afw$migrt$pkg.var_3918(160) from apexframework.afw_13_page where numr_apex = 12030 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Mes impressions', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(154, 'Insert'), 152);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Accueil', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(152, 'Insert'), 153);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Feedback', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(157, 'Insert'), 154);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Page de connexion', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(156, 'Insert'), 155);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Historique des accès', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(159, 'Insert'), 156);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Page commune', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(151, 'Insert'), 157);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Gérer le mot de passe', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(160, 'Insert'), 158);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Travail d''impression', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(155, 'Insert'), 159);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Mes recherches', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(153, 'Insert'), 160);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'Mettre à jour', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(158, 'Insert'), 161);
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
select seqnc into afw$migrt$pkg.var_4041(152) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(154, 'Select');
select seqnc into afw$migrt$pkg.var_4041(153) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(152, 'Select');
select seqnc into afw$migrt$pkg.var_4041(154) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
select seqnc into afw$migrt$pkg.var_4041(155) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
select seqnc into afw$migrt$pkg.var_4041(156) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(159, 'Select');
select seqnc into afw$migrt$pkg.var_4041(157) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_4041(158) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_4041(159) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
select seqnc into afw$migrt$pkg.var_4041(160) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_4041(161) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'N', null, 'Résultat des recherches', 1, afw$migrt$pkg.obten_var_3918(153, 'Insert'), 77, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'N', null, 'Liste des travaux d''impression', 1, afw$migrt$pkg.obten_var_3918(154, 'Insert'), 78, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(5, 'Insert'), 'N', null, 'Historique des accès', 1, afw$migrt$pkg.obten_var_3918(159, 'Insert'), 76, null);
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_ir');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_ir');
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
select seqnc into afw$migrt$pkg.var_3919(77) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3919(78) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(154, 'Select');
select seqnc into afw$migrt$pkg.var_3919(76) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(159, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_page_ir');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_page_ir');
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

insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 62321941287195991, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(78, 'Insert'), 440, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_IMEDT_FORMT', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 62322045146195992, 'O', null, 'Exécution<br />immediate', 2, afw$migrt$pkg.obten_var_3919(78, 'Insert'), 441, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 62322149066195992, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_3919(78, 'Insert'), 442, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STAT_FORMT', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 62322250071195992, 'O', null, 'Statut', 4, afw$migrt$pkg.obten_var_3919(78, 'Insert'), 443, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOMBR_ELEMN', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 62322351996195992, 'O', null, 'Nombre<br />éléments', 5, afw$migrt$pkg.obten_var_3919(78, 'Insert'), 444, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_CREAT', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 62322442504195993, 'O', null, 'Créé le', 6, afw$migrt$pkg.obten_var_3919(78, 'Insert'), 445, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('LIEN', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 62322536906195993, 'O', null, 'Impression', 8, afw$migrt$pkg.obten_var_3919(78, 'Insert'), 446, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_EVENM_FORMT', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 56727058368649612, 'O', null, 'Événement', 2, afw$migrt$pkg.obten_var_3919(76, 'Insert'), 447, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_EVENM', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 56729755031688987, 'O', null, 'Date', 1, afw$migrt$pkg.obten_var_3919(76, 'Insert'), 448, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_LIBL_STRUC_APLIC_HTML', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 425709925049554162, 'O', null, 'Énoncé trouvé', 4, afw$migrt$pkg.obten_var_3919(77, 'Insert'), 449, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_PERTN', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 425710046159554162, 'O', null, 'Pertinence (%)', 5, afw$migrt$pkg.obten_var_3919(77, 'Insert'), 450, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_LIEN', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 425710147507554162, 'O', null, 'Lien', 6, afw$migrt$pkg.obten_var_3919(77, 'Insert'), 451, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DNR_REF_STRUC_APLIC_FORMT', afw$migrt$pkg.obten_var_3928(5, 'Insert'), 426131435347448197, 'O', null, 'Résultat', 7, afw$migrt$pkg.obten_var_3919(77, 'Insert'), 452, null);
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
select seqnc into afw$migrt$pkg.var_3895(440) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
select seqnc into afw$migrt$pkg.var_3895(441) from apexframework.afw_13_page_ir_coln where coln_table = 'INDIC_IMEDT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
select seqnc into afw$migrt$pkg.var_3895(442) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
select seqnc into afw$migrt$pkg.var_3895(443) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_STAT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
select seqnc into afw$migrt$pkg.var_3895(444) from apexframework.afw_13_page_ir_coln where coln_table = 'NOMBR_ELEMN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
select seqnc into afw$migrt$pkg.var_3895(445) from apexframework.afw_13_page_ir_coln where coln_table = 'DATE_CREAT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
select seqnc into afw$migrt$pkg.var_3895(446) from apexframework.afw_13_page_ir_coln where coln_table = 'LIEN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
select seqnc into afw$migrt$pkg.var_3895(447) from apexframework.afw_13_page_ir_coln where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(76, 'Select');
select seqnc into afw$migrt$pkg.var_3895(448) from apexframework.afw_13_page_ir_coln where coln_table = 'DATE_EVENM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(76, 'Select');
select seqnc into afw$migrt$pkg.var_3895(449) from apexframework.afw_13_page_ir_coln where coln_table = 'DNR_LIBL_STRUC_APLIC_HTML' and ref_page_ir = afw$migrt$pkg.obten_var_3919(77, 'Select');
select seqnc into afw$migrt$pkg.var_3895(450) from apexframework.afw_13_page_ir_coln where coln_table = 'DNR_PERTN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(77, 'Select');
select seqnc into afw$migrt$pkg.var_3895(451) from apexframework.afw_13_page_ir_coln where coln_table = 'DNR_LIEN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(77, 'Select');
select seqnc into afw$migrt$pkg.var_3895(452) from apexframework.afw_13_page_ir_coln where coln_table = 'DNR_REF_STRUC_APLIC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(77, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 18958572122713254, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1228, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48503571405794162, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1229, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48503798879794164, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1230, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48503973869794164, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1231, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48842792291413645, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1232, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 70327276282470309, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1233, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 93067592679637942, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1234, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 93067797874639465, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1235, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 93068002722640812, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1236, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 240761543786188990, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', afw$migrt$pkg.obten_var_3918(151, 'Insert'), 1237, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 10650446236443048, 'O', null, null, null, null, 'N', null, '[P1_SEQNC]', 'P1_SEQNC', afw$migrt$pkg.obten_var_3918(152, 'Insert'), 1238, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 424933332676784604, 'O', null, null, null, null, 'N', null, 'Recherches antérieures', 'P6_RECHR', afw$migrt$pkg.obten_var_3918(153, 'Insert'), 1239, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 424934327229839756, 'O', null, null, null, null, 'N', null, 'Éléments trouvés', 'P6_RESLT_RECHR', afw$migrt$pkg.obten_var_3918(153, 'Insert'), 1240, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 426135352868718192, 'O', null, null, null, null, 'N', null, 'Énoncé', 'P6_NOUV_RECHR', afw$migrt$pkg.obten_var_3918(153, 'Insert'), 1241, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 426186735648946926, 'O', null, null, null, null, 'N', null, 'selon', 'P6_EXECT_NOUV', afw$migrt$pkg.obten_var_3918(153, 'Insert'), 1242, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 426264047360047202, 'O', null, null, null, null, 'N', null, 'dans', 'P6_SYSTM', afw$migrt$pkg.obten_var_3918(153, 'Insert'), 1243, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 426533154054388001, 'O', null, null, null, null, 'N', null, '[P6_MODL_RECHR]', 'P6_MODL_RECHR', afw$migrt$pkg.obten_var_3918(153, 'Insert'), 1245, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 453298631612908675, 'N', null, null, null, null, 'N', null, 'Nouvelle recherche', 'AUTRE_RECHR', afw$migrt$pkg.obten_var_3918(153, 'Insert'), 1246, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 427530446591891613, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(153, 'Insert'), 1247, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 69559443598943278, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P51_SEQNC', afw$migrt$pkg.obten_var_3918(155, 'Insert'), 1248, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 69559632791943285, 'O', null, null, null, null, 'O', null, 'Nom', 'P51_NOM', afw$migrt$pkg.obten_var_3918(155, 'Insert'), 1249, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 65991717871638094, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(155, 'Insert'), 1250, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 65992109604638097, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(155, 'Insert'), 1251, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 65991905311638097, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(155, 'Insert'), 1252, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 65992317951638097, 'N', null, null, null, null, 'N', null, 'Imprimer lot ', 'IMPR_TRAVL', afw$migrt$pkg.obten_var_3918(155, 'Insert'), 1253, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 65992511948638097, 'N', null, null, null, null, 'N', null, 'Ajout à la file d''impression', 'AJOUT_IMPRE', afw$migrt$pkg.obten_var_3918(155, 'Insert'), 1254, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 19351539174260232, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', afw$migrt$pkg.obten_var_3918(156, 'Insert'), 1255, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 19351752475260233, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', afw$migrt$pkg.obten_var_3918(156, 'Insert'), 1256, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 19352131529260234, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', afw$migrt$pkg.obten_var_3918(156, 'Insert'), 1258, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 19352347898260235, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', afw$migrt$pkg.obten_var_3918(156, 'Insert'), 1259, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 19352557107260235, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', afw$migrt$pkg.obten_var_3918(156, 'Insert'), 1260, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 422502724813505743, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', afw$migrt$pkg.obten_var_3918(157, 'Insert'), 1261, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 422503225033505743, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', afw$migrt$pkg.obten_var_3918(157, 'Insert'), 1262, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 422503755475505744, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', afw$migrt$pkg.obten_var_3918(157, 'Insert'), 1263, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 422503933471505744, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', afw$migrt$pkg.obten_var_3918(157, 'Insert'), 1264, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 422504456938505744, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', afw$migrt$pkg.obten_var_3918(157, 'Insert'), 1265, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 422504656038505744, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', afw$migrt$pkg.obten_var_3918(157, 'Insert'), 1266, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 422505156529505745, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', afw$migrt$pkg.obten_var_3918(157, 'Insert'), 1267, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 418936022503200563, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', afw$migrt$pkg.obten_var_3918(157, 'Insert'), 1268, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 16529060130659922, 'O', null, null, null, null, 'O', null, 'Courriel', 'P12020_COURL', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1269, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48535994038906986, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12020_SEQNC', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1270, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48536203260906987, 'O', null, null, null, null, 'O', null, 'Nom', 'P12020_NOM', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1271, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48536378573906989, 'O', null, null, null, null, 'O', null, 'Prénom', 'P12020_PRENM', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1272, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48536778802906989, 'O', null, null, null, null, 'O', null, 'Code', 'P12020_CODE_UTILS', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1273, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48537384999906992, 'O', null, null, null, null, 'O', null, 'Date expiration', 'P12020_DATE_EXPIR', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1274, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48537599923906992, 'O', null, null, null, null, 'O', null, 'Compte verrouillé', 'P12020_INDIC_VERL', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1275, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 48537974893906992, 'O', null, null, null, null, 'O', null, 'Changer mot passe<br />prochaine connexion', 'P12020_INDIC_CHANG_MOT_PASSE', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1276, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 51689682262496103, 'O', null, null, null, null, 'N', null, '[P12020_GROUP_UTILS]', 'P12020_GROUP_UTILS', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1278, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 70532066828205690, 'O', null, null, null, null, 'N', null, 'Filtrer par application', 'P12020_FILTR_APLIC', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1279, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 70532448961285715, 'O', null, null, null, null, 'N', null, 'Filtre par mot clé', 'P12020_FILTR_MOT_CLE', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1280, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 44968647615601804, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1282, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 44968877424601805, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1283, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 44968556150601804, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1284, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 44968459265601804, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1285, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 44974053944611671, 'N', null, null, null, null, 'N', null, 'Créer et ajouter', 'CREATE_ADD', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 1286, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49273473934805653, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12030_SEQNC', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 1287, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49273699942805654, 'O', null, null, null, null, 'O', null, 'Nom', 'P12030_NOM', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 1288, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49273892229805656, 'O', null, null, null, null, 'O', null, 'Prénom', 'P12030_PRENM', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 1289, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49274087024805656, 'O', null, null, null, null, 'O', null, 'Code utilisateur', 'P12030_CODE_UTILS', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 1290, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49278081752830267, 'O', null, null, null, null, 'N', null, 'Ancien mot de passe', 'P12030_ANCN_MOT_PASSE', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 1291, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49278291426830267, 'O', null, null, null, null, 'N', null, 'Nouveau mot de passe', 'P12030_NOUV_MOT_PASSE_1', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 1292, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49278479582830269, 'O', null, null, null, null, 'N', null, 'Confirmer le nouveau mot de passe', 'P12030_CONFR_MOT_PASSE', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 1293, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49281678204848220, 'O', null, null, null, null, 'N', null, '[P12030_7_0]', 'P12030_7_0', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 1296, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 426265526544088508, 'N', null, null, null, null, 'N', null, 'Exécuter', 'P6_EXECT', afw$migrt$pkg.obten_var_3918(153, 'Insert'), 12765, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 19351931953260234, 'N', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', afw$migrt$pkg.obten_var_3918(156, 'Insert'), 12766, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 70533057497354390, 'N', null, null, null, null, 'N', null, 'Appliquer filtre', 'P12020_APLIQ_FILTR', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 12767, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49188590836819389, 'N', null, null, null, null, 'N', null, 'Gérer mot de passe', 'P12020_MOT_PASSE', afw$migrt$pkg.obten_var_3918(158, 'Insert'), 12768, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49280298530842195, 'N', null, null, null, null, 'N', null, 'Définir le mot de passe', 'P12030_DEFNR_MOT_PASSE', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 12769, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(5, 'Insert'), null, 49280090194842195, 'N', null, null, null, null, 'N', null, 'Annuler', 'P12030_ANULR', afw$migrt$pkg.obten_var_3918(160, 'Insert'), 12770, 'BOUTN');
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
select seqnc into afw$migrt$pkg.var_3909(1228) from apexframework.afw_13_page_item where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1229) from apexframework.afw_13_page_item where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1230) from apexframework.afw_13_page_item where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1231) from apexframework.afw_13_page_item where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1232) from apexframework.afw_13_page_item where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1233) from apexframework.afw_13_page_item where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1234) from apexframework.afw_13_page_item where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1235) from apexframework.afw_13_page_item where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1236) from apexframework.afw_13_page_item where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1237) from apexframework.afw_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1238) from apexframework.afw_13_page_item where nom_apex = 'P1_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(152, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1239) from apexframework.afw_13_page_item where nom_apex = 'P6_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1240) from apexframework.afw_13_page_item where nom_apex = 'P6_RESLT_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1241) from apexframework.afw_13_page_item where nom_apex = 'P6_NOUV_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1242) from apexframework.afw_13_page_item where nom_apex = 'P6_EXECT_NOUV' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1243) from apexframework.afw_13_page_item where nom_apex = 'P6_SYSTM' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1245) from apexframework.afw_13_page_item where nom_apex = 'P6_MODL_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1246) from apexframework.afw_13_page_item where nom_apex = 'AUTRE_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1247) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1248) from apexframework.afw_13_page_item where nom_apex = 'P51_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1249) from apexframework.afw_13_page_item where nom_apex = 'P51_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1250) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1251) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1252) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1253) from apexframework.afw_13_page_item where nom_apex = 'IMPR_TRAVL' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1254) from apexframework.afw_13_page_item where nom_apex = 'AJOUT_IMPRE' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1255) from apexframework.afw_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1256) from apexframework.afw_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1258) from apexframework.afw_13_page_item where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1259) from apexframework.afw_13_page_item where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1260) from apexframework.afw_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1261) from apexframework.afw_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1262) from apexframework.afw_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1263) from apexframework.afw_13_page_item where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1264) from apexframework.afw_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1265) from apexframework.afw_13_page_item where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1266) from apexframework.afw_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1267) from apexframework.afw_13_page_item where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1268) from apexframework.afw_13_page_item where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1269) from apexframework.afw_13_page_item where nom_apex = 'P12020_COURL' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1270) from apexframework.afw_13_page_item where nom_apex = 'P12020_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1271) from apexframework.afw_13_page_item where nom_apex = 'P12020_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1272) from apexframework.afw_13_page_item where nom_apex = 'P12020_PRENM' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1273) from apexframework.afw_13_page_item where nom_apex = 'P12020_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1274) from apexframework.afw_13_page_item where nom_apex = 'P12020_DATE_EXPIR' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1275) from apexframework.afw_13_page_item where nom_apex = 'P12020_INDIC_VERL' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1276) from apexframework.afw_13_page_item where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1278) from apexframework.afw_13_page_item where nom_apex = 'P12020_GROUP_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1279) from apexframework.afw_13_page_item where nom_apex = 'P12020_FILTR_APLIC' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1280) from apexframework.afw_13_page_item where nom_apex = 'P12020_FILTR_MOT_CLE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1282) from apexframework.afw_13_page_item where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1283) from apexframework.afw_13_page_item where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1284) from apexframework.afw_13_page_item where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1285) from apexframework.afw_13_page_item where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1286) from apexframework.afw_13_page_item where nom_apex = 'CREATE_ADD' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1287) from apexframework.afw_13_page_item where nom_apex = 'P12030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1288) from apexframework.afw_13_page_item where nom_apex = 'P12030_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1289) from apexframework.afw_13_page_item where nom_apex = 'P12030_PRENM' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1290) from apexframework.afw_13_page_item where nom_apex = 'P12030_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1291) from apexframework.afw_13_page_item where nom_apex = 'P12030_ANCN_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1292) from apexframework.afw_13_page_item where nom_apex = 'P12030_NOUV_MOT_PASSE_1' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1293) from apexframework.afw_13_page_item where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_3909(1296) from apexframework.afw_13_page_item where nom_apex = 'P12030_7_0' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12765) from apexframework.afw_13_page_item where nom_apex = 'P6_EXECT' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12766) from apexframework.afw_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12767) from apexframework.afw_13_page_item where nom_apex = 'P12020_APLIQ_FILTR' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12768) from apexframework.afw_13_page_item where nom_apex = 'P12020_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12769) from apexframework.afw_13_page_item where nom_apex = 'P12030_DEFNR_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12770) from apexframework.afw_13_page_item where nom_apex = 'P12030_ANULR' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
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
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(44, 'Update') where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(111, 'Update') where numr_apex = 6 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(37, 'Update') where numr_apex = 50 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(37, 'Update') where numr_apex = 51 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(118, 'Update') where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(105, 'Update') where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(182, 'Update') where numr_apex = 12020 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(135, 'Update') where numr_apex = 12021 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(134, 'Update') where numr_apex = 12030 and ref_aplic = afw$migrt$pkg.obten_var_3928(5, 'Select');
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
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_IMEDT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STAT_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOMBR_ELEMN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_CREAT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'LIEN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(78, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(76, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_EVENM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(76, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_LIBL_STRUC_APLIC_HTML' and ref_page_ir = afw$migrt$pkg.obten_var_3919(77, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_PERTN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(77, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_LIEN' and ref_page_ir = afw$migrt$pkg.obten_var_3919(77, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DNR_REF_STRUC_APLIC_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(77, 'Select');
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
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_3918(151, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(152, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_RESLT_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_NOUV_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_EXECT_NOUV' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_SYSTM' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_MODL_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AUTRE_RECHR' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P51_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P51_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'IMPR_TRAVL' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AJOUT_IMPRE' and ref_page = afw$migrt$pkg.obten_var_3918(155, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(157, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_COURL' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_PRENM' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_DATE_EXPIR' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_VERL' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_GROUP_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_FILTR_APLIC' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_FILTR_MOT_CLE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE_ADD' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_SEQNC' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_NOM' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_PRENM' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_ANCN_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_NOUV_MOT_PASSE_1' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_7_0' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P6_EXECT' and ref_page = afw$migrt$pkg.obten_var_3918(153, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_3918(156, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_APLIQ_FILTR' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(158, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_DEFNR_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_ANULR' and ref_page = afw$migrt$pkg.obten_var_3918(160, 'Select');
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
                       set ref_versn = afw$migrt$pkg.obten_var_4086(84, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = afw$migrt$pkg.obten_var_3928(1, 'Update'),
                           ref_page_conxn = afw$migrt$pkg.obten_var_3918(156, 'Update'),
                           ref_page_acuei = null
                     where seqnc = afw$migrt$pkg.var_3928(5);
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_aplic');
end;
/
begin
  if afw$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('...Mise a jour du referentiel APEX');
    afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_3928(5),'O');
  end if;
end;
/

