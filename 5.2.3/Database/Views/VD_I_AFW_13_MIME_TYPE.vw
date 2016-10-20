SET DEFINE OFF;
create or replace force view vd_i_afw_13_mime_type
(
  seqnc
 ,ref_type_fichr
 ,ext
 ,mime_type
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ordre_choix
)
as
  select seqnc
        ,ref_type_fichr
        ,ext
        ,mime_type
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ordre_choix
    from afw_13_mime_type
/
