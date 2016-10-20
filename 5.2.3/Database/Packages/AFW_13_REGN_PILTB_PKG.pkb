SET DEFINE OFF;
create or replace package body afw_13_regn_piltb_pkg
as
  function obten_contn_page_courn (pva_code                    in varchar2
                                  ,pva_code_lang               in varchar2 default null
                                  ,pva_indic_etend_page_zero   in varchar2 default 'N')
    return clob
  is
    vcl_contn   clob;
    vnu_aplic   number default afw_11_aplic_pkg.obten_aplic_sesn;
    vnu_page    number default afw_13_page_pkg.obten_page_sesn;
    vnu_lang    number (10) default case when pva_code_lang is null then afw_01_lang_pkg.obten_lang_sesn else afw_01_lang_pkg.obten_lang (pva_code_lang) end;
  begin
    dbms_lob.createtemporary (vcl_contn
                             ,true);

    select rpl.contn
      into vcl_contn
      from vd_i_afw_13_regn_piltb_lang rpl
          ,vd_i_afw_13_regn_piltb      rp
          ,vd_i_afw_13_page            p
     where     rpl.ref_lang = vnu_lang
           and rpl.ref_regn_piltb = rp.seqnc
           and rp.ref_page = p.seqnc
           and (   (    p.seqnc = vnu_page
                    and pva_indic_etend_page_zero = 'N')
                or (    (   p.seqnc = vnu_page
                         or p.seqnc = afw_13_page_pkg.obten_page_zero_sesn)
                    and pva_indic_etend_page_zero = 'O'))
           and rp.code = pva_code
           and p.ref_aplic = vnu_aplic;

    -- TODO: CARLO il semble y avoir un bug dans cette procédure
    --afw_15_htp_pkg.efect_subst (vcl_contn);

    return vcl_contn;
  exception
    when no_data_found
    then
      return null;
  end obten_contn_page_courn;

  procedure afich_contn_page_courn (pva_code                    in varchar2
                                   ,pva_code_lang               in varchar2 default null
                                   ,pva_indic_etend_page_zero   in varchar2 default 'N')
  is
    vcl_contn   clob;
  begin
    dbms_lob.createtemporary (vcl_contn
                             ,true);

    vcl_contn      :=
      obten_contn_page_courn (pva_code
                             ,pva_code_lang
                             ,pva_indic_etend_page_zero);

    afw_15_htp_pkg.ecrir_clob (vcl_contn);
  end afich_contn_page_courn;

  function obten_contn_aide_page (pnu_page   in number
                                 ,pnu_lang   in number)
    return clob
  is
    vcl_contn   clob;
  begin
    dbms_lob.createtemporary (vcl_contn
                             ,true);

    select rpl.contn
      into vcl_contn
      from vd_i_afw_13_regn_piltb      rp
          ,vd_i_afw_13_regn_piltb_lang rpl
     where     rp.ref_page = pnu_page
           and rpl.ref_regn_piltb = rp.seqnc
           and rp.ref_dv_type_regn_piltb = afw_14_domn_valr_pkg.obten_seqnc ('TYPE_REGN_PILTB'
                                                                            ,'AIDE_PAGE'
                                                                            ,'SAFP')
           and rpl.ref_lang = pnu_lang;

    --afw_15_htp_pkg.efect_subst (vcl_contn);

    return vcl_contn;
  exception
    when no_data_found
    then
      dbms_lob.freetemporary (vcl_contn);
      -- TODO: Définir ce message dans SAFP
      return 'Aucune aide n''est définie pour cette page.';
  end obten_contn_aide_page;

  procedure afich_contn_aide_page (pnu_page   in number
                                  ,pnu_lang   in number)
  is
    vcl_contn   clob;
  begin
    dbms_lob.createtemporary (vcl_contn
                             ,true);

    vcl_contn      :=
      obten_contn_aide_page (pnu_page
                            ,pnu_lang);

    afw_15_htp_pkg.ecrir_clob (vcl_contn);
  end afich_contn_aide_page;
end afw_13_regn_piltb_pkg;
/
