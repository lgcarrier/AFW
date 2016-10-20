set define off
set serveroutput on
set feedback off


prompt ========================================
prompt Installation de l'application: SAFA - Assurance qualite

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFA');
  afw$migrt$pkg.var_3928(3) := afw_11_aplic_pkg.maj_aplic ('SAFA','Assurance qualité',1000008, afw$migrt$pkg.vnu_seqnc_prodt);

  afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_3928(3),'O');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFA');
end;
/


prompt ...Metadonnees des entites
prompt ......versn
--Debut - afw_11_versn
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('Debut - afw_11_versn');
delete from tc$11$versn;

insert into APEXFRAMEWORK.tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 'O', null, 4, 4, 0, 0, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, null, 15);
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
            where t.dnr_ref_aplic = afw$migrt$pkg.var_3928(3)
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
select seqnc into afw$migrt$pkg.var_4086(15) from apexframework.afw_11_versn where code = '0100' and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select') and ref_plugn is null and ref_prodt is null;
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

insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 10);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des produits', 1, null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 11);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des applications d''un produit', 2, null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 12);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des pages d''une application', 3, null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 13);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 14);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Commentaire', 102, null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 15);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Validations', 1001, null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 16);
insert into APEXFRAMEWORK.tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_afw01, indic_prise_charg_afw04, indic_prise_charg_afw13_confr, indic_prise_charg_afw13_navgt, indic_prise_charg_afw14_popup, indic_prise_charg_afw18, indic_prise_charg_afw19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2016-09-13 16:03:41', 'YYYY-MM-DD HH24:MI:SS'), null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Validations', 1011, null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), 17);
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
select seqnc into afw$migrt$pkg.var_3918(10) from apexframework.afw_13_page where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
select seqnc into afw$migrt$pkg.var_3918(11) from apexframework.afw_13_page where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
select seqnc into afw$migrt$pkg.var_3918(12) from apexframework.afw_13_page where numr_apex = 2 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
select seqnc into afw$migrt$pkg.var_3918(13) from apexframework.afw_13_page where numr_apex = 3 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
select seqnc into afw$migrt$pkg.var_3918(14) from apexframework.afw_13_page where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
select seqnc into afw$migrt$pkg.var_3918(15) from apexframework.afw_13_page where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
select seqnc into afw$migrt$pkg.var_3918(16) from apexframework.afw_13_page where numr_apex = 1001 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
select seqnc into afw$migrt$pkg.var_3918(17) from apexframework.afw_13_page where numr_apex = 1011 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'Commentaire', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(15, 'Insert'), 11);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'Planification', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(12, 'Insert'), 12);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'Page commune', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(10, 'Insert'), 13);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'Validations', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(17, 'Insert'), 14);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'Page de connexion', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(14, 'Insert'), 15);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'Validations', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(16, 'Insert'), 16);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'Pages d''une application', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(13, 'Insert'), 17);
insert into APEXFRAMEWORK.tc$13$page$lang (dnr_ref_aplic, nom, ref_dv_type_expre, ref_lang, ref_page, seqnc) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'Assurance qualité', null, afw$migrt$pkg.obten_var_4074(1, 'Insert'), afw$migrt$pkg.obten_var_3918(11, 'Insert'), 18);
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
select seqnc into afw$migrt$pkg.var_4041(11) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
select seqnc into afw$migrt$pkg.var_4041(12) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(12, 'Select');
select seqnc into afw$migrt$pkg.var_4041(13) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_4041(14) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(17, 'Select');
select seqnc into afw$migrt$pkg.var_4041(15) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
select seqnc into afw$migrt$pkg.var_4041(16) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(16, 'Select');
select seqnc into afw$migrt$pkg.var_4041(17) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(13, 'Select');
select seqnc into afw$migrt$pkg.var_4041(18) from apexframework.afw_13_page_lang where ref_lang = afw$migrt$pkg.obten_var_4074(1, 'Select') and ref_page = afw$migrt$pkg.obten_var_3918(11, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'N', null, 'Pages', 1, afw$migrt$pkg.obten_var_3918(13, 'Insert'), 2419, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'N', null, 'Liste des produits', 1, afw$migrt$pkg.obten_var_3918(11, 'Insert'), 2417, null);
insert into APEXFRAMEWORK.tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (afw$migrt$pkg.obten_var_3928(3, 'Insert'), 'N', null, 'Applications', 1, afw$migrt$pkg.obten_var_3918(12, 'Insert'), 2418, null);
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
select seqnc into afw$migrt$pkg.var_3919(2419) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(13, 'Select');
select seqnc into afw$migrt$pkg.var_3919(2417) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(11, 'Select');
select seqnc into afw$migrt$pkg.var_3919(2418) from apexframework.afw_13_page_ir where ref_page = afw$migrt$pkg.obten_var_3918(12, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457003805532900903, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(2417, 'Insert'), 17789, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457003925159900904, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_3919(2417, 'Insert'), 17790, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457004019979900904, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_3919(2417, 'Insert'), 17791, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457008829018059578, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(2418, 'Insert'), 17792, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457008930651059578, 'O', null, 'Code', 2, afw$migrt$pkg.obten_var_3919(2418, 'Insert'), 17793, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_FORMT', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457009035090059578, 'O', null, 'Nom', 4, afw$migrt$pkg.obten_var_3919(2418, 'Insert'), 17794, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC_APEX', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457009316289059578, 'O', null, 'Numéro', 7, afw$migrt$pkg.obten_var_3919(2418, 'Insert'), 17795, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOMBR_EREUR', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 92330324823655988, 'O', null, 'Nb. validations', 8, afw$migrt$pkg.obten_var_3919(2418, 'Insert'), 17796, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457015535932073191, 'O', null, 'Seqnc', 1, afw$migrt$pkg.obten_var_3919(2419, 'Insert'), 17797, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APEX', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457015618298073191, 'O', null, 'Numéro', 2, afw$migrt$pkg.obten_var_3919(2419, 'Insert'), 17798, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 457015722812073191, 'O', null, 'Nom', 3, afw$migrt$pkg.obten_var_3919(2419, 'Insert'), 17799, null);
insert into APEXFRAMEWORK.tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOMBR_EREUR', afw$migrt$pkg.obten_var_3928(3, 'Insert'), 92330101772636289, 'O', null, 'Nb. validations', 4, afw$migrt$pkg.obten_var_3919(2419, 'Insert'), 17800, null);
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
select seqnc into afw$migrt$pkg.var_3895(17789) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2417, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17790) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2417, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17791) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2417, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17792) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17793) from apexframework.afw_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17794) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17795) from apexframework.afw_13_page_ir_coln where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17796) from apexframework.afw_13_page_ir_coln where coln_table = 'NOMBR_EREUR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17797) from apexframework.afw_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2419, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17798) from apexframework.afw_13_page_ir_coln where coln_table = 'NUMR_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2419, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17799) from apexframework.afw_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2419, 'Select');
select seqnc into afw$migrt$pkg.var_3895(17800) from apexframework.afw_13_page_ir_coln where coln_table = 'NOMBR_EREUR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2419, 'Select');
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

insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 1979678257017752121, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 66, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2009223256300833029, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 67, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2009223483774833031, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 68, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2009223658764833031, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 69, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2009562477186452512, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 70, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2031046961177509176, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 71, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2053787277574676809, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 72, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2053787482769678332, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 73, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2053787687617679679, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 74, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2125501021274740622, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', afw$migrt$pkg.obten_var_3918(10, 'Insert'), 75, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 1979977037017309273, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', afw$migrt$pkg.obten_var_3918(14, 'Insert'), 76, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 1979977245401309274, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', afw$migrt$pkg.obten_var_3918(14, 'Insert'), 77, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 1979977637285309274, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', afw$migrt$pkg.obten_var_3918(14, 'Insert'), 79, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 1979977837249309275, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', afw$migrt$pkg.obten_var_3918(14, 'Insert'), 80, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 1979978030730309275, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', afw$migrt$pkg.obten_var_3918(14, 'Insert'), 81, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2383218344958644642, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', afw$migrt$pkg.obten_var_3918(15, 'Insert'), 82, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2383218848782644645, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', afw$migrt$pkg.obten_var_3918(15, 'Insert'), 83, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2383219328709644645, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', afw$migrt$pkg.obten_var_3918(15, 'Insert'), 84, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2383219545635644646, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', afw$migrt$pkg.obten_var_3918(15, 'Insert'), 85, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2383220043730644647, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', afw$migrt$pkg.obten_var_3918(15, 'Insert'), 86, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2383220251672644647, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', afw$migrt$pkg.obten_var_3918(15, 'Insert'), 87, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2383220751443644647, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', afw$migrt$pkg.obten_var_3918(15, 'Insert'), 88, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 2379628243968330541, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', afw$migrt$pkg.obten_var_3918(15, 'Insert'), 89, 'BOUTN');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 457344617602926889, 'O', null, null, null, null, 'N', null, '[P1001_MODE]', 'P1001_MODE', afw$migrt$pkg.obten_var_3918(16, 'Insert'), 90, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 457398934420471079, 'O', null, null, null, null, 'N', null, '[P1011_MODE]', 'P1011_MODE', afw$migrt$pkg.obten_var_3918(17, 'Insert'), 91, 'ITEM');
insert into APEXFRAMEWORK.tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, icone_bulle_aide, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, afw$migrt$pkg.obten_var_3928(3, 'Insert'), null, 1979977434732309274, 'N', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', afw$migrt$pkg.obten_var_3918(14, 'Insert'), 12764, 'BOUTN');
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
select seqnc into afw$migrt$pkg.var_3909(66) from apexframework.afw_13_page_item where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(67) from apexframework.afw_13_page_item where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(68) from apexframework.afw_13_page_item where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(69) from apexframework.afw_13_page_item where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(70) from apexframework.afw_13_page_item where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(71) from apexframework.afw_13_page_item where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(72) from apexframework.afw_13_page_item where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(73) from apexframework.afw_13_page_item where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(74) from apexframework.afw_13_page_item where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(75) from apexframework.afw_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
select seqnc into afw$migrt$pkg.var_3909(76) from apexframework.afw_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
select seqnc into afw$migrt$pkg.var_3909(77) from apexframework.afw_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
select seqnc into afw$migrt$pkg.var_3909(79) from apexframework.afw_13_page_item where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
select seqnc into afw$migrt$pkg.var_3909(80) from apexframework.afw_13_page_item where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
select seqnc into afw$migrt$pkg.var_3909(81) from apexframework.afw_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
select seqnc into afw$migrt$pkg.var_3909(82) from apexframework.afw_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
select seqnc into afw$migrt$pkg.var_3909(83) from apexframework.afw_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
select seqnc into afw$migrt$pkg.var_3909(84) from apexframework.afw_13_page_item where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
select seqnc into afw$migrt$pkg.var_3909(85) from apexframework.afw_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
select seqnc into afw$migrt$pkg.var_3909(86) from apexframework.afw_13_page_item where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
select seqnc into afw$migrt$pkg.var_3909(87) from apexframework.afw_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
select seqnc into afw$migrt$pkg.var_3909(88) from apexframework.afw_13_page_item where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
select seqnc into afw$migrt$pkg.var_3909(89) from apexframework.afw_13_page_item where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
select seqnc into afw$migrt$pkg.var_3909(90) from apexframework.afw_13_page_item where nom_apex = 'P1001_MODE' and ref_page = afw$migrt$pkg.obten_var_3918(16, 'Select');
select seqnc into afw$migrt$pkg.var_3909(91) from apexframework.afw_13_page_item where nom_apex = 'P1011_MODE' and ref_page = afw$migrt$pkg.obten_var_3918(17, 'Select');
select seqnc into afw$migrt$pkg.var_3909(12764) from apexframework.afw_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
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
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(86, 'Update') where numr_apex = 1 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(9, 'Update') where numr_apex = 2 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(1, 'Update') where numr_apex = 3 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(118, 'Update') where numr_apex = 101 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = afw$migrt$pkg.obten_var_3911(105, 'Update') where numr_apex = 102 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1001 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
update afw_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1011 and ref_aplic = afw$migrt$pkg.obten_var_3928(3, 'Select');
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
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2417, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2417, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2417, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_FORMT' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOMBR_EREUR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2418, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2419, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APEX' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2419, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2419, 'Select');
update afw_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOMBR_EREUR' and ref_page_ir = afw$migrt$pkg.obten_var_3919(2419, 'Select');
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
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = afw$migrt$pkg.obten_var_3918(10, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = afw$migrt$pkg.obten_var_3918(15, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1001_MODE' and ref_page = afw$migrt$pkg.obten_var_3918(16, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1011_MODE' and ref_page = afw$migrt$pkg.obten_var_3918(17, 'Select');
update afw_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = afw$migrt$pkg.obten_var_3918(14, 'Select');
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
                       set ref_versn = afw$migrt$pkg.obten_var_4086(15, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = afw$migrt$pkg.obten_var_3928(1, 'Update'),
                           ref_page_conxn = afw$migrt$pkg.obten_var_3918(14, 'Update'),
                           ref_page_acuei = null
                     where seqnc = afw$migrt$pkg.var_3928(3);
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_aplic');
end;
/
begin
  if afw$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('...Mise a jour du referentiel APEX');
    afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.var_3928(3),'O');
  end if;
end;
/

