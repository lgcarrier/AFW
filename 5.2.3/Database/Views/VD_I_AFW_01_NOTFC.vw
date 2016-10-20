SET DEFINE OFF;
create or replace force view vd_i_afw_01_notfc
(
  seqnc
 ,code
 ,nom
 ,descr
 ,inden_mesg
 ,titre_mesg
 ,mesg
 ,ref_modl_afich_notfc
 ,indic_specf
 ,indic_afich_uniq
 ,ref_domn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,code
        ,nom
        ,descr
        ,inden_mesg
        ,titre_mesg
        ,mesg
        ,ref_modl_afich_notfc
        ,indic_specf
        ,indic_afich_uniq
        ,ref_domn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from afw_01_notfc
/
