SET DEFINE OFF;
create or replace package afw_03_journ_pkg
is
  --Ceci sert à séquencer, par session, les lignes dans afw_03_trace_exec
  gnu_fil         pls_integer default 0;
  --Ceci sert à calculer, par session, le temps écoulé depuis la dernière trace dans afw_03_trace_exec
  gts_dernr       timestamp default systimestamp;

  type typ_tab_timst_fil is table of timestamp
    index by pls_integer;

  gta_timst_fil   typ_tab_timst_fil;


  procedure ecrir_journ (pva_expli              in varchar2 default null
                        ,pva_travl              in varchar2 default null
                        ,pva_code_clas_inter    in varchar2 default null
                        ,pbo_notfr_mesg_infor   in boolean default false);

  procedure defnr_travl (pva_travl in varchar2);

  procedure purgr;
end afw_03_journ_pkg;
/
