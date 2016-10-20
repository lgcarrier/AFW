SET DEFINE OFF;
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
