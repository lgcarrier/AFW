SET DEFINE OFF;
create or replace force view vd_i_afw_01_modl_mesg_notfc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,objet
 ,ref_domn
 ,corps_mesg
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,objet
        ,ref_domn
        ,corps_mesg
    from afw_01_modl_mesg_notfc
/
