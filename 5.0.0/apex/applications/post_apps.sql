set define off
set serveroutput on
set feedback off


prompt ========================================
prompt Post-applications

prompt ...Metadonnees des entites
prompt ......aplic
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_aplic;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_11_aplic');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_aplic');
end;
/

prompt ......type_comnc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_type_comnc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_type_comnc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_type_comnc');
end;
/

prompt ......versn
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

prompt ......code_err_oracl
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_code_err_oracl;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_code_err_oracl');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_code_err_oracl');
end;
/

prompt ......type_fichr
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_type_fichr;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_type_fichr');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_type_fichr');
end;
/

prompt ......modl_comnc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_modl_comnc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_modl_comnc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_modl_comnc');
end;
/

prompt ......entit
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_FONCT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_PARMT_AFW' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_DOMN_FONCT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_OPERT_OPTIO' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_GR_UT_OPERT_OPTIO_DOMN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_FONCT_STRUC_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_CARNT_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_07_VALR_AUDIT_STRUC_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_ACTIO_AUDIT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_MESG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_ATRIB_STRUC_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_AFECT_ITEM' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_PAGE_ITEM' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_CARNT_SPRIN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_ITEM_CARNT_SPRIN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_CARNT_PRODT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_EFORT_ITEM' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_PAGE' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_REQT_INTER_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_23_RESLT_RECHR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_HISTR_EFORT_RESTN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_ITEM_CARNT_PRODT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_30_CAS_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_CHAMP_PUBLC_TRAVL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_OCURN_PARMT_PUBLC_TRAVL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_23_DETL_APLIC_MODL_RECHR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_23_ENONC_RECHR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_23_PATRN_RECHR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_23_APLIC_MODL_RECHR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_STRUC_APLIC_SUIVI' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_MODL_COMNC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_TYPE_TRAVL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_CONFG_EVENM_NOTFB' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_MODL_AFICH_NOTFC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_TYPE_COMNC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_COMPT_TWILI' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_PIECE_TELCP_AXIAT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_SMS_TWILI' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_EVENM_NOTFB' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_COMPT_AXIAT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_23_MODL_RECHR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_NOTFC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_ATRIB_MODL_COMNC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_23_DETL_RESLT_RECHR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_STRUC_APLIC_DESTN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_23_RECHR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_03_JOURN_STRUC_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_RESLT_DESTN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_TELCP_AXIAT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_VALR_CHAMP' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_MESG_LANG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_SMS_TWILI_ENTRA' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_MESG_ERR_LIE' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_CODE_ERR_ORACL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_LANG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_21_PLUGN_ITEM_MENU' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_21_PLUGN_MENU' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_29_RESLT_REQUT_AQ' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_29_CONTR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_CHAMP' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_VERSN_PUBLC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_DESTN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_EXPOR_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_STRUC_ADMIN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_PAGE_IR_COLN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_07_INSTA_SEMPH' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_LIEN_GROUP_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_04_FIL_ARIAN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_LIEN_STRUC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_entit');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_MESG_TRADC_APEX' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_19_CLE' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_NAVGT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_19_SPECF_FONCT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_STAT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_INSTA_PREFR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_04_CONTX' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_19_FONCT_LANG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_PAGE_ITEM' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_14_DOMN_VALR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_STRUC_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_STRUC_APLIC_LANG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_19_FONCT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_14_TYPE_DOMN_VALR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_OPERT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_GROUP_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_TYPE_STRUC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_PAGE' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_PAGE_IR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_14_FORMT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_REGN_PILTB' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_LANG_LANG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_04_CONTX_ETEND' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_MESG_INFOR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_MEMBR_STRUC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_14_DETL_DOMN_VALR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_SESN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_PRODT_LANG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_PREFR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_07_ETAT_SESN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_LISTE_NAVGT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_EVOLT_STAT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_19_DISPN_FONCT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_PRODT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_07_SEMPH' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_03_JOURN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_DEFNT_ACCES' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_CONDT_PILTB' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_21_PLUGN_CALND' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_CONDT_EXECT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_20_MODL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_TYPE_PUBLC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_20_DETL_DOCMN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_20_SECTN_DOCMN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_20_DOCMN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_DOMN_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_GROUP_PUBLC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_TYPE_FICHR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_ENTIT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_LIEN_CONDT_PILTB' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_ITEM_MENU' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_MIME_TYPE' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_ELEMN_CONFG_PUBLC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_20_MODL_PARMT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_HISTR_ACCES' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_21_PLUGN_ARBRE' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_PAGE_LANG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_ELEMN_CONFG_EVENM_NOTFB' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_ENGIN_VERSN_PUBLC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_JOURN_TRAVL_EXECT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_RESRC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_FORMT_RESRC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_03_LIEN_CLAS_INTER_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_DOMN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_21_PLUGN_CALND_TYPE' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_DOMN_TYPE_PUBLC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_20_MODL_EXCEP' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_PARMT_PUBLC_TRAVL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_EXPOR_PAGE' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_PUBLC_TRAVL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_21_PLUGN_ARBRE_NOEUD' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_PRODT_RESRC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_19_BOUTN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_20_DEPLM' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_04_NAVGT_HISTR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_EMPLA_DOSR_VIRTL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_PAGE_PREFR_NAVGT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_GROUP_STAT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_VERSN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_MENU' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_PARMT_TYPE_PUBLC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_DOSR_VIRTL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_FAVR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_PAGE_ITEM_LANG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_NAVGT_ELEMN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_REGN_PILTB_LANG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_TRAVL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_ENGIN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_HIERC_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_03_CLAS_INTER' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_PROFL_COURL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_OCURN_RESRC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_VALR_ELEMN_CONFG' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_03_TRACE_EXECT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_ARBRE_NOEUD' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_PARMT_PUBLC_TRAVL_EXECT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_ATRIB_ENTIT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_ARBRE' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_MODL_MESG_NOTFC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_entit');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_DESTN_CONFG_EVENM_NOTFB' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_OCURN_SA_EVENM_NOTFB' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_21_PLUGN_CALND_COULR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_COURL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_COURL_PIECE_JOINT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_COURL_DESTN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_07_AUDIT_STRUC_APLIC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_25_PUBLC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_11_PLUGN' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_PROPR_COURL_ENTRA' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_ATACH_COURL_ENTRA' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_17_COURL_ENTRA' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_04_TUTRL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_UTILS_AVATR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_01_PROPG_EVENM_NOTFB' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_HISTR_TUTRL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_DOMN_SERVR_LDAP' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_SERVR_LDAP' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_ETAPE_TUTRL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_13_TUTRL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_LIEN_GADGT_UTILS_PARMT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_TUTRL' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_37_LIEN_GADGT_PARMT_RACRC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_37_GADGT_PARMT_RACRC' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_GROUP_GADGT_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_37_GADGT_CATGR' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_37_GADGT_PARMT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_37_TABL_BORD' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_LIEN_GR_GADGT_GR_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_37_GADGT' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
update afw_11_entit set ref_atrib_entit_supr = null where code = 'AFW_12_LIEN_GADGT_UTILS' and ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_entit;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_11_entit');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_entit');
end;
/

prompt ......plugn_calnd_coulr
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_calnd_coulr;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_calnd_coulr');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_calnd_coulr');
end;
/

prompt ......atrib_modl_comnc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_atrib_modl_comnc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_atrib_modl_comnc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_atrib_modl_comnc');
end;
/

prompt ......formt
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$14_formt;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_14_formt');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_14_formt');
end;
/

