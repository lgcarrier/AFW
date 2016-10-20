SET DEFINE OFF;
create or replace package body afw_12_scenr_notfc_cu_pkg
as
  kva_ident_struc_aplic   constant varchar2 (30) default '^STRUC_ACCES$';
  kva_ident_coln_afect    constant varchar2 (30) default '^COLN_AFECT$';
  kva_ident_valr_afect    constant varchar2 (30) default '^VALR_AFECT$';
  kva_ident_seqnc_afect   constant varchar2 (30) default '^SEQNC_AFECT$';
  kva_resdr_updat_stat    constant varchar2 (4000)
                                     default    'update '
                                             || kva_ident_struc_aplic
                                             || '
           set '
                                             || kva_ident_coln_afect
                                             || ' = '
                                             || kva_ident_valr_afect
                                             || '
         where seqnc = '
                                             || kva_ident_seqnc_afect ;

  gnu_seqnc_scenr_notfc            vd_afw_12_scenr_notfc.seqnc%type default null;

  gva_code_scenr_notfc             vd_afw_12_scenr_notfc.code%type default null;
  gva_code_prodt                   vd_afw_11_prodt.code%type default null;
  gva_code_struc_aplic             vd_afw_12_struc_aplic.code%type default null;
  gva_nom_coln                     vd_afw_12_atrib_struc_aplic.nom_coln%type default null;
  gnu_struc_aplic                  vd_afw_12_struc_aplic.seqnc%type default null;
  gnu_seqnc_struc_aplic            number;
  gnu_seqnc_struc_aplic_actio      number;
  gnu_seqnc_domn                   vd_afw_12_domn.seqnc%type;
  gbo_lancr_maj_actio              boolean default true;


  cursor cur_insta
  is
    select isn.seqnc
          ,isn.ref_scenr_notfc_actio seqnc_actio
      from vd_afw_12_insta_scenr_notfc isn
          ,vd_afw_12_atrib_scenr_notfc asn
          ,vd_afw_12_scenr_notfc       sn
          ,vd_afw_12_atrib_struc_aplic asa
     where     isn.ref_atrib_scenr_notfc = asn.seqnc
           and asn.ref_scenr_notfc = sn.seqnc
           and isn.indic_notfr = 'O'
           and sn.seqnc = gnu_seqnc_scenr_notfc
           and isn.ref_domn = gnu_seqnc_domn
           and asn.ref_atrib_struc_aplic = asa.seqnc
           and asa.nom_coln = gva_nom_coln;

  rec_insta                        cur_insta%rowtype;

  procedure initl_reslt (pva_code_prodt                in vd_afw_11_prodt.code%type
                        ,pva_code_scenr_notfc          in vd_afw_12_scenr_notfc.code%type
                        ,pva_code_struc_aplic          in vd_afw_12_struc_aplic.code%type
                        ,pnu_seqnc_struc_aplic         in number
                        ,pva_code_domn                 in vd_afw_12_domn.code%type
                        ,pva_nom_coln                  in vd_afw_12_atrib_struc_aplic.nom_coln%type
                        ,pnu_seqnc_struc_aplic_actio   in number)
  is
  begin
    gva_code_scenr_notfc          := pva_code_scenr_notfc;
    gva_code_prodt                := pva_code_prodt;
    gva_code_struc_aplic          := pva_code_struc_aplic;
    gnu_struc_aplic               := afw_12_struc_aplic_pkg.obten_seqnc (gva_code_struc_aplic);
    gva_nom_coln                  := pva_nom_coln;

    gnu_seqnc_struc_aplic         := pnu_seqnc_struc_aplic;
    gnu_seqnc_struc_aplic_actio   := pnu_seqnc_struc_aplic_actio;

    gnu_seqnc_scenr_notfc         := afw_12_scenr_notfc_pkg.obten_seqnc (pva_code_scenr_notfc);
    gnu_seqnc_domn                := afw_12_domn_pkg.obten_seqnc_domn (pva_code_domn);
  --    ete('gva_code_scenr_notfc',gva_code_scenr_notfc);
  --    ete('gva_code_prodt',gva_code_prodt);
  --    ete('gva_code_struc_aplic',gva_code_struc_aplic);
  --    ete('gnu_struc_aplic',gnu_struc_aplic);
  --    ete('gva_nom_coln',gva_nom_coln);
  --    ete('gnu_seqnc_struc_aplic',gnu_seqnc_struc_aplic);
  --    ete('gnu_seqnc_scenr_notfc',gnu_seqnc_scenr_notfc);
  --    ete('gnu_seqnc_struc_aplic',gnu_seqnc_struc_aplic);
  --    ete('gnu_seqnc_domn',gnu_seqnc_domn);
  end initl_reslt;

  procedure inser_log (pnu_insta in vd_afw_12_insta_scenr_notfc.seqnc%type)
  is
    vnu_utils   vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct ();
  begin
    afw_12_insta_sn_log_pkg.inser_scenr_notfc_logs (vnu_utils
                                                   ,gnu_struc_aplic
                                                   ,gnu_seqnc_struc_aplic
                                                   ,pnu_insta);
  end inser_log;

  procedure resdr_scenr_notfc_actio (pnu_seqnc_actio in vd_afw_12_scenr_notfc_actio.seqnc%type)
  is
    vnu_struc_aplic         number (10) default null;
    vnu_stat                number (10) default null;
    vnu_atrib_struc_aplic   number (10) default null;

    vnu_evenm_notfb         number (10) default null;

    procedure resdr_updat_stat
    is
      vva_struc_acces         vd_afw_12_struc_aplic.nom_struc_acces_don%type;
      vva_atrib_struc_acces   vd_afw_12_atrib_struc_aplic.nom_coln%type;

      vva_exect               varchar2 (4000) default null;
    begin
      --Suppose que la structure d'acc¿est updatable
      select nom_struc_acces_don
        into vva_struc_acces
        from vd_afw_12_struc_aplic sa
       where sa.seqnc = vnu_struc_aplic;

      vva_atrib_struc_acces   := afw_12_struc_aplic_pkg.obten_nom_coln_atrib (vnu_atrib_struc_aplic);

      vva_exect               :=
        replace (replace (replace (replace (kva_resdr_updat_stat
                                           ,kva_ident_struc_aplic
                                           ,vva_struc_acces)
                                  ,kva_ident_coln_afect
                                  ,vva_atrib_struc_acces)
                         ,kva_ident_valr_afect
                         ,vnu_stat)
                ,kva_ident_seqnc_afect
                ,gnu_seqnc_struc_aplic_actio);

      execute immediate vva_exect;
    end resdr_updat_stat;

    procedure resdr_evenm_notfb
    is --TODO LG :D
    begin
      null;
    end resdr_evenm_notfb;
  begin
    select ref_struc_aplic_stat
          ,ref_stat
          ,ref_evenm_notfb
          ,ref_atrib_struc_aplic_stat
      into vnu_struc_aplic
          ,vnu_stat
          ,vnu_evenm_notfb
          ,vnu_atrib_struc_aplic
      from vd_afw_12_scenr_notfc_actio
     where seqnc = pnu_seqnc_actio;

    case
      when     vnu_struc_aplic is not null
           and vnu_stat is not null
           and vnu_atrib_struc_aplic is not null
           and gbo_lancr_maj_actio
      then
        resdr_updat_stat;
      when vnu_evenm_notfb is not null
      then
        resdr_evenm_notfb;
      else
        null;
    end case;
  exception
    when no_data_found
    then
      ete ('Action non trouv¿ prochaine action.');
  end resdr_scenr_notfc_actio;

  procedure resdr_insta
  is
    vnu_insta   vd_afw_12_insta_scenr_notfc.seqnc%type default rec_insta.seqnc;
  begin
    --Produire action
    resdr_scenr_notfc_actio (afw_12_insta_scenr_notfc_pkg.obten_actio (vnu_insta));

    --Logger la r¿lution
    inser_log (vnu_insta);
  end resdr_insta;

  procedure resdr_scenr_notfc (pva_code_prodt                in vd_afw_11_prodt.code%type
                              ,pva_code_scenr_notfc          in vd_afw_12_scenr_notfc.code%type
                              ,pva_code_struc_aplic          in vd_afw_12_struc_aplic.code%type
                              ,pva_code_atrib_struc_aplic    in vd_afw_12_atrib_struc_aplic.nom_coln%type
                              ,pnu_seqnc_struc_aplic         in number
                              ,pnu_seqnc_struc_aplic_actio   in number default null
                              ,pva_code_domn                 in vd_afw_12_domn.code%type default afw_12_domn_pkg.obten_code_domn_sesn
                              ,pbo_lancr_maj_actio           in boolean default true)
  is
  begin
    --Initialiser
    gbo_lancr_maj_actio   := pbo_lancr_maj_actio;
    initl_reslt (pva_code_prodt
                ,pva_code_scenr_notfc
                ,pva_code_struc_aplic
                ,pnu_seqnc_struc_aplic
                ,pva_code_domn
                ,pva_code_atrib_struc_aplic
                ,pnu_seqnc_struc_aplic_actio);

    --Obtenir l'ensemble des instances ¿¿udre
    open cur_insta;

    fetch cur_insta
      into rec_insta;

    while cur_insta%found
    loop
      resdr_insta;

      fetch cur_insta
        into rec_insta;
    end loop;

    close cur_insta;
  exception
    when others
    then
      ete ();

      if cur_insta%isopen
      then
        close cur_insta;
      end if;
  end resdr_scenr_notfc;
end afw_12_scenr_notfc_cu_pkg;
/
