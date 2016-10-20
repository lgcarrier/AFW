SET DEFINE OFF;
create or replace package body afw_15_ajax_pkg
as
  procedure obten_json_sql (pva_sql in varchar2)
  is
  begin
    apex_util.json_from_sql (pva_sql);
  exception
    when others
    then
      htp.prn ('{"row":[]}');
  end obten_json_sql;
end afw_15_ajax_pkg;
/
