SET DEFINE OFF;
create or replace force view vd_i_afw_13_page_ir_coln
(
  seqnc
 ,ordre_afich
 ,libl
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coln_table
 ,ref_page_ir
 ,id_apex
 ,largr
 ,type_largr
 ,indic_exprt
 ,ref_mesg_aide
 ,dnr_ref_aplic
)
as
  select seqnc
        ,ordre_afich
        ,libl
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coln_table
        ,ref_page_ir
        ,id_apex
        ,largr
        ,type_largr
        ,indic_exprt
        ,ref_mesg_aide
        ,dnr_ref_aplic
    from afw_13_page_ir_coln
/
