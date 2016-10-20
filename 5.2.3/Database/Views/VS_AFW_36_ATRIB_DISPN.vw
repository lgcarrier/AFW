SET DEFINE OFF;
create or replace force view vs_afw_36_atrib_dispn
(
  seqnc
 ,ref_page
 ,ref_type_don
 ,ref_type_don_code
 ,indic_dispn
 ,nom_afich
 ,nom_sql
 ,dnr_ref_aplic
 ,ordre
 ,indic_presn_vue
)
as
  select seqnc
        ,ref_page
        ,ref_type_don
        , (select code
             from vd_i_afw_36_type_don td
            where td.seqnc = ad.ref_type_don)
           ref_type_don_code
        ,indic_dispn
        ,nom_afich
        ,nom_sql
        ,dnr_ref_aplic
        , (select vad.ordre
             from vd_i_afw_36_vue_atrib vad
            where     vad.ref_vue = sys_context ('afw_36_filtr'
                                                ,'ref_vue')
                  and vad.ref_atrib_dispn = ad.seqnc)
           ordre
        ,nvl ( (select 'O'
                  from vd_i_afw_36_vue_atrib vad
                 where     vad.ref_vue = sys_context ('afw_36_filtr'
                                                     ,'ref_vue')
                       and vad.ref_atrib_dispn = ad.seqnc)
             ,'N')
           indic_presn_vue
    from vd_i_afw_36_atrib_dispn ad
   where     ad.ref_page = sys_context ('afw_36_filtr'
                                       ,'ref_page')
         and indic_dispn = 'O'
  with read only
/
