SET DEFINE OFF;
create or replace force view vd_afw_01_mesg_lang
(
  seqnc
 ,ref_lang
 ,ref_lang_formt
 ,mesg
 ,ref_mesg
 ,ref_mesg_formt
 ,type_mesg
)
as
  select seqnc
        ,ref_lang
        , (select l.nom
             from vd_afw_01_lang l
            where l.seqnc = p.seqnc)
           ref_lang_formt
        ,mesg
        ,ref_mesg
        , (select m.numr_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = p.ref_mesg)
           ref_mesg_formt
        , (select m.type_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = p.ref_mesg)
           type_mesg
    from vd_i_afw_01_mesg_lang p
/
