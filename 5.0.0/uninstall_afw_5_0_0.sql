set feedback off
set serveroutput on size 30000
whenever sqlerror exit sql.sqlcode rollback

prompt
prompt START OF SCRIPT
prompt ...Preparing uninstall

create or replace package afw$uninstall$pkg
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

  procedure valdt_schem_unins;

  procedure valdt_schema_afw_exist;

  procedure valdt_apex_works_exist;
end afw$uninstall$pkg;
/

create or replace package body afw$uninstall$pkg
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

  procedure valdt_schem_unins
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
      afw$uninstall$pkg.log_error ('You have to be connected as SYS to install AFW');
  end valdt_schem_unins;

  procedure valdt_schema_afw_exist
  is
    vnu_exist   number;
  begin
    select null
      into vnu_exist
      from dba_users
     where username = kva_schem_afw;
  exception
    when no_data_found
    then
      afw$uninstall$pkg.log_error ('The schema AFW was not found.');
  end valdt_schema_afw_exist;

  procedure valdt_apex_works_exist
  is
    vnu_exist   number;
  begin
    select null
      into vnu_exist
      from apex_050000.wwv_flow_companies
     where provisioning_company_id = knu_apex_works;
  exception
    when no_data_found
    then
      afw$uninstall$pkg.log_error ('The APEX Workspace associated with AFW was not found.');
  end valdt_apex_works_exist;
end afw$uninstall$pkg;
/

prompt ...Validations

begin
  if not afw$uninstall$pkg.gbo_error
  then
    dbms_output.put_line ('......Connected with SYS');
    afw$uninstall$pkg.valdt_schem_unins ();
  end if;
end;
/

begin
  if not afw$uninstall$pkg.gbo_error
  then
    dbms_output.put_line ('......AFW schema must exists');
    afw$uninstall$pkg.valdt_schema_afw_exist ();
  end if;
end;
/

begin
  if not afw$uninstall$pkg.gbo_error
  then
    dbms_output.put_line ('......APEX Workspace must exists');
    afw$uninstall$pkg.valdt_apex_works_exist ();
  end if;
end;
/

declare
  --AFW Workspace ID
  vnu_apex_works   number default 91160807242371593;
begin
  if not afw$uninstall$pkg.gbo_error
  then
    dbms_output.put_line ('...Uninstall');
    dbms_output.put_line ('......Deleting Apex Workspace');
    dbms_output.put_line ('......Deleting schema AFW');
    apex_050000.wwv_flow_provisioning.terminate_service_by_sgid (vnu_apex_works
                                                                ,p_drop_users   => 'Y');

    for c1 in (select id
                 from apex_050000.wwv_flow_provision_company
                where security_group_id = vnu_apex_works)
    loop
      apex_050000.wwv_flow_provisioning.delete_provision_request (c1.id);
      exit;
    end loop;
  end if;
end;
/

begin
  if not afw$uninstall$pkg.gbo_error
  then
    commit;
    dbms_output.put_line ('Uninstall completed');
  else
    rollback;
    dbms_output.put_line ('Uninstall failed');
    dbms_output.put_line (   'Error : '
                          || afw$uninstall$pkg.gva_nom_bloc_err);
  end if;
end;
/

prompt ...Cleaning

drop package afw$uninstall$pkg;

prompt END OF SCRIPT