prompt ......atrib_entit
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH4' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(347, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ELEMN_CONFG_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(295, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(327, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL_REGN' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(277, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EREUR' and ref_entit = afw$migrt$pkg.obten_var_entit(306, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(292, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(310, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DERNR_PRODT_ACCES' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'WHO_CALLED_ME' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TABL_EXTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(380, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(317, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_IGNOR' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(354, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(255, 'Update') where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(298, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR4' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ID_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH1' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_CONDT_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(312, 'Update') where code = 'REF_TYPE_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(251, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(277, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ADJEC_DEMNS' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(355, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(318, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PREFR' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PHYSQ' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(218, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_REQT_INTER' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB2' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ARBRE' and ref_entit = afw$migrt$pkg.obten_var_entit(366, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_TRIER_PAR' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRS' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'IMAGE_SPRIT' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MOT' and ref_entit = afw$migrt$pkg.obten_var_entit(227, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(246, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_PLSQL_GAUCH' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ATRIB_SA_ADRES_DESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(372, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_SCHEM' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DERNR_DOMN_ACCES' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_SMS_NOTFC' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(243, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(235, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(213, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(235, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ID_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'GROUP_SMS' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MIME_TYPE' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(245, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TELCP_AXIAT' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_ARIER_PLAN' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(212, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(232, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_TITRE' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(218, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_LIBL_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(221, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CAS_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_PAGE_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SUCRS_IMPLA' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REINT_SIDF' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(262, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(211, 'Update') where code = 'REF_ATRIB_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(262, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PORT' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MODIF' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NOMBR' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_TROP_DON_TROUV' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(286, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_RANGE_MODF' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_RANGE_INSER_SPECF' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROMCITY' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ID_APEX_REGN' and ref_entit = afw$migrt$pkg.obten_var_entit(369, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(372, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(373, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_HIERC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(372, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE_PERST' and ref_entit = afw$migrt$pkg.obten_var_entit(266, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(278, 'Update') where code = 'REF_PAGE_ITEM' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH10' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(350, 'Update') where code = 'REF_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(305, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_LECTR_SEUL' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXTRA_TOTAL' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(291, 'Update') where code = 'REF_REGN_PILTB' and ref_entit = afw$migrt$pkg.obten_var_entit(357, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(360, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'OBJET' and ref_entit = afw$migrt$pkg.obten_var_entit(370, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(360, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'HEURE_FIN_EXTEN' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CORPS_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(370, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(370, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(370, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(370, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_EVENM_NOTFB' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(360, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'HEURE_DEBUT_EXTEN' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_MINTS_INTER' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(370, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(370, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'HEURE_FIN_NORML' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'APLIC_PRIOR' and ref_entit = afw$migrt$pkg.obten_var_entit(360, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE_LISTE' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR1' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SCPC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_AIDE_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_3' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(339, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(310, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(369, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ACTIO' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(266, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(289, 'Update') where code = 'REF_PAGE_IR' and ref_entit = afw$migrt$pkg.obten_var_entit(347, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(317, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR7' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(255, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(332, 'Update') where code = 'REF_FORMT_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DISPN_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(356, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(298, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MODE_CACHE' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(300, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXTRA_TOUT' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(369, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_AIDE_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(298, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_COMNC_PAR_RACN' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(353, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(302, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(277, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(356, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH3' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_REGN_ARBRE' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_MODL' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_COURN' and ref_entit = afw$migrt$pkg.obten_var_entit(356, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'URL_SERVL' and ref_entit = afw$migrt$pkg.obten_var_entit(359, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE9' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SESS_ID' and ref_entit = afw$migrt$pkg.obten_var_entit(294, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(348, 'Update') where code = 'REF_GROUP_STAT' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DATE_FIN' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SSPI' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_CONTX_INTER' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(277, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXTRA_TERMN' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(363, 'Update') where code = 'REF_OCURN_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(312, 'Update') where code = 'REF_TYPE_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(316, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(366, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(315, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(359, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TABL_EXTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MOT_PASSE' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MIME_TYPE' and ref_entit = afw$migrt$pkg.obten_var_entit(322, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_MESG_AIDE_CONTX' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(294, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL' and ref_entit = afw$migrt$pkg.obten_var_entit(337, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(255, 'Update') where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(355, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR8' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_FORMT_SORT' and ref_entit = afw$migrt$pkg.obten_var_entit(359, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CORDN_X_DEBUT' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(274, 'Update') where code = 'REF_STAT' and ref_entit = afw$migrt$pkg.obten_var_entit(302, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR_COMNT' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXTRA_TOUT' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_ICON' and ref_entit = afw$migrt$pkg.obten_var_entit(345, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(254, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_CONTN_ITEM_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_ALIGN' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_FORMT_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'HAUTR_REGN_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_COULR_THEME' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_COULR_PRINC' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(350, 'Update') where code = 'REF_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_ORIEN_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_REGN_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_TYPE_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROM' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TOCOUNTRY' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_BODY' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_ACCOUNTSID' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TOCITY' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_3' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(318, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_ID' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_JOURN' and ref_entit = afw$migrt$pkg.obten_var_entit(330, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(317, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ORGAN' and ref_entit = afw$migrt$pkg.obten_var_entit(337, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SCPI' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(254, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COURL' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ID_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(297, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(277, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(366, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(255, 'Update') where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(327, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(300, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(345, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(292, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(354, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = afw$migrt$pkg.obten_var_entit(357, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AGEND_NOM_TABLE' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_INTER' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB3' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(283, 'Update') where code = 'REF_TYPE_DOMN_VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(380, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_VERSN_2' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(345, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(254, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TEXT_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(294, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(269, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(295, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TABL_EXTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CHANG_MOT_PASSE' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_CONDT_PLSQL' and ref_entit = afw$migrt$pkg.obten_var_entit(310, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'HAUTR_PREPN' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DEPLC' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(302, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(336, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_4' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(344, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRS' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOEUD_OUVER' and ref_entit = afw$migrt$pkg.obten_var_entit(366, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_AIDE' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SSPI' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(318, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(316, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(292, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(322, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(269, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_5' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ENVIR' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEMPH' and ref_entit = afw$migrt$pkg.obten_var_entit(266, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(269, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOCMN' and ref_entit = afw$migrt$pkg.obten_var_entit(313, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL' and ref_entit = afw$migrt$pkg.obten_var_entit(344, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_HEURE' and ref_entit = afw$migrt$pkg.obten_var_entit(306, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(302, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXPRT' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_AFW13_NAVGT' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_2' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(356, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_NAVGT_HISTR' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(285, 'Update') where code = 'REF_GROUP_UTILS_LIE' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES_IP' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PACKG' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ID_TEMPL_BOUTN' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(337, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ICONE' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DETL_DOCMN' and ref_entit = afw$migrt$pkg.obten_var_entit(313, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(354, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(380, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(354, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SHIFT' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR2' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESRC_COMPS' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(332, 'Update') where code = 'REF_FORMT_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESPN' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DEFNT' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_CONDT_COMNC_PAR' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB5' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RAPRT_INTER' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR5' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SAPC' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(255, 'Update') where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONDT' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(278, 'Update') where code = 'REF_PAGE_ITEM_FOCUS' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(345, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_PARMT' and ref_entit = afw$migrt$pkg.obten_var_entit(344, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_SURCH' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TITRE_AIDE_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TYPE' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(336, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(297, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_MESG_TOTL' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE3' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SESSION_ID' and ref_entit = afw$migrt$pkg.obten_var_entit(300, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(316, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_SUBST' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_IGNOR_GROUP_ADMIN' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_EXPOR_METDN' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_RESPN' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DOCMN_REFRC' and ref_entit = afw$migrt$pkg.obten_var_entit(207, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(318, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_EXPRE' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_CHOIX' and ref_entit = afw$migrt$pkg.obten_var_entit(322, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(277, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(336, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(278, 'Update') where code = 'REF_ITEM' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_INDIC_EVENM_MODFB' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_INTER' and ref_entit = afw$migrt$pkg.obten_var_entit(380, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRESN_APPEL' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AIDE_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(298, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(346, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(295, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(300, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB5' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(255, 'Update') where code = 'REF_LANG_CIBLE' and ref_entit = afw$migrt$pkg.obten_var_entit(292, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DEUX' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR9' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'HASH_DERNR_URL' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(330, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_CONDT_SAUVG' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(278, 'Update') where code = 'REF_PAGE_ITEM' and ref_entit = afw$migrt$pkg.obten_var_entit(355, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(251, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_COURT' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(344, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(344, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(327, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REINT_NAVGT' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(251, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MESG_AIDE_CONTX' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(262, 'Update') where code = 'REF_DESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_INDIC_JOURN_COMPL' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_AUDIT_SUPRS' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE_ACUEI' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(208, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(208, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PIPLN' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB3' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(347, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TRAVL_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UN' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(305, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(353, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(218, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'OBJET' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH_UNIQ' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(218, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(363, 'Update') where code = 'REF_OCURN_RESRC_ICON' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_CURSR_AIDE_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_REFRC_DOCMN' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_PRECD' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ACTIO_JOURN' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_RESPN' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COMPT_AXIAT' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(243, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'STAT_SOUMS' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_SPRIN' and ref_entit = afw$migrt$pkg.obten_var_entit(221, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_DESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MESG_SMS' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_ENVOI_DIFR' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_ERR' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(235, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(245, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_HEURE_SAISI' and ref_entit = afw$migrt$pkg.obten_var_entit(221, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(232, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(332, 'Update') where code = 'REF_FORMT_RESRC_ICON' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PARMT_ALIMN' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MODIF_OCURN' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(295, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_SEQNC_SA_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TYPE_STRUC' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_AFW01' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TIMST' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_IMEDT' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_KEYDW' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(255, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VERSN_BD_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(305, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AGEND_COLN_TITRE' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(286, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_AFW14_POPUP' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SESSION_ID' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB2' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_LIEN' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(310, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_AFICH' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(359, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ID_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(322, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_SAPI' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SSPC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(298, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_EXECT' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(318, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_ICONE_NOEUD' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'APP_ID' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(277, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(331, 'Update') where code = 'REF_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB4' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(315, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONTX' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACCES' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(315, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_VERSN_1' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(302, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TEMPL_BOUTN' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REINT_PAGE_IR' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_EVENM' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COMNT' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AGEND_COLN_COULR' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_LARGR' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(353, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(313, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(379, 'Update') where code = 'REF_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(331, 'Update') where code = 'REF_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(363, 'Update') where code = 'REF_OCURN_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(332, 'Update') where code = 'REF_FORMT_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_INSTA_LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(321, 'Update') where code = 'REF_ITEM_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(257, 'Update') where code = 'REF_PLUGN_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NIV_ITEM' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ETEND_NOMBR_COLN' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'RANG_ITEM' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_ITEM' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(256, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(317, 'Update') where code = 'REF_GROUP_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(254, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_CONTR' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(327, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(316, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CLEAR_PAGE_IR' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'STAT_SOUMS' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(356, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DETRM' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(310, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRM_OCURN' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(295, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_VALR_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GROUP_UTILS_ADMIN' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(318, 'Update') where code = 'REF_TYPE_FICHR' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE_CIBLE' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH2' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(315, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_ITEM' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(285, 'Update') where code = 'REF_GROUP_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(318, 'Update') where code = 'REF_TYPE_FICHR' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(369, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PREFX_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(269, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(305, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(295, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_VERSN_4' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(355, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_SSPC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(313, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ACCES_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ACCES' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FIL_ARIAN' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'OBJET' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_1' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ITEM_SUBST' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_SQL' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_LIE' and ref_entit = afw$migrt$pkg.obten_var_entit(269, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(327, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_TYPE_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DISPN_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(349, 'Update') where code = 'REF_VERSN' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_REGN_CALND' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(255, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EFACR_CACHE' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_INITL' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(355, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_RANG_EXTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AGEND_COLN_VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(355, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CTRL' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONCT_PROPR_ENTET_GAUCH' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CONFR_SAUVG' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EN_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_AIDE_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(339, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PHYSQ_COMPS' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_2' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SOUMS_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EXPLI' and ref_entit = afw$migrt$pkg.obten_var_entit(306, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(354, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(255, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EXPRE_ACTIO' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_CONDT_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE_EREUR' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_SCPC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(308, 'Update') where code = 'REF_CONDT_PILTB' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DEPSM_ALIAS_COLN' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VARBL2' and ref_entit = afw$migrt$pkg.obten_var_entit(305, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(269, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DOCMN_VERL' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_PAGE_GARDE' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REINT_PAGNT' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(286, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB5' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(347, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_ADMIN' and ref_entit = afw$migrt$pkg.obten_var_entit(269, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(292, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_REQST' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(354, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'POSTN' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTX' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(347, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(380, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RENMR' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(284, 'Update') where code = 'REF_OPERT' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(255, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COMPR_MIGRT' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(317, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LB' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE4' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(302, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(322, 'Update') where code = 'REF_MIME_TYPE' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR10' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GROUP_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB4' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_NAVGT' and ref_entit = afw$migrt$pkg.obten_var_entit(356, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREER_NOEUD' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONCT_PROPR_ENTET_DROIT' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(344, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AUTHID_CURNT_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(352, 'Update') where code = 'REF_DOSR_VIRTL' and ref_entit = afw$migrt$pkg.obten_var_entit(346, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(327, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(355, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(377, 'Update') where code = 'REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(377, 'Update') where code = 'REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_TRAIT' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_VALD_NIV_SECRT_MOT_PASSE' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DEMND_ACTIV_COMPT_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(377, 'Update') where code = 'REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_AUDIT_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_AUDIT_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FONCT_OBTEN_BASE_URL' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC_COMNT_BOGUE' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC_ACUEI' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(377, 'Update') where code = 'REF_APLIC_AUTHE' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_APLIC_AUTHE' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APLIC_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE_CONXN' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(208, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(208, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_AUDIT_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(208, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(208, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(208, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(208, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NATR_AUDIT' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ACTIO_AUDIT' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(344, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(255, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(366, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(380, 'Update') where code = 'REF_PLUGN' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(357, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ID_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(297, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(345, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(243, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(285, 'Update') where code = 'REF_GROUP' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ALT' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_ELEMN' and ref_entit = afw$migrt$pkg.obten_var_entit(356, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(346, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'APP_USER' and ref_entit = afw$migrt$pkg.obten_var_entit(297, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRM_NOEUD' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(317, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE6' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(286, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(355, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(266, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(318, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PILE_TRACE' and ref_entit = afw$migrt$pkg.obten_var_entit(306, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(352, 'Update') where code = 'REF_DOSR_VIRTL' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DATE_DEBUT' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(349, 'Update') where code = 'REF_VERSN' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(286, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(254, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(347, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(359, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(310, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SAPC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PREVN_ACTIO_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(318, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_URL' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_URL' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(262, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(211, 'Update') where code = 'REF_ATRIB_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(360, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(360, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'HEURE_DEBUT_NORML' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(360, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(239, 'Update') where code = 'REF_EVENM_NOTFB' and ref_entit = afw$migrt$pkg.obten_var_entit(360, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(349, 'Update') where code = 'REF_VERSN' and ref_entit = afw$migrt$pkg.obten_var_entit(380, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(346, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_ALIMN' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH8' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EXT' and ref_entit = afw$migrt$pkg.obten_var_entit(322, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ROLE' and ref_entit = afw$migrt$pkg.obten_var_entit(353, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(366, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(254, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(354, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_ELEMN' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE_TEMPR' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_URL' and ref_entit = afw$migrt$pkg.obten_var_entit(345, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(286, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(310, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(337, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(295, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'APP_USER' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SYSTM' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_POUR' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(357, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONCT_PROPR_ENTET_CENTR' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(315, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_FICHR' and ref_entit = afw$migrt$pkg.obten_var_entit(375, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES_ENVOY' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = afw$migrt$pkg.obten_var_entit(375, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'STAT_SOUMS' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(376, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(376, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES' and ref_entit = afw$migrt$pkg.obten_var_entit(376, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ENVOY' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(376, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(376, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SENS' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL' and ref_entit = afw$migrt$pkg.obten_var_entit(375, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_TENTV_MAX' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SUJET' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(375, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FIL_ATENT' and ref_entit = afw$migrt$pkg.obten_var_entit(376, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_MDP' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(245, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(224, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(360, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = afw$migrt$pkg.obten_var_entit(224, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CHAMP' and ref_entit = afw$migrt$pkg.obten_var_entit(224, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(224, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(224, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(224, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(224, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PROCD_INFOR_SUPLM' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PAGE_INEXS_MAJ_REFRN' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTX_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_SUCS' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_ECHEC' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_ECHEC_SPECF' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'POSTN_X' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'POSTN_Y' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ANGLE_ORINT' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_CHAMP' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PDF_FUSN' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CHAMP' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXPOR_TABL_INDEX' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_TROP_DON_TROUV' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_COMNC_PAR_COLN_PARNT_NUL' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH_ERR_CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'JQUER_UI_CSS_SCOPE' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_SMSSTATUS' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'IDEN_ACCES' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_NOUVL_ATRIB' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(368, 'Update') where code = 'REF_ATRIB_ENTIT_SUPR' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DISPN_DOCMN' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(315, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(315, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR' and ref_entit = afw$migrt$pkg.obten_var_entit(225, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE' and ref_entit = afw$migrt$pkg.obten_var_entit(225, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(319, 'Update') where code = 'REF_ENTIT_REFRN' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = afw$migrt$pkg.obten_var_entit(225, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CARDN' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FORCE_SELCT' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(225, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PARMT_PUBLC_TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(225, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_PRICE' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(245, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(235, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DATE_JOURN_COMPL' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_URI' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONFG_INCLU_MIGRT' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SERVR_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SSL_SORTN' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SSL_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_USAGR_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SERVR_SORTN' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PORT_SORTN' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_METHD_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NIV_INCLU_MIGRT' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_USAGR_SORTN' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PORT_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_MDP_SORTN' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_MDP_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COMPT_AXIAT_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_METHD_SORTN' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RAFRC' and ref_entit = afw$migrt$pkg.obten_var_entit(369, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SUIVI' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREAT_INITL' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CHARG_PROGR' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STAT' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PERSN' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STAT' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(230, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(334, 'Update') where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PROCD_GLISR_ELEMN_ARBRE' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PROCD_DEPSR_ELEMN_ARBRE' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(231, 'Update') where code = 'REF_MODL_COMNC' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(235, 'Update') where code = 'REF_TYPE_COMNC' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(262, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(262, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(262, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CORPS' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(262, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COMPT_TWILI' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COURL' and ref_entit = afw$migrt$pkg.obten_var_entit(375, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MODE_ATACH' and ref_entit = afw$migrt$pkg.obten_var_entit(375, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(376, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_USAGR' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SERVR' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_TENTV' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(376, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE' and ref_entit = afw$migrt$pkg.obten_var_entit(376, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(251, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(357, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_STRUC_ACCES_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ORGAN' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_VERL' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(380, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_SNPI' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FORMT_ORCL' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_SCPI' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(345, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(294, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_SUPRS_SPECF' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CLE' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_PREPN' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SSPC' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(274, 'Update') where code = 'REF_STAT_EVOLT' and ref_entit = afw$migrt$pkg.obten_var_entit(302, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(344, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_AFW04' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TEXT' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(346, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(339, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(337, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB1' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(300, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(269, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(310, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(289, 'Update') where code = 'REF_PAGE_IR' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STAT' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TAIL_RELTV' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_RECHR_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_LIEN' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(218, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_DECMP_RESLT' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STAT' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(221, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_RESPN' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB3' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_LIEN' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(359, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AGREG' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_AFW_13_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(218, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'URL_SERVL_EXTER' and ref_entit = afw$migrt$pkg.obten_var_entit(359, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(354, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(269, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC' and ref_entit = afw$migrt$pkg.obten_var_entit(330, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VARBL1' and ref_entit = afw$migrt$pkg.obten_var_entit(305, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(284, 'Update') where code = 'REF_OPERT' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(337, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TITRE' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(322, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(302, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH9' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_ELEMN' and ref_entit = afw$migrt$pkg.obten_var_entit(356, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(353, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'APP' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_SPRIN' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ID_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_1' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_SUCS_SPECF' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROMSTATE' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(357, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(346, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SECTN_DOCMN' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EMPLA' and ref_entit = afw$migrt$pkg.obten_var_entit(346, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AVERT_AUTR_UNIQ' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(327, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_AFW19' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(318, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(255, 'Update') where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(292, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(353, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EN_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE1' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MIME_TYPE' and ref_entit = afw$migrt$pkg.obten_var_entit(375, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_METHD' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FORMT_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(374, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(294, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRM_DON_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_NATR_INFOR' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(224, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INFOR_SUPLM' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LISTE_REF_PAGE_ACTIV' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(359, 'Update') where code = 'REF_ENGIN' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = afw$migrt$pkg.obten_var_entit(250, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MESG_TOUT_DROIT_RESRV' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(260, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROMZIP' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_APIVERSION' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESTN_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_AFICH_NOTFC' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_TIME' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(243, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EFORT_RESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(216, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_VERSN_3' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(369, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_BOUTN' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(327, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESLT_DESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(277, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(380, 'Update') where code = 'REF_PLUGN' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MOT_PASSE_WALT' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(255, 'Update') where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(357, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(346, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(313, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_TYPE_REGN_PILTB' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_CONTX' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(353, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SYSTM' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(251, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(294, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_LIAIS' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_EVENM' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ELEMN_SUP' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(313, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_PRE_REQT' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXCLU' and ref_entit = afw$migrt$pkg.obten_var_entit(305, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(290, 'Update') where code = 'REF_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREER_OCURN' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(312, 'Update') where code = 'REF_TYPE_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(326, 'Update') where code = 'REF_PLUGN_ARBRE' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ORGAN' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(345, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DISPN_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACTIF' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(353, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AGEND' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_SAPC' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(345, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_4' and ref_entit = afw$migrt$pkg.obten_var_entit(273, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(277, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SECTN_DOCMN' and ref_entit = afw$migrt$pkg.obten_var_entit(313, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(283, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DUREE' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(348, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(316, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(349, 'Update') where code = 'REF_VERSN' and ref_entit = afw$migrt$pkg.obten_var_entit(346, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_GERER_SIDF' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(209, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE_COMNT_BOGUE' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(349, 'Update') where code = 'REF_VERSN' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(347, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(378, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(369, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'HAUTR' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_STOCK_MEME_REPRT' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(330, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH7' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ERR_CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(254, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = afw$migrt$pkg.obten_var_entit(293, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(263, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(251, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(254, 'Update') where code = 'REF_CODE_ERR_ORACL' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FIXE' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(316, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EMPLA_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH5' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_EFORT' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(336, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(213, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CONTX' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(357, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(317, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FIL' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SENS' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_VALID' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VUE_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'OPERT' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACTIF' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_STRUC_ACCES' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(212, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(245, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CSS_ICONE_BOOTS' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(232, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(216, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(261, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(312, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(261, 'Update') where code = 'REF_VERSN_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(329, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH6' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR6' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE5' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RETR' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_FETCH' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_RANGE_SUPRM' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_RANGE_INSER' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_AUCUN_DON_TROUV' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_FETCH_SPECF' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_RANGE_SUPRM_SPECF' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_RANGE_MODF_SPECF' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_AUCUN_DON_TROUV' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_SMSMESSAGESID' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACCES_GLOBL' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TOZIP' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TOSTATE' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROMCOUNTRY' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_SMSSID' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TO' and ref_entit = afw$migrt$pkg.obten_var_entit(252, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(257, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ACCES_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(372, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONFG_EVENM_NOTFB' and ref_entit = afw$migrt$pkg.obten_var_entit(372, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONFG_EVENM_NOTFB' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(373, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONFG_EVENM_NOTFB' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ACCES' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(372, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(373, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COULR' and ref_entit = afw$migrt$pkg.obten_var_entit(373, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(373, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(328, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(372, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(373, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_NATR_DESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(373, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(218, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_STATUS' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DON_NOMNL' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_AGEND' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TITRE' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_AUTHE_EXTER_AFW' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(231, 'Update') where code = 'REF_MODL_COMNC' and ref_entit = afw$migrt$pkg.obten_var_entit(243, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_FICHR' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL_NOTFC' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDEN_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COMPT_TWILI' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(235, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(232, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_ENVOI_DIFR' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_ATACH' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_A' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PARTG' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REPNS_SERVR' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_TEXTE' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_PREVU' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(218, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(213, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(213, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_AFW_30_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(213, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(221, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(216, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(334, 'Update') where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SPECF' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(235, 'Update') where code = 'REF_TYPE_COMNC' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DOCMN_REFRC' and ref_entit = afw$migrt$pkg.obten_var_entit(216, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(235, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TEXTE' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(235, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(243, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_PERTN' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_TEXTE' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(239, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_IDENT' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(212, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TYPE_TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(245, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(245, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(232, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FLECH_AIDE_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TEMPS_AFICH' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_PRIOR' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REPRT_WALT' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(232, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(232, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_PREVU' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SYSTM' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(243, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(216, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DOCMN_REFRC' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC_MODL_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_NOUVL_ENTIT' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(221, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_LIBL_STRUC_APLIC_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(216, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(220, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(212, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EFORT_PREVU' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(372, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(212, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LONGR_BLOC' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(214, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROTC_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APLIC_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC_ACCES' and ref_entit = afw$migrt$pkg.obten_var_entit(248, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_TOKEN' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(243, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_AFW_30_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(251, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(316, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(369, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(347, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE8' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(302, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_PRE_REQT' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(298, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_AFW13_CONFR' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(366, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(232, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(300, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(340, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACTIF' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_AFW18' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE2' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SAPI' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(331, 'Update') where code = 'REF_RESRC' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_CONDT_SAUVG' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_KEYPR' and ref_entit = afw$migrt$pkg.obten_var_entit(271, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ECRIT' and ref_entit = afw$migrt$pkg.obten_var_entit(330, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DOSR_FICHR' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SAPI' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE7' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UNITE_MESR_LARGR_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(336, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOEUD_ACTIF' and ref_entit = afw$migrt$pkg.obten_var_entit(369, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TITRE' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(330, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(359, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(266, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_ADMIN' and ref_entit = afw$migrt$pkg.obten_var_entit(295, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(349, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(316, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_STAT_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ID_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE_FORML' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'OBTEN_JSON_NOEUD_NOMBR_NIV' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FIL_ARIAN' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(343, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(322, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EVENM_MODFB' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(355, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PRENM' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(359, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_SOURC' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(279, 'Update') where code = 'REF_DOMN_VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(264, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(319, 'Update') where code = 'REF_ENTIT' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(281, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTX_INTER' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_ID_PARNT' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(364, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(286, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(337, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TABLE' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(325, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(321, 'Update') where code = 'REF_ITEM_MENU' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_REQST' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB2' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(255, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(300, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FERMR_NOEUD' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PLUGN_ARBRE_NOEUD' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_UNITE_INCLU' and ref_entit = afw$migrt$pkg.obten_var_entit(290, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(317, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(292, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(286, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(255, 'Update') where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_CONDT' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(294, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ID_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(266, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(210, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR3' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(295, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ACTIO' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SNPI' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(379, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CLAS_INTER' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(352, 'Update') where code = 'REF_DOSR_VIRTL' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES_ENVOY' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB4' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_AIDE' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(292, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TRAVL' and ref_entit = afw$migrt$pkg.obten_var_entit(306, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFECT_INPUT_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(296, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PARMT_TYPE_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(338, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(359, 'Update') where code = 'REF_ENGIN' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(323, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_COLN' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PLUGN' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(274, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(251, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VARBL3' and ref_entit = afw$migrt$pkg.obten_var_entit(305, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(291, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APLIC_CIBLE' and ref_entit = afw$migrt$pkg.obten_var_entit(263, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MAJ_REFRN' and ref_entit = afw$migrt$pkg.obten_var_entit(263, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(263, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(263, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(336, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(336, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_SECTN' and ref_entit = afw$migrt$pkg.obten_var_entit(314, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(327, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE10' and ref_entit = afw$migrt$pkg.obten_var_entit(367, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TITRE_AIDE_INSTA' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(310, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(380, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(316, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH' and ref_entit = afw$migrt$pkg.obten_var_entit(320, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_EXPIR' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'HAUTR_REGN_ARBRE' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(299, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(307, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(253, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(311, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TYPE_PUBLC' and ref_entit = afw$migrt$pkg.obten_var_entit(336, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(319, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(288, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(275, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB1' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'OBTEN_JSON_ARBRE_NOMBR_NIV' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(313, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'APEX_REPTS_ID' and ref_entit = afw$migrt$pkg.obten_var_entit(272, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(356, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(265, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(268, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONDT_EXECT' and ref_entit = afw$migrt$pkg.obten_var_entit(342, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_OUVRI_NOEUD' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DTHR' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'BB' and ref_entit = afw$migrt$pkg.obten_var_entit(365, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(317, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(358, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_ERR_SUPRS' and ref_entit = afw$migrt$pkg.obten_var_entit(280, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ENVOY' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_SSPI' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB1' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(318, 'Update') where code = 'REF_TYPE_FICHR' and ref_entit = afw$migrt$pkg.obten_var_entit(322, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(286, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(368, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SELCT_NOEUD' and ref_entit = afw$migrt$pkg.obten_var_entit(341, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(361, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(322, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONDT_PRISE_CHARG' and ref_entit = afw$migrt$pkg.obten_var_entit(282, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(326, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(331, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(308, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(313, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(300, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(298, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TYPE' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(351, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ICON' and ref_entit = afw$migrt$pkg.obten_var_entit(318, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(333, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(357, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(380, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(255, 'Update') where code = 'REF_LANG' and ref_entit = afw$migrt$pkg.obten_var_entit(251, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_5' and ref_entit = afw$migrt$pkg.obten_var_entit(303, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(315, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ORGAN' and ref_entit = afw$migrt$pkg.obten_var_entit(324, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_COLN' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DATE_FIN_JOURN_COMPL' and ref_entit = afw$migrt$pkg.obten_var_entit(309, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(211, 'Update') where code = 'REF_ATRIB_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(211, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(246, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(227, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_PERTN' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_MAXIM_RESLT' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DETL_APLIC_MODL_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ACTIO_INTER' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(266, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(352, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(344, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(276, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(332, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CORDN_Y_DEBUT' and ref_entit = afw$migrt$pkg.obten_var_entit(363, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(227, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_PLSQL_DROIT' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PATRN_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(246, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(246, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(246, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ENONC_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ATRIB_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_PRIOR' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_EXECT' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(216, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_CONTR' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_APART' and ref_entit = afw$migrt$pkg.obten_var_entit(227, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC_LIEN' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(227, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(227, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(212, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SENS' and ref_entit = afw$migrt$pkg.obten_var_entit(249, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_RESPN' and ref_entit = afw$migrt$pkg.obten_var_entit(216, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_EXECT' and ref_entit = afw$migrt$pkg.obten_var_entit(246, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(227, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC_MODL_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(213, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(213, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(246, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NIV_GRAVT' and ref_entit = afw$migrt$pkg.obten_var_entit(258, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(228, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE_ID' and ref_entit = afw$migrt$pkg.obten_var_entit(258, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(212, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PERTN' and ref_entit = afw$migrt$pkg.obten_var_entit(226, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(227, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(246, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'EFORT_RESTN' and ref_entit = afw$migrt$pkg.obten_var_entit(221, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(241, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SENS' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(262, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_TEXT' and ref_entit = afw$migrt$pkg.obten_var_entit(373, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FLOW_ID' and ref_entit = afw$migrt$pkg.obten_var_entit(258, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ACOUN_ID' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(232, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_TRAVL_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(242, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'RESLT' and ref_entit = afw$migrt$pkg.obten_var_entit(247, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_BORDR' and ref_entit = afw$migrt$pkg.obten_var_entit(335, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(331, 'Update') where code = 'REF_RESRC_ICON' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ATRIB_STRUC_APLIC_AFICH' and ref_entit = afw$migrt$pkg.obten_var_entit(229, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ID' and ref_entit = afw$migrt$pkg.obten_var_entit(258, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NATR' and ref_entit = afw$migrt$pkg.obten_var_entit(258, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NIV_GRAVT' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONTR' and ref_entit = afw$migrt$pkg.obten_var_entit(258, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ATRIB_SA_NOM_FORMT' and ref_entit = afw$migrt$pkg.obten_var_entit(371, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_COMPS' and ref_entit = afw$migrt$pkg.obten_var_entit(258, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_SPRIN' and ref_entit = afw$migrt$pkg.obten_var_entit(215, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESLT_RECHR' and ref_entit = afw$migrt$pkg.obten_var_entit(244, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(223, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(234, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(243, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR' and ref_entit = afw$migrt$pkg.obten_var_entit(236, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(231, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_DE' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TYPE_COMNC' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(222, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(221, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COMNT' and ref_entit = afw$migrt$pkg.obten_var_entit(217, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = afw$migrt$pkg.obten_var_entit(237, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TW_SID' and ref_entit = afw$migrt$pkg.obten_var_entit(238, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(240, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(381, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(381, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(381, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(381, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(381, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COURL_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(381, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(381, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REPRS_LECTR_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_LECTR_ENTRA_ERR' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_LIRE_PROFL_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_RECPT' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_COURL' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REPND' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RECNT' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_LU' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRM' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COURL_EXPED' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_EXPED' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN_TEXTE_PUR' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'OBJET' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROPR' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MIME_TYPE' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COURL_ENTRA' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_PIECE_CORPS_MESG' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(279, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_PAGE_LARGR' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FORCR_AJUST_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(289, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'RESRC_ADITN' and ref_entit = afw$migrt$pkg.obten_var_entit(350, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_COMPL_MAXM' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_IMPRE_PIED_PAGE_PDF_IR' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(206, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(284, 'Update') where code = 'REF_OPERT' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PREPN' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_CONDT_AFICH' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_VALR_INSTA_CONDT_AFICH' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_UTILS_BASE_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(205, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(205, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(205, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(205, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_OPERT_OPTIO' and ref_entit = afw$migrt$pkg.obten_var_entit(205, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_OPERT' and ref_entit = afw$migrt$pkg.obten_var_entit(205, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GROUP_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(205, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(201, 'Update') where code = 'REF_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(206, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(206, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(206, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(206, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(201, 'Update') where code = 'REF_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(206, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(206, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(201, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(203, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(203, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(203, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(203, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACTIF' and ref_entit = afw$migrt$pkg.obten_var_entit(203, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(203, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(203, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(203, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'COMPT_GENRL' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(202, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(202, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(202, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(202, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(202, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(202, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(202, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(259, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(381, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_CONTN' and ref_entit = afw$migrt$pkg.obten_var_entit(383, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(382, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(204, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(201, 'Update') where code = 'REF_FONCT' and ref_entit = afw$migrt$pkg.obten_var_entit(284, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(267, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(205, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(205, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(206, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_PLPDF_COULR' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_IMPRE_ENTET_PDF_IR' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE_ACUEI' and ref_entit = afw$migrt$pkg.obten_var_entit(377, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(270, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TIMST' and ref_entit = afw$migrt$pkg.obten_var_entit(641, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ON_SHOWN' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ON_SHOW' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(641, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(641, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ON_HIDE' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(641, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ON_HIDN' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LOGO_TAIL_MOYN' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INITL_COMPS_JAVSC' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LOGO_TAIL_LARGE' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LOGO_TAIL_PET' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(621, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(278, 'Update') where code = 'REF_PAGE_ITEM' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DOMN_DOCMN_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(603, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(602, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(601, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ON_PREV' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIEN_ID_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_PERSN_URL_APRES_AUTHE' and ref_entit = afw$migrt$pkg.obten_var_entit(219, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_TITRE' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH_TOILE_FOND' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'MOT_PASSE' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(603, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PARMT_AUTHE_EXTER_AFW' and ref_entit = afw$migrt$pkg.obten_var_entit(287, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(601, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ON_NEXT' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PREMR_CHARG' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MODE_REFLX' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TUTRL' and ref_entit = afw$migrt$pkg.obten_var_entit(602, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(602, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = afw$migrt$pkg.obten_var_entit(301, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(602, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(603, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SERVR_LDAP' and ref_entit = afw$migrt$pkg.obten_var_entit(603, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(603, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(602, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(601, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(606, 'Update') where code = 'REF_TUTRL' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PORT' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(603, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH_ORPHE' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'TEMPL_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(601, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(288, 'Update') where code = 'REF_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AJOUT_APLIC_APEX' and ref_entit = afw$migrt$pkg.obten_var_entit(263, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SELCT_JQUER_ELEMN_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIEN_ATRIB_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ICONE_BULLE_AIDE' and ref_entit = afw$migrt$pkg.obten_var_entit(278, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(601, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(602, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_POSTN_AFICH' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'LIEN_CLASS_CSS_HTML' and ref_entit = afw$migrt$pkg.obten_var_entit(321, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'BASE_DN' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CN' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(601, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(603, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(602, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOTE_BAS_PAGE' and ref_entit = afw$migrt$pkg.obten_var_entit(336, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(603, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AJOUT_SUPRT_CCI' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(210, 'Update') where code = 'REF_MESG_DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(605, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(298, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(603, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_SUPRT' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES_SUPRT' and ref_entit = afw$migrt$pkg.obten_var_entit(362, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(601, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(606, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(604, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_EVENM_NOTFB' and ref_entit = afw$migrt$pkg.obten_var_entit(601, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(662, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GROUP_GADGT_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(669, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LIEN_GADGT_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_AJAX' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = afw$migrt$pkg.obten_var_entit(641, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONFG_GADGT' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_TYPE_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GROUP_GADGT_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(669, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(664, 'Update') where code = 'REF_GADGT_PARMT_RACRC' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(669, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(669, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_APRES_DECNX' and ref_entit = afw$migrt$pkg.obten_var_entit(334, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GROUP_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(669, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CLASS_CSS' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GADGT_PARMT' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TUTRL' and ref_entit = afw$migrt$pkg.obten_var_entit(641, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SYSTM' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(280, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(662, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(662, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_GROUP_DEFT' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TUTRL' and ref_entit = afw$migrt$pkg.obten_var_entit(662, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TABL_BORD' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_OBLIG' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GADGT_PARMT_RACRC' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(296, 'Update') where code = 'REF_DV_TYPE_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(662, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_GENRQ' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(668, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(666, 'Update') where code = 'REF_GADGT_CATGR' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GADGT' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(669, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ICONE' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_DEMDR' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CONFG_GRIL' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(669, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(304, 'Update') where code = 'REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(669, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(670, 'Update') where code = 'REF_GADGT' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ENVOI_DIFR' and ref_entit = afw$migrt$pkg.obten_var_entit(233, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(666, 'Update') where code = 'REF_GADGT_CATGR' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_GENRT' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(671, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(666, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(667, 'Update') where code = 'REF_GADGT_PARMT' and ref_entit = afw$migrt$pkg.obten_var_entit(663, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_FORML_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = afw$migrt$pkg.obten_var_entit(279, 'Update') where code = 'REF_DOMN_VALR' and ref_entit = afw$migrt$pkg.obten_var_entit(667, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = afw$migrt$pkg.obten_var_entit(670, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = afw$migrt$pkg.obten_var_entit(665, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LIEN_GADGT_PARMT_RACRC' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(661, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_11_atrib_entit');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_11_atrib_entit');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_DON' and ref_entit = afw$migrt$pkg.obten_var_entit(664, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = afw$migrt$pkg.obten_var_entit(298, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOTE_SCRIP_PRE_MIGRT' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'NOTE_SCRIP_POST_MIGRT' and ref_entit = afw$migrt$pkg.obten_var_entit(304, 'Select');
update afw_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_GROUP_APLIC' and ref_entit = afw$migrt$pkg.obten_var_entit(285, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_atrib_entit;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_11_atrib_entit');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_atrib_entit');
end;
/

prompt ......type_domn_valr
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$14_type_domn_valr;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_14_type_domn_valr');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_14_type_domn_valr');
end;
/

prompt ......domn_valr
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$14_domn_valr;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_14_domn_valr');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_14_domn_valr');
end;
/

prompt ......mime_type
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_13_mime_type set ref_type_fichr = null where ext = '.mcf' and mime_type = 'text/mcf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mcp' and mime_type = 'application/netmc';
update afw_13_mime_type set ref_type_fichr = null where ext = '.me' and mime_type = 'application/x-troff-me';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mht' and mime_type = 'message/rfc822';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mhtml' and mime_type = 'message/rfc822';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mid' and mime_type = 'application/x-midi';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mid' and mime_type = 'audio/midi';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mid' and mime_type = 'audio/x-mid';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mid' and mime_type = 'audio/x-midi';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mid' and mime_type = 'music/crescendo';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mid' and mime_type = 'x-music/x-midi';
update afw_13_mime_type set ref_type_fichr = null where ext = '.midi' and mime_type = 'application/x-midi';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.midi' and mime_type = 'audio/midi';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.midi' and mime_type = 'audio/x-mid';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.midi' and mime_type = 'audio/x-midi';
update afw_13_mime_type set ref_type_fichr = null where ext = '.midi' and mime_type = 'music/crescendo';
update afw_13_mime_type set ref_type_fichr = null where ext = '.midi' and mime_type = 'x-music/x-midi';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mif' and mime_type = 'application/x-frame';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mif' and mime_type = 'application/x-mif';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mime' and mime_type = 'message/rfc822';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mime' and mime_type = 'www/mime';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mjf' and mime_type = 'audio/x-vnd.audioexplosion.mjuicemediafile';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mjpg' and mime_type = 'video/x-motion-jpeg';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mm' and mime_type = 'application/base64';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mm' and mime_type = 'application/x-meme';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mme' and mime_type = 'application/base64';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mod' and mime_type = 'audio/mod';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mod' and mime_type = 'audio/x-mod';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.moov' and mime_type = 'video/quicktime';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mov' and mime_type = 'video/quicktime';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.movie' and mime_type = 'video/x-sgi-movie';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mp2' and mime_type = 'audio/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mp2' and mime_type = 'audio/x-mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp2' and mime_type = 'video/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp2' and mime_type = 'video/x-mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp2' and mime_type = 'video/x-mpeq2a';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mp3' and mime_type = 'audio/mpeg3';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mp3' and mime_type = 'audio/x-mpeg-3';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp3' and mime_type = 'video/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp3' and mime_type = 'video/x-mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mpa' and mime_type = 'audio/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mpa' and mime_type = 'video/mpeg';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mpc' and mime_type = 'application/x-project';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mpe' and mime_type = 'video/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mpeg' and mime_type = 'video/mpeg';
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_mime_type');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_mime_type');
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mpg' and mime_type = 'audio/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mpg' and mime_type = 'video/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mpga' and mime_type = 'audio/mpeg';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mpp' and mime_type = 'application/vnd.ms-project';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mpt' and mime_type = 'application/x-project';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mpv' and mime_type = 'application/x-project';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mpx' and mime_type = 'application/x-project';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mrc' and mime_type = 'application/marc';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ms' and mime_type = 'application/x-troff-ms';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mv' and mime_type = 'video/x-sgi-movie';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.my' and mime_type = 'audio/make';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mzz' and mime_type = 'application/x-vnd.audioexplosion.mzz';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.nap' and mime_type = 'image/naplps';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.naplps' and mime_type = 'image/naplps';
update afw_13_mime_type set ref_type_fichr = null where ext = '.nc' and mime_type = 'application/x-netcdf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ncm' and mime_type = 'application/vnd.nokia.configuration-message';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.nif' and mime_type = 'image/x-niff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.niff' and mime_type = 'image/x-niff';
update afw_13_mime_type set ref_type_fichr = null where ext = '.nix' and mime_type = 'application/x-mix-transfer';
update afw_13_mime_type set ref_type_fichr = null where ext = '.nsc' and mime_type = 'application/x-conference';
update afw_13_mime_type set ref_type_fichr = null where ext = '.nvd' and mime_type = 'application/x-navidoc';
update afw_13_mime_type set ref_type_fichr = null where ext = '.o' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.oda' and mime_type = 'application/oda';
update afw_13_mime_type set ref_type_fichr = null where ext = '.omc' and mime_type = 'application/x-omc';
update afw_13_mime_type set ref_type_fichr = null where ext = '.omcd' and mime_type = 'application/x-omcdatamaker';
update afw_13_mime_type set ref_type_fichr = null where ext = '.omcr' and mime_type = 'application/x-omcregerator';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p' and mime_type = 'text/x-pascal';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p10' and mime_type = 'application/pkcs10';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p10' and mime_type = 'application/x-pkcs10';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p12' and mime_type = 'application/pkcs-12';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p12' and mime_type = 'application/x-pkcs12';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p7a' and mime_type = 'application/x-pkcs7-signature';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p7c' and mime_type = 'application/pkcs7-mime';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p7c' and mime_type = 'application/x-pkcs7-mime';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p7m' and mime_type = 'application/pkcs7-mime';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p7m' and mime_type = 'application/x-pkcs7-mime';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p7r' and mime_type = 'application/x-pkcs7-certreqresp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.p7s' and mime_type = 'application/pkcs7-signature';
update afw_13_mime_type set ref_type_fichr = null where ext = '.part' and mime_type = 'application/pro_eng';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pas' and mime_type = 'text/pascal';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pbm' and mime_type = 'image/x-portable-bitmap';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pcl' and mime_type = 'application/vnd.hp-pcl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pcl' and mime_type = 'application/x-pcl';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pct' and mime_type = 'image/x-pict';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pcx' and mime_type = 'image/x-pcx';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pdb' and mime_type = 'chemical/x-pdb';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(3, 'Update') where ext = '.pdf' and mime_type = 'application/pdf';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.pfunk' and mime_type = 'audio/make';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.pfunk' and mime_type = 'audio/make.my.funk';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pgm' and mime_type = 'image/x-portable-graymap';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pgm' and mime_type = 'image/x-portable-greymap';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pic' and mime_type = 'image/pict';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pict' and mime_type = 'image/pict';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pkg' and mime_type = 'application/x-newton-compatible-pkg';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sbk' and mime_type = 'application/x-tbook';
update afw_13_mime_type set ref_type_fichr = null where ext = '.scm' and mime_type = 'application/x-lotusscreencam';
update afw_13_mime_type set ref_type_fichr = null where ext = '.scm' and mime_type = 'text/x-script.guile';
update afw_13_mime_type set ref_type_fichr = null where ext = '.scm' and mime_type = 'text/x-script.scheme';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.scm' and mime_type = 'video/x-scm';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sdml' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sdp' and mime_type = 'application/sdp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sdp' and mime_type = 'application/x-sdp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sdr' and mime_type = 'application/sounder';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sea' and mime_type = 'application/sea';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sea' and mime_type = 'application/x-sea';
update afw_13_mime_type set ref_type_fichr = null where ext = '.set' and mime_type = 'application/set';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sgm' and mime_type = 'text/sgml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sgm' and mime_type = 'text/x-sgml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sgml' and mime_type = 'text/sgml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sgml' and mime_type = 'text/x-sgml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sh' and mime_type = 'application/x-bsh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sh' and mime_type = 'application/x-sh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sh' and mime_type = 'application/x-shar';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sh' and mime_type = 'text/x-script.sh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.shar' and mime_type = 'application/x-bsh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.shar' and mime_type = 'application/x-shar';
update afw_13_mime_type set ref_type_fichr = null where ext = '.shtml' and mime_type = 'text/html';
update afw_13_mime_type set ref_type_fichr = null where ext = '.shtml' and mime_type = 'text/x-server-parsed-html';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.sid' and mime_type = 'audio/x-psid';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sit' and mime_type = 'application/x-sit';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sit' and mime_type = 'application/x-stuffit';
update afw_13_mime_type set ref_type_fichr = null where ext = '.skd' and mime_type = 'application/x-koan';
update afw_13_mime_type set ref_type_fichr = null where ext = '.skm' and mime_type = 'application/x-koan';
update afw_13_mime_type set ref_type_fichr = null where ext = '.skp' and mime_type = 'application/x-koan';
update afw_13_mime_type set ref_type_fichr = null where ext = '.skt' and mime_type = 'application/x-koan';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sl' and mime_type = 'application/x-seelogo';
update afw_13_mime_type set ref_type_fichr = null where ext = '.smi' and mime_type = 'application/smil';
update afw_13_mime_type set ref_type_fichr = null where ext = '.smil' and mime_type = 'application/smil';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.snd' and mime_type = 'audio/basic';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.snd' and mime_type = 'audio/x-adpcm';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sol' and mime_type = 'application/solids';
update afw_13_mime_type set ref_type_fichr = null where ext = '.spc' and mime_type = 'application/x-pkcs7-certificates';
update afw_13_mime_type set ref_type_fichr = null where ext = '.spc' and mime_type = 'text/x-speech';
update afw_13_mime_type set ref_type_fichr = null where ext = '.spl' and mime_type = 'application/futuresplash';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.spr' and mime_type = 'application/x-sprite';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.sprite' and mime_type = 'application/x-sprite';
update afw_13_mime_type set ref_type_fichr = null where ext = '.src' and mime_type = 'application/x-wais-source';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ssi' and mime_type = 'text/x-server-parsed-html';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ssm' and mime_type = 'application/streamingmedia';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sst' and mime_type = 'application/vnd.ms-pki.certstore';
update afw_13_mime_type set ref_type_fichr = null where ext = '.step' and mime_type = 'application/step';
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_mime_type');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_mime_type');
update afw_13_mime_type set ref_type_fichr = null where ext = '.stl' and mime_type = 'application/sla';
update afw_13_mime_type set ref_type_fichr = null where ext = '.stl' and mime_type = 'application/vnd.ms-pki.stl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.stl' and mime_type = 'application/x-navistyle';
update afw_13_mime_type set ref_type_fichr = null where ext = '.stp' and mime_type = 'application/step';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sv4cpio' and mime_type = 'application/x-sv4cpio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.sv4crc' and mime_type = 'application/x-sv4crc';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.svf' and mime_type = 'image/vnd.dwg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.svf' and mime_type = 'image/x-dwg';
update afw_13_mime_type set ref_type_fichr = null where ext = '.svr' and mime_type = 'application/x-world';
update afw_13_mime_type set ref_type_fichr = null where ext = '.svr' and mime_type = 'x-world/x-svr';
update afw_13_mime_type set ref_type_fichr = null where ext = '.swf' and mime_type = 'application/x-shockwave-flash';
update afw_13_mime_type set ref_type_fichr = null where ext = '.t' and mime_type = 'application/x-troff';
update afw_13_mime_type set ref_type_fichr = null where ext = '.talk' and mime_type = 'text/x-speech';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tar' and mime_type = 'application/x-tar';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tbk' and mime_type = 'application/toolbook';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tbk' and mime_type = 'application/x-tbook';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tcl' and mime_type = 'application/x-tcl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tcl' and mime_type = 'text/x-script.tcl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tcsh' and mime_type = 'text/x-script.tcsh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tex' and mime_type = 'application/x-tex';
update afw_13_mime_type set ref_type_fichr = null where ext = '.texi' and mime_type = 'application/x-texinfo';
update afw_13_mime_type set ref_type_fichr = null where ext = '.texinfo' and mime_type = 'application/x-texinfo';
update afw_13_mime_type set ref_type_fichr = null where ext = '.text' and mime_type = 'application/plain';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(23, 'Update') where ext = '.text' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tgz' and mime_type = 'application/gnutar';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tgz' and mime_type = 'application/x-compressed';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.tif' and mime_type = 'image/tiff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.tif' and mime_type = 'image/x-tiff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.tiff' and mime_type = 'image/tiff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.tiff' and mime_type = 'image/x-tiff';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tr' and mime_type = 'application/x-troff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.tsi' and mime_type = 'audio/tsp-audio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tsp' and mime_type = 'application/dsptype';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.tsp' and mime_type = 'audio/tsplayer';
update afw_13_mime_type set ref_type_fichr = null where ext = '.tsv' and mime_type = 'text/tab-separated-values';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.turbot' and mime_type = 'image/florian';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(23, 'Update') where ext = '.txt' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.uil' and mime_type = 'text/x-uil';
update afw_13_mime_type set ref_type_fichr = null where ext = '.uni' and mime_type = 'text/uri-list';
update afw_13_mime_type set ref_type_fichr = null where ext = '.unis' and mime_type = 'text/uri-list';
update afw_13_mime_type set ref_type_fichr = null where ext = '.unv' and mime_type = 'application/i-deas';
update afw_13_mime_type set ref_type_fichr = null where ext = '.uri' and mime_type = 'text/uri-list';
update afw_13_mime_type set ref_type_fichr = null where ext = '.uris' and mime_type = 'text/uri-list';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ustar' and mime_type = 'application/x-ustar';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ustar' and mime_type = 'multipart/x-ustar';
update afw_13_mime_type set ref_type_fichr = null where ext = '.uu' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.uu' and mime_type = 'text/x-uuencode';
update afw_13_mime_type set ref_type_fichr = null where ext = '.uue' and mime_type = 'text/x-uuencode';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vcd' and mime_type = 'application/x-cdlink';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vcs' and mime_type = 'text/x-vcalendar';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vda' and mime_type = 'application/vda';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.vdo' and mime_type = 'video/vdo';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vew' and mime_type = 'application/groupwise';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.viv' and mime_type = 'video/vivo';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.viv' and mime_type = 'video/vnd.vivo';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.vivo' and mime_type = 'video/vivo';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.vivo' and mime_type = 'video/vnd.vivo';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vmd' and mime_type = 'application/vocaltec-media-desc';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vmf' and mime_type = 'application/vocaltec-media-file';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.voc' and mime_type = 'audio/voc';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.voc' and mime_type = 'audio/x-voc';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.vos' and mime_type = 'video/vosaic';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.vox' and mime_type = 'audio/voxware';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.vqe' and mime_type = 'audio/x-twinvq-plugin';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.vqf' and mime_type = 'audio/x-twinvq';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.vql' and mime_type = 'audio/x-twinvq-plugin';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vrml' and mime_type = 'application/x-vrml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vrml' and mime_type = 'model/vrml';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xls' and mime_type = 'application/x-msexcel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlt' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlt' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlv' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlv' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlw' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlw' and mime_type = 'application/vnd.ms-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlw' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = null where ext = '.xlw' and mime_type = 'application/x-msexcel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.xm' and mime_type = 'audio/xm';
update afw_13_mime_type set ref_type_fichr = null where ext = '.xml' and mime_type = 'application/xml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.xml' and mime_type = 'text/xml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.xmz' and mime_type = 'xgl/movie';
update afw_13_mime_type set ref_type_fichr = null where ext = '.xpix' and mime_type = 'application/x-vnd.ls-xpix';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xpm' and mime_type = 'image/x-xpixmap';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xpm' and mime_type = 'image/xpm';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.x-png' and mime_type = 'image/png';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.xsr' and mime_type = 'video/x-amt-showrun';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xwd' and mime_type = 'image/x-xwd';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xwd' and mime_type = 'image/x-xwindowdump';
update afw_13_mime_type set ref_type_fichr = null where ext = '.xyz' and mime_type = 'chemical/x-pdb';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.z' and mime_type = 'application/x-compress';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.z' and mime_type = 'application/x-compressed';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.zip' and mime_type = 'application/x-compressed';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.zip' and mime_type = 'application/x-zip-compressed';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.zip' and mime_type = 'application/zip';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.zip' and mime_type = 'multipart/x-zip';
update afw_13_mime_type set ref_type_fichr = null where ext = '.zoo' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.zsh' and mime_type = 'text/x-script.zsh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.3dm' and mime_type = 'x-world/x-3dmf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.3dmf' and mime_type = 'x-world/x-3dmf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.a' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.aab' and mime_type = 'application/x-authorware-bin';
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_mime_type');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_mime_type');
update afw_13_mime_type set ref_type_fichr = null where ext = '.aam' and mime_type = 'application/x-authorware-map';
update afw_13_mime_type set ref_type_fichr = null where ext = '.aas' and mime_type = 'application/x-authorware-seg';
update afw_13_mime_type set ref_type_fichr = null where ext = '.abc' and mime_type = 'text/vnd.abc';
update afw_13_mime_type set ref_type_fichr = null where ext = '.acgi' and mime_type = 'text/html';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.afl' and mime_type = 'video/animaflex';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ai' and mime_type = 'application/postscript';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aif' and mime_type = 'audio/aiff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aif' and mime_type = 'audio/x-aiff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aifc' and mime_type = 'audio/aiff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aifc' and mime_type = 'audio/x-aiff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aiff' and mime_type = 'audio/aiff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aiff' and mime_type = 'audio/x-aiff';
update afw_13_mime_type set ref_type_fichr = null where ext = '.aim' and mime_type = 'application/x-aim';
update afw_13_mime_type set ref_type_fichr = null where ext = '.aip' and mime_type = 'text/x-audiosoft-intra';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ani' and mime_type = 'application/x-navi-animation';
update afw_13_mime_type set ref_type_fichr = null where ext = '.aos' and mime_type = 'application/x-nokia-9000-communicator-add-on-software';
update afw_13_mime_type set ref_type_fichr = null where ext = '.aps' and mime_type = 'application/mime';
update afw_13_mime_type set ref_type_fichr = null where ext = '.arc' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.arj' and mime_type = 'application/arj';
update afw_13_mime_type set ref_type_fichr = null where ext = '.arj' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.art' and mime_type = 'image/x-jg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.asf' and mime_type = 'video/x-ms-asf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.asm' and mime_type = 'text/x-asm';
update afw_13_mime_type set ref_type_fichr = null where ext = '.asp' and mime_type = 'text/asp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.asx' and mime_type = 'application/x-mplayer2';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.asx' and mime_type = 'video/x-ms-asf';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.asx' and mime_type = 'video/x-ms-asf-plugin';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.au' and mime_type = 'audio/basic';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.au' and mime_type = 'audio/x-au';
update afw_13_mime_type set ref_type_fichr = null where ext = '.avi' and mime_type = 'application/x-troff-msvideo';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.avi' and mime_type = 'video/avi';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.avi' and mime_type = 'video/msvideo';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.avi' and mime_type = 'video/x-msvideo';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.avs' and mime_type = 'video/avs-video';
update afw_13_mime_type set ref_type_fichr = null where ext = '.bcpio' and mime_type = 'application/x-bcpio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/mac-binary';
update afw_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/macbinary';
update afw_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/x-binary';
update afw_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/x-macbinary';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.bm' and mime_type = 'image/bmp';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.bmp' and mime_type = 'image/bmp';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.bmp' and mime_type = 'image/x-windows-bmp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.boo' and mime_type = 'application/book';
update afw_13_mime_type set ref_type_fichr = null where ext = '.book' and mime_type = 'application/book';
update afw_13_mime_type set ref_type_fichr = null where ext = '.boz' and mime_type = 'application/x-bzip2';
update afw_13_mime_type set ref_type_fichr = null where ext = '.bsh' and mime_type = 'application/x-bsh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.bz' and mime_type = 'application/x-bzip';
update afw_13_mime_type set ref_type_fichr = null where ext = '.bz2' and mime_type = 'application/x-bzip2';
update afw_13_mime_type set ref_type_fichr = null where ext = '.c' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.c' and mime_type = 'text/x-c';
update afw_13_mime_type set ref_type_fichr = null where ext = '.c++' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cat' and mime_type = 'application/vnd.ms-pki.seccat';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cc' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cc' and mime_type = 'text/x-c';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ccad' and mime_type = 'application/clariscad';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cco' and mime_type = 'application/x-cocoa';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cdf' and mime_type = 'application/cdf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cdf' and mime_type = 'application/x-cdf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cdf' and mime_type = 'application/x-netcdf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cer' and mime_type = 'application/pkix-cert';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cer' and mime_type = 'application/x-x509-ca-cert';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cha' and mime_type = 'application/x-chat';
update afw_13_mime_type set ref_type_fichr = null where ext = '.chat' and mime_type = 'application/x-chat';
update afw_13_mime_type set ref_type_fichr = null where ext = '.class' and mime_type = 'application/java';
update afw_13_mime_type set ref_type_fichr = null where ext = '.class' and mime_type = 'application/java-byte-code';
update afw_13_mime_type set ref_type_fichr = null where ext = '.class' and mime_type = 'application/x-java-class';
update afw_13_mime_type set ref_type_fichr = null where ext = '.com' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.com' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.conf' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cpio' and mime_type = 'application/x-cpio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cpp' and mime_type = 'text/x-c';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cpt' and mime_type = 'application/mac-compactpro';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cpt' and mime_type = 'application/x-compactpro';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cpt' and mime_type = 'application/x-cpt';
update afw_13_mime_type set ref_type_fichr = null where ext = '.crl' and mime_type = 'application/pkcs-crl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.crl' and mime_type = 'application/pkix-crl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.crt' and mime_type = 'application/pkix-cert';
update afw_13_mime_type set ref_type_fichr = null where ext = '.crt' and mime_type = 'application/x-x509-ca-cert';
update afw_13_mime_type set ref_type_fichr = null where ext = '.crt' and mime_type = 'application/x-x509-user-cert';
update afw_13_mime_type set ref_type_fichr = null where ext = '.csh' and mime_type = 'application/x-csh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.csh' and mime_type = 'text/x-script.csh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.css' and mime_type = 'application/x-pointplus';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(62, 'Update') where ext = '.css' and mime_type = 'text/css';
update afw_13_mime_type set ref_type_fichr = null where ext = '.cxx' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.dcr' and mime_type = 'application/x-director';
update afw_13_mime_type set ref_type_fichr = null where ext = '.deepv' and mime_type = 'application/x-deepv';
update afw_13_mime_type set ref_type_fichr = null where ext = '.def' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.der' and mime_type = 'application/x-x509-ca-cert';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.dif' and mime_type = 'video/x-dv';
update afw_13_mime_type set ref_type_fichr = null where ext = '.dir' and mime_type = 'application/x-director';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.dl' and mime_type = 'video/dl';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.dl' and mime_type = 'video/x-dl';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.doc' and mime_type = 'application/msword';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.dot' and mime_type = 'application/msword';
update afw_13_mime_type set ref_type_fichr = null where ext = '.dp' and mime_type = 'application/commonground';
update afw_13_mime_type set ref_type_fichr = null where ext = '.drw' and mime_type = 'application/drafting';
update afw_13_mime_type set ref_type_fichr = null where ext = '.dump' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.dv' and mime_type = 'video/x-dv';
update afw_13_mime_type set ref_type_fichr = null where ext = '.dvi' and mime_type = 'application/x-dvi';
update afw_13_mime_type set ref_type_fichr = null where ext = '.dwf' and mime_type = 'drawing/x-dwf (old)';
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_mime_type');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_mime_type');
update afw_13_mime_type set ref_type_fichr = null where ext = '.dwf' and mime_type = 'model/vnd.dwf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.dwg' and mime_type = 'application/acad';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.dwg' and mime_type = 'image/vnd.dwg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.dwg' and mime_type = 'image/x-dwg';
update afw_13_mime_type set ref_type_fichr = null where ext = '.dxf' and mime_type = 'application/dxf';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.dxf' and mime_type = 'image/vnd.dwg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.dxf' and mime_type = 'image/x-dwg';
update afw_13_mime_type set ref_type_fichr = null where ext = '.dxr' and mime_type = 'application/x-director';
update afw_13_mime_type set ref_type_fichr = null where ext = '.el' and mime_type = 'text/x-script.elisp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.elc' and mime_type = 'application/x-bytecode.elisp (compiled elisp)';
update afw_13_mime_type set ref_type_fichr = null where ext = '.elc' and mime_type = 'application/x-elc';
update afw_13_mime_type set ref_type_fichr = null where ext = '.env' and mime_type = 'application/x-envoy';
update afw_13_mime_type set ref_type_fichr = null where ext = '.eps' and mime_type = 'application/postscript';
update afw_13_mime_type set ref_type_fichr = null where ext = '.es' and mime_type = 'application/x-esrehber';
update afw_13_mime_type set ref_type_fichr = null where ext = '.etx' and mime_type = 'text/x-setext';
update afw_13_mime_type set ref_type_fichr = null where ext = '.evy' and mime_type = 'application/envoy';
update afw_13_mime_type set ref_type_fichr = null where ext = '.evy' and mime_type = 'application/x-envoy';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(41, 'Update') where ext = '.exe' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.f' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.f' and mime_type = 'text/x-fortran';
update afw_13_mime_type set ref_type_fichr = null where ext = '.f77' and mime_type = 'text/x-fortran';
update afw_13_mime_type set ref_type_fichr = null where ext = '.f90' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.f90' and mime_type = 'text/x-fortran';
update afw_13_mime_type set ref_type_fichr = null where ext = '.fdf' and mime_type = 'application/vnd.fdf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.fif' and mime_type = 'application/fractals';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.fif' and mime_type = 'image/fif';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.fli' and mime_type = 'video/fli';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.fli' and mime_type = 'video/x-fli';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.flo' and mime_type = 'image/florian';
update afw_13_mime_type set ref_type_fichr = null where ext = '.flx' and mime_type = 'text/vnd.fmi.flexstor';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.fmf' and mime_type = 'video/x-atomic3d-feature';
update afw_13_mime_type set ref_type_fichr = null where ext = '.for' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.for' and mime_type = 'text/x-fortran';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.fpx' and mime_type = 'image/vnd.fpx';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.fpx' and mime_type = 'image/vnd.net-fpx';
update afw_13_mime_type set ref_type_fichr = null where ext = '.frl' and mime_type = 'application/freeloader';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.funk' and mime_type = 'audio/make';
update afw_13_mime_type set ref_type_fichr = null where ext = '.g' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.g3' and mime_type = 'image/g3fax';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.gif' and mime_type = 'image/gif';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.gl' and mime_type = 'video/gl';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.gl' and mime_type = 'video/x-gl';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.gsd' and mime_type = 'audio/x-gsm';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.gsm' and mime_type = 'audio/x-gsm';
update afw_13_mime_type set ref_type_fichr = null where ext = '.gsp' and mime_type = 'application/x-gsp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.gss' and mime_type = 'application/x-gss';
update afw_13_mime_type set ref_type_fichr = null where ext = '.gtar' and mime_type = 'application/x-gtar';
update afw_13_mime_type set ref_type_fichr = null where ext = '.gz' and mime_type = 'application/x-compressed';
update afw_13_mime_type set ref_type_fichr = null where ext = '.gz' and mime_type = 'application/x-gzip';
update afw_13_mime_type set ref_type_fichr = null where ext = '.gzip' and mime_type = 'application/x-gzip';
update afw_13_mime_type set ref_type_fichr = null where ext = '.gzip' and mime_type = 'multipart/x-gzip';
update afw_13_mime_type set ref_type_fichr = null where ext = '.h' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.h' and mime_type = 'text/x-h';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hdf' and mime_type = 'application/x-hdf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.help' and mime_type = 'application/x-helpfile';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hgl' and mime_type = 'application/vnd.hp-hpgl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hh' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hh' and mime_type = 'text/x-h';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hlb' and mime_type = 'text/x-script';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hlp' and mime_type = 'application/hlp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hlp' and mime_type = 'application/x-helpfile';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hlp' and mime_type = 'application/x-winhelp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hpg' and mime_type = 'application/vnd.hp-hpgl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hpgl' and mime_type = 'application/vnd.hp-hpgl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/binhex';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/binhex4';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/mac-binhex';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/mac-binhex40';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/x-binhex40';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/x-mac-binhex40';
update afw_13_mime_type set ref_type_fichr = null where ext = '.hta' and mime_type = 'application/hta';
update afw_13_mime_type set ref_type_fichr = null where ext = '.htc' and mime_type = 'text/x-component';
update afw_13_mime_type set ref_type_fichr = null where ext = '.htm' and mime_type = 'text/html';
update afw_13_mime_type set ref_type_fichr = null where ext = '.html' and mime_type = 'text/html';
update afw_13_mime_type set ref_type_fichr = null where ext = '.htmls' and mime_type = 'text/html';
update afw_13_mime_type set ref_type_fichr = null where ext = '.htt' and mime_type = 'text/webviewhtml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.htx' and mime_type = 'text/html';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ice' and mime_type = 'x-conference/x-cooltalk';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ico' and mime_type = 'image/x-icon';
update afw_13_mime_type set ref_type_fichr = null where ext = '.idc' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ief' and mime_type = 'image/ief';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.iefs' and mime_type = 'image/ief';
update afw_13_mime_type set ref_type_fichr = null where ext = '.iges' and mime_type = 'application/iges';
update afw_13_mime_type set ref_type_fichr = null where ext = '.iges' and mime_type = 'model/iges';
update afw_13_mime_type set ref_type_fichr = null where ext = '.igs' and mime_type = 'application/iges';
update afw_13_mime_type set ref_type_fichr = null where ext = '.igs' and mime_type = 'model/iges';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ima' and mime_type = 'application/x-ima';
update afw_13_mime_type set ref_type_fichr = null where ext = '.imap' and mime_type = 'application/x-httpd-imap';
update afw_13_mime_type set ref_type_fichr = null where ext = '.inf' and mime_type = 'application/inf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ins' and mime_type = 'application/x-internett-signup';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ip' and mime_type = 'application/x-ip2';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.isu' and mime_type = 'video/x-isvideo';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.it' and mime_type = 'audio/it';
update afw_13_mime_type set ref_type_fichr = null where ext = '.iv' and mime_type = 'application/x-inventor';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ivr' and mime_type = 'i-world/i-vrml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ivy' and mime_type = 'application/x-livescreen';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.jam' and mime_type = 'audio/x-jam';
update afw_13_mime_type set ref_type_fichr = null where ext = '.jav' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.jav' and mime_type = 'text/x-java-source';
update afw_13_mime_type set ref_type_fichr = null where ext = '.java' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.java' and mime_type = 'text/x-java-source';
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_mime_type');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_mime_type');
update afw_13_mime_type set ref_type_fichr = null where ext = '.jcm' and mime_type = 'application/x-java-commerce';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jfif' and mime_type = 'image/jpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jfif' and mime_type = 'image/pjpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jfif-tbnl' and mime_type = 'image/jpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpe' and mime_type = 'image/jpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpe' and mime_type = 'image/pjpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpeg' and mime_type = 'image/jpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpeg' and mime_type = 'image/pjpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpg' and mime_type = 'image/jpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpg' and mime_type = 'image/pjpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jps' and mime_type = 'image/x-jps';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(61, 'Update') where ext = '.js' and mime_type = 'application/x-javascript';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jut' and mime_type = 'image/jutvision';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.kar' and mime_type = 'audio/midi';
update afw_13_mime_type set ref_type_fichr = null where ext = '.kar' and mime_type = 'music/x-karaoke';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ksh' and mime_type = 'application/x-ksh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ksh' and mime_type = 'text/x-script.ksh';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.la' and mime_type = 'audio/nspaudio';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.la' and mime_type = 'audio/x-nspaudio';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.lam' and mime_type = 'audio/x-liveaudio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.latex' and mime_type = 'application/x-latex';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lha' and mime_type = 'application/lha';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lha' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lha' and mime_type = 'application/x-lha';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lhx' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.list' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.lma' and mime_type = 'audio/nspaudio';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.lma' and mime_type = 'audio/x-nspaudio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.log' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lsp' and mime_type = 'application/x-lisp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lsp' and mime_type = 'text/x-script.lisp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lst' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lsx' and mime_type = 'text/x-la-asf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ltx' and mime_type = 'application/x-latex';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lzh' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lzh' and mime_type = 'application/x-lzh';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lzx' and mime_type = 'application/lzx';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lzx' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.lzx' and mime_type = 'application/x-lzx';
update afw_13_mime_type set ref_type_fichr = null where ext = '.m' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.m' and mime_type = 'text/x-m';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.m1v' and mime_type = 'video/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.m2a' and mime_type = 'audio/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.m2v' and mime_type = 'video/mpeg';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.m3u' and mime_type = 'audio/x-mpequrl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.man' and mime_type = 'application/x-troff-man';
update afw_13_mime_type set ref_type_fichr = null where ext = '.map' and mime_type = 'application/x-navimap';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mar' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mbd' and mime_type = 'application/mbedlet';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mc$' and mime_type = 'application/x-magic-cap-package-1.0';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mcd' and mime_type = 'application/mcad';
update afw_13_mime_type set ref_type_fichr = null where ext = '.mcd' and mime_type = 'application/x-mathcad';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.mcf' and mime_type = 'image/vasa';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pko' and mime_type = 'application/vnd.ms-pki.pko';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pl' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pl' and mime_type = 'text/x-script.perl';
update afw_13_mime_type set ref_type_fichr = null where ext = '.plx' and mime_type = 'application/x-pixclscript';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pm' and mime_type = 'image/x-xpixmap';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pm' and mime_type = 'text/x-script.perl-module';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pm4' and mime_type = 'application/x-pagemaker';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pm5' and mime_type = 'application/x-pagemaker';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.png' and mime_type = 'image/png';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pnm' and mime_type = 'application/x-portable-anymap';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pnm' and mime_type = 'image/x-portable-anymap';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pot' and mime_type = 'application/mspowerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pot' and mime_type = 'application/vnd.ms-powerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pov' and mime_type = 'model/x-pov';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ppa' and mime_type = 'application/vnd.ms-powerpoint';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ppm' and mime_type = 'image/x-portable-pixmap';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pps' and mime_type = 'application/mspowerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pps' and mime_type = 'application/vnd.ms-powerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ppt' and mime_type = 'application/mspowerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ppt' and mime_type = 'application/powerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ppt' and mime_type = 'application/vnd.ms-powerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ppt' and mime_type = 'application/x-mspowerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ppz' and mime_type = 'application/mspowerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pre' and mime_type = 'application/x-freelance';
update afw_13_mime_type set ref_type_fichr = null where ext = '.prt' and mime_type = 'application/pro_eng';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ps' and mime_type = 'application/postscript';
update afw_13_mime_type set ref_type_fichr = null where ext = '.psd' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pvu' and mime_type = 'paleovu/x-pv';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pwz' and mime_type = 'application/vnd.ms-powerpoint';
update afw_13_mime_type set ref_type_fichr = null where ext = '.py' and mime_type = 'text/x-script.phyton';
update afw_13_mime_type set ref_type_fichr = null where ext = '.pyc' and mime_type = 'applicaiton/x-bytecode.python';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.qcp' and mime_type = 'audio/vnd.qcelp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.qd3' and mime_type = 'x-world/x-3dmf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.qd3d' and mime_type = 'x-world/x-3dmf';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.qif' and mime_type = 'image/x-quicktime';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.qt' and mime_type = 'video/quicktime';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.qtc' and mime_type = 'video/x-qtc';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.qti' and mime_type = 'image/x-quicktime';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.qtif' and mime_type = 'image/x-quicktime';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.ra' and mime_type = 'audio/x-pn-realaudio';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.ra' and mime_type = 'audio/x-pn-realaudio-plugin';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.ra' and mime_type = 'audio/x-realaudio';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.ram' and mime_type = 'audio/x-pn-realaudio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.ras' and mime_type = 'application/x-cmu-raster';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ras' and mime_type = 'image/cmu-raster';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ras' and mime_type = 'image/x-cmu-raster';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.rast' and mime_type = 'image/cmu-raster';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rexx' and mime_type = 'text/x-script.rexx';
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_mime_type');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_mime_type');
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.rf' and mime_type = 'image/vnd.rn-realflash';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.rgb' and mime_type = 'image/x-rgb';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rm' and mime_type = 'application/vnd.rn-realmedia';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rm' and mime_type = 'audio/x-pn-realaudio';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rmi' and mime_type = 'audio/mid';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rmm' and mime_type = 'audio/x-pn-realaudio';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rmp' and mime_type = 'audio/x-pn-realaudio';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rmp' and mime_type = 'audio/x-pn-realaudio-plugin';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rng' and mime_type = 'application/ringing-tones';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rng' and mime_type = 'application/vnd.nokia.ringing-tone';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rnx' and mime_type = 'application/vnd.rn-realplayer';
update afw_13_mime_type set ref_type_fichr = null where ext = '.roff' and mime_type = 'application/x-troff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.rp' and mime_type = 'image/vnd.rn-realpix';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rpm' and mime_type = 'audio/x-pn-realaudio-plugin';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rt' and mime_type = 'text/richtext';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rt' and mime_type = 'text/vnd.rn-realtext';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rtf' and mime_type = 'application/rtf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rtf' and mime_type = 'application/x-rtf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rtf' and mime_type = 'text/richtext';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rtx' and mime_type = 'application/rtf';
update afw_13_mime_type set ref_type_fichr = null where ext = '.rtx' and mime_type = 'text/richtext';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.rv' and mime_type = 'video/vnd.rn-realvideo';
update afw_13_mime_type set ref_type_fichr = null where ext = '.s' and mime_type = 'text/x-asm';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.s3m' and mime_type = 'audio/s3m';
update afw_13_mime_type set ref_type_fichr = null where ext = '.saveme' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vrml' and mime_type = 'x-world/x-vrml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vrt' and mime_type = 'x-world/x-vrt';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vsd' and mime_type = 'application/x-visio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vst' and mime_type = 'application/x-visio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.vsw' and mime_type = 'application/x-visio';
update afw_13_mime_type set ref_type_fichr = null where ext = '.w60' and mime_type = 'application/wordperfect6.0';
update afw_13_mime_type set ref_type_fichr = null where ext = '.w61' and mime_type = 'application/wordperfect6.1';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.w6w' and mime_type = 'application/msword';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.wav' and mime_type = 'audio/wav';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.wav' and mime_type = 'audio/x-wav';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wb1' and mime_type = 'application/x-qpro';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.wbmp' and mime_type = 'image/vnd.wap.wbmp';
update afw_13_mime_type set ref_type_fichr = null where ext = '.web' and mime_type = 'application/vnd.xara';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.wiz' and mime_type = 'application/msword';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wk1' and mime_type = 'application/x-123';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wmf' and mime_type = 'windows/metafile';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wml' and mime_type = 'text/vnd.wap.wml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wmlc' and mime_type = 'application/vnd.wap.wmlc';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wmls' and mime_type = 'text/vnd.wap.wmlscript';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wmlsc' and mime_type = 'application/vnd.wap.wmlscriptc';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.word' and mime_type = 'application/msword';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wp' and mime_type = 'application/wordperfect';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wp5' and mime_type = 'application/wordperfect';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wp5' and mime_type = 'application/wordperfect6.0';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wp6' and mime_type = 'application/wordperfect';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wpd' and mime_type = 'application/wordperfect';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wpd' and mime_type = 'application/x-wpwin';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wq1' and mime_type = 'application/x-lotus';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wri' and mime_type = 'application/mswrite';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wri' and mime_type = 'application/x-wri';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wrl' and mime_type = 'application/x-world';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wrl' and mime_type = 'model/vrml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wrl' and mime_type = 'x-world/x-vrml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wrz' and mime_type = 'model/vrml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wrz' and mime_type = 'x-world/x-vrml';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wsc' and mime_type = 'text/scriplet';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wsrc' and mime_type = 'application/x-wais-source';
update afw_13_mime_type set ref_type_fichr = null where ext = '.wtk' and mime_type = 'application/x-wintalk';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xbm' and mime_type = 'image/x-xbitmap';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xbm' and mime_type = 'image/x-xbm';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xbm' and mime_type = 'image/xbm';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.xdr' and mime_type = 'video/x-amt-demorun';
update afw_13_mime_type set ref_type_fichr = null where ext = '.xgz' and mime_type = 'xgl/drawing';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xif' and mime_type = 'image/vnd.xiff';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xl' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xla' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xla' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xla' and mime_type = 'application/x-msexcel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlb' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlb' and mime_type = 'application/vnd.ms-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlb' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlc' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlc' and mime_type = 'application/vnd.ms-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlc' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xld' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xld' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlk' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlk' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xll' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xll' and mime_type = 'application/vnd.ms-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xll' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlm' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlm' and mime_type = 'application/vnd.ms-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlm' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xls' and mime_type = 'application/excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xls' and mime_type = 'application/x-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlsx' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.rar' and mime_type = 'application/x-compressed';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(23, 'Update') where ext = '.sql' and mime_type = 'text/plain';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.docx' and mime_type = 'application/octet-stream';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xls' and mime_type = 'application/vnd.ms-excel';
update afw_13_mime_type set ref_type_fichr = afw$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.csv' and mime_type = 'text/csv';
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_mime_type;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_mime_type');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_mime_type');
end;
/

prompt ......detl_domn_valr
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$14_detl_domn_valr;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_14_detl_domn_valr');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_14_detl_domn_valr');
end;
/

prompt ......group_stat
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_group_stat;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_group_stat');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_group_stat');
end;
/

prompt ......lang
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_lang;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_lang');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_lang');
end;
/

prompt ......engin
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_engin;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_25_engin');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_25_engin');
end;
/

prompt ......dosr_virtl
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_dosr_virtl;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_dosr_virtl');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_dosr_virtl');
end;
/

prompt ......group_publc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_group_publc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_25_group_publc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_25_group_publc');
end;
/

prompt ......prodt_lang
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_prodt_lang;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_11_prodt_lang');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_prodt_lang');
end;
/

prompt ......lang_lang
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_lang_lang;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_lang_lang');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_lang_lang');
end;
/

prompt ......empla_dosr_virtl
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_empla_dosr_virtl;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_empla_dosr_virtl');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_empla_dosr_virtl');
end;
/

prompt ......mesg_tradc_apex
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_mesg_tradc_apex;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_mesg_tradc_apex');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_mesg_tradc_apex');
end;
/

prompt ......formt_resrc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_formt_resrc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_formt_resrc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_formt_resrc');
end;
/

prompt ......patrn_rechr
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$23_patrn_rechr;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_23_patrn_rechr');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_23_patrn_rechr');
end;
/

prompt ......mesg
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_mesg;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_mesg');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_mesg');
end;
/

prompt ......mesg_lang
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_mesg_lang;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_mesg_lang');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_mesg_lang');
end;
/

prompt ......mesg_err_lie
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_mesg_err_lie;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_mesg_err_lie');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_mesg_err_lie');
end;
/

prompt ......struc_aplic
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(53, 'Update'), ref_page_liste = afw$migrt$pkg.obten_var_page(52, 'Update') where code = 'PAGE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(64, 'Update'), ref_page_liste = afw$migrt$pkg.obten_var_page(63, 'Update') where code = 'PREFR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'STRUC_ADMIN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ITEM_MENU';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PLUGN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SIE_14_POPUP_LOV_IR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REGN_PILTB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TRADC_REGN_PILTB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'APLIC';
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_12_struc_aplic');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_12_struc_aplic');
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_ITEM_MENU';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DOMN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'RESRC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_PARMT_PUBLC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_STAT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ELEMN_CONFG_PUBLC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'POPUP_LOV_IR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'POPUP_LOV_IR_FILTR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'EVENM_NOTFB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MESG';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'OPERT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PAGE_PLUGN_CALND';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ENGIN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'LIAIS_MESG';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_OPERT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(99, 'Update'), ref_page_liste = null where code = 'VERSN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SECTN_DOCMN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_UTILS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_PUBLC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PLUGN_ARBRE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CLE_FONCT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MENU';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'STRUC_APLIC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'LICNS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SOUS_MODL';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TRAVL';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PUBLC_TRAVL';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CODE_UTILS_OUBLI';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REQT_OBTEN_CODE_UTILS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REQT_ACTIV_COMPT_UTILS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAFD';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAFP';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAFU';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAFS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(79, 'Update'), ref_page_liste = afw$migrt$pkg.obten_var_page(77, 'Update') where code = 'DOMN_VALR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(81, 'Update'), ref_page_liste = afw$migrt$pkg.obten_var_page(80, 'Update') where code = 'TYPE_DOMN_VALR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(65, 'Update'), ref_page_liste = null where code = 'INSTA_PREFR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MOTR_PDF';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'JOURN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'FONCT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TRACE_EXECT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CODE_ORACL';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MESG_APEX';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'LISTE_NAVGT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CONDT_PILTB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'RAPRT_INTER';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TRADC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'VALR_RETR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'EXPOR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'STRUC_APLIC_STAT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'STRUC_APLIC_TRADC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AUTOR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DECLN_PILE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'LANG';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'EXTEN_ARBRE_NOEUD';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'EXTEN_MENU';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ENGIN_VERSN_PUBLC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'FORMT_RESRC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'OCURN_RESRC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DOSR_VIRTL';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CONDT_EXEC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SAFP_EVENM_NOTFB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DEPLM_RESRC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'IDENT_ACCES';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ATRIB_EVENM_NOTFB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL_RECHR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DESTN_CONFG_EVENM_NOTFB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ETUDE_IMPAC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AIDE_PAGE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_PUBLC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_DOCMN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'COMPT_NOTFC_SMS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SIE_11_APLIC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PRODT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ITEM';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_AFICH';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PATRN_RECHR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACCES_APLIC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CHAMP_PUBLC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(108, 'Update'), ref_page_liste = afw$migrt$pkg.obten_var_page(107, 'Update') where code = 'ENTIT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_DROIT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'POPUP_LOV_IR_SAFD';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DEFNT_EVENM_NOTFB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PUBLC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'IMPRE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'VERSN_PUBLC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SYSTM';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MENU_SAFS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ITEM_MENU_SAFS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL_PARMT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'COMNT_BOGUE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CONFG_EVENM_NOFTB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DESTN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CARNT_SYSTM';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'APLIC_MODL_RECHR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DETL_APLIC_MODL_RECHR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'RESLT_RECHR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DETL_DOMN_VALR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ELEMN_CONFG_EVENM_NOTFB';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'RESLT_DESTN';
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_12_struc_aplic');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_12_struc_aplic');
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REQT_INTER_UTILS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PROFL_COUR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CONXN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MOT_PASSE_OUBLI';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REINT_MOT_PASSE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REQT_REINT_MOT_PASSE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'FORMT_REPNS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_GABRT_FORML';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAF';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_COURL';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MEMBR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_STRUC_ADMIN';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'FILE_ATENT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CLAS_INTER';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL_NOTFC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL_MESG_NOTFC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_MODL_COMNC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODFR_MOT_PASSE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MOT_PASSE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'HISTR_ACCES';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'COMPT_TELCP';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_ROLE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_ENVIR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_JALON_EQUIP';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_TACHE';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TACHE_EFORT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_LIEN_EQUIP';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(243, 'Update'), ref_page_liste = afw$migrt$pkg.obten_var_page(242, 'Update') where code = 'AFW_JALON';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(240, 'Update'), ref_page_liste = afw$migrt$pkg.obten_var_page(239, 'Update') where code = 'AFW_EQUIP';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_DISPN_UTILS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_ROLE_UTILS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_SCHEM';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_DEFN_CAPTR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TEST_EN_INSCR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(149, 'Update'), ref_page_liste = afw$migrt$pkg.obten_var_page(148, 'Update') where code = 'AFW_FONCT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_ASURN_QUALT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_DOMN_FONCT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = afw$migrt$pkg.obten_var_page(150, 'Update'), ref_page_liste = null where code = 'LIEN_FONCT_STRUC_APLIC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_PRECN_REALS';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'FONCT_AFW';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'UTILS_AFW';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TABL_BORD';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GADGT_CATGR';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GADGT_PARMT_RACRC';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GADGT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GADGT_PARMT';
update afw_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'LIEN_GADGT_PARMT_RACRC';
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_struc_aplic;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_struc_aplic');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_struc_aplic');
end;
/

prompt ......evenm_notfb
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_evenm_notfb;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_evenm_notfb');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_evenm_notfb');
end;
/

prompt ......atrib_struc_aplic
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_MASQ_FORMT_REPNS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'LARGR_REPNS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_COLN_REPNS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_RANGE_REPNS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AUTRE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_CHAMP_AUTRE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_CARCT_AUTRE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_MASQ_FORMT_AUTRE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'LARGR_AUTRE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_COLN_AUTRE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_RANGE_AUTRE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(123, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SCHEM_ENVIR_CIBLE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CAPTR_DDL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(147, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SCHEM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SCHEM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_OBJET' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_OBJET_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_EVENM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL_SI_OBJET_NON_VERL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_12_atrib_struc_aplic');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_12_atrib_struc_aplic');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRIS_CHARG_ENONC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_JOURN_ENONC_COMPL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_META_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE_PARNT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NATR_TACHE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_COMNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_INSCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE_ORIGN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COMNT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SIGNF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(151, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(150, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AFICH_ERR_CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_IMPRE_ENTET_PDF_IR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_IMPRE_PIED_PAGE_PDF_IR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_PLPDF_COULR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_SUCS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_ECHEC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_FETCH' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_SUPRM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_INSER' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUCUN_DON_TROUV' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_TROP_DON_TROUV' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUDIT_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUDIT_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUDIT_SUPRS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TAIL_TABL_EXTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_EXTRA_TOUT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_GROUP_UTILS_ADMIN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG_TOUT_DROIT_RESRV' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'JQUER_UI_CSS_SCOPE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_APLIC_ACUEI' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_ACUEI' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_APLIC_COMNT_BOGUE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_SUPRM_SPECF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_MODF_SPECF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_INSER_SPECF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = afw$migrt$pkg.obten_var_atrib_struc_aplic(298, 'Update') where nom_coln = 'REF_MESG_TROP_DON_TROUV' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TYPE_DOMN_VALR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_SYSTM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'ENONC_SOURC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TYPE_DON' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TYPE_DON_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SERVR_SORTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PORT_SORTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_METHD_SORTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_USAGR_SORTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_SSL_SORTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PORT_ENTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_MDP_ENTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_METHD_ENTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_SSL_ENTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DOMN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_ENVOY' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROTC_ENTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SURCH' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MODL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AGREG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_DETRM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PIPLN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_12_atrib_struc_aplic');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_12_atrib_struc_aplic');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_ORGAN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VERSN_BD_APLIC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AUTHID_CURNT_UTILS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_MODL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TYPE_MESG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(31, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(31, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(31, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SURCH' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MODL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_DETRM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PIPLN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_ORGAN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AUTHID_CURNT_UTILS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_MESG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_ORGAN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'POSTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VALR_DEFT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PUBLC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_RETR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_DOCMN_REFRC_VALR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_DOCMN_REFRC_CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_RESPN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_SYSTM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_APEX' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_LANG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'LANG_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = afw$migrt$pkg.obten_var_atrib_struc_aplic(739, 'Update') where nom_coln = 'REF_UTILS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = afw$migrt$pkg.obten_var_atrib_struc_aplic(353, 'Update') where nom_coln = 'REF_DV_TYPE_REQT_INTER' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_REQT_INTER_CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_REQT_INTER_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_DEBUT_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_FIN_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'URL_INTER' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'APP_ID_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STRUC_APLIC_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_MESG_SUPRS_SPECF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_ERR_SUPRS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_MESG_ERR_SUPRS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_EXTRA_TOUT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_STRUC_ACCES_DON' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_FORML' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FONCT_VALR_COURT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_DISPN_DOCMN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ACCES' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ACCES_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_EVENM_NOTFB' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TITRE_MESG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG_SMS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE_VALR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VALR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN_VALR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_12_atrib_struc_aplic');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_12_atrib_struc_aplic');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VERSN_BD_APLIC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_MODL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FONCT_VALR_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_PACKG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DOSR_FICHR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PAGE_ACUEI' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_ECHEC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_MODF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_APLIC_APEX' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_EXTRA_TOUT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG_TOUT_DROIT_RESRV' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = afw$migrt$pkg.obten_var_atrib_struc_aplic(327, 'Update') where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_APEX' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STRUC_APLIC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE19' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE14_POPUP' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_ECHEC_SPECF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUCUN_DON_TROUV' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_FORMT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(46, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_MDP_SORTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SERVR_ENTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_USAGR_ENTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'ADRES_ENVOY' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(117, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC_PRESN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_DEBUT_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_FIN_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VALR_COURT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VALR_ORGAN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_DV' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_DESTN_CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_DESTN_VALR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CONFG_EVENM_NOTFB' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DESTN_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_RESLT_DESTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_RESLT_DESTN_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ATRIB_SA_NOM_FORMT_CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ATRIB_SA_ADRES_DESTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ATRIB_SA_ADRES_DESTN_CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DESTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ACCES_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PRODT_COMNT_BOGUE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PAGE_COMNT_BOGUE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AFICH_ERR_CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_SUCS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_FETCH' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_SUPRM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUCUN_DON_TROUV' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_TROP_DON_TROUV' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PAGE_ACUEI' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TAIL_TABL_EXTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_GROUP_UTILS_ADMIN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PROFL_COURL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ENVIR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_AUTHE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'JQUER_UI_CSS_SCOPE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_MESG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TYPE_MESG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_12_atrib_struc_aplic');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_12_atrib_struc_aplic');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE01' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE04' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_SUPRS_SPECF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE13_NAVGT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE18' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_RECHR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE13_CONFR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PREFX_MESG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_SUCS_SPECF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_FETCH_SPECF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PUBLC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(35, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(31, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(31, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PUBLC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AGREG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(36, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MODL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SENS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_DOCMN_REFRC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_RESPN_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(108, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TAIL_TABL_EXTRA' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FONCT_DESCR_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CONFG_EVENM_NOTFB' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(114, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TYPE_COMNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'OBJET' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(106, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_DOMN_VALR_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(112, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_DON' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(104, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_LISTE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(33, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PAGE_CONXN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_DESTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DESTN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ATRIB_SA_NOM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(79, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ACCES' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(115, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FONCT_OBTEN_BASE_URL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PRODT_ACUEI' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PAGE_INEXS_MAJ_REFRN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_INSER' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_EXPOR_METDN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DOSR_FICHR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRODT_AUTHE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(9, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(19, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(1, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(144, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(144, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(137, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(137, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(137, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(137, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(137, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(137, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(137, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(137, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_EQUIP' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_EQUIP_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_JALON' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_JALON_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DEBUT_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FIN_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'POURC_AFECT_EQUIP_JALON' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(139, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ROLE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ROLE_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'EFORT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_12_atrib_struc_aplic');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_12_atrib_struc_aplic');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_EFORT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(141, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(146, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ROLE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(146, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(146, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DEBUT_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(146, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FIN_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(146, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(146, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(146, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(146, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(146, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SIGNF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPL_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CONTN_SOURCE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_SIGNL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_SIGNL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_SIGNL_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_MODE_SIGNL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_MODE_SIGNL_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PROFL_COURL_SIGNL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_P_COURL_SIGNL_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COMNT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_META_APLIC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_META_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_APLIC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(140, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_EQUIP' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DEBUT_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FIN_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'POURC_IMPLI_EQUIP' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(142, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DEBUT_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'EFORT_DISPN_SEMN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FIN_EFECT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(145, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(143, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(143, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(143, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(143, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_PREVU' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(143, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(143, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(143, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(143, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(143, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(144, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(144, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(144, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(144, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(144, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(144, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_EVENM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPR_SI_VERL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPR_SI_VERL_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(148, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_DON_SAIS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_REPNS_OBLIG' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_INTER' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_REPNS_MULTP' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_MINM_OCURN_INTER' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_MAXM_OCURN_INTER' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_CHAMP_REPNS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN_VALR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_CARCT_REPNS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(122, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_FONCT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_FONCT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_VERSN_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_APLIC_ACUEI' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_12_atrib_struc_aplic');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_12_atrib_struc_aplic');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_PAGE_ACUEI' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_APLIC_COMNT_BOGUE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(153, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_FONCT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(153, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STRUC_APLIC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(153, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(153, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(153, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(153, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SIGNF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_INSCR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE_ORIGN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COMNT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_META_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE_PARNT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NATR_TACHE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NATR_TACHE_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_COMNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_JALON' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_REALS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(154, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_MODF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COMPT_GENRL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_EXPOR_METDN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ENVIR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PAGE_INEXS_MAJ_REFRN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_COMNT_BOGUE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NOM_VERSN' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_PAGE_COMNT_BOGUE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(86, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(153, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(153, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_CODE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_APLIC_APEX' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_PAGE_APEX' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_TRAIT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_TRAIT_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_PERSN_URL_APRES_AUTHE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(116, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PARMT_AUTHE_EXTER_AFW' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE_UTILS_BASE_DON' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPL_MAXM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DERNR_DOMN_ACCES' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PRENM' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE_UTILS' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MOT_PASSE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CHANG_MOT_PASSE' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DERNR_PRODT_ACCES' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT_COMNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COURL' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_EXPIR' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(182, 'Select');
update afw_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF_FORMT' and ref_struc_aplic = afw$migrt$pkg.obten_var_struc_aplic(152, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_atrib_struc_aplic;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_atrib_struc_aplic');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_atrib_struc_aplic');
end;
/

prompt ......fonct
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_fonct;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_fonct');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_fonct');
end;
/

prompt ......destn
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_destn;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_destn');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_destn');
end;
/

prompt ......hierc_aplic
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_hierc_aplic;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_hierc_aplic');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_hierc_aplic');
end;
/

prompt ......fonct_struc_aplic
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_fonct_struc_aplic;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_fonct_struc_aplic');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_fonct_struc_aplic');
end;
/

prompt ......struc_aplic_lang
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_struc_aplic_lang;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_struc_aplic_lang');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_struc_aplic_lang');
end;
/

prompt ......reslt_destn
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_reslt_destn;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_reslt_destn');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_reslt_destn');
end;
/

prompt ......resrc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_resrc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_resrc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_resrc');
end;
/

prompt ......type_publc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_type_publc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_25_type_publc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_25_type_publc');
end;
/

prompt ......parmt_type_publc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_parmt_type_publc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_25_parmt_type_publc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_25_parmt_type_publc');
end;
/

prompt ......ocurn_resrc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_ocurn_resrc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_ocurn_resrc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_ocurn_resrc');
end;
/

prompt ......elemn_confg_publc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_elemn_confg_publc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_25_elemn_confg_publc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_25_elemn_confg_publc');
end;
/

prompt ......publc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_publc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_25_publc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_25_publc');
end;
/

prompt ......versn_publc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_versn_publc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_25_versn_publc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_25_versn_publc');
end;
/

prompt ......engin_versn_publc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_engin_versn_publc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_25_engin_versn_publc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_25_engin_versn_publc');
end;
/

prompt ......opert
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_opert;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_opert');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_opert');
end;
/

prompt ......opert_optio
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_opert_optio;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_opert_optio');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_opert_optio');
end;
/

prompt ......group_utils
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_group_utils;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_group_utils');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_group_utils');
end;
/

prompt ......lien_group_utils
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_lien_group_utils;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_lien_group_utils');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_lien_group_utils');
end;
/

prompt ......defnt_acces
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_defnt_acces;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_defnt_acces');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_defnt_acces');
end;
/

prompt ......stat
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_stat;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_stat');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_stat');
end;
/

prompt ......evolt_stat
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_evolt_stat;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_12_evolt_stat');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_12_evolt_stat');
end;
/

prompt ......menu
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_menu;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_menu');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_menu');
end;
/

prompt ......item_menu
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(89, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(182, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(118, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(158, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'UTILS' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(105, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(134, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DOSR_VIRTL' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(106, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'EXTNS' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(106, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(77, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_VALR' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(68, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'STRUC_LOGCL' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(83, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'LANG' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(5, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(80, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TYPE' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(75, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP_STAT' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(63, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'PREF' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(72, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'OPERT' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(68, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'STRUC_APLIC' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(117, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(217, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'NOTFC_SMS' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = afw$migrt$pkg.obten_var_menu(5, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(29, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DECNX' and ref_menu = afw$migrt$pkg.obten_var_menu(5, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(117, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'NOTFC' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(117, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(197, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'COURL' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(117, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(219, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'COMPT_TELCP' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(83, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(215, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_COMNC' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(181, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(201, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CLAS_INTER' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(83, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(208, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_AFICH' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(116, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(177, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'UTILS' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(116, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(184, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'STRUC_ADMIN' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(116, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(192, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'AUTOR' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(90, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(190, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TYPE' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(109, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(111, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TYPE_PUBLC' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(109, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(116, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'PUBLC' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(109, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(114, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP_PUBLC' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(108, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(74, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'AUTOR' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(108, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(66, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP_DROIT' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(130, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(39, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'JOURNL' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(130, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(137, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CONDT_EXEC' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(107, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(42, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MESG' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(107, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(40, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'LIAIS' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(100, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(50, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TRADC_APEX' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(100, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(49, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CODE_EREUR_ORACL' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(105, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(126, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RESRC' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(126, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RESRC_SUPR' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(48, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SYSTM' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(42, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MESG_SUPR' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(74, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT_SUPR' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(116, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RAPRT_SUPR' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_13_item_menu');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_13_item_menu');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(4, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(89, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CALND' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(98, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(46, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TRACE_EXECT' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(130, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(82, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DECLN_PILE' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(147, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ZONE_DECNX' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(114, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ZONE_DECNX' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(192, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(174, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'ADMIN' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(158, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(154, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RAPRT' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(119, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(154, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'IMPRE' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(121, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ZONE_DECNX' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(109, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(109, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'ENGIN' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(140, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'EVENM_NOTFB' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(83, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(213, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_MESG_NOTFC' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(142, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DESTN' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(117, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(193, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_RECHR' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(83, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(221, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'EVENM_NOTFB' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(118, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(153, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RECHR_UTILS' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ADMIN' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(181, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(199, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'FIL_ATENT' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(4, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(86, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'ARBOR' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(121, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ACTIO_AIDE_PAGE' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(114, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ACTIO_AIDE_PAGE' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(142, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_SESN' and ref_menu = afw$migrt$pkg.obten_var_menu(4, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(147, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_SESN' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(114, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_SESN' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(121, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_SESN' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(34, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MENU' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(142, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ACTIO_AIDE_PAGE' and ref_menu = afw$migrt$pkg.obten_var_menu(4, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(147, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ACTIO_AIDE_PAGE' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = afw$migrt$pkg.obten_var_menu(4, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(142, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DECNX' and ref_menu = afw$migrt$pkg.obten_var_menu(4, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(89, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(226, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'REQT_INTER_UTILS' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(4, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(93, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'EXTEN_MENU' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(116, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(230, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'FONCT' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(148, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'FONCT' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(106, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(19, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'APLIC' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(146, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(227, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'FORMT_REPNS' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(142, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'MODFR_MOT_PASSE' and ref_menu = afw$migrt$pkg.obten_var_menu(4, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(147, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'MODFR_MOT_PASSE' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(121, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'MODFR_MOT_PASSE' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select');
update afw_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(114, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'MODFR_MOT_PASSE' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(117, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(197, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'PROFL_COURL' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(146, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(230, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'LISTE_NAVGT_DOMN' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(106, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(1086, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TABL_BORD' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(582, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(1088, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GADGT_CATGR' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(582, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(1092, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GADGT' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(582, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(1090, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GADGT_PARMT_RACRC' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(4, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(108, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(1387, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT_VUE_GLOBL' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select');
update afw_13_item_menu set ref_aplic = afw$migrt$pkg.obten_var_aplic(7, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = afw_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',afw$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = afw$migrt$pkg.obten_var_item_menu(89, 'Update'), ref_ocurn_resrc = null, ref_page = afw$migrt$pkg.obten_var_page(1398, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT_VUE_GLOBL' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_item_menu;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_13_item_menu');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_13_item_menu');
end;
/

prompt ......plugn_menu
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_21_plugn_menu set ref_dv_coulr_princ = afw_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',afw$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = afw_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',afw$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = afw_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',afw$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = afw_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',afw$migrt$pkg.vva_code_prodt), ref_dv_type_menu = null where code = 'MENU_ACUEI' and ref_menu = afw$migrt$pkg.obten_var_menu(4, 'Select') and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
update afw_21_plugn_menu set ref_dv_coulr_princ = afw_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',afw$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = afw_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',afw$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = afw_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',afw$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = afw_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',afw$migrt$pkg.vva_code_prodt), ref_dv_type_menu = afw_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',afw$migrt$pkg.vva_code_prodt) where code = 'MENU_PRINC_SAFD' and ref_menu = afw$migrt$pkg.obten_var_menu(1, 'Select') and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
update afw_21_plugn_menu set ref_dv_coulr_princ = afw_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',afw$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = afw_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',afw$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = afw_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',afw$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = afw_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',afw$migrt$pkg.vva_code_prodt), ref_dv_type_menu = afw_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',afw$migrt$pkg.vva_code_prodt) where code = 'MENU_PRINC_SAFU' and ref_menu = afw$migrt$pkg.obten_var_menu(2, 'Select') and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
update afw_21_plugn_menu set ref_dv_coulr_princ = afw_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',afw$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = afw_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',afw$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = afw_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',afw$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = afw_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',afw$migrt$pkg.vva_code_prodt), ref_dv_type_menu = afw_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',afw$migrt$pkg.vva_code_prodt) where code = 'MENU_PRINC_SAFP' and ref_menu = afw$migrt$pkg.obten_var_menu(3, 'Select') and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
update afw_21_plugn_menu set ref_dv_coulr_princ = afw_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',afw$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = afw_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',afw$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = afw_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',afw$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = afw_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',afw$migrt$pkg.vva_code_prodt), ref_dv_type_menu = null where code = 'P0_MENU_SANS_CONTX' and ref_menu = afw$migrt$pkg.obten_var_menu(5, 'Select') and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
update afw_21_plugn_menu set ref_dv_coulr_princ = afw_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',afw$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = afw_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',afw$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = afw_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',afw$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = afw_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',afw$migrt$pkg.vva_code_prodt), ref_dv_type_menu = afw_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',afw$migrt$pkg.vva_code_prodt) where code = 'P0_MENU_PILTB_SAFD' and ref_menu is null and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
update afw_21_plugn_menu set ref_dv_coulr_princ = afw_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',afw$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = afw_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',afw$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = afw_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',afw$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = afw_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',afw$migrt$pkg.vva_code_prodt), ref_dv_type_menu = afw_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',afw$migrt$pkg.vva_code_prodt) where code = 'P0_MENU_PILTB_SAFU' and ref_menu is null and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
update afw_21_plugn_menu set ref_dv_coulr_princ = afw_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',afw$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = afw_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',afw$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = afw_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',afw$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = afw_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',afw$migrt$pkg.vva_code_prodt), ref_dv_type_menu = afw_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',afw$migrt$pkg.vva_code_prodt) where code = 'P0_MENU_PILTB_SAFP' and ref_menu is null and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_menu;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_menu');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_menu');
end;
/

prompt ......plugn_arbre
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_arbre;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_arbre');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_arbre');
end;
/

prompt ......plugn_item_menu
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(106, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(6, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(12, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(11, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(10, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(9, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(5, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(8, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(7, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(4, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(100, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(102, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(103, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(101, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(105, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(3, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(104, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(108, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(97, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(96, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(109, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(93, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(95, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(94, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(107, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(98, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(111, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(99, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(112, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(2, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(3, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(121, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(3, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(118, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(3, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(119, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(3, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(116, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(117, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(114, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(115, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(120, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(3, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(122, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(3, 'Select');
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('afw_21_plugn_item_menu');
end;
/

begin
if afw$migrt$pkg.vnu_sql_code = 0 then
afw_03_journ_pkg.ecrir_journ('afw_21_plugn_item_menu');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(89, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(1, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(91, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(90, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(92, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(84, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(87, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(83, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(88, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(86, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(13, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(85, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(147, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(113, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(125, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(143, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(1, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(142, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(1, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(127, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(128, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(146, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(131, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(144, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(137, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(134, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(123, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(124, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(126, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(130, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(30, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(5, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = afw_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',afw$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = afw_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_DOUBL',afw$migrt$pkg.vva_code_prodt) where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(29, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(5, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(150, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(4, 'Select');
update afw_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = afw$migrt$pkg.obten_var_item_menu(181, 'Select') and ref_plugn_menu = afw$migrt$pkg.obten_var_plugn_menu(2, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_item_menu;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_item_menu');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_item_menu');
end;
/

prompt ......plugn_arbre_noeud
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_arbre_noeud;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_arbre_noeud');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_arbre_noeud');
end;
/

prompt ......plugn_calnd
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_21_plugn_calnd set ref_dv_vue_deft = afw_14_domn_valr_pkg.obten_seqnc('VUE_DISPN_CALND','JOUR',afw$migrt$pkg.vva_code_prodt) where code = '61' and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
update afw_21_plugn_calnd set ref_dv_vue_deft = afw_14_domn_valr_pkg.obten_seqnc('VUE_DISPN_CALND','SEMN_SIMPL',afw$migrt$pkg.vva_code_prodt) where code = '62' and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
update afw_21_plugn_calnd set ref_dv_vue_deft = afw_14_domn_valr_pkg.obten_seqnc('VUE_DISPN_CALND','JOUR',afw$migrt$pkg.vva_code_prodt) where code = '21' and ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_calnd;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_calnd');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_21_plugn_calnd');
end;
/

prompt ......modl_afich_notfc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_01_modl_afich_notfc set ref_formt_resrc_icon = null, ref_modl_comnc = afw$migrt$pkg.obten_var_modl_comnc(3, 'Update'), ref_ocurn_resrc_icon = null, ref_resrc_icon = null where code = 'ECRAN_IMPOR' and ref_domn is null;
update afw_01_modl_afich_notfc set ref_formt_resrc_icon = null, ref_modl_comnc = afw$migrt$pkg.obten_var_modl_comnc(2, 'Update'), ref_ocurn_resrc_icon = null, ref_resrc_icon = null where code = 'SMS' and ref_domn is null;
update afw_01_modl_afich_notfc set ref_formt_resrc_icon = null, ref_modl_comnc = afw$migrt$pkg.obten_var_modl_comnc(1, 'Update'), ref_ocurn_resrc_icon = null, ref_resrc_icon = null where code = 'COURL_BASE' and ref_domn is null;
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_modl_afich_notfc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_01_modl_afich_notfc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_01_modl_afich_notfc');
end;
/

prompt ......tabl_bord
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$37_tabl_bord;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_37_tabl_bord');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_37_tabl_bord');
end;
/

prompt ......gadgt_parmt_racrc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$37_gadgt_parmt_racrc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_37_gadgt_parmt_racrc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_37_gadgt_parmt_racrc');
end;
/

prompt ......gadgt_catgr
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$37_gadgt_catgr;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_37_gadgt_catgr');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_37_gadgt_catgr');
end;
/

prompt ......gadgt
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$37_gadgt;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_37_gadgt');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_37_gadgt');
end;
/

prompt ......gadgt_parmt
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$37_gadgt_parmt;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_37_gadgt_parmt');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_37_gadgt_parmt');
end;
/

prompt ......lien_gadgt_parmt_racrc
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$37_lien_gadgt_parmt_racrc;

  if vnu_count > 0 then
    afw$migrt$pkg.defnr_ereur ('Update sur afw_37_lien_gadgt_parmt_racrc');
  end if;
end;
null;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_37_lien_gadgt_parmt_racrc');
end;
/

prompt ...Mise a jour du produit
begin
if afw$migrt$pkg.vnu_sql_code = 0 then
update afw_11_prodt
                       set indic_extra_tout = 'N',
                           ref_group_utils_admin = null,
                           dosr_fichr = '/res/afw/',
                           ident_envir = 'Développement',
                           ref_versn = afw$migrt$pkg.obten_var_versn(82, 'Update'),
                           mesg_tout_droit_resrv = 'MIT',
                           jquer_ui_css_scope = 'ui-afw',
                           indic_afich_err_code = 'O',
                           indic_page_inexs_maj_refrn = 'N',
                           fonct_obten_base_url = null,
                           ref_mesg_sucs = afw$migrt$pkg.obten_var_mesg(985, 'Update'),
                           ref_mesg_echec = afw$migrt$pkg.obten_var_mesg(986, 'Update'),
                           ref_mesg_fetch = afw$migrt$pkg.obten_var_mesg(966, 'Update'),
                           ref_mesg_range_suprm = afw$migrt$pkg.obten_var_mesg(968, 'Update'),
                           ref_mesg_range_modf = afw$migrt$pkg.obten_var_mesg(366, 'Update'),
                           ref_mesg_range_inser = afw$migrt$pkg.obten_var_mesg(967, 'Update'),
                           ref_mesg_aucun_don_trouv = afw$migrt$pkg.obten_var_mesg(367, 'Update'),
                           ref_mesg_trop_don_trouv = afw$migrt$pkg.obten_var_mesg(241, 'Update'),
                           ref_aplic_acuei = afw$migrt$pkg.obten_var_aplic(2, 'Update'),
                           ref_page_acuei = afw$migrt$pkg.obten_var_page(7, 'Update'),
                           ref_aplic_comnt_bogue = afw$migrt$pkg.obten_var_aplic(4, 'Update'),
                           ref_page_comnt_bogue = afw$migrt$pkg.obten_var_page(22, 'Update'),
                           procd_impre_entet_pdf_ir = null,
                           procd_impre_pied_page_pdf_ir = null,
                           procd_plpdf_coulr = null,
                           compt_genrl = '0',
                           domn_docmn_html = null,
                           initl_comps_javsc = '//INTERACTIVE REPORT
afw.jQuery("#apexir_rollover").appendTo("body");',
                           note_scrip_pre_migrt = 'My...........................-//+ossyyssssoo++//:............................+MM
My...........................+ddddhhhhddhyysssoo+-...........................+MM
My.........................../yyyyyhhmNMyo+++ooo/-...........................+MM
My...........................+sssssyyhmM++++oooo/-...........................+MM
My...........................+ssssyyhhmM++ooooss/............................+MM
My...........................+sssyyyhhmMooooosss/............................+MM
My...........................oyyyyyyhhmMoooossss/--:::::///:::-..............+MM
My...........................oyyyyyyhydN+++osooshddddmmmmmmmdddhhys-.........+MM
My..........................-oyyyyyyysyhooossooymmmmmNNNNNmhysssssy-.........+MM
My..............--::/+osoo+/+shhhhyyyyyyyyyyyyyyyssyddddmNyooooossy-.........+MM
My.........:ossssyyysssyyyyhhyyhdddddddmmmmdso+++++oyhddmNyoooosssy-.........+MM
My........./yyyhhhhhdddyoo++//+yyhhhhhhdNMMy+++++++oyhdmmNyooossssy+.........+MM
My........./oooooooohmMh//////+yyyyyhhdmmNM++++++++osydddNyooossssy:.........+MM
My.........:+ooooooshdNs//////+syyyyydmmmNM++++++++osydddNyoosssssy-.........+MM
My.........:+ooooosyyhNs//////+ssssyhddddmM++++++++osyhhhNysssssssyo.........+MM
My.........-+oooosssyyms+++++/+ssssyhhhhhmM++++++++oyyhhhNysssyyyyyhssysssssooMM
My.......-:+oooossssssmsooooo++ossyyyyyyydN++++++++oyyhhhmysyyyssssmNMMMmho+:sMM
My.-:/oymNMMyossssssssdoooooo/+osyyyyyyyydNo+++oooooyyyyhhssooooshmNmyo:-....+MM
MhyhmNNMMMMMmhhyssssssy+++//+oosyyyyyyyyydmoooooososhhddddyyhdmmdy+:-........+MM
My/+ooshhdmmmNNNNNNmmddhyhhdddhsyyyyyyyyhhhssssssssshmNNNMNmdyo:-............+MM
My.....--:/+ossyhhmmmNMNmmmmmmdhhyyyhhhhhysssoo+++shmNNmds+/-................+MM
My.............-::/+osyhdhmNNNNNNmmdddhhhyo++osyhdmdhs+:--...................+MM
My.....................-:/++osyhddmNMMMMNMMNNNNdhy+/-........................+MM
My...........................---:/+ooyhhmNNdhso/--...........................+MM
MdoooooooooooooooooooooooooooooooooooossyyhhsooooooooooooooooooooooooooooooooyMM',
                           note_scrip_post_migrt = null,
                           procd_initl_sesn = null,
                           fonct_migrt_persn = null
                     where seqnc = afw$migrt$pkg.vnu_seqnc_prodt;
end if;
exception
when others then
afw$migrt$pkg.defnr_ereur ('Update sur afw_11_prodt');
end;
/
prompt ========================================
begin
  if afw$migrt$pkg.vnu_sql_code = 0 then
    commit;
    dbms_output.put_line ('Deploiement complete correctement');
  else
    rollback;
    afw_13_condt_piltb_pkg.vbo_en_charg := false;
    dbms_output.put_line ('Une erreur est survenue lors de l''execution du script de deploiement.');
    dbms_output.put_line ('Bloc   : ' || afw$migrt$pkg.vva_nom_bloc_err);
    dbms_output.put_line ('Code   : ' || afw$migrt$pkg.vnu_sql_code);
    dbms_output.put_line ('Message: ' || afw$migrt$pkg.vva_sql_errm);
    dbms_output.put_line ('Pile   :');
    dbms_output.put_line (afw$migrt$pkg.vva_back_trace);
    afw_03_journ_pkg.ecrir_journ (afw$migrt$pkg.vva_sql_errm);
    afw_03_journ_pkg.ecrir_journ (afw$migrt$pkg.vva_back_trace);
  end if;
end;
/

begin
  if afw$migrt$pkg.vnu_sql_code <> 0 then
    raise_application_error (-20100, afw$migrt$pkg.vva_sql_errm);
  end if;
end;
/

prompt ========================================
prompt Nettoyage des objets temporaires

exec afw$migrt$pkg.suprm_table_tempr;

drop package afw$migrt$pkg;

begin 
                    afw_11_migrt_pkg.gva_indic_migrt := 'N'; 
                  end;
                  /

prompt ================================================================================
prompt ..._....___..___.__..__.___..___...._....__..__..___.__......__.___...___.._..__
prompt ../_\..| _ \| __|\ \/ /| __|| _ \../_\..|  \/  || __|\ \    / // _ \ | _ \| |/ /
prompt ./ _ \.|  _/| _|  >  < | _|.|   /./ _ \.| |\/| || _|..\ \/\/ /| (_) ||   /|   < 
prompt /_/.\_\|_|..|___|/_/\_\|_|..|_|_\/_/.\_\|_|..|_||___|..\_/\_/..\___/.|_|_\|_|\_\
prompt ================================================================================
prompt "Never send a human to do a machine's job." -Agent Smith
prompt ================================================================================
