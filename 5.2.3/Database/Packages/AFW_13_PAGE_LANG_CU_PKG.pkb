SET DEFINE OFF;
create or replace package body afw_13_page_lang_cu_pkg
as
  kva_code_plsql          constant varchar2 (11) default 'SEQNC_CONTX';
  kva_const_fonct_genrt   constant varchar2 (13) default '%FONCT_GENRT%';

  function obten_libl_page (pva_libl                 in varchar2
                           ,pva_code_dv_type_expre   in varchar2
                           ,pnu_lang                 in number
                           ,pnu_seqnc_contx          in number default null)
    return varchar2
  is
    vva_libl                 vd_afw_13_page_lang.nom%type default pva_libl;
    vva_code_dv_type_expre   vd_afw_13_page_lang.ref_dv_type_expre_formt%type default pva_code_dv_type_expre;
    vva_progr_a_lancr        varchar2 (4000)
                               default    'begin '
                                       || '  afw_13_page_lang_cu_pkg.gva_libl := '
                                       || kva_const_fonct_genrt
                                       || '(:1, :2); '
                                       || '  exception when others then ete(); afw_13_page_lang_cu_pkg.gva_libl := null;'
                                       || 'end;';
  begin
    case vva_code_dv_type_expre
      when kva_code_plsql
      then
        vva_progr_a_lancr      :=
          replace (vva_progr_a_lancr
                  ,kva_const_fonct_genrt
                  ,vva_libl);

        --Execute function to get value by API define in afw_13_page_lang
        execute immediate vva_progr_a_lancr
          using pnu_seqnc_contx --nvl (afw_07_util_pkg.nv ('A_AFW_04_SEQNC_CON'), afw_07_util_pkg.nv ('SSPC'))
               ,pnu_lang;

        case
          when gva_libl is not null
          then
            vva_libl   := gva_libl;
          when gva_mesg_par_deft is not null
          then
            vva_libl   := gva_mesg_par_deft;
          else
            vva_libl   := kva_mesg_par_deft;
        end case;
      else
        null; --Retourne le libelle fixe pour linstant
    end case;

    return vva_libl;
  exception
    when no_data_found
    then
      return kva_mesg_par_deft;
  end obten_libl_page;

  function genr_libl_page (pnu_numr_page_apex    in number
                          ,pnu_lang              in number default afw_01_lang_pkg.obten_lang_sesn ()
                          ,pnu_numr_aplic_apex   in number default afw_11_aplic_pkg.obten_numr_apex_aplic
                          ,pnu_seqnc_contx       in number default null)
    return varchar2
  is
    vva_libl                 vd_afw_13_page_lang.nom%type;
    vva_code_dv_type_expre   vd_afw_13_page_lang.ref_dv_type_expre_formt%type;
  begin
    select pl.nom
          ,pl.ref_dv_type_expre_formt
      into vva_libl
          ,vva_code_dv_type_expre
      from vd_afw_13_page_lang pl
          ,vd_afw_13_page      p
     where     p.numr_apex = pnu_numr_page_apex
           and p.app_id_formt = pnu_numr_aplic_apex
           and pl.ref_page = p.seqnc
           and pl.ref_lang = pnu_lang;

    return obten_libl_page (vva_libl
                           ,vva_code_dv_type_expre
                           ,pnu_lang
                           ,pnu_seqnc_contx);
  end genr_libl_page;
end afw_13_page_lang_cu_pkg;
/
