SET DEFINE OFF;
create or replace force view vd_afw_13_page_ir_coln
(
  seqnc
 ,ref_page_ir
 ,ordre_afich
 ,libl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coln_table
 ,id_apex
 ,largr
 ,type_largr
 ,indic_exprt
 ,ref_mesg_aide
 ,ref_mesg_aide_numr
)
as
  select seqnc
        ,ref_page_ir
        ,ordre_afich
        ,libl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coln_table
        ,id_apex
        ,largr
        ,type_largr
        ,indic_exprt
        ,ref_mesg_aide
        , (select mes.numr_mesg
             from vd_afw_01_mesg mes
            where mes.seqnc = pic.ref_mesg_aide)
           ref_mesg_aide_numr
    from vd_i_afw_13_page_ir_coln pic
/


create or replace trigger vd_afw_13_page_ir_coln_iou_trg
  instead of update
  on vd_afw_13_page_ir_coln
  for each row
declare
  vnu_ref_mesg_aide   number (10);
begin
  if :new.ref_mesg_aide_numr is not null
  then
    select m.seqnc
      into vnu_ref_mesg_aide
      from vd_afw_13_page_ir pi
          ,vd_afw_13_page    p
          ,vd_afw_11_aplic   ap
          ,vd_afw_01_mesg    m
     where     pi.seqnc = :new.ref_page_ir
           and pi.ref_page = p.seqnc
           and p.ref_aplic = ap.seqnc
           and ap.ref_prodt = m.ref_prodt
           and m.numr_mesg = :new.ref_mesg_aide_numr;
  end if;

  update afw_13_page_ir_coln
     set ordre_afich     = :new.ordre_afich
        ,libl            = :new.libl
        ,date_modfc      = :new.date_modfc
        ,utils_modfc     = :new.utils_modfc
        ,coln_table      = :new.coln_table
        ,id_apex         = :new.id_apex
        ,largr           = :new.largr
        ,type_largr      = :new.type_largr
        ,indic_exprt     = :new.indic_exprt
        ,ref_mesg_aide   = vnu_ref_mesg_aide
   where seqnc = :new.seqnc;
exception
  when others
  then
    raise;
end vd_afw_13_page_ir_coln_iou_trg;
/
