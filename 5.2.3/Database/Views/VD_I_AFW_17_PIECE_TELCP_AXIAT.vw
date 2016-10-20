SET DEFINE OFF;
create or replace force view vd_i_afw_17_piece_telcp_axiat
(
  seqnc
 ,ref_telcp_axiat
 ,nombr_page
 ,ordre_atach
 ,contn
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,mime_type
 ,nom_fichr
)
as
  select seqnc
        ,ref_telcp_axiat
        ,nombr_page
        ,ordre_atach
        ,contn
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,mime_type
        ,nom_fichr
    from afw_17_piece_telcp_axiat
/
