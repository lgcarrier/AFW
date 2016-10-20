SET DEFINE OFF;
create or replace force view vd_afw_01_mesg_aide
(
  seqnc
 ,nom
 ,libl
 ,type_item
 ,ref_page
 ,numr_mesg
 ,mesg
 ,ref_lang
 ,seqnc_mesg_lang
)
as
  select aap.seqnc
        ,aap.nom_apex
        ,aap.libl
        ,aap.type_item
        ,aap.ref_page
        ,mes.numr_mesg
        ,mel.mesg
        ,mel.ref_lang
        ,mel.seqnc
    from vd_i_afw_13_page      pa
        ,vd_i_afw_13_page_item aap
        ,vd_i_afw_11_prodt     pro
        ,vd_i_afw_11_aplic     ap
        ,vd_i_afw_01_mesg      mes
        ,vd_i_afw_01_mesg_lang mel
   where     pa.ref_aplic = ap.seqnc
         and ap.ref_prodt = pro.seqnc
         and aap.ref_page = pa.seqnc
         and aap.ref_mesg_aide = mes.seqnc(+)
         and mel.ref_mesg(+) = mes.seqnc
  union all
  select irc.seqnc
        ,irc.coln_table
        ,irc.libl
        ,'RAPRT'
        ,ir.ref_page
        ,mes.numr_mesg
        ,mel.mesg
        ,mel.ref_lang
        ,mel.seqnc
    from vd_i_afw_13_page         pa
        ,vd_i_afw_13_page_ir      ir
        ,vd_i_afw_13_page_ir_coln irc
        ,vd_i_afw_11_prodt        pro
        ,vd_i_afw_11_aplic        ap
        ,vd_i_afw_01_mesg         mes
        ,vd_i_afw_01_mesg_lang    mel
   where     pa.ref_aplic = ap.seqnc
         and ap.ref_prodt = pro.seqnc
         and ir.ref_page = pa.seqnc
         and irc.ref_page_ir = ir.seqnc
         and irc.ref_mesg_aide = mes.seqnc(+)
         and mel.ref_mesg(+) = mes.seqnc
  union all
  select rpl.seqnc
        ,null
        ,null
        ,'PAGE'
        ,rp.ref_page
        ,rp.nom
        ,to_char (rpl.contn)
        ,rpl.ref_lang
        ,rpl.seqnc
    from vd_i_afw_13_page            pa
        ,vd_i_afw_11_prodt           pro
        ,vd_i_afw_11_aplic           ap
        ,vd_i_afw_13_regn_piltb      rp
        ,vd_i_afw_13_regn_piltb_lang rpl
   where     pa.ref_aplic = ap.seqnc
         and ap.ref_prodt = pro.seqnc
         and rp.ref_page = pa.seqnc
         and rpl.ref_regn_piltb = rp.seqnc
         and rp.ref_dv_type_regn_piltb = afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REGN_PILTB'
                                                                          ,'AIDE_PAGE')
/


create or replace trigger vd_afw_01_mesg_aide_iou_trg
  instead of update
  on vd_afw_01_mesg_aide
  for each row
begin
  if :new.type_item in ('RAPRT'
                       ,'ITEM'
                       ,'BOUTN')
  then
    update vd_i_afw_01_mesg_lang ml
       set ml.mesg   = :new.mesg
     where seqnc = :new.seqnc_mesg_lang;
  elsif :new.type_item = 'PAGE'
  then
    update vd_i_afw_13_regn_piltb_lang rpl
       set rpl.contn   = :new.mesg
     where rpl.seqnc = :new.seqnc_mesg_lang;
  end if;
end vd_afw_01_mesg_aide_iou_trg;
/
