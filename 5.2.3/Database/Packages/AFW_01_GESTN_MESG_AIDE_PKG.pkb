SET DEFINE OFF;
create or replace package body afw_01_gestn_mesg_aide_pkg
is
  function obten_aide_page_item (pnu_numr_apex_page_item in number)
    return varchar2
  is
    vva_numr_mesg    vd_afw_01_mesg.numr_mesg%type;
    vva_libl         vd_afw_13_page_item.libl%type;
    vva_code_prodt   vd_afw_11_prodt.code%type;
  begin
    select m.numr_mesg
          ,itm.libl
          ,pr.code
      into vva_numr_mesg
          ,vva_libl
          ,vva_code_prodt
      from vd_afw_13_page_item itm
          ,vd_afw_01_mesg      m
          ,vd_afw_13_page      p
          ,vd_afw_11_prodt     pr
          ,vd_afw_11_aplic     a
     where     itm.id_apex = pnu_numr_apex_page_item
           and m.seqnc = itm.ref_mesg_aide
           and p.seqnc = itm.ref_page
           and a.seqnc = p.ref_aplic
           and a.ref_prodt = pr.seqnc;

    return afw_01_gestn_mesg_pkg.obten_mesg_par_numr (vva_numr_mesg
                                                     ,vva_code_prodt);
  exception
    when no_data_found
    then
      return afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000099'
                                                       ,'AFW');
  end obten_aide_page_item;

  function obten_aide_coln_ir (p_sesn        in number
                              ,p_ir_id       in number
                              ,p_ir_col_id   in varchar2)
    return varchar2
  is
    vva_mesg   varchar2 (10);
  begin
    if afw_07_util_pkg.verfr_sesn_vald (p_sesn)
    then
      select m.numr_mesg
        into vva_mesg
        from vd_afw_11_prodt        pr
            ,vd_afw_13_page         p
            ,vd_i_afw_13_page_ir    ir
            ,vd_afw_13_page_ir_coln col
            ,vd_i_afw_01_mesg       m
            ,vd_i_afw_11_aplic      a
       where     col.ref_page_ir = ir.seqnc
             and    'APEXIR_'
                 || upper (col.coln_table) = upper (p_ir_col_id)
             and ir.id_apex = p_ir_id
             and m.seqnc = col.ref_mesg_aide
             and p.seqnc = ir.ref_page
             and a.seqnc = p.ref_aplic
             and a.ref_prodt = pr.seqnc;

      return afw_01_gestn_mesg_pkg.obten_mesg_par_numr (vva_mesg
                                                       ,'AFW');
    else
      return null;
    end if;
  exception
    when no_data_found
    then
      return afw_01_gestn_mesg_pkg.obten_mesg_par_numr ('SIE.000099'
                                                       ,'AFW');
  end obten_aide_coln_ir;
end afw_01_gestn_mesg_aide_pkg;
/
