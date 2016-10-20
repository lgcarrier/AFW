SET DEFINE OFF;
create or replace procedure ete (pva_1                in varchar2 default sqlerrm
                                ,pva_2                in varchar2 default dbms_utility.format_error_backtrace ()
                                ,pcl_clob             in clob default null
                                ,pbl_blob             in blob default null
                                ,pnu_duree_deps_fil   in number default null
                                ,pxm_xml              in xmltype default null)
is
  pragma autonomous_transaction;
  vts_dernr   timestamp default afw_03_journ_pkg.gts_dernr;
  vts_actue   timestamp default systimestamp;
begin
  afw_03_journ_pkg.gnu_fil                                    := afw_03_journ_pkg.gnu_fil + 1;

  if pnu_duree_deps_fil is not null
  then
    if afw_03_journ_pkg.gta_timst_fil.exists (pnu_duree_deps_fil)
    then
      vts_dernr   := afw_03_journ_pkg.gta_timst_fil (pnu_duree_deps_fil);
    end if;
  end if;

  insert into afw_03_trace_exect (un
                                 ,deux
                                 ,dthr
                                 ,lb
                                 ,bb
                                 ,who_called_me
                                 ,fil
                                 ,duree
                                 ,xml)
       values (nvl (pva_1, '«NULL»')
              ,nvl (pva_2, '«NULL»')
              ,vts_actue
              ,pcl_clob
              ,pbl_blob
              ,substr (dbms_utility.format_call_stack ()
                      ,1
                      ,4000)
              ,afw_03_journ_pkg.gnu_fil
              , (  extract (day from vts_actue - vts_dernr) * 86400
                 + extract (hour from vts_actue - vts_dernr) * 3600
                 + extract (minute from vts_actue - vts_dernr) * 60
                 + round (extract (second from vts_actue - vts_dernr)
                         ,3))
              ,pxm_xml);

  afw_03_journ_pkg.gts_dernr                                  := vts_actue;
  afw_03_journ_pkg.gta_timst_fil (afw_03_journ_pkg.gnu_fil)   := vts_actue;

  commit;
end ete;
/
