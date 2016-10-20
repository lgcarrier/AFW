SET DEFINE OFF;
create or replace package body afw_01_lang_pkg
as
  --  kva_code_lang_deft   constant varchar2 (5) default 'FR-CA';

  function obten_lang (pva_code in varchar2)
    return number
  is
    vnu_lang   vd_i_afw_01_lang.seqnc%type;
  begin
    select seqnc
      into vnu_lang
      from vd_i_afw_01_lang l
     where l.code = upper (pva_code);

    return vnu_lang;
  exception
    when others
    then
      return null;
  end obten_lang;

  function obten_lang_sesn (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default afw_11_prodt_pkg.obten_prodt_sesn ())
    return number
  is
  begin
    --ete('apex_util.get_session_lang',apex_util.get_session_lang);
    return afw_07_polc_pkg.obten_valr_contx_seqnc_lang;
  --return nvl (obten_lang (apex_util.get_preference ('FSP_LANGUAGE_PREFERENCE')), afw_11_prodt_pkg.obten_lang_deft (pnu_prodt));
  --    return afw_11_prodt_pkg.obten_lang_deft (pnu_prodt);
  end obten_lang_sesn;

  function obten_code_lang_sesn (pnu_prodt in vd_i_afw_11_prodt.seqnc%type default afw_11_prodt_pkg.obten_prodt_sesn ())
    return varchar2
  is
    vva_code   vd_i_afw_01_lang.code%type;
  begin
    select code
      into vva_code
      from vd_i_afw_01_lang l
     where l.seqnc = obten_lang_sesn (pnu_prodt);

    return vva_code;
  end obten_code_lang_sesn;

  function obten_lang_formt (pnu_lang         in number
                            ,pnu_lang_cible   in number)
    return vd_i_afw_01_lang_lang.nom%type
  is
    vva_nom   vd_i_afw_01_lang_lang.nom%type;
  begin
    select sll.nom
      into vva_nom
      from vd_i_afw_01_lang_lang sll
     where     sll.ref_lang = pnu_lang
           and sll.ref_lang_cible = pnu_lang_cible;

    return vva_nom;
  end obten_lang_formt;

  function obten_lang_formt (pva_code_lang         in varchar2
                            ,pva_code_lang_cible   in varchar2)
    return vd_i_afw_01_lang_lang.nom%type
  is
    vva_nom   vd_i_afw_01_lang_lang.nom%type;
  begin
    select sll.nom
      into vva_nom
      from vd_i_afw_01_lang_lang sll
          ,vd_i_afw_01_lang      sl
          ,vd_i_afw_01_lang      sl2
     where     sll.ref_lang = sl.seqnc
           and sl.code = pva_code_lang
           and sll.ref_lang_cible = sl2.seqnc
           and sl2.code = pva_code_lang_cible;

    return vva_nom;
  end obten_lang_formt;

  function obten_code_lang (pnu_lang in number)
    return varchar2
  is
    vva_code   vd_i_afw_01_lang.code%type;
  begin
    select code
      into vva_code
      from vd_i_afw_01_lang l
     where l.seqnc = pnu_lang;

    return vva_code;
  end obten_code_lang;

  procedure defnr_lang_sesn
  is
  begin
    apex_util.set_preference (p_preference   => 'FSP_LANGUAGE_PREFERENCE'
                             ,p_value        => lower (afw_11_prodt_pkg.obten_code_lang_sesn ()));
  end defnr_lang_sesn;

  function obten_lang_furtr
    return varchar2
  is
    vva_lang   varchar2 (100);
  begin
    vva_lang   := owa_util.get_cgi_env ('HTTP_ACCEPT_LANGUAGE');

    if instr (vva_lang
             ,',') > 0
    then
      vva_lang      :=
        substr (vva_lang
               ,1
               ,  instr (vva_lang
                        ,',')
                - 1);
    end if;

    if instr (vva_lang
             ,';') > 0
    then
      vva_lang      :=
        substr (vva_lang
               ,1
               ,  instr (vva_lang
                        ,';')
                - 1);
    end if;

    return vva_lang;
  --return upper(aa.g_browser_language);
  end obten_lang_furtr;

  function obten_lang_aplic_deft
    return varchar2
  is
    vva_lang   varchar2 (10);
  begin
    select flow_language
      into vva_lang
      from apex_aplic
     where id = afw_07_util_pkg.nv ('APP_ID');

    return upper (vva_lang);
  end obten_lang_aplic_deft;
end afw_01_lang_pkg;
/
