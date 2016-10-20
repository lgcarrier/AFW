SET DEFINE OFF;
create or replace package body afw_07_sql_noyau_pkg
as
  procedure obten_infor_coln_ir (pnu_ref_ir    in     number
                                ,pnu_rpts_id   in     number
                                ,pic_infor     in out afw_07_sql_pkg.typ_rec_infor_coln)
  is
  begin
    select pirc.libl
          ,pirc.largr
          ,pirc.type_largr
          ,pirc.indic_exprt
          ,airc.format_mask
          ,airc.heading_alignment
          ,airc.column_alignment
      into pic_infor.va_libl
          ,pic_infor.nu_largr
          ,pic_infor.va_type_largr
          ,pic_infor.va_indic_expor
          ,pic_infor.va_formt
          ,pic_infor.va_align_entet
          ,pic_infor.va_align_coln
      from vd_afw_13_page_ir_coln pirc
          ,apex_ir_coln           airc
     where     pirc.ref_page_ir = pnu_ref_ir
           and pirc.coln_table = upper (pic_infor.va_nom)
           and airc.id = pirc.id_apex;
  exception
    when no_data_found
    then
      -- Chercher la colonne dans les colonnes calculées
      begin
        select comp.column_label
              ,comp.format_mask
          into pic_infor.va_libl
              ,pic_infor.va_formt
          from apex_ir_compt comp
         where     comp.report_id = pnu_rpts_id
               and comp.db_column_name = upper (pic_infor.va_nom);
      exception
        when no_data_found
        then
          pic_infor.va_libl    := initcap (pic_infor.va_nom);
          pic_infor.va_formt   := null;
      end;

      pic_infor.nu_largr         := null;
      pic_infor.va_type_largr    := null;
      pic_infor.va_indic_expor   := 'O';
      pic_infor.va_align_entet   := null;
      pic_infor.va_align_coln    := null;
  end;
end afw_07_sql_noyau_pkg;
/
