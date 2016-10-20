SET DEFINE OFF;
create or replace force view vs_afw_23_somr_reslt_rechr
(
  nom_formt
 ,ref_struc_aplic
 ,ref_rechr
)
as
    select    sa.nom
           || ' [décompte '
           || count (1)
           || ', pertinence maximum '
           || max (rr.dnr_pertn)
           || '%]'
             nom_formt
          ,sa.seqnc ref_struc_aplic
          ,rr.ref_rechr
      from vd_afw_23_reslt_rechr rr
          ,vd_afw_12_struc_aplic sa
     where sa.seqnc = rr.dnr_ref_struc_aplic
  group by sa.nom
          ,sa.seqnc
          ,rr.ref_rechr
/
