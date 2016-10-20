SET DEFINE OFF;
create or replace package body afw_01_destn_evenm_notfb_pkg
is
  --Constantes pour envoi courriel
  knu_postn_coln_adres_formt   constant pls_integer default 1;
  knu_postn_coln_nom_formt     constant pls_integer default 2;

  function resdr (pnu_seqnc_destn_confg   in number
                 ,pnu_seqnc_struc_aplic   in number)
    return afw_01_destn_evenm_notfb_pkg.gta_destn
  is
    cursor cur_destn
    is
      select dc.ref_atrib_sa_nom_formt
            ,rd.ident_acces
            ,tc.code            code_type_comnc
            ,asa.nom_coln       nom_coln_adres
            ,en.ref_struc_aplic ref_struc_aplic
        from vd_afw_01_destn_confg_en    dc
            ,vd_afw_01_reslt_destn       rd
            ,vd_afw_01_confg_evenm_notfb cen
            ,vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_01_type_comnc        tc
            ,vd_afw_01_evenm_notfb       en
       where     dc.seqnc = pnu_seqnc_destn_confg
             and dc.ref_confg_evenm_notfb = cen.seqnc
             and dc.ref_reslt_destn = rd.seqnc
             and asa.seqnc = dc.ref_atrib_sa_adres_destn
             and tc.seqnc = cen.ref_type_comnc
             and en.seqnc = cen.ref_evenm_notfb;

    rec_destn         cur_destn%rowtype;

    vre_destn         gty_destn;

    vva_nom_coln      varchar2 (30);

    vta_destn         gta_destn default gta_destn ();

    vta_nom_coln      apex_application_global.vc_arr2;
    vta_liste_subst   afw_07_sql_pkg.typ_liste_subst;

    vta_liste_destn   afw_07_sql_pkg.typ_coln_valr;
  begin
    open cur_destn;

    fetch cur_destn
      into rec_destn;

    close cur_destn;

    if rec_destn.code_type_comnc = 'COURL'
    then
      --      vre_destn.adres_destn      :=
      --        afw_12_struc_aplic_cu_pkg.resdr_elemn (rec_destn.ref_struc_aplic
      --                                              ,pnu_seqnc_struc_aplic
      --                                              ,   rec_destn.ident_acces
      --                                               || '.'
      --                                               || rec_destn.nom_coln_adres);

      --Ca prend le nom aussi en Courriel
      select nom_coln
        into vva_nom_coln
        from vd_afw_12_atrib_struc_aplic asa
       where asa.seqnc = rec_destn.ref_atrib_sa_nom_formt;

      --      vre_destn.nom_formt      :=
      --        afw_12_struc_aplic_cu_pkg.resdr_elemn (rec_destn.ref_struc_aplic
      --                                              ,pnu_seqnc_struc_aplic
      --                                              ,   rec_destn.ident_acces
      --                                               || '.'
      --                                               || vva_nom_coln);
      vta_liste_subst (1).vva_valr                := pnu_seqnc_struc_aplic;
      vta_liste_subst (1).vva_nom                 := 'cle';
      vta_nom_coln (knu_postn_coln_adres_formt)   := rec_destn.nom_coln_adres;
      vta_nom_coln (knu_postn_coln_nom_formt)     := vva_nom_coln;

      vta_liste_destn                             :=
        afw_12_struc_aplic_cu_pkg.resdr_tabl_elemn (rec_destn.ref_struc_aplic
                                                   ,pnu_seqnc_struc_aplic
                                                   ,rec_destn.ident_acces
                                                   ,vta_nom_coln
                                                   ,vta_liste_subst);

      vta_destn.extend (vta_liste_destn.vnu_nombr_ligne);

      --Pour chaque ligne
      for vnu_ligne in 1 .. vta_liste_destn.vnu_nombr_ligne
      loop
        --Déterminer les adresses courriels
        --        ete ('vta_liste_destn i'
        --            ,vnu_ligne);
        --        ete ('adres_destn'
        --            ,vta_liste_destn.vta_liste_coln_valr (knu_postn_coln_adres_formt) (vnu_ligne));
        --        ete ('nom_formt'
        --            ,vta_liste_destn.vta_liste_coln_valr (knu_postn_coln_nom_formt) (vnu_ligne));

        vta_destn (vnu_ligne).nom_formt     := vta_liste_destn.vta_liste_coln_valr (knu_postn_coln_nom_formt) (vnu_ligne);
        vta_destn (vnu_ligne).adres_destn   := vta_liste_destn.vta_liste_coln_valr (knu_postn_coln_adres_formt) (vnu_ligne);
      end loop;
    --raise no_data_found;
    elsif rec_destn.code_type_comnc = 'SMS'
    then
      --      vre_destn.numr_telph_destn      :=
      --        afw_12_struc_aplic_cu_pkg.resdr_elemn (rec_destn.ref_struc_aplic
      --                                              ,pnu_seqnc_struc_aplic
      --                                              ,   rec_destn.ident_acces
      --                                               || '.'
      --                                               || rec_destn.nom_coln_adres);

      null;
    end if;

    return vta_destn;
  exception
    when others
    then
      ete ();
      afw_03_journ_pkg.ecrir_journ ('resdr');
      raise;
  end resdr;
end afw_01_destn_evenm_notfb_pkg;
/
