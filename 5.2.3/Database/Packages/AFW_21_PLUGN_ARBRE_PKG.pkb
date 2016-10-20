SET DEFINE OFF;
create or replace package body afw_21_plugn_arbre_pkg
as
  gva_progm_a_lancr   varchar2 (4000) default 'declare
         vre_glisr_elemn afw_21_plugn_arbre_pkg.typ_rec_glisr_elemn;
       begin
         vre_glisr_elemn.vva_glisr_elemn             := :p1;
         vre_glisr_elemn.vva_depsr_elemn             := :p2;

         %PROCD_PERSN%(vre_glisr_elemn);
         afw_21_plugn_arbre_pkg.gre_glisr_elemn := vre_glisr_elemn;
       end;';

  type typ_rec_arbre is record
  (
    vnu_stat               number
   ,vnu_level              number
   ,vva_titre              varchar2 (200)
   ,vva_type               varchar2 (30)
   ,vva_valr               varchar2 (200)
   ,vva_titre_aide_insta   varchar2 (4000) default null
   ,vva_aide_insta         varchar2 (4000) default null
   ,vva_lien               varchar2 (4000)
  );

  type tab_rec_arbre is table of typ_rec_arbre
    index by pls_integer;

  function obten_plugn_arbre_noeud_deft (pnu_numr_apex_regn in number)
    return varchar2
  is
    vva_code   vd_afw_21_plugn_arbre_noeud.code%type;
  begin
    select lower (pan.code)
      into vva_code
      from vd_afw_21_plugn_arbre_noeud pan
          ,vd_afw_21_plugn_arbre       pa
          ,apex_regn                   ar
     where     pan.seqnc = pa.ref_plugn_arbre_noeud
           and pa.ref_prodt in (select ref_prodt
                                  from afw_11_aplic
                                 where numr_aplic_apex = ar.flow_id)
           and ar.id = pnu_numr_apex_regn
           and pa.code = ar.attribute_05;

    return vva_code;
  exception
    when others
    then
      return null;
  end obten_plugn_arbre_noeud_deft;

  function obten_enreg_confg_plugn (pnu_numr_apex_regn in number)
    return typ_rec_confg_plugn
  is
    cursor cur_confg_plugn
    is
      select pa.seqnc
            ,enonc_pre_reqt
            ,pa.code
            ,nom_table
            ,coln_titre
            ,coln_type
            ,coln_valr
            ,coln_titre_aide_insta
            ,coln_aide_insta
            ,coln_lien
            ,coln_id
            ,coln_id_parnt
            ,enonc_condt
            ,indic_comnc_par_racn
            ,indic_comnc_par_coln_parnt_nul
            ,enonc_condt_comnc_par
            ,enonc_trier_par
            ,indic_renmr
            ,indic_deplc
            ,image_sprit
            ,largr_regn_arbre
            ,hautr_regn_arbre
            ,ar.attribute_01
            ,obten_json_arbre_nombr_niv
            ,obten_json_noeud_nombr_niv
            ,mode_cache
            ,pag.numr_apex
            ,pa.indic_charg_progr
            ,pa.nom_procd_glisr_elemn_arbre
            ,pa.nom_procd_depsr_elemn_arbre
        from vd_afw_21_plugn_arbre pa
            ,vd_afw_13_page        pag
            , --vd_afw_13_page_regn pr,
             apex_regn             ar
       /*where pa.ref_page_regn = pr.seqnc
         and pr.seqnc =
               afw_13_page_regn_pkg.obten_page_regn (pnu_numr_apex_regn)
         and pag.seqnc = pr.ref_page
         and ar.id = pnu_numr_apex_regn;*/
       where     pa.code = ar.attribute_05
             and ar.id = pnu_numr_apex_regn
             and pag.numr_apex = ar.page_id
             and pag.app_id_formt = ar.flow_id;

    rec_confg_plugn   typ_rec_confg_plugn;
  begin
    open cur_confg_plugn;

    fetch cur_confg_plugn
      into rec_confg_plugn;

    close cur_confg_plugn;

    return rec_confg_plugn;
  end obten_enreg_confg_plugn;

  procedure maj_arbre_contx_noeud (pnu_numr_apex_regn    in number
                                  ,pty_rec_confg_plugn   in typ_rec_confg_plugn)
  is
    cur_arbre           sys_refcursor;
    vta_tab_rec_arbre   tab_rec_arbre;
    vta_tab_noeud       afw_12_arbre_pkg.tab_noeud;

    function genr_reqt_sql (pty_rec_confg_plugn in typ_rec_confg_plugn)
      return varchar2
    is
      vva_reqt_sql   varchar2 (32767);
    begin
      vva_reqt_sql      :=
           'select '
        || pty_rec_confg_plugn.coln_valr
        || ' value'
        || ' from '
        || pty_rec_confg_plugn.nom_table
        || case
             when pty_rec_confg_plugn.enonc_condt is not null
             then
                  ' where '
               || pty_rec_confg_plugn.enonc_condt
             else
               null
           end
        || ' start with '
        || pty_rec_confg_plugn.coln_id
        || ' = (select tab2.'
        || pty_rec_confg_plugn.coln_id_parnt
        || ' from '
        || pty_rec_confg_plugn.nom_table
        || ' tab2 where tab2.'
        || pty_rec_confg_plugn.coln_id
        || ' = :noeud)'
        || case
             when pty_rec_confg_plugn.enonc_condt_comnc_par is not null
             then
                  ' and '
               || pty_rec_confg_plugn.enonc_condt_comnc_par
             else
               null
           end
        || ' connect by prior '
        || pty_rec_confg_plugn.coln_id
        || ' = '
        || pty_rec_confg_plugn.coln_id_parnt;

      return vva_reqt_sql;
    end genr_reqt_sql;

    function enlev_carct_suprf_docmn (pnu_numr_regn_apex   in number
                                     ,pva_valr             in varchar2)
      return number
    is
    begin
      return to_number (substr (pva_valr
                               ,  length (   'R'
                                          || pnu_numr_regn_apex
                                          || '_')
                                + 1));
    end enlev_carct_suprf_docmn;
  begin
    open cur_arbre for genr_reqt_sql (pty_rec_confg_plugn)
      using enlev_carct_suprf_docmn (pnu_numr_apex_regn
                                    ,afw_07_util_pkg.v (pty_rec_confg_plugn.item_noeud));

    fetch cur_arbre
      bulk collect into vta_tab_noeud;

    close cur_arbre;

    afw_12_arbre_pkg.ajout_liste_noeud (pnu_numr_apex_regn
                                       ,vta_tab_noeud);
  end maj_arbre_contx_noeud;

  function formt_chain (pva_valr in varchar2)
    return varchar2
  is
  begin
    if pva_valr is null
    then
      return 'null';
    else
      return pva_valr;
    end if;
  end formt_chain;

  function formt_chain_2 (pva_valr in varchar2)
    return varchar2
  is
  begin
    if pva_valr is null
    then
      return 'null';
    else
      return    ''''
             || pva_valr
             || '''';
    end if;
  end formt_chain_2;

  procedure ouvri_atrib_enfan
  is
  begin
    htp.prn (',"children":');
  end ouvri_atrib_enfan;

  procedure ouvri_liste_noeud
  is
  begin
    htp.prn ('[');
  end ouvri_liste_noeud;

  procedure fermr_liste_noeud
  is
  begin
    htp.prn (']');
  end fermr_liste_noeud;

  procedure ouvri_noeud
  is
  begin
    htp.prn ('{');
  end ouvri_noeud;

  procedure fermr_noeud
  is
  begin
    htp.prn ('}');
  end fermr_noeud;

  procedure sepr_noeud
  is
  begin
    htp.prn (',');
  end sepr_noeud;

  procedure genr_json_arbre (pnu_numr_apex_regn in number)
  is
    rec_confg_plugn   typ_rec_confg_plugn;
  begin
    rec_confg_plugn   := obten_enreg_confg_plugn (pnu_numr_apex_regn);

    if rec_confg_plugn.indic_charg_progr = 'N'
    then
      genr_json_arbre_compl (pnu_numr_apex_regn);
    else
      if afw_12_arbre_pkg.verfr_presn (pnu_numr_apex_regn)
      then
        genr_json_arbre_contx (pnu_numr_apex_regn);
      else
        genr_json_racn_arbre (pnu_numr_apex_regn);
      end if;
    end if;
  end genr_json_arbre;

  procedure genr_json_racn_arbre (pnu_numr_apex_regn in number)
  is
    cur_racn_arbre          sys_refcursor;
    rec_confg_plugn         typ_rec_confg_plugn;
    vta_tab_rec_arbre       tab_rec_arbre;
    vnu_nombr_noeud_arbre   number;
    vnu_nombr_itert         number;

    procedure formt_noeud (p_rec_arbre in typ_rec_arbre)
    is
    begin
      htp.prn (   '"attr":{"id":"'
               || 'R'
               || rec_confg_plugn.seqnc
               --|| pnu_numr_apex_regn
               || '_'
               || p_rec_arbre.vva_valr
               || '"'
               || ',"rel":"'
               || case when p_rec_arbre.vva_type is not null then p_rec_arbre.vva_type else obten_plugn_arbre_noeud_deft (pnu_numr_apex_regn) end
               || '"'
               || '},'
               || '"data":{"title":"'
               || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_titre)
               || '",'
               || '"attr":{'
               || case
                    when p_rec_arbre.vva_aide_insta is not null
                    then
                         '"title":"'
                      || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_titre_aide_insta)
                      || '|'
                      || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_aide_insta)
                      || '",'
                    else
                      null
                  end
               || '"href":"'
               || p_rec_arbre.vva_lien
               || '"'
               || '}'
               || '}'
               || case when p_rec_arbre.vnu_stat = 1 then ',"state":"open"' when p_rec_arbre.vnu_stat <> 0 then ',"state":"closed"' else null end);
    end formt_noeud;

    function genr_reqt_sql (pty_rec_confg_plugn in typ_rec_confg_plugn)
      return varchar2
    is
      vva_reqt_sql                     varchar2 (32767);
      vva_indic_enonc_condt            varchar2 (1) := 'N';
      vva_indic_enonc_condt_comnc_pa   varchar2 (1) := 'N';
      vva_indic_enonc_trier_par        varchar2 (1) := 'N';
    begin
      if pty_rec_confg_plugn.enonc_condt is not null
      then
        vva_indic_enonc_condt   := 'O';
      end if;

      if pty_rec_confg_plugn.enonc_condt_comnc_par is not null
      then
        vva_indic_enonc_condt_comnc_pa   := 'O';
      end if;

      if pty_rec_confg_plugn.enonc_trier_par is not null
      then
        vva_indic_enonc_trier_par   := 'O';
      end if;

      vva_reqt_sql      :=
           'select case'
        || '         when connect_by_isleaf = 1 then'
        || '           0'
        || '         when '
        || '           level <= '
        || pty_rec_confg_plugn.obten_json_arbre_nombr_niv
        || '         then'
        || '            1'
        || --'         when level = 1 then' ||
           --'           1' ||
         '         else'
        || '           -1'
        || '       end stat,'
        || ' level,'
        || pty_rec_confg_plugn.coln_titre
        || ' titre,'
        || ' lower('
        || formt_chain (pty_rec_confg_plugn.coln_type)
        || ')'
        || ' type,'
        || pty_rec_confg_plugn.coln_valr
        || ' valr,'
        || formt_chain (pty_rec_confg_plugn.coln_titre_aide_insta)
        || ' titre_aide_insta,'
        || formt_chain (pty_rec_confg_plugn.coln_aide_insta)
        || ' aide_insta,'
        || formt_chain (pty_rec_confg_plugn.coln_lien)
        || ' link'
        || '  from '
        || pty_rec_confg_plugn.nom_table
        || ' where level <= '
        || pty_rec_confg_plugn.obten_json_arbre_nombr_niv
        || case
             when vva_indic_enonc_condt = 'O'
             then
                  ' and '
               || pty_rec_confg_plugn.enonc_condt
             else
               null
           end
        || ' start with '
        || pty_rec_confg_plugn.coln_id_parnt
        || case
             when pty_rec_confg_plugn.indic_comnc_par_racn = 'O'
             then
               ' is null '
             else
                  ' in (select '
               || pty_rec_confg_plugn.coln_id
               || ' from '
               || pty_rec_confg_plugn.nom_table
               || ' where '
               || pty_rec_confg_plugn.coln_id_parnt
               || ' is null)'
           end
        || case
             when vva_indic_enonc_condt_comnc_pa = 'O'
             then
                  ' and '
               || pty_rec_confg_plugn.enonc_condt_comnc_par
             else
               null
           end
        || ' connect by prior '
        || pty_rec_confg_plugn.coln_id
        || ' = '
        || pty_rec_confg_plugn.coln_id_parnt
        || '                  and level <= '
        || pty_rec_confg_plugn.obten_json_arbre_nombr_niv
        || case vva_indic_enonc_trier_par
             when 'O'
             then
                  ' order siblings by '
               || pty_rec_confg_plugn.enonc_trier_par
             else
               null
           end;

      return vva_reqt_sql;
    end genr_reqt_sql;
  begin
    initl_arbre (pnu_numr_apex_regn);


    rec_confg_plugn         := obten_enreg_confg_plugn (pnu_numr_apex_regn);

    if length (rec_confg_plugn.enonc_pre_reqt) > 0
    then
      execute immediate rec_confg_plugn.enonc_pre_reqt;
    end if;

    open cur_racn_arbre for genr_reqt_sql (rec_confg_plugn);

    fetch cur_racn_arbre
      bulk collect into vta_tab_rec_arbre;

    close cur_racn_arbre;

    vnu_nombr_noeud_arbre   := vta_tab_rec_arbre.count ();
    vnu_nombr_itert         := vnu_nombr_noeud_arbre + 1;

    if vnu_nombr_noeud_arbre > 0
    then
      ouvri_liste_noeud ();

      for i in 1 .. vnu_nombr_itert
      loop
        if i <> vnu_nombr_itert
        then
          if     vta_tab_rec_arbre.exists (i - 1)
             and vta_tab_rec_arbre (i).vnu_level = vta_tab_rec_arbre (i - 1).vnu_level
          then
            fermr_noeud ();
            sepr_noeud ();
          elsif     vta_tab_rec_arbre.exists (i - 1)
                and vta_tab_rec_arbre (i).vnu_level > vta_tab_rec_arbre (i - 1).vnu_level
          then
            ouvri_atrib_enfan ();
            ouvri_liste_noeud ();
          elsif     vta_tab_rec_arbre.exists (i - 1)
                and vta_tab_rec_arbre (i).vnu_level < vta_tab_rec_arbre (i - 1).vnu_level
          then
            fermr_noeud ();

            for j in vta_tab_rec_arbre (i).vnu_level .. (vta_tab_rec_arbre (i - 1).vnu_level - 1)
            loop
              fermr_liste_noeud ();
              fermr_noeud ();
            end loop;

            sepr_noeud ();
          end if;

          ouvri_noeud ();
          formt_noeud (vta_tab_rec_arbre (i));
        else
          fermr_noeud ();

          if vta_tab_rec_arbre (i - 1).vnu_level > 1
          then
            for j in 1 .. (vta_tab_rec_arbre (i - 1).vnu_level - 1)
            loop
              fermr_liste_noeud ();
              fermr_noeud ();
            end loop;
          end if;
        end if;
      end loop;

      fermr_liste_noeud ();
    else
      ouvri_liste_noeud ();
      ouvri_noeud ();
      fermr_noeud ();
      fermr_liste_noeud ();
    end if;
  exception
    when others
    then
      htp.prn ('[{}]');
  end genr_json_racn_arbre;

  procedure genr_json_arbre_contx (pnu_numr_apex_regn in number)
  is
    cur_arbre_contx         sys_refcursor;
    rec_confg_plugn         typ_rec_confg_plugn;
    vta_tab_rec_arbre       tab_rec_arbre;
    vnu_nombr_noeud_arbre   number;
    vnu_nombr_itert         number;

    procedure formt_noeud (p_rec_arbre in typ_rec_arbre)
    is
    begin
      htp.prn (   '"attr":{"id":"'
               || 'R'
               || rec_confg_plugn.seqnc
               --|| pnu_numr_apex_regn
               || '_'
               || p_rec_arbre.vva_valr
               || '"'
               || ',"rel":"'
               || case when p_rec_arbre.vva_type is not null then p_rec_arbre.vva_type else obten_plugn_arbre_noeud_deft (pnu_numr_apex_regn) end
               || '"'
               || '},'
               || '"data":{"title":"'
               || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_titre)
               || '",'
               || '"attr":{'
               || case
                    when p_rec_arbre.vva_aide_insta is not null
                    then
                         '"title":"'
                      || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_titre_aide_insta)
                      || '|'
                      || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_aide_insta)
                      || '",'
                    else
                      null
                  end
               || '"href":"'
               || p_rec_arbre.vva_lien
               || '"'
               || '}'
               || '}'
               || case when p_rec_arbre.vnu_stat <> 0 then ',"state":"open"' else ',"state":"closed"' end);
    end formt_noeud;

    function genr_reqt_sql (pty_rec_confg_plugn in typ_rec_confg_plugn)
      return varchar2
    is
      vva_reqt_sql                     varchar2 (32767);
      vva_indic_enonc_condt            varchar2 (1) := 'N';
      vva_indic_enonc_condt_comnc_pa   varchar2 (1) := 'N';
      vva_indic_enonc_trier_par        varchar2 (1) := 'N';
      vnu_niv                          number := 2;
    begin
      if pty_rec_confg_plugn.enonc_condt is not null
      then
        vva_indic_enonc_condt   := 'O';
      end if;

      if pty_rec_confg_plugn.enonc_condt_comnc_par is not null
      then
        vva_indic_enonc_condt_comnc_pa   := 'O';
      end if;

      if pty_rec_confg_plugn.enonc_trier_par is not null
      then
        vva_indic_enonc_trier_par   := 'O';
      end if;

      vva_reqt_sql      :=
           'select case
           when connect_by_isleaf = 1 then
             0
           when level <= '
        || pty_rec_confg_plugn.obten_json_arbre_nombr_niv
        || ' then
             1
           else
             -1
         end stat,
         level,'
        || pty_rec_confg_plugn.coln_titre
        || ' titre,'
        || ' lower('
        || formt_chain (pty_rec_confg_plugn.coln_type)
        || ')'
        || ' type,'
        || pty_rec_confg_plugn.coln_valr
        || ' valr,'
        || formt_chain (pty_rec_confg_plugn.coln_titre_aide_insta)
        || ' titre_aide_insta,'
        || formt_chain (pty_rec_confg_plugn.coln_aide_insta)
        || ' aide_insta,'
        || formt_chain (pty_rec_confg_plugn.coln_lien)
        || ' lien'
        || '  from '
        || ' (select * from '
        || pty_rec_confg_plugn.nom_table
        || ' where '
        || '('
        || pty_rec_confg_plugn.coln_id_parnt
        || ' is null or '
        || pty_rec_confg_plugn.coln_id_parnt
        || ' in (select an.noeud_ouver from vd_afw_12_arbre_noeud an where an.ref_arbre = :vnu_arbre)) '
        || case vva_indic_enonc_condt
             when 'O'
             then
                  ' and '
               || pty_rec_confg_plugn.enonc_condt
             else
               null
           end
        || ')'
        || ' start with '
        || pty_rec_confg_plugn.coln_id_parnt
        || case
             when pty_rec_confg_plugn.indic_comnc_par_racn = 'O'
             then
               ' is null '
             else
                  ' in (select '
               || pty_rec_confg_plugn.coln_id
               || ' from '
               || pty_rec_confg_plugn.nom_table
               || ' where '
               || pty_rec_confg_plugn.coln_id_parnt
               || ' is null)'
           end
        || case
             when vva_indic_enonc_condt_comnc_pa = 'O'
             then
                  ' and '
               || pty_rec_confg_plugn.enonc_condt_comnc_par
             else
               null
           end
        || ' connect by prior '
        || pty_rec_confg_plugn.coln_id
        || ' = '
        || pty_rec_confg_plugn.coln_id_parnt
        || '                  and level <= '
        || pty_rec_confg_plugn.obten_json_arbre_nombr_niv
        || case vva_indic_enonc_trier_par
             when 'O'
             then
                  ' order siblings by '
               || pty_rec_confg_plugn.enonc_trier_par
             else
               null
           end;

      return vva_reqt_sql;
    end genr_reqt_sql;
  begin
    initl_arbre (pnu_numr_apex_regn);

    rec_confg_plugn         := obten_enreg_confg_plugn (pnu_numr_apex_regn);

    maj_arbre_contx_noeud (pnu_numr_apex_regn
                          ,rec_confg_plugn);

    --générer l'arbre en contexte du noeud sélectionné et des noeuds ouverts
    if length (rec_confg_plugn.enonc_pre_reqt) > 0
    then
      execute immediate rec_confg_plugn.enonc_pre_reqt; --USING NOEUD
    end if;

    open cur_arbre_contx for genr_reqt_sql (rec_confg_plugn) using afw_12_arbre_pkg.obten_arbre (pnu_numr_apex_regn);

    fetch cur_arbre_contx
      bulk collect into vta_tab_rec_arbre;

    close cur_arbre_contx;

    vnu_nombr_noeud_arbre   := vta_tab_rec_arbre.count ();
    vnu_nombr_itert         := vnu_nombr_noeud_arbre + 1;

    if vnu_nombr_noeud_arbre > 0
    then
      ouvri_liste_noeud ();

      for i in 1 .. vnu_nombr_itert
      loop
        if i <> vnu_nombr_itert
        then
          if     vta_tab_rec_arbre.exists (i - 1)
             and vta_tab_rec_arbre (i).vnu_level = vta_tab_rec_arbre (i - 1).vnu_level
          then
            fermr_noeud ();
            sepr_noeud ();
          elsif     vta_tab_rec_arbre.exists (i - 1)
                and vta_tab_rec_arbre (i).vnu_level > vta_tab_rec_arbre (i - 1).vnu_level
          then
            ouvri_atrib_enfan ();
            ouvri_liste_noeud ();
          elsif     vta_tab_rec_arbre.exists (i - 1)
                and vta_tab_rec_arbre (i).vnu_level < vta_tab_rec_arbre (i - 1).vnu_level
          then
            fermr_noeud ();

            for j in vta_tab_rec_arbre (i).vnu_level .. (vta_tab_rec_arbre (i - 1).vnu_level - 1)
            loop
              fermr_liste_noeud ();
              fermr_noeud ();
            end loop;

            sepr_noeud ();
          end if;

          ouvri_noeud ();
          formt_noeud (vta_tab_rec_arbre (i));
        else
          fermr_noeud ();

          if vta_tab_rec_arbre (i - 1).vnu_level > 1
          then
            for j in 1 .. (vta_tab_rec_arbre (i - 1).vnu_level - 1)
            loop
              fermr_liste_noeud ();
              fermr_noeud ();
            end loop;
          end if;
        end if;
      end loop;

      fermr_liste_noeud ();
    else
      ouvri_liste_noeud ();
      ouvri_noeud ();
      fermr_noeud ();
      fermr_liste_noeud ();
    end if;
  exception
    when others
    then
      ouvri_liste_noeud ();
      ouvri_noeud ();
      fermr_noeud ();
      fermr_liste_noeud ();
  end genr_json_arbre_contx;

  procedure genr_json_arbre_compl (pnu_numr_apex_regn in number)
  is
    cur_arbre_compl         sys_refcursor;
    rec_confg_plugn         typ_rec_confg_plugn;
    vta_tab_rec_arbre       tab_rec_arbre;
    vnu_nombr_noeud_arbre   number;
    vnu_nombr_itert         number;

    procedure formt_noeud (p_rec_arbre in typ_rec_arbre)
    is
    begin
      htp.prn (   '"attr":{"id":"'
               || 'R'
               || rec_confg_plugn.seqnc
               --|| pnu_numr_apex_regn
               || '_'
               || p_rec_arbre.vva_valr
               || '"'
               || ',"rel":"'
               || case when p_rec_arbre.vva_type is not null then p_rec_arbre.vva_type else obten_plugn_arbre_noeud_deft (pnu_numr_apex_regn) end
               || '"'
               || '},'
               || '"data":{"title":"'
               || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_titre)
               || '",'
               || '"attr":{'
               || case
                    when p_rec_arbre.vva_aide_insta is not null
                    then
                         '"title":"'
                      || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_titre_aide_insta)
                      || '|'
                      || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_aide_insta)
                      || '",'
                    else
                      null
                  end
               || '"href":"'
               || p_rec_arbre.vva_lien
               || '"'
               || '}'
               || '}'
               || case when p_rec_arbre.vnu_stat = 1 then ',"state":"open"' when p_rec_arbre.vnu_stat <> 0 then ',"state":"closed"' else null end);
    end formt_noeud;

    function genr_reqt_sql (pty_rec_confg_plugn in typ_rec_confg_plugn)
      return varchar2
    is
      vva_reqt_sql                     varchar2 (32767);
      vva_indic_enonc_condt            varchar2 (1) := 'N';
      vva_indic_enonc_condt_comnc_pa   varchar2 (1) := 'N';
      vva_indic_enonc_trier_par        varchar2 (1) := 'N';
    begin
      if pty_rec_confg_plugn.enonc_condt is not null
      then
        vva_indic_enonc_condt   := 'O';
      end if;

      if pty_rec_confg_plugn.enonc_condt_comnc_par is not null
      then
        vva_indic_enonc_condt_comnc_pa   := 'O';
      end if;

      if pty_rec_confg_plugn.enonc_trier_par is not null
      then
        vva_indic_enonc_trier_par   := 'O';
      end if;

      vva_reqt_sql      :=
           'select case'
        || '         when connect_by_isleaf = 1 then'
        || '           0'
        || '         when '
        || '           level <= '
        || pty_rec_confg_plugn.obten_json_arbre_nombr_niv
        || '          then'
        || '           1'
        || '         when (select 1 from vd_afw_12_arbre_noeud an where an.ref_arbre = :vnu_arbre and an.noeud_ouver = '
        || pty_rec_confg_plugn.coln_id
        || ') = 1 then'
        || '           1'
        || '         else'
        || '           -1'
        || '       end stat,'
        || ' level,'
        || pty_rec_confg_plugn.coln_titre
        || ' titre,'
        || ' lower('
        || formt_chain (pty_rec_confg_plugn.coln_type)
        || ')'
        || ' type,'
        || pty_rec_confg_plugn.coln_valr
        || ' valr,'
        || formt_chain (pty_rec_confg_plugn.coln_titre_aide_insta)
        || ' titre_aide_insta,'
        || formt_chain (pty_rec_confg_plugn.coln_aide_insta)
        || ' aide_insta,'
        || formt_chain (pty_rec_confg_plugn.coln_lien)
        || ' link'
        || '  from '
        || pty_rec_confg_plugn.nom_table
        || case
             when vva_indic_enonc_condt = 'O'
             then
                  ' where '
               || pty_rec_confg_plugn.enonc_condt
             else
               null
           end
        || ' start with '
        || pty_rec_confg_plugn.coln_id_parnt
        || case
             when pty_rec_confg_plugn.indic_comnc_par_racn = 'O'
             then
               ' is null '
             else
                  ' in (select '
               || pty_rec_confg_plugn.coln_id
               || ' from '
               || pty_rec_confg_plugn.nom_table
               || ' where '
               || pty_rec_confg_plugn.coln_id_parnt
               || ' is null)'
           end
        || case
             when vva_indic_enonc_condt_comnc_pa = 'O'
             then
                  ' and '
               || pty_rec_confg_plugn.enonc_condt_comnc_par
             else
               null
           end
        || ' connect by prior '
        || pty_rec_confg_plugn.coln_id
        || ' = '
        || pty_rec_confg_plugn.coln_id_parnt
        || case vva_indic_enonc_trier_par
             when 'O'
             then
                  ' order siblings by '
               || pty_rec_confg_plugn.enonc_trier_par
             else
               null
           end;

      return vva_reqt_sql;
    end genr_reqt_sql;
  begin
    initl_arbre (pnu_numr_apex_regn);
    rec_confg_plugn         := obten_enreg_confg_plugn (pnu_numr_apex_regn);

    if length (rec_confg_plugn.enonc_pre_reqt) > 0
    then
      execute immediate rec_confg_plugn.enonc_pre_reqt;
    end if;

    open cur_arbre_compl for genr_reqt_sql (rec_confg_plugn) using afw_12_arbre_pkg.obten_arbre (pnu_numr_apex_regn);

    fetch cur_arbre_compl
      bulk collect into vta_tab_rec_arbre;

    close cur_arbre_compl;

    vnu_nombr_noeud_arbre   := vta_tab_rec_arbre.count ();
    vnu_nombr_itert         := vnu_nombr_noeud_arbre + 1;

    if vnu_nombr_noeud_arbre > 0
    then
      ouvri_liste_noeud ();

      for i in 1 .. vnu_nombr_itert
      loop
        if i <> vnu_nombr_itert
        then
          if     vta_tab_rec_arbre.exists (i - 1)
             and vta_tab_rec_arbre (i).vnu_level = vta_tab_rec_arbre (i - 1).vnu_level
          then
            fermr_noeud ();
            sepr_noeud ();
          elsif     vta_tab_rec_arbre.exists (i - 1)
                and vta_tab_rec_arbre (i).vnu_level > vta_tab_rec_arbre (i - 1).vnu_level
          then
            ouvri_atrib_enfan ();
            ouvri_liste_noeud ();
          elsif     vta_tab_rec_arbre.exists (i - 1)
                and vta_tab_rec_arbre (i).vnu_level < vta_tab_rec_arbre (i - 1).vnu_level
          then
            fermr_noeud ();

            for j in vta_tab_rec_arbre (i).vnu_level .. (vta_tab_rec_arbre (i - 1).vnu_level - 1)
            loop
              fermr_liste_noeud ();
              fermr_noeud ();
            end loop;

            sepr_noeud ();
          end if;

          ouvri_noeud ();
          formt_noeud (vta_tab_rec_arbre (i));
        else
          fermr_noeud ();

          if vta_tab_rec_arbre (i - 1).vnu_level > 1
          then
            for j in 1 .. (vta_tab_rec_arbre (i - 1).vnu_level - 1)
            loop
              fermr_liste_noeud ();
              fermr_noeud ();
            end loop;
          end if;
        end if;
      end loop;

      fermr_liste_noeud ();
    else
      ouvri_liste_noeud ();
      ouvri_noeud ();
      fermr_noeud ();
      fermr_liste_noeud ();
    end if;
  exception
    when others
    then
      htp.prn ('[{}]');
  end genr_json_arbre_compl;

  procedure genr_json_noeud (pnu_numr_apex_regn   in number
                            ,pva_noeud            in varchar2)
  is
    cur_arbre_noeud         sys_refcursor;
    rec_confg_plugn         typ_rec_confg_plugn;
    vta_tab_rec_arbre       tab_rec_arbre;
    vnu_nombr_noeud_arbre   number;
    vnu_nombr_itert         number;

    procedure formt_noeud (p_rec_arbre in typ_rec_arbre)
    is
    begin
      htp.prn (   '"attr":{"id":"'
               || 'R'
               || rec_confg_plugn.seqnc
               --|| pnu_numr_apex_regn
               || '_'
               || p_rec_arbre.vva_valr
               || '"'
               || ',"rel":"'
               || case when p_rec_arbre.vva_type is not null then p_rec_arbre.vva_type else obten_plugn_arbre_noeud_deft (pnu_numr_apex_regn) end
               || '"'
               || '},'
               || '"data":{"title":"'
               || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_titre)
               || '",'
               || '"attr":{'
               || case
                    when p_rec_arbre.vva_aide_insta is not null
                    then
                         '"title":"'
                      || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_titre_aide_insta)
                      || '|'
                      || afw_07_util_pkg.echap_text_json (p_rec_arbre.vva_aide_insta)
                      || '",'
                    else
                      null
                  end
               || '"href":"'
               || p_rec_arbre.vva_lien
               || '"'
               || '}'
               || '}'
               || case when p_rec_arbre.vnu_stat <> 0 then ',"state":"closed"' else null end);
    end formt_noeud;

    function genr_reqt_sql (pty_rec_confg_plugn in typ_rec_confg_plugn)
      return varchar2
    is
      vva_reqt_sql                     varchar2 (32767);
      vva_indic_enonc_condt            varchar2 (1) := 'N';
      vva_indic_enonc_condt_comnc_pa   varchar2 (1) := 'N';
      vva_indic_enonc_trier_par        varchar2 (1) := 'N';
    begin
      if pty_rec_confg_plugn.enonc_condt is not null
      then
        vva_indic_enonc_condt   := 'O';
      end if;

      if pty_rec_confg_plugn.enonc_condt_comnc_par is not null
      then
        vva_indic_enonc_condt_comnc_pa   := 'O';
      end if;

      if pty_rec_confg_plugn.enonc_trier_par is not null
      then
        vva_indic_enonc_trier_par   := 'O';
      end if;

      vva_reqt_sql      :=
           'select '
        || '  case '
        || '    when connect_by_isleaf = 1 then '
        || '      0 '
        || '    when level = 1 then '
        || '      1 '
        || '    else '
        || '      -1 '
        || ' end stat, '
        || ' level, '
        || pty_rec_confg_plugn.coln_titre
        || ' titre, '
        || ' lower('
        || formt_chain (pty_rec_confg_plugn.coln_type)
        || ') '
        || ' type, '
        || pty_rec_confg_plugn.coln_valr
        || ' valr, '
        || formt_chain (pty_rec_confg_plugn.coln_titre_aide_insta)
        || ' titre_aide_insta, '
        || formt_chain (pty_rec_confg_plugn.coln_aide_insta)
        || ' aide_insta, '
        || formt_chain (pty_rec_confg_plugn.coln_lien)
        || ' lien '
        || '  from '
        || pty_rec_confg_plugn.nom_table
        || ' where level <= '
        || pty_rec_confg_plugn.obten_json_noeud_nombr_niv
        || --case when vva_indic_enonc_condt = 'O' then ' and ' || pty_rec_confg_plugn.enonc_condt else null end ||
          ' start with '
        || pty_rec_confg_plugn.coln_id_parnt
        || ' = '
        || formt_chain_2 (pva_noeud)
        || --case when vva_indic_enonc_comnc_par = 'O' then ' and ' || pty_rec_confg_plugn.enonc_comnc_par else null end ||
          ' connect by prior '
        || pty_rec_confg_plugn.coln_id
        || ' = '
        || pty_rec_confg_plugn.coln_id_parnt
        || '                  and level <= '
        || (pty_rec_confg_plugn.obten_json_noeud_nombr_niv + 1)
        || case vva_indic_enonc_trier_par
             when 'O'
             then
                  ' order siblings by '
               || pty_rec_confg_plugn.enonc_trier_par
             else
               null
           end;

      return vva_reqt_sql;
    end genr_reqt_sql;
  begin
    rec_confg_plugn         := obten_enreg_confg_plugn (pnu_numr_apex_regn);

    if length (rec_confg_plugn.enonc_pre_reqt) > 0
    then
      execute immediate rec_confg_plugn.enonc_pre_reqt;
    end if;

    open cur_arbre_noeud for genr_reqt_sql (rec_confg_plugn);

    fetch cur_arbre_noeud
      bulk collect into vta_tab_rec_arbre;

    close cur_arbre_noeud;

    vnu_nombr_noeud_arbre   := vta_tab_rec_arbre.count ();
    vnu_nombr_itert         := vnu_nombr_noeud_arbre + 1;

    if vnu_nombr_noeud_arbre > 0
    then
      actio_ouvri_noeud (pnu_numr_apex_regn
                        ,pva_noeud);
      ouvri_liste_noeud ();

      for i in 1 .. vnu_nombr_itert
      loop
        if i <> vnu_nombr_itert
        then
          if     vta_tab_rec_arbre.exists (i - 1)
             and vta_tab_rec_arbre (i).vnu_level = vta_tab_rec_arbre (i - 1).vnu_level
          then
            fermr_noeud ();
            sepr_noeud ();
          elsif     vta_tab_rec_arbre.exists (i - 1)
                and vta_tab_rec_arbre (i).vnu_level > vta_tab_rec_arbre (i - 1).vnu_level
          then
            ouvri_atrib_enfan ();
            ouvri_liste_noeud ();
          elsif     vta_tab_rec_arbre.exists (i - 1)
                and vta_tab_rec_arbre (i).vnu_level < vta_tab_rec_arbre (i - 1).vnu_level
          then
            fermr_noeud ();

            for j in vta_tab_rec_arbre (i).vnu_level .. (vta_tab_rec_arbre (i - 1).vnu_level - 1)
            loop
              fermr_liste_noeud ();
              fermr_noeud ();
            end loop;

            sepr_noeud ();
          end if;

          ouvri_noeud ();
          formt_noeud (vta_tab_rec_arbre (i));
        else
          fermr_noeud ();

          if vta_tab_rec_arbre (i - 1).vnu_level > 1
          then
            for j in 1 .. (vta_tab_rec_arbre (i - 1).vnu_level - 1)
            loop
              fermr_liste_noeud ();
              fermr_noeud ();
            end loop;
          end if;
        end if;
      end loop;

      fermr_liste_noeud ();
    end if;
  exception
    when others
    then
      ete ();
  end genr_json_noeud;

  procedure actio_ouvri_noeud (pnu_numr_apex_regn   in number
                              ,pva_noeud            in varchar2)
  is
  begin
    afw_12_arbre_pkg.ouvri_noeud (pnu_numr_apex_regn
                                 ,pva_noeud);
  end actio_ouvri_noeud;

  procedure actio_fermr_noeud (pnu_numr_apex_regn   in number
                              ,pva_noeud            in varchar2)
  is
  begin
    afw_12_arbre_pkg.fermr_noeud (pnu_numr_apex_regn
                                 ,pva_noeud);
  end actio_fermr_noeud;

  procedure actio_selct_noeud (pnu_numr_apex_regn   in number
                              ,pva_noeud            in varchar2)
  is
    rec_confg_plugn   typ_rec_confg_plugn;

    cursor cur_item_noeud
    is
      select ar.attribute_01 item_noeud
        from apex_regn ar
       where ar.id = pnu_numr_apex_regn; /*exists
                (select null
                   from vd_afw_21_plugn_arbre pa
                  where pa.code = ar.attribute_05
                    and ar.id = pnu_numr_apex_regn
                    and exists
                          (select null
                             from vd_afw_13_page p, vd_afw_13_page_regn pr2
                            where pr.ref_page = p.seqnc
                              and pr2.ref_page = p.seqnc
                              and pr2.seqnc =
                                    afw_13_page_regn_pkg.obten_page_regn (
                                      pnu_numr_apex_regn)));*/
  begin
    for rec_item_noeud in cur_item_noeud
    loop
      afw_07_util_pkg.defnr_etat_sessn (rec_item_noeud.item_noeud
                                       ,null);
    end loop;

    rec_confg_plugn   := obten_enreg_confg_plugn (pnu_numr_apex_regn);

    afw_07_sesn_pkg.defnr_valr_sesn (afw_21_plugn_arbre_pkg.kva_s_noeud_actif
                                    ,pva_noeud);
  end actio_selct_noeud;

  procedure actio_glisr_elemn_arbre (pnu_numr_apex_regn   in number
                                    ,pva_glisr_elemn      in varchar2
                                    ,pva_depsr_elemn      in varchar2)
  is
    rec_confg_plugn   typ_rec_confg_plugn;

    procedure lancr_procd_persn (pva_nom_procd     in varchar2
                                ,pva_glisr_elemn   in varchar2
                                ,pva_depsr_elemn   in varchar2)
    is
      vva_progr_a_lancr   varchar2 (4000)
                            default replace (gva_progm_a_lancr
                                            ,'%PROCD_PERSN%'
                                            ,pva_nom_procd);
    begin
      execute immediate vva_progr_a_lancr
        using pva_glisr_elemn
             ,pva_depsr_elemn;
    exception
      when others
      then
        raise;
    end lancr_procd_persn;
  begin
    rec_confg_plugn   := obten_enreg_confg_plugn (pnu_numr_apex_regn);

    lancr_procd_persn (rec_confg_plugn.nom_procd_glisr_elemn_arbre
                      ,pva_glisr_elemn
                      ,substr (pva_depsr_elemn
                              ,  instr (pva_depsr_elemn
                                       ,'_')
                               + 1));
  end actio_glisr_elemn_arbre;

  procedure genr_json_type_noeud (pnu_numr_apex_regn in number)
  is
    vva_json_optio_type_noeud   varchar2 (32767);
    vva_enfan_vald              varchar2 (400);

    cursor cur_type_noeud
    is
      select lower (pan.code)  code
            ,   edv.empla
             || ore.nom_physq
               icone
            ,ore.cordn_x_debut image_sprit_postn_pixel_gauch
            ,ore.cordn_y_debut image_sprit_postn_pixel_haut
            ,pan.indic_selct_noeud
            ,pan.indic_ouvri_noeud
            ,pan.indic_fermr_noeud
            ,pan.indic_creer_noeud
            ,pan.indic_suprm_noeud
        from vd_afw_13_empla_dosr_virtl  edv
            ,vd_afw_13_resrc             r
            ,vd_afw_13_ocurn_resrc       ore
            ,vd_afw_21_plugn_arbre_noeud pan
            ,vd_afw_21_plugn_arbre       pa
            ,vd_afw_11_prodt             p2
            ,apex_regn                   ar
       where     edv.ref_versn = p2.ref_versn
             and edv.ref_dosr_virtl = r.ref_dosr_virtl
             and r.indic_stock_meme_reprt = 'O'
             and ore.ref_resrc = r.seqnc
             and ore.ref_versn = p2.ref_versn
             and ore.ref_resrc = pan.ref_resrc
             and pan.ref_plugn_arbre = pa.seqnc
             --and pa.ref_page_regn = pr.seqnc
             and pa.code = ar.attribute_05
             and ar.id = pnu_numr_apex_regn
      union all
      select lower (pan.code)  code
            ,   edv.empla
             || ore.nom_physq
               icone
            ,ore.cordn_x_debut image_sprit_postn_pixel_gauch
            ,ore.cordn_y_debut image_sprit_postn_pixel_haut
            ,pan.indic_selct_noeud
            ,pan.indic_ouvri_noeud
            ,pan.indic_fermr_noeud
            ,pan.indic_creer_noeud
            ,pan.indic_suprm_noeud
        from vd_afw_13_empla_dosr_virtl  edv
            ,vd_afw_13_resrc             r
            ,vd_afw_13_ocurn_resrc       ore
            ,vd_afw_21_plugn_arbre_noeud pan
            ,vd_afw_21_plugn_arbre       pa
            ,vd_afw_11_prodt             p2
            ,apex_regn                   ar
       where     edv.ref_versn = p2.ref_versn
             and edv.ref_dosr_virtl = ore.ref_dosr_virtl
             and r.indic_stock_meme_reprt = 'N'
             and ore.ref_resrc = r.seqnc
             and ore.ref_versn = p2.ref_versn
             and ore.ref_resrc = pan.ref_resrc
             and pan.ref_plugn_arbre = pa.seqnc
             --and pa.ref_page_regn = pr.seqnc
             and pa.code = ar.attribute_05
             and ar.id = pnu_numr_apex_regn
             and pa.ref_formt_resrc = ore.ref_formt_resrc;
  begin
    vva_enfan_vald   := '"all"';

    vva_enfan_vald      :=
      rtrim (vva_enfan_vald
            ,',');

    htp.prn (   '{"valid_children":'
             || vva_enfan_vald
             || ',"type_attr":"rel","types":{');

    for rec_type_noeud in cur_type_noeud
    loop
      if vva_json_optio_type_noeud is not null
      then
        htp.prn (   vva_json_optio_type_noeud
                 || ',');
        vva_json_optio_type_noeud   := null;
      end if;

      vva_json_optio_type_noeud      :=
           '"'
        || rec_type_noeud.code
        || '":{'
        || '"valid_children":'
        || vva_enfan_vald
        || ','
        || '"select_node":'
        || case when rec_type_noeud.indic_selct_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"open_node":'
        || case when rec_type_noeud.indic_ouvri_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"close_node":'
        || case when rec_type_noeud.indic_fermr_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"create_node":'
        || case when rec_type_noeud.indic_creer_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"delete_node":'
        || case when rec_type_noeud.indic_suprm_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"icon":{'
        || case
             when rec_type_noeud.icone is not null
             then
                  '"image":"'
               || rec_type_noeud.icone
               || '"'
             else
                  '"position":"'
               || rec_type_noeud.image_sprit_postn_pixel_gauch
               || 'px '
               || rec_type_noeud.image_sprit_postn_pixel_haut
               || 'px"'
           end
        || '}'
        || '}';
    end loop;

    htp.prn (   vva_json_optio_type_noeud
             || '}}');
  end genr_json_type_noeud;

  procedure genr_json_type_noeud2 (pnu_numr_apex_regn in number)
  is
    vva_json_optio_type_noeud   varchar2 (32767);
    vva_enfan_vald              varchar2 (400);

    cursor cur_type_noeud
    is
      select lower (pan.code)  code
            ,   edv.empla
             || ore.nom_physq
               icone
            ,ore.cordn_x_debut image_sprit_postn_pixel_gauch
            ,ore.cordn_y_debut image_sprit_postn_pixel_haut
            ,pan.indic_selct_noeud
            ,pan.indic_ouvri_noeud
            ,pan.indic_fermr_noeud
            ,pan.indic_creer_noeud
            ,pan.indic_suprm_noeud
        from vd_afw_13_empla_dosr_virtl  edv
            ,vd_afw_13_resrc             r
            ,vd_afw_13_ocurn_resrc       ore
            ,vd_afw_21_plugn_arbre_noeud pan
            ,vd_afw_21_plugn_arbre       pa
            ,vd_afw_11_prodt             p2
            ,vd_afw_11_aplic             p3
            ,vd_afw_13_page              p1
            ,apex_regn                   ar
       where     edv.ref_versn = p2.ref_versn
             and edv.ref_dosr_virtl = r.ref_dosr_virtl
             and r.indic_stock_meme_reprt = 'O'
             and ore.ref_resrc = r.seqnc
             and ore.ref_versn = p2.ref_versn
             and ore.ref_resrc = pan.ref_resrc
             and pan.ref_plugn_arbre = pa.seqnc
             --and pa.ref_page_regn = pr.seqnc
             and pa.code = ar.attribute_05
             and ar.id = pnu_numr_apex_regn
             and p2.seqnc = p3.ref_prodt
             and p3.seqnc = p1.ref_aplic
      union all
      select lower (pan.code)  code
            ,   edv.empla
             || ore.nom_physq
               icone
            ,ore.cordn_x_debut image_sprit_postn_pixel_gauch
            ,ore.cordn_y_debut image_sprit_postn_pixel_haut
            ,pan.indic_selct_noeud
            ,pan.indic_ouvri_noeud
            ,pan.indic_fermr_noeud
            ,pan.indic_creer_noeud
            ,pan.indic_suprm_noeud
        from vd_afw_13_empla_dosr_virtl  edv
            ,vd_afw_13_resrc             r
            ,vd_afw_13_ocurn_resrc       ore
            ,vd_afw_21_plugn_arbre_noeud pan
            ,vd_afw_21_plugn_arbre       pa
            ,vd_afw_11_prodt             p2
            ,vd_afw_11_aplic             p3
            ,vd_afw_13_page              p1
            ,apex_regn                   ar
       where     edv.ref_versn = p2.ref_versn
             and edv.ref_dosr_virtl = ore.ref_dosr_virtl
             and r.indic_stock_meme_reprt = 'N'
             and ore.ref_resrc = r.seqnc
             and ore.ref_versn = p2.ref_versn
             and ore.ref_resrc = pan.ref_resrc
             and pan.ref_plugn_arbre = pa.seqnc
             --and pa.ref_page_regn = pr.seqnc
             and pa.code = ar.attribute_05
             and ar.id = pnu_numr_apex_regn
             and p2.seqnc = p3.ref_prodt
             and p3.seqnc = p1.ref_aplic
             and pa.ref_formt_resrc = ore.ref_formt_resrc;
  begin
    vva_enfan_vald   := '"all"';

    vva_enfan_vald      :=
      rtrim (vva_enfan_vald
            ,',');

    htp.prn (   '{"valid_children":'
             || vva_enfan_vald
             || ',"type_attr":"rel","types":{');

    for rec_type_noeud in cur_type_noeud
    loop
      if vva_json_optio_type_noeud is not null
      then
        htp.prn (   vva_json_optio_type_noeud
                 || ',');
        vva_json_optio_type_noeud   := null;
      end if;

      vva_json_optio_type_noeud      :=
           '"'
        || rec_type_noeud.code
        || '":{'
        || '"valid_children":'
        || vva_enfan_vald
        || ','
        || '"select_node":'
        || case when rec_type_noeud.indic_selct_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"open_node":'
        || case when rec_type_noeud.indic_ouvri_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"close_node":'
        || case when rec_type_noeud.indic_fermr_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"create_node":'
        || case when rec_type_noeud.indic_creer_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"delete_node":'
        || case when rec_type_noeud.indic_suprm_noeud = 'O' then 'true' else 'false' end
        || ','
        || '"icon":{'
        || case
             when rec_type_noeud.icone is not null
             then
                  '"image":"'
               || rec_type_noeud.icone
               || '"'
             else
                  '"position":"'
               || rec_type_noeud.image_sprit_postn_pixel_gauch
               || 'px '
               || rec_type_noeud.image_sprit_postn_pixel_haut
               || 'px"'
           end
        || '}'
        || '}';
    end loop;

    htp.prn (   vva_json_optio_type_noeud
             || '}}');
  end genr_json_type_noeud2;

  procedure initl_arbre (pnu_numr_apex_regn in number)
  is
  begin
    afw_12_arbre_pkg.initl_arbre (pnu_numr_apex_regn);
  end initl_arbre;

  procedure forcr_rafrc (pva_code             in varchar2
                        ,pnu_numr_page_apex   in number
                        ,pnu_utils            in number default null)
  is
    vnu_page_regn   apex_regn.id%type;
  begin
    select ar.id
      into vnu_page_regn
      from vd_afw_21_plugn_arbre pa
          ,apex_regn             ar
     where     pa.code = ar.attribute_05
           and pa.code = pva_code
           and pa.ref_prodt = afw_11_aplic_pkg.obten_prodt (afw_11_aplic_pkg.obten_aplic_sesn)
           and ar.page_id = pnu_numr_page_apex
           and ar.flow_id = afw_11_aplic_pkg.obten_numr_apex_aplic;

    /*select pr.seqnc
      into vnu_page_regn
      from vd_afw_21_plugn_arbre pa, vd_afw_13_page_regn pr, vd_afw_13_page p
     where pa.code = pva_code
       and pa.ref_page_regn = pr.seqnc
       and pr.ref_page = p.seqnc
       and p.numr_apex = pnu_numr_page_apex;*/

    afw_12_arbre_pkg.forcr_rafrc (vnu_page_regn
                                 ,pnu_utils);
  exception
    when others
    then
      ete ();
  end forcr_rafrc;

  procedure rafrc_efect (pva_code             in varchar2
                        ,pnu_numr_page_apex   in number
                        ,pnu_utils            in number default null
                        ,pnu_numr_apex        in number default afw_11_aplic_pkg.obten_numr_apex_aplic)
  is
    vnu_page_regn   apex_regn.id%type;
  begin
    select ar.id
      into vnu_page_regn
      from vd_afw_21_plugn_arbre pa
          ,apex_regn             ar
     where     pa.code = ar.attribute_05
           and pa.code = pva_code
           and pa.ref_prodt = afw_11_aplic_pkg.obten_prodt (afw_11_aplic_pkg.obten_aplic_sesn)
           and ar.page_id = pnu_numr_page_apex
           and ar.flow_id = pnu_numr_apex;

    /*select pr.seqnc
      into vnu_page_regn
      from vd_afw_21_plugn_arbre pa, vd_afw_13_page_regn pr, vd_afw_13_page p, vd_afw_11_aplic a
     where pa.code = pva_code
       and pa.ref_page_regn = pr.seqnc
       and pr.ref_page = p.seqnc
       and p.numr_apex = pnu_numr_page_apex
       and p.ref_aplic = a.seqnc
       and a.seqnc = pnu_numr_apex;*/

    afw_12_arbre_pkg.rafrc_efect (vnu_page_regn
                                 ,pnu_utils);
  exception
    when others
    then
      ete ();
  end rafrc_efect;

  function obten_chemn_resrc_simpl_noeud (pnu_noeud            in number
                                         ,pva_formt_bals_img   in varchar2 default 'N')
    return varchar2
  is
    vva_resrc        varchar2 (60);
    vva_code_formt   varchar2 (23);
    vva_propr        varchar2 (11);
  begin
    select r.code
          ,fr.code
          ,case when r.ref_prodt is not null then 'PRODT' when r.ref_struc_aplic is not null then 'STRUC_APLIC' else 'PLUGN' end
      into vva_resrc
          ,vva_code_formt
          ,vva_propr
      from vd_afw_21_plugn_arbre_noeud pan
          ,vd_afw_21_plugn_arbre       pa
          ,vd_afw_13_formt_resrc       fr
          ,vd_afw_13_resrc             r
     where     pan.seqnc = pnu_noeud
           and pa.seqnc = pan.ref_plugn_arbre
           and fr.seqnc = pa.ref_formt_resrc
           and r.seqnc = pan.ref_resrc;

    if pva_formt_bals_img = 'N'
    then
      return afw_13_resrc_pkg.obten_chemn_resrc (vva_propr
                                                ,vva_resrc
                                                ,vva_code_formt);
    else
      return    '<img src="'
             || afw_13_resrc_pkg.obten_chemn_resrc (vva_propr
                                                   ,vva_resrc
                                                   ,vva_code_formt)
             || '" />';
    end if;
  end obten_chemn_resrc_simpl_noeud;

  --CONAL : revoir le fonctionnement avec la refonte
  procedure bascl_arbre_sesn (pnu_numr_apex_regn in number)
  is
    cursor cur_group_arbre_prodt (pnu_prodt              in number
                                 ,pnu_numr_apex_page     in number
                                 ,pva_code_plugn_arbre   in varchar2)
    is
      select ar.id id_page_regn
            ,pa.seqnc
        from vd_afw_11_prodt       pro
            ,vd_afw_11_aplic       ap
            ,apex_regn             ar
            ,vd_afw_21_plugn_arbre pa
            ,vd_afw_12_arbre       a
       where     pro.seqnc = ap.ref_prodt
             and pa.ref_prodt in (select ref_prodt
                                    from vd_afw_11_aplic
                                   where numr_aplic_apex = ar.flow_id)
             and pa.code = ar.attribute_05
             and pro.seqnc = pnu_prodt
             and ar.page_id = pnu_numr_apex_page
             and pa.code = pva_code_plugn_arbre
             and ar.id = a.id_apex_regn
             and ar.flow_id = ap.numr_aplic_apex
             and a.ref_sesn = afw_12_sesn_pkg.obten_sesn;

    vva_code_plugn_arbre   vd_afw_21_plugn_arbre.code%type;
    vnu_prodt              vd_afw_11_aplic.seqnc%type;
    vnu_numr_apex_page     vd_afw_13_page.numr_apex%type;
    rec_confg_plugn        afw_21_plugn_arbre_pkg.typ_rec_confg_plugn;
    vva_valr_noeud_actif   vd_afw_12_arbre.noeud_actif%type;
  begin
    --vérifier si présence darbre pour la session
    if afw_12_arbre_pkg.verfr_presn_sesn
    then
      --On veut basculer vers pnu_numr_apex_regn
      --trouver le code du plugin correspondant à la région
      select pro.seqnc
            ,p.numr_apex
            ,pa.code
        into vnu_prodt
            ,vnu_numr_apex_page
            ,vva_code_plugn_arbre
        from vd_afw_11_prodt       pro
            ,vd_afw_11_aplic       ap
            ,vd_afw_13_page        p
            ,vd_afw_21_plugn_arbre pa
            ,apex_regn             ar
       where     ar.id = pnu_numr_apex_regn
             and pro.seqnc = ap.ref_prodt
             and ap.seqnc = p.ref_aplic
             and p.numr_apex = ar.page_id
             and ap.numr_aplic_apex = ar.flow_id
             and pa.code = ar.attribute_05
             and pa.ref_prodt = pro.seqnc;

      for rec_group_arbre_prodt in cur_group_arbre_prodt (vnu_prodt
                                                         ,vnu_numr_apex_page
                                                         ,vva_code_plugn_arbre)
      loop
        vva_valr_noeud_actif   := afw_12_arbre_pkg.obten_noeud_actif;

        update vd_afw_12_arbre
           set id_apex_regn   = pnu_numr_apex_regn
              ,noeud_actif      =
                 case
                   when vva_valr_noeud_actif is null
                   then
                     null
                   else
                        'R'
                     || rec_group_arbre_prodt.seqnc
                     || substr (vva_valr_noeud_actif
                               ,instr (vva_valr_noeud_actif
                                      ,'_'))
                 end
         where     ref_sesn = afw_12_sesn_pkg.obten_sesn
               and id_apex_regn = rec_group_arbre_prodt.id_page_regn;

        if sql%found
        then
          --Ne devrait avoir qu'une seule ligne
          select noeud_actif
            into vva_valr_noeud_actif
            from vd_afw_12_arbre
           where     ref_sesn = afw_12_sesn_pkg.obten_sesn
                 and id_apex_regn = pnu_numr_apex_regn
                 and rownum <= 1;

          afw_07_sesn_pkg.defnr_valr_sesn (afw_21_plugn_arbre_pkg.kva_s_noeud_actif
                                          ,vva_valr_noeud_actif);
        end if;
      end loop;
    end if;
  end bascl_arbre_sesn;

  procedure creer_noeud_deft (pnu_seqnc in number)
  is
  begin
    insert into afw_21_plugn_arbre_noeud pan (code
                                             ,nom
                                             ,descr
                                             ,ref_plugn_arbre
                                             ,dnr_ref_prodt)
      select 'DEFT'
            ,'Défaut'
            ,'Le type par défaut s''affiche comme un répertoire'
            ,pnu_seqnc
            ,pa.ref_prodt
        from vd_i_afw_21_plugn_arbre pa
       where pa.seqnc = pnu_seqnc;
  end;
end afw_21_plugn_arbre_pkg;
/
