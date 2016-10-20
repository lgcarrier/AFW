SET DEFINE OFF;
create or replace package body afw_25_javsc_pkg
as
  procedure ajout_scrip_charg
  is
    vva_script     varchar2 (4000);
    vnu_nombr_ir   number;
  begin
    afw_07_util_pkg.ajout_info_debug ('AFW 25 Rapport interactif - JavaScript au chargement');

    select count (*)
      into vnu_nombr_ir
      from vd_afw_13_page_ir pi
     where pi.ref_page = afw_13_page_pkg.obten_page_sesn ();

    if vnu_nombr_ir > 0
    then
      afw_07_util_pkg.ajout_libr_javsc ('jquery.apex-ir_tri_alter'
                                       ,   afw_11_prodt_pkg.obten_dosr_fichr_afw
                                        || 'assets/plugins/jquery-apex/4.1.0/');

      vva_script      :=
           'if (apex.worksheet.ws) {'
        || '  gReport = new apex.worksheet.ws("");'
        || '  function trans_ir(){'
        || '   gReport.l_LastFunction = trans_ir;'
        || '   afw.jQuery.trans_IR_tri_alter();'
        || '   if (afw.jQuery(".afw_25_formt_entet_vertc").length>0) {afw.afw_25.entet_vertc.formt();}'
        || '  }'
        || '  trans_ir();'
        || '  setInterval('
        || '   function(){'
        || '    trans_ir();'
        || '   },'
        || '   1000'
        || '  );'
        || '}';

      afw_07_util_pkg.ajout_code_javsc_charg (vva_script);
    end if;
  exception
    when no_data_found
    then
      null;
  end ajout_scrip_charg;
end afw_25_javsc_pkg;
/
