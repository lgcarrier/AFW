SET DEFINE OFF;
create or replace package body afw_07_polc_pkg
as
  --Identifiant contexte session disponible pour AFW
  kva_contx_sesn               constant varchar2 (30) default 'ctx_infor_sesn';

  --Identifiants contexte session (disponible via les fonctions correspondantes)
  kva_contx_sesn_seqnc_sesn    constant varchar2 (30) default 'vnu_seqnc_sesn';
  kva_contx_sesn_code_utils    constant varchar2 (30) default 'vva_code_utils';
  kva_contx_sesn_seqnc_utils   constant varchar2 (30) default 'vnu_seqnc_utils';
  kva_contx_sesn_code_prodt    constant varchar2 (30) default 'vva_code_prodt';
  kva_contx_sesn_seqnc_prodt   constant varchar2 (30) default 'vnu_seqnc_prodt';
  kva_contx_sesn_code_aplic    constant varchar2 (30) default 'vva_code_aplic';
  kva_contx_sesn_seqnc_aplic   constant varchar2 (30) default 'vnu_seqnc_aplic';
  kva_contx_sesn_code_lang     constant varchar2 (30) default 'vva_code_lang';
  kva_contx_sesn_seqnc_lang    constant varchar2 (30) default 'vnu_seqnc_lang';

  kva_contx_sesn_numr_aplic    constant varchar2 (30) default 'vnu_numr_aplic_apex';
  kva_contx_sesn_seqnc_page    constant varchar2 (30) default 'vnu_seqnc_page';
  kva_contx_sesn_numr_page     constant varchar2 (30) default 'vnu_numr_page_apex';
  kva_contx_sesn_sidf          constant varchar2 (30) default 'vnu_sidf';

  procedure defnr_contx (pva_contx         in varchar2
                        ,pva_ident         in varchar2
                        ,pva_ident_value   in varchar2 default null)
  is
  begin
    dbms_session.set_context (pva_contx
                             ,pva_ident
                             ,pva_ident_value);
  end defnr_contx;

  procedure defnr_contx_sesn_seqnc_sesn (pnu_sesn in number)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_seqnc_sesn
                ,pnu_sesn);
  end defnr_contx_sesn_seqnc_sesn;

  procedure defnr_contx_sesn_code_utils (pva_code_utils in varchar2)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_code_utils
                ,pva_code_utils);
  end defnr_contx_sesn_code_utils;

  procedure defnr_contx_sesn_seqnc_utils (pnu_seqnc_utils in number)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_seqnc_utils
                ,pnu_seqnc_utils);
  end defnr_contx_sesn_seqnc_utils;

  procedure defnr_contx_sesn_code_prodt (pva_code_prodt in varchar2)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_code_prodt
                ,pva_code_prodt);
  end defnr_contx_sesn_code_prodt;

  procedure defnr_contx_sesn_seqnc_prodt (pnu_seqnc_prodt in number)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_seqnc_prodt
                ,pnu_seqnc_prodt);
  end defnr_contx_sesn_seqnc_prodt;

  procedure defnr_contx_sesn_code_aplic (pva_code_aplic in varchar2)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_code_aplic
                ,pva_code_aplic);
  end defnr_contx_sesn_code_aplic;

  procedure defnr_contx_sesn_seqnc_aplic (pnu_seqnc_aplic in number)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_seqnc_aplic
                ,pnu_seqnc_aplic);
  end defnr_contx_sesn_seqnc_aplic;

  procedure defnr_contx_sesn_code_lang (pva_code_lang in varchar2)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_code_lang
                ,pva_code_lang);
  end defnr_contx_sesn_code_lang;

  procedure defnr_contx_sesn_seqnc_lang (pnu_seqnc_lang in number)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_seqnc_lang
                ,pnu_seqnc_lang);
  end defnr_contx_sesn_seqnc_lang;

  procedure defnr_contx_sesn_numr_aplic (pnu_numr_aplic in number)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_numr_aplic
                ,pnu_numr_aplic);
  end defnr_contx_sesn_numr_aplic;

  procedure defnr_contx_sesn_seqnc_page (pnu_seqnc_page in number)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_seqnc_page
                ,pnu_seqnc_page);
  end defnr_contx_sesn_seqnc_page;

  procedure defnr_contx_sesn_numr_page (pnu_numr_page in number)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_numr_page
                ,pnu_numr_page);
  end defnr_contx_sesn_numr_page;

  procedure defnr_contx_sesn_sidf (pnu_sidf in number)
  is
  begin
    defnr_contx (kva_contx_sesn
                ,kva_contx_sesn_sidf
                ,pnu_sidf);
  end defnr_contx_sesn_sidf;

  function obten_chain_contx (pva_contx   in varchar2
                             ,pva_ident   in varchar2)
    return varchar2
  is
  begin
    return    'sys_context('''
           || pva_contx
           || ''','''
           || pva_ident
           || ''')';
  end obten_chain_contx;

  function obten_chain_contx_seqnc_sesn
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_seqnc_sesn);
  end obten_chain_contx_seqnc_sesn;

  function obten_chain_contx_code_utils
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_code_utils);
  end obten_chain_contx_code_utils;

  function obten_chain_contx_seqnc_utils
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_seqnc_utils);
  end obten_chain_contx_seqnc_utils;

  function obten_chain_contx_code_prodt
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_code_prodt);
  end obten_chain_contx_code_prodt;

  function obten_chain_contx_seqnc_prodt
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_seqnc_prodt);
  end obten_chain_contx_seqnc_prodt;

  function obten_chain_contx_code_aplic
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_code_aplic);
  end obten_chain_contx_code_aplic;

  function obten_chain_contx_seqnc_aplic
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_seqnc_aplic);
  end obten_chain_contx_seqnc_aplic;

  function obten_chain_contx_code_lang
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_code_lang);
  end obten_chain_contx_code_lang;

  function obten_chain_contx_seqnc_lang
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_seqnc_lang);
  end obten_chain_contx_seqnc_lang;

  function obten_chain_contx_numr_aplic
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_numr_aplic);
  end obten_chain_contx_numr_aplic;


  function obten_chain_contx_seqnc_page
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_seqnc_page);
  end obten_chain_contx_seqnc_page;


  function obten_chain_contx_numr_page
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_numr_page);
  end obten_chain_contx_numr_page;

  function obten_chain_contx_sidf
    return varchar2
  is
  begin
    return obten_chain_contx (kva_contx_sesn
                             ,kva_contx_sesn_sidf);
  end obten_chain_contx_sidf;

  function obten_valr_contx (pva_contx   in varchar2
                            ,pva_ident   in varchar2)
    return varchar2
  is
  begin
    return sys_context (pva_contx
                       ,pva_ident);
  end obten_valr_contx;

  function obten_valr_contx_varch (pva_contx   in varchar2
                                  ,pva_ident   in varchar2)
    return varchar2
  is
  begin
    return obten_valr_contx (pva_contx
                            ,pva_ident);
  end obten_valr_contx_varch;

  function obten_valr_contx_numbr (pva_contx   in varchar2
                                  ,pva_ident   in varchar2)
    return number
  is
  begin
    return to_number (obten_valr_contx (pva_contx
                                       ,pva_ident));
  end obten_valr_contx_numbr;

  function obten_valr_contx_seqnc_sesn
    return number
  is
  begin
    return obten_valr_contx_numbr (kva_contx_sesn
                                  ,kva_contx_sesn_seqnc_sesn);
  end obten_valr_contx_seqnc_sesn;

  function obten_valr_contx_code_utils
    return varchar2
  is
  begin
    return obten_valr_contx_varch (kva_contx_sesn
                                  ,kva_contx_sesn_code_utils);
  end obten_valr_contx_code_utils;

  function obten_valr_contx_seqnc_utils
    return number
  is
  begin
    return obten_valr_contx_numbr (kva_contx_sesn
                                  ,kva_contx_sesn_seqnc_utils);
  end obten_valr_contx_seqnc_utils;

  function obten_valr_contx_code_prodt
    return varchar2
  is
  begin
    return obten_valr_contx_varch (kva_contx_sesn
                                  ,kva_contx_sesn_code_prodt);
  end obten_valr_contx_code_prodt;

  function obten_valr_contx_seqnc_prodt
    return number
  is
  begin
    return obten_valr_contx_numbr (kva_contx_sesn
                                  ,kva_contx_sesn_seqnc_prodt);
  end obten_valr_contx_seqnc_prodt;

  function obten_valr_contx_code_aplic
    return varchar2
  is
  begin
    return obten_valr_contx_varch (kva_contx_sesn
                                  ,kva_contx_sesn_code_aplic);
  end obten_valr_contx_code_aplic;

  function obten_valr_contx_seqnc_aplic
    return number
  is
  begin
    return obten_valr_contx_numbr (kva_contx_sesn
                                  ,kva_contx_sesn_seqnc_aplic);
  end obten_valr_contx_seqnc_aplic;

  function obten_valr_contx_code_lang
    return varchar2
  is
  begin
    return obten_valr_contx_varch (kva_contx_sesn
                                  ,kva_contx_sesn_code_lang);
  end obten_valr_contx_code_lang;

  function obten_valr_contx_seqnc_lang
    return number
  is
  begin
    return obten_valr_contx_numbr (kva_contx_sesn
                                  ,kva_contx_sesn_seqnc_lang);
  end obten_valr_contx_seqnc_lang;

  function obten_valr_contx_numr_aplic
    return number
  is
  begin
    return obten_valr_contx_numbr (kva_contx_sesn
                                  ,kva_contx_sesn_numr_aplic);
  end obten_valr_contx_numr_aplic;

  function obten_valr_contx_seqnc_page
    return number
  is
  begin
    return obten_valr_contx_numbr (kva_contx_sesn
                                  ,kva_contx_sesn_seqnc_page);
  end obten_valr_contx_seqnc_page;

  function obten_valr_contx_numr_page
    return number
  is
  begin
    return obten_valr_contx_numbr (kva_contx_sesn
                                  ,kva_contx_sesn_numr_page);
  end obten_valr_contx_numr_page;

  function obten_valr_contx_sidf
    return number
  is
  begin
    return obten_valr_contx_numbr (kva_contx_sesn
                                  ,kva_contx_sesn_sidf);
  end obten_valr_contx_sidf;

  procedure initl_contx
  is
    vva_code_prodt        vd_i_afw_11_prodt.code%type;
    vnu_seqnc_prodt       vd_i_afw_11_prodt.seqnc%type;
    vva_code_aplic        vd_i_afw_11_aplic.code%type;
    vnu_seqnc_aplic       vd_i_afw_11_aplic.seqnc%type;
    vnu_seqnc_page        vd_i_afw_13_page.seqnc%type;
    vnu_seqnc_utils       vd_i_afw_12_utils.seqnc%type;
    vva_code_lang         vd_i_afw_01_lang.code%type;
    vnu_seqnc_lang        vd_i_afw_01_lang.seqnc%type;

    vnu_numr_aplic_apex   vd_i_afw_11_aplic.numr_aplic_apex%type default afw_07_util_pkg.nv ('APP_ID');
    vnu_numr_page_apex    vd_i_afw_13_page.numr_apex%type default afw_07_util_pkg.nv ('APP_PAGE_ID');
    vva_code_utils        vd_i_afw_12_utils.code_utils%type default afw_07_util_pkg.v ('APP_USER');
    vnu_seqnc_sesn        vd_i_afw_12_sesn.id_sesn%type default afw_07_util_pkg.nv ('SESSION');
    vnu_sidf              vd_i_afw_04_fil_arian.seqnc%type default afw_07_util_pkg.nv ('SIDF');

    procedure defnr_valr_aplic
    is
    begin
      defnr_contx_sesn_numr_aplic (vnu_numr_aplic_apex);
      defnr_contx_sesn_seqnc_aplic (vnu_seqnc_aplic);
      defnr_contx_sesn_code_aplic (vva_code_aplic);
    end defnr_valr_aplic;

    procedure defnr_valr_page
    is
    begin
      defnr_contx_sesn_numr_page (vnu_numr_page_apex);
      defnr_contx_sesn_seqnc_page (vnu_seqnc_page);
    end defnr_valr_page;

    procedure defnr_valr_prodt
    is
    begin
      defnr_contx_sesn_seqnc_prodt (vnu_seqnc_prodt);
      defnr_contx_sesn_code_prodt (vva_code_prodt);
    end defnr_valr_prodt;

    procedure defnr_valr_lang
    is
    begin
      defnr_contx_sesn_seqnc_lang (vnu_seqnc_lang);
      defnr_contx_sesn_code_lang (vva_code_lang);
    end defnr_valr_lang;

    procedure defnr_valr_utils
    is
    begin
      defnr_contx_sesn_seqnc_utils (vnu_seqnc_utils);
      defnr_contx_sesn_code_utils (vva_code_utils);
    end defnr_valr_utils;

    procedure defnr_valr_domn
    is
    begin
      null; --Pourrait être un jour utile
    end defnr_valr_domn;

    procedure defnr_valr_sesn
    is
    begin
      defnr_contx_sesn_seqnc_sesn (vnu_seqnc_sesn);
    end defnr_valr_sesn;

    procedure defnr_valr_sidf
    is
    begin
      defnr_contx_sesn_sidf (vnu_sidf);
    end defnr_valr_sidf;
  begin
    begin
      select p.code
            ,p.seqnc
            ,a.code
            ,a.seqnc
            ,pa.seqnc
        into vva_code_prodt
            ,vnu_seqnc_prodt
            ,vva_code_aplic
            ,vnu_seqnc_aplic
            ,vnu_seqnc_page
        from vd_i_afw_11_aplic a
            ,vd_i_afw_11_prodt p
            ,vd_i_afw_13_page  pa
       where     a.ref_prodt = p.seqnc
             and a.numr_aplic_apex = vnu_numr_aplic_apex
             and a.seqnc = pa.ref_aplic
             and pa.numr_apex = vnu_numr_page_apex;
    exception
      when no_data_found
      then
        null;
    end;

    vva_code_lang    := upper (apex_util.get_preference ('FSP_LANGUAGE_PREFERENCE'));
    vnu_seqnc_lang   := afw_01_lang_pkg.obten_lang (vva_code_lang);

    begin
      select seqnc
        into vnu_seqnc_utils
        from vd_i_afw_12_utils u
       where u.code_utils = vva_code_utils;
    exception
      when no_data_found
      then
        --Nous sommes dans la page de login, donc pas de USER connecté
        null;
    end;

    defnr_valr_aplic;
    defnr_valr_prodt;
    defnr_valr_page;
    defnr_valr_lang;
    defnr_valr_utils;
    defnr_valr_domn;
    defnr_valr_sesn;
    defnr_valr_sidf;
  exception
    when others
    then
      ete ();
      ete ('ERREUR afw_07_polc_pkg.initl_contx');
      ete ('vva_code_utils'
          ,vva_code_utils);
      ete ('vva_code_lang'
          ,vva_code_lang);
      ete ('vnu_numr_aplic_apex'
          ,vnu_numr_aplic_apex);
      ete ('vnu_numr_page_apex'
          ,vnu_numr_page_apex);
  end initl_contx;
end afw_07_polc_pkg;
/
