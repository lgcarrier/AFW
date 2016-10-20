SET DEFINE OFF;
create or replace force view vd_i_afw_17_courl_piece_joint
(
  seqnc
 ,ref_courl
 ,mime_type
 ,contn
 ,tail
 ,nom_fichr
 ,mode_atach
)
as
  select seqnc
        ,ref_courl
        ,mime_type
        ,contn
        ,tail
        ,nom_fichr
        ,mode_atach
    from afw_17_courl_piece_joint
/
