SET DEFINE OFF;
create or replace package afw_11_aplic_pkg
is
  function obten_lang_deft (pnu_aplic in vd_i_afw_11_aplic.seqnc%type)
    return vd_afw_01_lang.seqnc%type;

  function obten_lang_deft_formt (pnu_aplic in vd_i_afw_11_aplic.seqnc%type)
    return apex_aplic.flow_language%type;

  function obten_aplic_sesn
    return vd_i_afw_11_aplic.seqnc%type;

  function obten_aplic (pva_code_aplic in vd_i_afw_11_aplic.code%type)
    return vd_i_afw_11_aplic.seqnc%type;

  /*
  TODO::CARLO
  obten_aplic et obten_aplic_numr_apex sont identiques
  */

  function obten_aplic (pnu_numr_apex in vd_i_afw_11_aplic.numr_aplic_apex%type)
    return vd_i_afw_11_aplic.seqnc%type;

  function obten_aplic_numr_apex (pnu_numr_apex in vd_i_afw_11_aplic.numr_aplic_apex%type)
    return vd_i_afw_11_aplic.seqnc%type;

  function obten_numr_apex_aplic (pnu_seqnc in number default obten_aplic_sesn)
    return vd_i_afw_11_aplic.numr_aplic_apex%type;

  function obten_numr_apex_aplic (pva_code_aplic in varchar2)
    return vd_i_afw_11_aplic.numr_aplic_apex%type;

  function obten_code_aplic (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.code%type;

  function obten_nom_aplic (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.nom%type;

  function obten_page_conxn (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_page_conxn%type;

  function obten_numr_apex_page_conxn (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return number;

  function obten_page_acuei (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_page_acuei%type;

  function obten_numr_apex_page_acuei (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return number;

  function obten_page_conxn_aplic_authe (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_page_conxn%type;

  function obten_numr_versn (pnu_versn_niv_1   in number
                            ,pnu_versn_niv_2   in number
                            ,pnu_versn_niv_3   in number
                            ,pnu_versn_niv_4   in number)
    return number
    deterministic;

  function obten_numr_versn_aplic (pnu_numr_aplic in number default null)
    return number;

  function obten_versn (pnu_versn_niv_1   in number
                       ,pnu_versn_niv_2   in number
                       ,pnu_versn_niv_3   in number
                       ,pnu_versn_niv_4   in number)
    return varchar2
    deterministic;

  function obten_versn
    return varchar2;

  function obten_schem (pnu_seqnc in number default null)
    return varchar2;

  procedure defnr_varbl_numr_aplic;

  function obten_aplic_sga
    return number;

  function obten_aplic_sdp
    return number;

  function obten_code_aplic_sdp
    return varchar2;

  procedure inser_aplic (pva_code              in varchar2
                        ,pva_nom               in varchar2
                        ,pnu_numr_aplic_apex   in number
                        ,pnu_numr_versn_1      in number
                        ,pnu_numr_versn_2      in number
                        ,pnu_numr_versn_3      in number
                        ,pnu_numr_versn_4      in number);

  function maj_aplic (pva_code              in varchar2
                     ,pva_nom               in varchar2
                     ,pnu_numr_aplic_apex   in number
                     ,pnu_ref_prodt         in number
                     ,pnu_ref_versn_courn   in number default null)
    return number;

  function obten_lang (pva_code    in vd_afw_01_lang.code%type
                      ,pnu_prodt   in number default afw_11_prodt_pkg.obten_prodt_sesn)
    return vd_afw_01_lang.seqnc%type;

  function obten_lang_sesn (pva_code_deft in varchar2 default null)
    return vd_afw_01_lang.seqnc%type;

  function obten_code_lang_sesn (pva_code_deft in varchar2 default null)
    return vd_i_afw_01_lang.code%type;

  function obten_secrt_group_id (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return apex_aplic.security_group_id%type;

  function obten_theme_apex (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return apex_aplic.theme_id%type;

  function obten_versn_courn (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_versn%type;

  function obten_aplic_authe (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_aplic_authe%type;

  function obten_prodt (pnu_aplic in vd_i_afw_11_aplic.seqnc%type)
    return vd_i_afw_11_prodt.seqnc%type;

  procedure defnr_app_id (pnu_numr_aplic_apex in number);

  function obten_aplic_tradc_courn (pnu_aplic_base in number)
    return number;
end afw_11_aplic_pkg;
/
