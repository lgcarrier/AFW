SET DEFINE OFF;
create or replace force view vd_afw_03_trace_exect
(
  un
 ,deux
 ,dthr
 ,utils
 ,seqnc
 ,lb
 ,who_called_me
 ,page
 ,app
 ,app_user
 ,fil
 ,duree
 ,bb
)
as
  select un
        ,deux
        ,dthr
        ,utils
        ,seqnc
        ,lb
        ,who_called_me
        ,page
        ,app
        ,app_user
        ,fil
        ,duree
        ,bb
    from vd_i_afw_03_trace_exect
/
