SET DEFINE OFF;
create or replace package body afw_19_fonct_pkg
as
  knu_sidf          number (10) default afw_07_util_pkg.nv ('SIDF');
  knu_app_id        number default afw_07_util_pkg.nv ('APP_ID');
  knu_app_page_id   number default afw_07_util_pkg.nv ('APP_PAGE_ID');
  knu_session       number default afw_07_util_pkg.nv ('SESSION');

  function obten_nom_lang (pnu_fonct   in number
                          ,pnu_lang    in number default null)
    return varchar2
  is
    vva_nom   vd_afw_19_fonct_lang.nom%type;
  begin
    select nom
      into vva_nom
      from vd_afw_19_fonct_lang fl
     where     fl.ref_fonct = pnu_fonct
           and ref_lang = nvl (pnu_lang, afw_01_lang_pkg.obten_lang_sesn ());

    return vva_nom;
  exception
    when no_data_found
    then
      return null;
  end obten_nom_lang;

  function obten_descr_lang (pnu_fonct   in number
                            ,pnu_lang    in number default null)
    return varchar2
  is
    vva_descr   vd_afw_19_fonct_lang.descr%type;
  begin
    select descr
      into vva_descr
      from vd_afw_19_fonct_lang fl
     where     fl.ref_fonct = pnu_fonct
           and ref_lang = nvl (pnu_lang, afw_01_lang_pkg.obten_lang_sesn ());

    return vva_descr;
  exception
    when no_data_found
    then
      return null;
  end obten_descr_lang;

  function obten_afich_atrib (pnu_dispn_fonct   in number
                             ,pva_atrib         in varchar2)
    return boolean
  is
    vbo_afich         boolean := false;
    vva_titre_atrib   vd_afw_19_fonct.titre_atrib1%type;
  begin
    case pva_atrib
      when 'VALR_ATRIB_1'
      then
        select f.titre_atrib1
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      when 'VALR_ATRIB_2'
      then
        select f.titre_atrib2
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      when 'VALR_ATRIB_3'
      then
        select f.titre_atrib3
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      when 'VALR_ATRIB_4'
      then
        select f.titre_atrib4
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      when 'VALR_ATRIB_5'
      then
        select f.titre_atrib5
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      else
        vva_titre_atrib   := null;
    end case;

    if vva_titre_atrib is not null
    then
      vbo_afich   := true;
    end if;

    return vbo_afich;
  exception
    when others
    then
      return false;
  end obten_afich_atrib;

  function obten_titre_atrib (pnu_dispn_fonct   in number
                             ,pnu_item_id       in number)
    return varchar2
  is
    vva_item_source   apex_item_page.source%type;
    vva_titre_atrib   vd_afw_19_fonct.titre_atrib1%type;
  begin
    select source
      into vva_item_source
      from apex_item_page aip
     where aip.id = pnu_item_id;

    case vva_item_source
      when 'VALR_ATRIB_1'
      then
        select f.titre_atrib1
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      when 'VALR_ATRIB_2'
      then
        select f.titre_atrib2
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      when 'VALR_ATRIB_3'
      then
        select f.titre_atrib3
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      when 'VALR_ATRIB_4'
      then
        select f.titre_atrib4
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      when 'VALR_ATRIB_5'
      then
        select f.titre_atrib5
          into vva_titre_atrib
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct       f
         where     df.seqnc = pnu_dispn_fonct
               and df.ref_fonct = f.seqnc;
      else
        vva_titre_atrib   := null;
    end case;

    return vva_titre_atrib;
  exception
    when others
    then
      return null;
  end obten_titre_atrib;

  function obten_url_impre
    return varchar2
  is
  begin
    return 'http://';
  end obten_url_impre;

  function obten_url_enreg_precd
    return varchar2
  is
  begin
    return afw_13_navgt_pkg.obten_url_precd;
  end obten_url_enreg_precd;

  function obten_url_enreg_suivn
    return varchar2
  is
  begin
    return afw_13_navgt_pkg.obten_url_suivn;
  end obten_url_enreg_suivn;

  function obten_url_premr_enreg
    return varchar2
  is
  begin
    return afw_13_navgt_pkg.obten_url_premr;
  end obten_url_premr_enreg;

  function obten_url_dernr_enreg
    return varchar2
  is
  begin
    return afw_13_navgt_pkg.obten_url_dernr (1);
  end obten_url_dernr_enreg;

  procedure obten_aide_cle_fonct (pnu_sidf   in number
                                 ,pnu_lang   in number)
  is
    cursor cur_cle_fonct
    is
        select afw_19_cle_pkg.obten_cle_formt (c.seqnc) cle_formt
              ,afw_19_fonct_pkg.obten_nom_lang (df.ref_fonct
                                               ,pnu_lang)
                 nom_formt
              ,afw_19_fonct_pkg.obten_descr_lang (df.ref_fonct
                                                 ,pnu_lang)
                 descr_formt
          from vd_afw_19_dispn_fonct df
              ,vd_afw_19_fonct     f
              ,vd_afw_19_cle       c
              ,vd_i_afw_04_fil_arian fa
              ,vd_afw_11_prodt     p
              ,vd_afw_11_aplic     ap
         where     fa.seqnc = pnu_sidf
               and ap.numr_aplic_apex = fa.app_id
               and ap.ref_prodt = p.seqnc
               and df.ref_prodt = p.seqnc
               and c.ref_dispn_fonct = df.seqnc
               and c.ref_lang = pnu_lang
               and f.seqnc = df.ref_fonct
               and not exists
                     (select null
                        from vd_afw_04_contx_etend ce
                       where     ce.ref_contx = fa.seqnc
                             and ce.nom = f.code
                             and ce.valr_varch = 'desct')
               and c.indic_inter = afw_19_javsc_pkg.obten_furtr_indic_inter
               and c.indic_actif = 'O'
      order by 2;

    vva_texte   varchar2 (4000);
  begin
    htp.p ('<h1>Aide clés de fonctions</h1>');
    htp.p ('<div id="aide_cle_fonct">');
    htp.p ('  <table class="aide_cle_fonct">');
    htp.p ('    <tr>');
    htp.p ('      <th>Clé</th>');
    htp.p ('      <th>Fonction</th>');
    htp.p ('      <th>Description</th>');
    htp.p ('    </tr>');

    for rec_cle_fonct in cur_cle_fonct
    loop
      htp.p ('    <tr>');
      htp.p (   '      <td>'
             || rec_cle_fonct.cle_formt
             || '</td>');
      htp.p (   '      <td>'
             || rec_cle_fonct.nom_formt
             || '</td>');
      htp.p (   '      <td>'
             || rec_cle_fonct.descr_formt
             || '</td>');
      htp.p ('    </tr>');
    end loop;

    htp.p ('  </table>');
    htp.p ('</div>');
  end obten_aide_cle_fonct;

  function obten_fonct (pva_code in varchar2)
    return number
  is
    vnu_seqnc   number (10);
  begin
    select seqnc
      into vnu_seqnc
      from vd_i_afw_19_fonct f
     where f.code = upper (pva_code);

    return vnu_seqnc;
  exception
    when others
    then
      return null;
  end obten_fonct;

  procedure desct_fonct (pva_code in varchar2)
  is
  begin
    afw_04_contx_pkg.defnr_contx_etend_varch (pva_code
                                             ,'desct'
                                             ,pbo_page_cible   => false);
  end;

  procedure obten_avert_fonct_non_dispn (pnu_sidf   in number
                                        ,pnu_lang   in number)
  is
  begin
    htp.p ('<h1>Cette fonction n''est pas active sur cette page.</h1>');
  end;
end afw_19_fonct_pkg;
/
