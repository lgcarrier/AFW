--Script 1 *** execute as / as sysdba
set define off
set verify off
set feedback off
whenever sqlerror exit sql.sqlcode rollback

prompt
prompt ...Preparing install
prompt

create or replace package afw$install$pkg
as
  kva_schem_insta    varchar2 (30) default 'SYS';
  kva_schem_afw      varchar2 (30) default 'AFW';
  knu_apex_works     number default 91160807242371593;

  gbo_error          boolean default false;
  gnu_sql_code       number default 0;
  gva_sql_errm       varchar2 (4000);
  gva_back_trace     varchar2 (32500);
  gva_nom_bloc_err   varchar2 (100);

  procedure log_error (pva_nom in varchar2);

  procedure valdt_schem_insta;

  procedure valdt_schema_afw_exist;

  procedure valdt_apex_works_exist;
end afw$install$pkg;
/

create or replace package body afw$install$pkg
as
  procedure log_error (pva_nom in varchar2)
  is
  begin
    gbo_error          := true;
    gnu_sql_code       := sqlcode;
    gva_sql_errm       := sqlerrm;
    gva_back_trace     := dbms_utility.format_error_backtrace ();
    gva_nom_bloc_err   := pva_nom;
  end log_error;

  procedure valdt_schem_insta
  is
    vnu_exist   number;
  begin
    select null
      into vnu_exist
      from user_users
     where username = kva_schem_insta;
  exception
    when no_data_found
    then
      log_error ('You have to be connected as SYS to install AFW');
  end valdt_schem_insta;

  procedure valdt_schema_afw_exist
  is
    vnu_exist   number;
  begin
    select null
      into vnu_exist
      from dba_users
     where username = kva_schem_afw;

    --todo::lgcarrier
    --show version num
    --afw_11_prodt_pkg.obten_numr_versn('AFW')

    log_error ('The schema AFW was found. To proceed with a fresh new install, you must first uninstall AFW.');
  exception
    when no_data_found
    then
      null;
  end valdt_schema_afw_exist;

  procedure valdt_apex_works_exist
  is
    vnu_exist   number;
  begin
    select null
      into vnu_exist
      from apex_050000.wwv_flow_companies
     where provisioning_company_id = knu_apex_works;

    --todo::lgcarrier
    --show workspace name

    log_error ('The APEX Workspace associated with AFW was found. To proceed with a fresh new install, you must first uninstall AFW.');
  exception
    when no_data_found
    then
      null;
  end valdt_apex_works_exist;
end afw$install$pkg;
/

prompt
prompt ...Validations

prompt ......Connexion avec SYS pour installer

begin
  if not afw$install$pkg.gbo_error
  then
    afw$install$pkg.valdt_schem_insta ();
  end if;
end;
/

prompt ......Le schema AFW ne doit pas exister

begin
  if not afw$install$pkg.gbo_error
  then
    afw$install$pkg.valdt_schema_afw_exist ();
  end if;
end;
/

prompt ......Le workspace APEX associé à AFW ne doit pas exister

begin
  if not afw$install$pkg.gbo_error
  then
    afw$install$pkg.valdt_apex_works_exist ();
  end if;
end;
/

prompt ...Installation

prompt ......Creation du schema AFW

--todo
prompt Saisir le mot de passe du schema AFW (defaut=afwpwd)

create user afw
  identified by afwpwd
  default tablespace sysaux
  temporary tablespace temp
  profile default
  account unlock;

prompt ......Installation du workspace APEX pour AFW
@@install_wks.sql;

prompt ......Grants et synonyms
@@install_grant_synonym.sql;

commit;

prompt
prompt ......Exécuter en tant que AFW

alter session set current_schema = afw;

declare
  vnu_exist       number;
  kva_schem_afw   varchar2 (30) default 'AFW';
begin
  select 1
    into vnu_exist
    from dual
   where kva_schem_afw = (select username
                            from user_users
                           where rownum = 1);
exception
  when no_data_found
  then
    afw$install$pkg.log_error ('Not able to execute as user AFW');
end;
/

prompt ......install_modl
@@install_modl.sql;
prompt ......install_app_meta
@@install_app_meta.sql;
prompt ......update_owner_app
@@update_owner_app.sql;

prompt
prompt ...Nettoyage
prompt

begin
  if not afw$install$pkg.gbo_error
  then
    commit;
    dbms_output.put_line ('Install completed');
  else
    rollback;
    dbms_output.put_line ('Install failed');
    dbms_output.put_line (   'Bloc   : '
                          || afw$install$pkg.gva_nom_bloc_err);
    dbms_output.put_line (   'Code   : '
                          || afw$install$pkg.gnu_sql_code);
    dbms_output.put_line (   'Message: '
                          || afw$install$pkg.gva_sql_errm);
    dbms_output.put_line ('Pile   :');
    dbms_output.put_line (afw$install$pkg.gva_back_trace);
  end if;
end;
/

begin
  if afw$install$pkg.gbo_error
  then
    raise_application_error (-20100
                            ,afw$install$pkg.gva_sql_errm);
  end if;
end;
/

drop package afw$install$pkg;