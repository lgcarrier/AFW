SET DEFINE OFF;
create or replace force view vd_afw_01_modl_mesg_notfc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,objet
 ,corps_mesg
 ,ref_domn
)
as
  (select seqnc
         ,code
         ,nom
         ,descr
         ,objet
         ,corps_mesg
         ,ref_domn
     from vd_i_afw_01_modl_mesg_notfc)
/
