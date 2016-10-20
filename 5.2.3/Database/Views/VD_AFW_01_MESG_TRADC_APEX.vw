SET DEFINE OFF;
create or replace force view vd_afw_01_mesg_tradc_apex
(
  seqnc
 ,nom
 ,text
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_lang
 ,lang
 ,ref_lang_formt
 ,ref_prodt
)
as
  select seqnc
        ,nom
        ,text
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_lang
        , (select lower (l.code)
             from vd_i_afw_01_lang l
            where l.seqnc = mta.ref_lang)
           lang
        , (select l.nom
             from vd_i_afw_01_lang l
            where l.seqnc = mta.ref_lang)
           ref_lang_formt
        ,ref_prodt
    from vd_i_afw_01_mesg_tradc_apex mta
/
