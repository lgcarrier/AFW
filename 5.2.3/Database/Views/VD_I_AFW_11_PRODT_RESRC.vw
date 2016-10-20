SET DEFINE OFF;
create or replace force view vd_i_afw_11_prodt_resrc
(
  seqnc
 ,ref_prodt
 ,ref_resrc
 ,ref_formt
 ,ref_condt_exect
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_plugn
)
as
  select seqnc
        ,ref_prodt
        ,ref_resrc
        ,ref_formt
        ,ref_condt_exect
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_plugn
    from afw_11_prodt_resrc
/
