SET DEFINE OFF;
create or replace package body afw_15_htp_pkg
as
  gar_tampn                           owa.vc_arr;
  gbo_ecrit_difr                      boolean default false;
  kva_nom_temn_trait_servr   constant varchar2 (50) default 'TRAIT_SERVR';

  type typ_subst is record
  (
    champ_subtr     varchar2 (30)
   ,valr_de_subst   varchar2 (100)
  );

  type typ_subst_carct is record
  (
    champ_subtr     varchar2 (2)
   ,valr_de_subst   varchar2 (10)
  );

  type typ_tab_subst is table of typ_subst
    index by pls_integer;

  type typ_tab_subst_carct is table of typ_subst_carct
    index by pls_integer;

  gta_subst                           typ_tab_subst;
  gta_subst_carct                     typ_tab_subst_carct;

  procedure efect_subst (pcl_clob in out nocopy clob)
  is
  begin
    for i in gta_subst.first () .. gta_subst.last ()
    loop
      /*Déterminer si au moins une occurence*/
      afw_07_clob_pkg.replc (pcl_clob
                            ,gta_subst (i).champ_subtr
                            ,gta_subst (i).valr_de_subst);
    end loop;
  end efect_subst;

  procedure ecrit_difr (pbo_ecrit_difr in boolean default true)
  is
  begin
    gbo_ecrit_difr   := pbo_ecrit_difr;
  end ecrit_difr;

  procedure vider
  is
  begin
    gar_tampn.delete ();
  end vider;

  function echap_atrib (pva_texte in varchar2)
    return varchar2
  is
    vva_echap   varchar2 (32000) default pva_texte;
  begin
    vva_echap      :=
      replace (vva_echap
              ,'&'
              ,'&amp;');
    vva_echap      :=
      replace (vva_echap
              ,'"'
              ,'&quot;');
    vva_echap      :=
      replace (vva_echap
              ,   chr (13)
               || chr (10)
              ,' ');
    vva_echap      :=
      replace (vva_echap
              ,chr (13)
              ,' ');
    vva_echap      :=
      replace (vva_echap
              ,chr (10)
              ,' ');
    return vva_echap;
  end echap_atrib;

  function echap_url (pva_texte in varchar2)
    return varchar2
  is
    vva_echap   varchar2 (32000) default pva_texte;
  begin
    -- Débuter par le %, sinon problème
    vva_echap      :=
      replace (vva_echap
              ,'%'
              ,'%25');
    -- Caractères réservés
    vva_echap      :=
      replace (vva_echap
              ,'$'
              ,'%24');
    vva_echap      :=
      replace (vva_echap
              ,'&'
              ,'%26');
    vva_echap      :=
      replace (vva_echap
              ,'+'
              ,'%2B');
    vva_echap      :=
      replace (vva_echap
              ,','
              ,'%2C');
    vva_echap      :=
      replace (vva_echap
              ,'/'
              ,'%2F');
    vva_echap      :=
      replace (vva_echap
              ,':'
              ,'%3A');
    vva_echap      :=
      replace (vva_echap
              ,';'
              ,'%3B');
    vva_echap      :=
      replace (vva_echap
              ,'='
              ,'%3D');
    vva_echap      :=
      replace (vva_echap
              ,'?'
              ,'%3F');
    vva_echap      :=
      replace (vva_echap
              ,'@'
              ,'%40');
    -- Autres caractères
    vva_echap      :=
      replace (vva_echap
              ,' '
              ,'%20');
    vva_echap      :=
      replace (vva_echap
              ,'"'
              ,'%22');
    vva_echap      :=
      replace (vva_echap
              ,'<'
              ,'%3C');
    vva_echap      :=
      replace (vva_echap
              ,'>'
              ,'%3E');
    vva_echap      :=
      replace (vva_echap
              ,'#'
              ,'%23');
    vva_echap      :=
      replace (vva_echap
              ,'{'
              ,'%7B');
    vva_echap      :=
      replace (vva_echap
              ,'}'
              ,'%7D');
    vva_echap      :=
      replace (vva_echap
              ,'|'
              ,'%7C');
    vva_echap      :=
      replace (vva_echap
              ,'\'
              ,'%5C');
    vva_echap      :=
      replace (vva_echap
              ,'^'
              ,'%5E');
    vva_echap      :=
      replace (vva_echap
              ,'~'
              ,'%7E');
    vva_echap      :=
      replace (vva_echap
              ,'['
              ,'%5B');
    vva_echap      :=
      replace (vva_echap
              ,']'
              ,'%5D');
    vva_echap      :=
      replace (vva_echap
              ,'`'
              ,'%60');
    return vva_echap;
  end echap_url;

  function echap_url_inver (pva_texte in varchar2)
    return varchar2
  is
    vva_echap   varchar2 (32000) default pva_texte;
  begin
    -- Caractères réservés
    vva_echap      :=
      replace (vva_echap
              ,'%24'
              ,'$');
    vva_echap      :=
      replace (vva_echap
              ,'%26'
              ,'&');
    vva_echap      :=
      replace (vva_echap
              ,'%2B'
              ,'+');
    vva_echap      :=
      replace (vva_echap
              ,'%2C'
              ,',');
    vva_echap      :=
      replace (vva_echap
              ,'%2F'
              ,'/');
    vva_echap      :=
      replace (vva_echap
              ,'%3A'
              ,':');
    vva_echap      :=
      replace (vva_echap
              ,'%3B'
              ,';');
    vva_echap      :=
      replace (vva_echap
              ,'%3D'
              ,'=');
    vva_echap      :=
      replace (vva_echap
              ,'%3F'
              ,'?');
    vva_echap      :=
      replace (vva_echap
              ,'%40'
              ,'@');
    -- Autres caractères
    vva_echap      :=
      replace (vva_echap
              ,'%20'
              ,' ');
    vva_echap      :=
      replace (vva_echap
              ,'%22'
              ,'"');
    vva_echap      :=
      replace (vva_echap
              ,'%3C'
              ,'<');
    vva_echap      :=
      replace (vva_echap
              ,'%3E'
              ,'>');
    vva_echap      :=
      replace (vva_echap
              ,'%23'
              ,'#');
    vva_echap      :=
      replace (vva_echap
              ,'%7B'
              ,'{');
    vva_echap      :=
      replace (vva_echap
              ,'%7D'
              ,'}');
    vva_echap      :=
      replace (vva_echap
              ,'%7C'
              ,'|');
    vva_echap      :=
      replace (vva_echap
              ,'%5C'
              ,'\');
    vva_echap      :=
      replace (vva_echap
              ,'%5E'
              ,'^');
    vva_echap      :=
      replace (vva_echap
              ,'%7E'
              ,'~');
    vva_echap      :=
      replace (vva_echap
              ,'%5B'
              ,'[');
    vva_echap      :=
      replace (vva_echap
              ,'%5D'
              ,']');
    vva_echap      :=
      replace (vva_echap
              ,'%60'
              ,'`');
    -- Terminer par le %, sinon problème
    vva_echap      :=
      replace (vva_echap
              ,'%25'
              ,'%');

    return vva_echap;
  end echap_url_inver;

  function echap_apex (pva_texte in varchar2)
    return varchar2
  is
  begin
    return apex_escape.html (pva_texte);
  end echap_apex;

  function echap (pva_texte           in varchar2
                 ,pva_rempl_retr_br   in varchar2 default 'N')
    return varchar2
  is
    pva_echap   varchar2 (32000);
  begin
    pva_echap      :=
      replace (pva_texte
              ,'&'
              ,'&amp;');
    pva_echap      :=
      replace (pva_echap
              ,'<'
              ,'&lt;');
    pva_echap      :=
      replace (pva_echap
              ,'>'
              ,'&gt;');

    if pva_rempl_retr_br = 'O'
    then
      pva_echap      :=
        replace (pva_echap
                ,   chr (13)
                 || chr (10)
                ,chr (10));
      pva_echap      :=
        replace (pva_echap
                ,chr (13)
                ,chr (10));
      pva_echap      :=
        replace (pva_echap
                ,chr (10)
                ,   '<br/>'
                 || chr (10));
    end if;

    return pva_echap;
  end echap;

  procedure echap (pva_texte in varchar2 /*,
          pva_rempl_retr_br   in varchar2 default 'N'*/
                                        )
  is
  begin
    ecrir (echap (pva_texte /*, pva_rempl_retr_br*/
                           ));
  end echap;

  procedure echap /*(
    pva_rempl_retr_br   in varchar2 default 'N')*/
  is
  begin
    for i in gar_tampn.first () .. gar_tampn.last ()
    loop
      gar_tampn (i)   := echap (gar_tampn (i) /*, pva_rempl_retr_br*/
                                             );
    end loop;
  end echap;

  procedure ecrir (pva_ligne   in varchar2
                  ,pbo_retr    in boolean default true)
  is
    vva_tampn   varchar2 (32000);
  begin
    vva_tampn   := pva_ligne;

    if pbo_retr
    then
      vva_tampn      :=
           vva_tampn
        || chr (10);
    end if;

    if gbo_ecrit_difr
    then
      gar_tampn (gar_tampn.count + 1)   := vva_tampn;
    else
      htp.prn (vva_tampn);
    end if;
  end ecrir;

  procedure ecrir
  is
  begin
    for i in gar_tampn.first () .. gar_tampn.last ()
    loop
      htp.prn (gar_tampn (i));
    end loop;

    vider ();
  end ecrir;

  function obten (pbo_vider in boolean default true)
    return varchar2
  is
    vbi_index   binary_integer;
    vva_conct   varchar2 (32000) default null;
  begin
    vbi_index   := gar_tampn.first ();

    while vbi_index is not null
    loop
      if length (vva_conct) + length (gar_tampn (vbi_index)) > 32000
      then
        vva_conct      :=
             vva_conct
          || substr (gar_tampn (vbi_index)
                    ,1
                    ,32000 - length (vva_conct));
      else
        vva_conct      :=
             vva_conct
          || gar_tampn (vbi_index);
      end if;

      vbi_index   := gar_tampn.next (vbi_index);
    end loop;

    if pbo_vider
    then
      vider ();
    end if;

    return vva_conct;
  end obten;

  function obten_clob (pbo_vider in boolean default true)
    return clob
  is
    vcl_conct   clob;
    vbi_index   binary_integer;
    vva_conct   varchar2 (32000) default null;
  begin
    vbi_index   := gar_tampn.first ();

    while vbi_index is not null
    loop
      if length (vva_conct) + length (gar_tampn (vbi_index)) > 32000
      then
        vcl_conct      :=
             vcl_conct
          || to_clob (vva_conct)
          || to_clob (gar_tampn (vbi_index));

        vva_conct   := null;
      else
        vva_conct      :=
             vva_conct
          || gar_tampn (vbi_index);
      end if;

      vbi_index   := gar_tampn.next (vbi_index);
    end loop;

    --Concatenate last piece of string
    vcl_conct      :=
         vcl_conct
      || to_clob (vva_conct);

    if pbo_vider
    then
      vider ();
    end if;

    return vcl_conct;
  end obten_clob;

  function obten_arr (pbo_vider in boolean default true)
    return owa.vc_arr
  is
    vbi_index   binary_integer;
    var_retr    owa.vc_arr;
  begin
    vbi_index   := gar_tampn.first ();

    while vbi_index is not null
    loop
      var_retr (vbi_index)   := gar_tampn (vbi_index);
      vbi_index              := gar_tampn.next (vbi_index);
    end loop;

    if pbo_vider
    then
      vider ();
    end if;

    return var_retr;
  end obten_arr;

  function ouvri_bals (pva_nom        in varchar2
                      ,pva_parmt_1    in varchar2 default null
                      ,pva_valr_1     in varchar2 default null
                      ,pva_parmt_2    in varchar2 default null
                      ,pva_valr_2     in varchar2 default null
                      ,pva_parmt_3    in varchar2 default null
                      ,pva_valr_3     in varchar2 default null
                      ,pva_parmt_4    in varchar2 default null
                      ,pva_valr_4     in varchar2 default null
                      ,pva_parmt_5    in varchar2 default null
                      ,pva_valr_5     in varchar2 default null
                      ,pva_parmt_6    in varchar2 default null
                      ,pva_valr_6     in varchar2 default null
                      ,pva_parmt_7    in varchar2 default null
                      ,pva_valr_7     in varchar2 default null
                      ,pva_parmt_8    in varchar2 default null
                      ,pva_valr_8     in varchar2 default null
                      ,pva_parmt_9    in varchar2 default null
                      ,pva_valr_9     in varchar2 default null
                      ,pva_parmt_10   in varchar2 default null
                      ,pva_valr_10    in varchar2 default null
                      ,pva_parmt_11   in varchar2 default null
                      ,pva_valr_11    in varchar2 default null
                      ,pva_parmt_12   in varchar2 default null
                      ,pva_valr_12    in varchar2 default null
                      ,pva_parmt_13   in varchar2 default null
                      ,pva_valr_13    in varchar2 default null
                      ,pva_parmt_14   in varchar2 default null
                      ,pva_valr_14    in varchar2 default null
                      ,pva_parmt_15   in varchar2 default null
                      ,pva_valr_15    in varchar2 default null
                      ,pva_parmt_16   in varchar2 default null
                      ,pva_valr_16    in varchar2 default null
                      ,pva_parmt_17   in varchar2 default null
                      ,pva_valr_17    in varchar2 default null
                      ,pva_parmt_18   in varchar2 default null
                      ,pva_valr_18    in varchar2 default null
                      ,pva_parmt_19   in varchar2 default null
                      ,pva_valr_19    in varchar2 default null
                      ,pva_parmt_20   in varchar2 default null
                      ,pva_valr_20    in varchar2 default null
                      ,pva_extra      in varchar2 default null)
    return varchar2
  is
    vva_nom          varchar2 (30);
    vbo_fermr_bals   boolean;
    vva_bals         varchar2 (32000);
  begin
    vbo_fermr_bals   := (pva_nom like '%/');

    if vbo_fermr_bals
    then
      vva_nom      :=
        substr (pva_nom
               ,1
               ,length (pva_nom) - 1);
    else
      vva_nom   := pva_nom;
    end if;

    vva_bals         :=
         '<'
      || vva_nom;

    if pva_parmt_1 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_1
        || '="'
        || echap_atrib (pva_valr_1)
        || '"';
    end if;

    if pva_parmt_2 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_2
        || '="'
        || echap_atrib (pva_valr_2)
        || '"';
    end if;

    if pva_parmt_3 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_3
        || '="'
        || echap_atrib (pva_valr_3)
        || '"';
    end if;

    if pva_parmt_4 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_4
        || '="'
        || echap_atrib (pva_valr_4)
        || '"';
    end if;

    if pva_parmt_5 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_5
        || '="'
        || echap_atrib (pva_valr_5)
        || '"';
    end if;

    if pva_parmt_6 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_6
        || '="'
        || echap_atrib (pva_valr_6)
        || '"';
    end if;

    if pva_parmt_7 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_7
        || '="'
        || echap_atrib (pva_valr_7)
        || '"';
    end if;

    if pva_parmt_8 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_8
        || '="'
        || echap_atrib (pva_valr_8)
        || '"';
    end if;

    if pva_parmt_9 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_9
        || '="'
        || echap_atrib (pva_valr_9)
        || '"';
    end if;

    if pva_parmt_10 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_10
        || '="'
        || echap_atrib (pva_valr_10)
        || '"';
    end if;

    if pva_parmt_11 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_11
        || '="'
        || echap_atrib (pva_valr_11)
        || '"';
    end if;

    if pva_parmt_12 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_12
        || '="'
        || echap_atrib (pva_valr_12)
        || '"';
    end if;

    if pva_parmt_13 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_13
        || '="'
        || echap_atrib (pva_valr_13)
        || '"';
    end if;

    if pva_parmt_14 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_14
        || '="'
        || echap_atrib (pva_valr_14)
        || '"';
    end if;

    if pva_parmt_15 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_15
        || '="'
        || echap_atrib (pva_valr_15)
        || '"';
    end if;

    if pva_parmt_16 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_16
        || '="'
        || echap_atrib (pva_valr_16)
        || '"';
    end if;

    if pva_parmt_17 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_17
        || '="'
        || echap_atrib (pva_valr_17)
        || '"';
    end if;

    if pva_parmt_18 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_18
        || '="'
        || echap_atrib (pva_valr_18)
        || '"';
    end if;

    if pva_parmt_19 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_19
        || '="'
        || echap_atrib (pva_valr_19)
        || '"';
    end if;

    if pva_parmt_20 is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_parmt_20
        || '="'
        || echap_atrib (pva_valr_20)
        || '"';
    end if;

    if pva_extra is not null
    then
      vva_bals      :=
           vva_bals
        || ' '
        || pva_extra;
    end if;

    if vbo_fermr_bals
    then
      vva_bals      :=
           vva_bals
        || ' /';
    end if;

    vva_bals         :=
         vva_bals
      || '>';
    return vva_bals;
  end ouvri_bals;

  procedure ouvri_bals (pva_nom        in varchar2
                       ,pva_parmt_1    in varchar2 default null
                       ,pva_valr_1     in varchar2 default null
                       ,pva_parmt_2    in varchar2 default null
                       ,pva_valr_2     in varchar2 default null
                       ,pva_parmt_3    in varchar2 default null
                       ,pva_valr_3     in varchar2 default null
                       ,pva_parmt_4    in varchar2 default null
                       ,pva_valr_4     in varchar2 default null
                       ,pva_parmt_5    in varchar2 default null
                       ,pva_valr_5     in varchar2 default null
                       ,pva_parmt_6    in varchar2 default null
                       ,pva_valr_6     in varchar2 default null
                       ,pva_parmt_7    in varchar2 default null
                       ,pva_valr_7     in varchar2 default null
                       ,pva_parmt_8    in varchar2 default null
                       ,pva_valr_8     in varchar2 default null
                       ,pva_parmt_9    in varchar2 default null
                       ,pva_valr_9     in varchar2 default null
                       ,pva_parmt_10   in varchar2 default null
                       ,pva_valr_10    in varchar2 default null
                       ,pva_parmt_11   in varchar2 default null
                       ,pva_valr_11    in varchar2 default null
                       ,pva_parmt_12   in varchar2 default null
                       ,pva_valr_12    in varchar2 default null
                       ,pva_parmt_13   in varchar2 default null
                       ,pva_valr_13    in varchar2 default null
                       ,pva_parmt_14   in varchar2 default null
                       ,pva_valr_14    in varchar2 default null
                       ,pva_parmt_15   in varchar2 default null
                       ,pva_valr_15    in varchar2 default null
                       ,pva_parmt_16   in varchar2 default null
                       ,pva_valr_16    in varchar2 default null
                       ,pva_parmt_17   in varchar2 default null
                       ,pva_valr_17    in varchar2 default null
                       ,pva_parmt_18   in varchar2 default null
                       ,pva_valr_18    in varchar2 default null
                       ,pva_parmt_19   in varchar2 default null
                       ,pva_valr_19    in varchar2 default null
                       ,pva_parmt_20   in varchar2 default null
                       ,pva_valr_20    in varchar2 default null
                       ,pva_extra      in varchar2 default null)
  is
  begin
    ecrir (ouvri_bals (pva_nom
                      ,pva_parmt_1
                      ,pva_valr_1
                      ,pva_parmt_2
                      ,pva_valr_2
                      ,pva_parmt_3
                      ,pva_valr_3
                      ,pva_parmt_4
                      ,pva_valr_4
                      ,pva_parmt_5
                      ,pva_valr_5
                      ,pva_parmt_6
                      ,pva_valr_6
                      ,pva_parmt_7
                      ,pva_valr_7
                      ,pva_parmt_8
                      ,pva_valr_8
                      ,pva_parmt_9
                      ,pva_valr_9
                      ,pva_parmt_10
                      ,pva_valr_10
                      ,pva_parmt_11
                      ,pva_valr_11
                      ,pva_parmt_12
                      ,pva_valr_12
                      ,pva_parmt_13
                      ,pva_valr_13
                      ,pva_parmt_14
                      ,pva_valr_14
                      ,pva_parmt_15
                      ,pva_valr_15
                      ,pva_parmt_16
                      ,pva_valr_16
                      ,pva_parmt_17
                      ,pva_valr_17
                      ,pva_parmt_18
                      ,pva_valr_18
                      ,pva_parmt_19
                      ,pva_valr_19
                      ,pva_parmt_20
                      ,pva_valr_20
                      ,pva_extra)
          ,true);
  end ouvri_bals;

  function fermr_bals (pva_nom in varchar2)
    return varchar2
  is
  begin
    return    '</'
           || pva_nom
           || '>';
  end fermr_bals;

  procedure fermr_bals (pva_nom in varchar2)
  is
  begin
    ecrir (fermr_bals (pva_nom)
          ,true);
  end fermr_bals;

  function style (pva_parmt_1    in varchar2 default null
                 ,pva_valr_1     in varchar2 default null
                 ,pva_parmt_2    in varchar2 default null
                 ,pva_valr_2     in varchar2 default null
                 ,pva_parmt_3    in varchar2 default null
                 ,pva_valr_3     in varchar2 default null
                 ,pva_parmt_4    in varchar2 default null
                 ,pva_valr_4     in varchar2 default null
                 ,pva_parmt_5    in varchar2 default null
                 ,pva_valr_5     in varchar2 default null
                 ,pva_parmt_6    in varchar2 default null
                 ,pva_valr_6     in varchar2 default null
                 ,pva_parmt_7    in varchar2 default null
                 ,pva_valr_7     in varchar2 default null
                 ,pva_parmt_8    in varchar2 default null
                 ,pva_valr_8     in varchar2 default null
                 ,pva_parmt_9    in varchar2 default null
                 ,pva_valr_9     in varchar2 default null
                 ,pva_parmt_10   in varchar2 default null
                 ,pva_valr_10    in varchar2 default null
                 ,pva_extra      in varchar2 default null)
    return varchar2
  is
    vva_style   varchar2 (32000);
  begin
    vva_style   := null;

    if pva_parmt_1 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_1
        || ':'
        || pva_valr_1
        || ';';
    end if;

    if pva_parmt_2 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_2
        || ':'
        || pva_valr_2
        || ';';
    end if;

    if pva_parmt_3 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_3
        || ':'
        || pva_valr_3
        || ';';
    end if;

    if pva_parmt_4 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_4
        || ':'
        || pva_valr_4
        || ';';
    end if;

    if pva_parmt_5 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_5
        || ':'
        || pva_valr_5
        || ';';
    end if;

    if pva_parmt_6 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_6
        || ':'
        || pva_valr_6
        || ';';
    end if;

    if pva_parmt_7 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_7
        || ':'
        || pva_valr_7
        || ';';
    end if;

    if pva_parmt_8 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_8
        || ':'
        || pva_valr_8
        || ';';
    end if;

    if pva_parmt_9 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_9
        || ':'
        || pva_valr_9
        || ';';
    end if;

    if pva_parmt_10 is not null
    then
      vva_style      :=
           vva_style
        || pva_parmt_10
        || ':'
        || pva_valr_10
        || ';';
    end if;

    if pva_extra is not null
    then
      if     vva_style is not null
         and pva_extra not like ';%'
      then
        vva_style      :=
             vva_style
          || ';';
      end if;

      vva_style      :=
           vva_style
        || pva_extra;
    end if;

    return vva_style;
  end style;

  function bals_anchor (pva_url       in varchar2
                       ,pva_text      in varchar2
                       ,pva_parmt_1   in varchar2 default null
                       ,pva_valr_1    in varchar2 default null
                       ,pva_parmt_2   in varchar2 default null
                       ,pva_valr_2    in varchar2 default null
                       ,pva_parmt_3   in varchar2 default null
                       ,pva_valr_3    in varchar2 default null
                       ,pva_parmt_4   in varchar2 default null
                       ,pva_valr_4    in varchar2 default null
                       ,pva_parmt_5   in varchar2 default null
                       ,pva_valr_5    in varchar2 default null
                       ,pva_parmt_6   in varchar2 default null
                       ,pva_valr_6    in varchar2 default null
                       ,pva_parmt_7   in varchar2 default null
                       ,pva_valr_7    in varchar2 default null
                       ,pva_parmt_8   in varchar2 default null
                       ,pva_valr_8    in varchar2 default null
                       ,pva_parmt_9   in varchar2 default null
                       ,pva_valr_9    in varchar2 default null
                       ,pva_extra     in varchar2 default null)
    return varchar2
  is
  begin
    return    ouvri_bals ('a'
                         ,'href'
                         ,pva_url
                         ,pva_parmt_1
                         ,pva_valr_1
                         ,pva_parmt_2
                         ,pva_valr_2
                         ,pva_parmt_3
                         ,pva_valr_3
                         ,pva_parmt_4
                         ,pva_valr_4
                         ,pva_parmt_5
                         ,pva_valr_5
                         ,pva_parmt_6
                         ,pva_valr_6
                         ,pva_parmt_7
                         ,pva_valr_7
                         ,pva_parmt_8
                         ,pva_valr_8
                         ,pva_parmt_9
                         ,pva_valr_9
                         ,pva_extra)
           || pva_text
           || fermr_bals ('a');
  end bals_anchor;

  function bals_image (pva_url       in varchar2
                      ,pva_parmt_1   in varchar2 default null
                      ,pva_valr_1    in varchar2 default null
                      ,pva_parmt_2   in varchar2 default null
                      ,pva_valr_2    in varchar2 default null
                      ,pva_parmt_3   in varchar2 default null
                      ,pva_valr_3    in varchar2 default null
                      ,pva_parmt_4   in varchar2 default null
                      ,pva_valr_4    in varchar2 default null
                      ,pva_parmt_5   in varchar2 default null
                      ,pva_valr_5    in varchar2 default null
                      ,pva_parmt_6   in varchar2 default null
                      ,pva_valr_6    in varchar2 default null
                      ,pva_parmt_7   in varchar2 default null
                      ,pva_valr_7    in varchar2 default null
                      ,pva_parmt_8   in varchar2 default null
                      ,pva_valr_8    in varchar2 default null
                      ,pva_parmt_9   in varchar2 default null
                      ,pva_valr_9    in varchar2 default null
                      ,pva_extra     in varchar2 default null)
    return varchar2
  is
  begin
    return ouvri_bals ('img/'
                      ,'src'
                      ,pva_url
                      ,pva_parmt_1
                      ,pva_valr_1
                      ,pva_parmt_2
                      ,pva_valr_2
                      ,pva_parmt_3
                      ,pva_valr_3
                      ,pva_parmt_4
                      ,pva_valr_4
                      ,pva_parmt_5
                      ,pva_valr_5
                      ,pva_parmt_6
                      ,pva_valr_6
                      ,pva_parmt_7
                      ,pva_valr_7
                      ,pva_parmt_8
                      ,pva_valr_8
                      ,pva_parmt_9
                      ,pva_valr_9
                      ,pva_extra);
  end bals_image;

  procedure ecrir_clob (pcl_clob in out nocopy clob)
  is
    vnu_tail_tampn   integer := 1000;
    vnu_tail_clob    integer;
    vnu_nombr_loop   number;
  begin
    vnu_tail_clob   := dbms_lob.getlength (pcl_clob);

    if vnu_tail_clob > 0
    then
      vnu_nombr_loop   := floor (vnu_tail_clob / vnu_tail_tampn);

      for i in 0 .. vnu_nombr_loop
      loop
        htp.prn (substr (pcl_clob
                        ,i * vnu_tail_tampn + 1
                        ,vnu_tail_tampn));
      end loop;
    end if;
  end ecrir_clob;

  procedure reint_temn_trait_servr
  is
  begin
    owa_util.mime_header ('text/html'
                         ,false);
    ajout_temn (pva_nom    => gva_nom_temn_trait_servr
               ,pva_valr   => null);
  end reint_temn_trait_servr;

  procedure creer_temn_trait_servr
  is
  begin
    owa_util.mime_header ('text/html'
                         ,false);
    ajout_temn (pva_nom    => gva_nom_temn_trait_servr
               ,pva_valr   => 'TERMN');
  end creer_temn_trait_servr;

  function obten_valr_temn (pva_nom in varchar2)
    return varchar2
  is
    vco_temn        owa_cookie.cookie;
    vva_valr_temn   varchar2 (4000);
  begin
    vco_temn        := owa_cookie.get (pva_nom);
    vva_valr_temn   := vco_temn.vals (1);

    return vva_valr_temn;
  exception
    when others
    then
      return null;
  end obten_valr_temn;

  procedure ajout_temn (pva_nom          in varchar2
                       ,pva_valr         in varchar2
                       ,pda_expir        in date default null
                       ,pva_chemn        in varchar2 default null
                       ,pva_domn         in varchar2 default null
                       ,pva_secrt        in varchar2 default null
                       ,pva_http_seulm   in varchar2 default null)
  is
  begin
    owa_cookie.send (name      => pva_nom
                    ,value     => pva_valr
                    ,expires   => pda_expir
                    ,path      => pva_chemn
                    ,domain    => pva_domn
                    ,secure    => pva_secrt /*,httponly   => pva_http_seulm*/
                                           );
  end ajout_temn;
begin
  gta_subst (1).champ_subtr      := '&SIDF.';
  gta_subst (1).valr_de_subst    := afw_07_util_pkg.nv ('SIDF');
  gta_subst (2).champ_subtr      := '&SAPC.';
  gta_subst (2).valr_de_subst    := afw_07_util_pkg.v ('SAPC');
  gta_subst (3).champ_subtr      := '&SSPC.';
  gta_subst (3).valr_de_subst    := afw_07_util_pkg.nv ('SSPC');
  gta_subst (4).champ_subtr      := '&SCPC.';
  gta_subst (4).valr_de_subst    := afw_07_util_pkg.v ('SCPC');
  gta_subst (5).champ_subtr      := '&SAPI.';
  gta_subst (5).valr_de_subst    := afw_07_util_pkg.v ('SAPI');
  gta_subst (6).champ_subtr      := '&SCPI.';
  gta_subst (6).valr_de_subst    := afw_07_util_pkg.v ('SCPI');
  gta_subst (7).champ_subtr      := '&SNPI.';
  gta_subst (7).valr_de_subst    := afw_07_util_pkg.v ('SNPI');
  gta_subst (8).champ_subtr      := '&SSPI.';
  gta_subst (8).valr_de_subst    := afw_07_util_pkg.nv ('SSPI');
  gta_subst (9).champ_subtr      := '&APP_ID.';
  gta_subst (9).valr_de_subst    := afw_07_util_pkg.nv ('APP_ID');
  gta_subst (10).champ_subtr     := '&APP_ALIAS.';
  gta_subst (10).valr_de_subst   := afw_07_util_pkg.v ('APP_ALIAS');
  gta_subst (11).champ_subtr     := '&APP_PAGE_ID.';
  gta_subst (11).valr_de_subst   := afw_07_util_pkg.nv ('APP_PAGE_ID');
  gta_subst (12).champ_subtr     := '&SESSION.';
  gta_subst (12).valr_de_subst   := afw_07_util_pkg.nv ('SESSION');
  gta_subst (13).champ_subtr     := 'Û';
  gta_subst (13).valr_de_subst   := '&Ucirc;';
  gta_subst (14).champ_subtr     := 'â';
  gta_subst (14).valr_de_subst   := '&acirc;';
  gta_subst (15).champ_subtr     := 'Â';
  gta_subst (15).valr_de_subst   := '&Acirc;';
  gta_subst (16).champ_subtr     := 'é';
  gta_subst (16).valr_de_subst   := '&eacute;';
  gta_subst (17).champ_subtr     := 'É';
  gta_subst (17).valr_de_subst   := '&Eacute;';
  gta_subst (18).champ_subtr     := 'è';
  gta_subst (18).valr_de_subst   := '&egrave;';
  gta_subst (19).champ_subtr     := 'È';
  gta_subst (19).valr_de_subst   := '&Egrave;';
  gta_subst (20).champ_subtr     := 'à';
  gta_subst (20).valr_de_subst   := '&agrave;';
  gta_subst (21).champ_subtr     := 'À';
  gta_subst (21).valr_de_subst   := '&Agrave;';
  gta_subst (22).champ_subtr     := 'ç';
  gta_subst (22).valr_de_subst   := '&ccedil;';
  gta_subst (23).champ_subtr     := 'Ç';
  gta_subst (23).valr_de_subst   := '&Ccedil;';
  gta_subst (24).champ_subtr     := 'û';
  gta_subst (24).valr_de_subst   := '&ucirc;';
  gta_subst (25).champ_subtr     := '<';
  gta_subst (25).valr_de_subst   := '&lt;';
  gta_subst (26).champ_subtr     := '>';
  gta_subst (26).valr_de_subst   := '&gt;';
end afw_15_htp_pkg;
/
