SET DEFINE OFF;
create or replace force view vd_afw_01_mesg
(
  seqnc
 ,numr_mesg
 ,numr_mesg_formt
 ,numr_mesg_formt_lang_prodt
 ,ref_prodt
 ,ref_prodt_formt
 ,descr
 ,type_mesg
 ,type_mesg_formt
)
as
  select seqnc
        ,numr_mesg
        , (select mesg
             from vd_afw_01_mesg_lang ml
            where     ml.ref_mesg = mes.seqnc
                  and ml.ref_lang = afw_01_lang_pkg.obten_lang_sesn)
           numr_mesg_formt
        , (select mesg
             from vd_afw_01_mesg_lang ml
            where     ml.ref_mesg = mes.seqnc
                  and ml.ref_lang = afw_11_prodt_pkg.obten_lang_deft (ref_prodt))
           numr_mesg_formt_lang_prodt
        ,ref_prodt
        ,nvl ( (select    p.code
                       || ' - '
                       || p.nom
                  from vd_i_afw_11_prodt p
                 where p.seqnc = mes.ref_prodt)
             ,'- Global -')
           ref_prodt_formt
        ,descr
        ,type_mesg
        ,decode (type_mesg,  'E', 'Erreur',  'A', 'Aide',  'W', 'Avertissement',  'I', 'Informatif',  'C', 'Erreur critique',  null) type_mesg_formt
    from vd_i_afw_01_mesg mes
/
