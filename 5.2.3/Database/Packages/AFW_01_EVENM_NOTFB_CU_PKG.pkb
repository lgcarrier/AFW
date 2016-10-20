SET DEFINE OFF;
create or replace package body afw_01_evenm_notfb_cu_pkg
as
  type typ_valr is record
  (
    vnu_valr   number
   ,vva_valr   varchar2 (4000)
   ,vda_date   date
  );

  type type_rec_aplic is record
  (
    seqnc                number (10)
   ,nom_struc_acces      varchar2 (30)
   ,nom_alias            varchar2 (2)
   ,nom_coln_forgn_key   varchar2 (30)
  );

  type typ_chemn is table of type_rec_aplic
    index by pls_integer;

  type typ_rec_elemn_subst is record
  (
    code_elemn          varchar2 (100)
   ,chemn_acces_reslt   varchar2 (4000)
  );

  type typ_tab_elemn_subst is table of typ_rec_elemn_subst
    index by pls_integer;

  exc_aucun_destn   exception;

  function valr_null (pre_valr in typ_valr)
    return boolean
  is
  begin
    if     pre_valr.vva_valr is null
       and pre_valr.vnu_valr is null
       and pre_valr.vda_date is null
    then
      return true;
    else
      return false;
    end if;
  end valr_null;

  function resdr_chemn_acces (pnu_seqnc_initl   in     number
                             ,pta_chemn         in out typ_chemn)
    return typ_valr
  is
    vre_valr                 typ_valr;
    vva_nom_struc_acces      varchar2 (30);
    vva_nom_coln_forgn_key   varchar2 (30);
    vva_sql                  varchar2 (32767);
  begin
    for i in pta_chemn.first () .. pta_chemn.last ()
    loop
      if pta_chemn (i).nom_struc_acces is null
      then
        --Obtenir le nom de la structure d'accès de l'application et des colonnes de résolution
        select sa.nom_struc_acces_don
              ,asa_fk.nom_coln
          into pta_chemn (i).nom_struc_acces
              ,pta_chemn (i - 1).nom_coln_forgn_key
          from vd_afw_12_atrib_struc_aplic asa_fk
              ,vd_afw_12_atrib_struc_aplic asa
              ,vd_afw_12_struc_aplic       sa
              ,vd_afw_01_hierc_aplic       ha
         where     asa_fk.seqnc = ha.ref_atrib_struc_aplic
               and asa.ref_struc_aplic = sa.seqnc
               and asa.seqnc = asa_fk.ref_atrib_struc_aplic
               and ha.seqnc = pta_chemn (i).seqnc;

        pta_chemn (i).nom_alias   := chr (64 + i);
      end if;
    end loop;

    --Résoudre, passer toutes les applications et énoncer un SQL obtenant la valeur
    vva_sql      :=
         'select '
      || pta_chemn (pta_chemn.last ()).nom_alias
      || '.seqnc '
      || chr (10)
      || 'from ';

    for i in pta_chemn.first () .. pta_chemn.last ()
    loop
      vva_sql      :=
           vva_sql
        || pta_chemn (i).nom_struc_acces
        || ' '
        || pta_chemn (i).nom_alias
        || ', ';
    end loop;

    vva_sql      :=
         substr (vva_sql
                ,1
                ,length (vva_sql) - 2)
      || chr (10)
      || 'where a.seqnc = :pnu_seqnc_initl ';

    for i in pta_chemn.first () + 1 .. pta_chemn.last ()
    loop
      vva_sql      :=
           vva_sql
        || 'and '
        || pta_chemn (i).nom_alias
        || '.seqnc = '
        || pta_chemn (i - 1).nom_alias
        || '.'
        || pta_chemn (i - 1).nom_coln_forgn_key
        || ' ';
    end loop;

    begin
      execute immediate vva_sql into vre_valr.vnu_valr using pnu_seqnc_initl;
    exception
      when no_data_found
      then
        return vre_valr;
    end;

    return vre_valr;
  end resdr_chemn_acces;

  /*
        function resdr_chemn_acces (pnu_seqnc_evenm_notfb   in number,
                                pnu_seqnc_initl         in number,
                                pva_chemn               in varchar2)
      return typ_valr is
    begin
      null;
    end resdr_chemn_acces;*/

  function resdr_ocurn_destn (pnu_seqnc_destn_confg   in number
                             ,pnu_seqnc_struc_aplic   in number)
    return afw_01_destn_evenm_notfb_pkg.gta_destn
  is
  begin
    return afw_01_destn_evenm_notfb_pkg.resdr (pnu_seqnc_destn_confg
                                              ,pnu_seqnc_struc_aplic);
  end resdr_ocurn_destn;

  procedure notfc_sms (pnu_confg_evenm_notfb   in number
                      ,pta_destn               in typ_tab_destn
                      ,pva_mesg                in varchar2)
  is
  begin
    afw_01_notfc_pkg.notfc_sms (pnu_confg_evenm_notfb
                               ,pta_destn
                               ,pva_mesg);
  end notfc_sms;

  procedure notfc_courl (pnu_confg_evenm_notfb   in number
                        ,pta_destn               in typ_tab_destn
                        ,pcl_mesg                in clob
                        ,pva_objet               in varchar2
                        ,pta_piec_joint          in typ_tab_piec_joint)
  is
  begin
    afw_01_notfc_pkg.notfc_courl (pnu_confg_evenm_notfb
                                 ,pta_destn
                                 ,pcl_mesg
                                 ,pva_objet
                                 ,pta_piec_joint);
  end notfc_courl;

  procedure apliq_confg (pnu_confg               in number
                        ,pnu_seqnc_struc_aplic   in number
                        ,pnu_lang                in number)
  is
    vta_elemn_subst         typ_tab_elemn_subst;

    cursor cur_mesg
    is
      select cenl.objet
            ,cenl.mesg
            ,cenl.mesg_sms
            , (select en.ref_struc_aplic
                 from vd_afw_01_evenm_notfb en
                where en.seqnc = ref_evenm_notfb)
               ref_struc_aplic
            ,ref_type_comnc_code_formt
            ,ref_evenm_notfb
            , (select case pc.indic_envir_sujet
                        when 'O'
                        then
                             p.ident_envir
                          || ' - '
                        else
                          null
                      end
                        objet_exten
                 from vd_afw_17_profl_courl pc
                     ,vd_afw_01_evenm_notfb en
                     ,vd_afw_11_prodt       p
                where     cen.ref_profl_courl = pc.seqnc
                      and cen.ref_evenm_notfb = en.seqnc
                      and en.ref_prodt = p.seqnc)
               objet_exten
        from vd_afw_01_confg_evenm_n_lang cenl
            ,vd_afw_01_confg_evenm_notfb  cen
       where     cenl.ref_lang = pnu_lang
             and cenl.ref_confg_evenm_notfb = cen.seqnc
             and cen.seqnc = pnu_confg;

    rec_mesg                cur_mesg%rowtype;

    cursor cur_destn
    is
      select d.seqnc
            ,dc.seqnc seqnc_destn_confg_en
            ,rd.ident_acces
            ,ref_atrib_sa_nom_formt_code
            ,ref_atrib_sa_adres_destn_code
            ,ref_dv_natr_destn_code
        from vd_afw_01_reslt_destn       rd
            ,vd_afw_01_destn             d
            ,vd_afw_01_destn_confg_en    dc
            ,vd_afw_01_evenm_notfb       en
            ,vd_afw_01_confg_evenm_notfb cen
       where     rd.ref_struc_aplic_acces = en.ref_struc_aplic
             and rd.ref_destn = d.seqnc
             and d.seqnc = dc.ref_destn
             and rd.seqnc = dc.ref_reslt_destn
             and dc.ref_confg_evenm_notfb = cen.seqnc
             and en.seqnc = cen.ref_evenm_notfb
             and cen.seqnc = pnu_confg;

    rec_destn               cur_destn%rowtype;
    vta_destn               typ_tab_destn;
    vta_piec_joint          typ_tab_piec_joint;
    vnu_indic_debut_valr    pls_integer;
    vnu_indic_fin_valr      pls_integer;
    vva_elemn               varchar2 (4000);
    vva_mesg_sms_formt      varchar2 (160);
    vva_objet_formt         varchar2 (4000);
    vcl_mesg_formt          clob;
    vre_destn_evenm_notfb   afw_01_destn_evenm_notfb_pkg.gty_destn;
    vta_destn_evenm_notfb   afw_01_destn_evenm_notfb_pkg.gta_destn;
    vnu_index               pls_integer;

    procedure extra_subst_corps
    is
    begin
      if dbms_lob.getlength (rec_mesg.mesg) > 0
      then
        vnu_indic_debut_valr      :=
          dbms_lob.instr (rec_mesg.mesg
                         ,'[#');

        --Déterminer tous les éléments à sélectionner dans les références
        while vnu_indic_debut_valr > 0
        loop
          --Déterminer la fin de la substitution
          vnu_indic_fin_valr      :=
            dbms_lob.instr (rec_mesg.mesg
                           ,'#]'
                           ,vnu_indic_debut_valr);

          if    vnu_indic_fin_valr = 0
             or vnu_indic_fin_valr - vnu_indic_debut_valr > 102
          then
            --Ce n'est pas une réelle valeur de substitution, il faut chercher plus loin
            --ou la valeur est plus large que 100
            null;
          else
            vta_elemn_subst (vta_elemn_subst.count ()).code_elemn      :=
              dbms_lob.substr (rec_mesg.mesg
                              ,vnu_indic_fin_valr - vnu_indic_debut_valr + 2
                              ,vnu_indic_debut_valr);
          end if;

          vnu_indic_debut_valr      :=
            dbms_lob.instr (rec_mesg.mesg
                           ,'[#'
                           ,vnu_indic_debut_valr + 1);
        end loop;
      end if;
    end extra_subst_corps;

    procedure resdr_subst_corps
    is
    begin
      --Résoudre les substitutions
      if vta_elemn_subst.count () != 0
      then
        for i in vta_elemn_subst.first .. vta_elemn_subst.last
        loop
          begin
            select ident_acces
              into vva_elemn
              from vd_afw_01_elemn_confg_en
             where     code = substr (vta_elemn_subst (i).code_elemn
                                     ,3
                                     ,length (vta_elemn_subst (i).code_elemn) - 4)
                   and ref_confg_evenm_notfb = pnu_confg;

            vva_elemn      :=
              afw_12_struc_aplic_cu_pkg.resdr_elemn (rec_mesg.ref_struc_aplic
                                                    ,pnu_seqnc_struc_aplic
                                                    ,vva_elemn);

            afw_07_clob_pkg.replc (vcl_mesg_formt
                                  ,vta_elemn_subst (i).code_elemn
                                  ,vva_elemn);
          exception
            when no_data_found
            then
              -- On en trouve pas comment remplacer un élément de substitution
              null;
            when others
            then
              null;
          end;
        end loop;
      end if;
    end resdr_subst_corps;

    procedure extra_subst_texte (pva_texte in out varchar2)
    is
    begin
      --Déterminer tous les éléments à sélectionner dans les références

      vnu_indic_debut_valr      :=
        instr (pva_texte
              ,'[#');

      while vnu_indic_debut_valr > 0
      loop
        --Déterminer la fin de la substitution
        vnu_indic_fin_valr      :=
          instr (pva_texte
                ,'#]'
                ,vnu_indic_debut_valr);

        if vnu_indic_fin_valr = 0
        then
          exit;
        else
          vta_elemn_subst (vta_elemn_subst.count ()).code_elemn      :=
            substr (pva_texte
                   ,vnu_indic_debut_valr
                   ,vnu_indic_fin_valr - vnu_indic_debut_valr + 2);
        end if;

        vnu_indic_debut_valr      :=
          instr (pva_texte
                ,'[#'
                ,vnu_indic_debut_valr + 2);
      end loop;
    end extra_subst_texte;

    procedure resdr_subst_texte (pva_texte in out varchar2)
    is
    begin
      --Résoudre les substitutions
      for i in vta_elemn_subst.first .. vta_elemn_subst.last
      loop
        begin
          select ident_acces
            into vva_elemn
            from vd_afw_01_elemn_confg_en
           where     code = substr (vta_elemn_subst (i).code_elemn
                                   ,3
                                   ,length (vta_elemn_subst (i).code_elemn) - 4)
                 and ref_confg_evenm_notfb = pnu_confg;

          vva_elemn      :=
            afw_12_struc_aplic_cu_pkg.resdr_elemn (rec_mesg.ref_struc_aplic
                                                  ,pnu_seqnc_struc_aplic
                                                  ,vva_elemn);
          pva_texte      :=
            replace (pva_texte
                    ,vta_elemn_subst (i).code_elemn
                    ,vva_elemn);
        exception
          when no_data_found
          then
            -- On en trouve pas comment remplacer un élément de substitution
            null;
        end;
      end loop;
    end resdr_subst_texte;
  begin
    -- Obtenir le message et l'objet
    open cur_mesg;

    fetch cur_mesg
      into rec_mesg;

    close cur_mesg;

    op (   'La configuration est du type "'
        || nvl (rec_mesg.ref_type_comnc_code_formt, 'NULL')
        || '"');

    if rec_mesg.ref_type_comnc_code_formt in ('COURL'
                                             ,'ECRAN')
    then
      dbms_lob.createtemporary (vcl_mesg_formt
                               ,true);
      dbms_lob.copy (vcl_mesg_formt
                    ,rec_mesg.mesg
                    ,dbms_lob.getlength (rec_mesg.mesg));

      extra_subst_corps;
      resdr_subst_corps;

      vva_objet_formt      :=
           rec_mesg.objet_exten
        || rec_mesg.objet;
      extra_subst_texte (rec_mesg.objet);
      resdr_subst_texte (vva_objet_formt);

      op (   'pnu_seqnc_struc_aplic= '
          || pnu_seqnc_struc_aplic);
      op (   'pnu_confg= '
          || pnu_confg);

      -- Obtenir les destinataires
      vnu_index   := 0;

      for rec_destn in cur_destn
      loop
        vta_destn_evenm_notfb      :=
          afw_01_destn_evenm_notfb_pkg.resdr (rec_destn.seqnc_destn_confg_en
                                             ,pnu_seqnc_struc_aplic);

        for i in 1 .. vta_destn_evenm_notfb.count
        loop
          if vta_destn_evenm_notfb (i).adres_destn is not null
          then
            vnu_index                           := vnu_index + 1;
            --TODO ACONSIGNY (Changer pour construire une liste complète de destinataires ) => rec_destn.seqnc_destn_confg_en par i
            vta_destn (vnu_index).type_destn    := rec_destn.ref_dv_natr_destn_code;

            vta_destn (vnu_index).nom_formt     := vta_destn_evenm_notfb (i).nom_formt;
            vta_destn (vnu_index).adres_courl   := vta_destn_evenm_notfb (i).adres_destn;

            op ('rec_destn.seqnc_destn_confg_en'
               ,rec_destn.seqnc_destn_confg_en);
            op ('rec_destn.ref_dv_natr_destn_code'
               ,rec_destn.ref_dv_natr_destn_code);
            op ('vta_destn_evenm_notfb (i).nom_formt'
               ,vta_destn_evenm_notfb (i).nom_formt);
            op ('vta_destn_evenm_notfb (i).adres_destn'
               ,vta_destn_evenm_notfb (i).adres_destn);
          end if;
        end loop;
      end loop;

      op (   vta_destn.count ()
          || ' destinataire(s) recevront le message');

      -- Envoyer le courriel
      if vta_destn.count () = 0
      then
        raise exc_aucun_destn;
      end if;

      notfc_courl (pnu_confg
                  ,vta_destn
                  ,vcl_mesg_formt
                  ,vva_objet_formt
                  ,vta_piec_joint);
    elsif rec_mesg.ref_type_comnc_code_formt = 'SMS'
    then
      vva_mesg_sms_formt   := rec_mesg.mesg_sms;

      extra_subst_texte (rec_mesg.mesg_sms);
      resdr_subst_texte (vva_mesg_sms_formt);

      --Obtenir les destinataires
      for rec_destn in cur_destn
      loop
        vta_destn_evenm_notfb      :=
          afw_01_destn_evenm_notfb_pkg.resdr (rec_destn.seqnc_destn_confg_en
                                             ,pnu_seqnc_struc_aplic);

        for i in 1 .. vta_destn_evenm_notfb.count
        loop
          vta_destn (rec_destn.seqnc_destn_confg_en).numr_telph   := vta_destn_evenm_notfb (i).numr_telph_destn;
        end loop;
      end loop;

      --Envoyer le sms
      notfc_sms (pnu_confg
                ,vta_destn
                ,vva_mesg_sms_formt);
    end if;
  exception
    when exc_aucun_destn
    then
      op ('Aucun destinataire trouvé.  Aucun message créé.');
      afw_01_err_apex_pkg.lever_err_apex_code ('NTF.000001'
                                              ,pva_code_prodt   => 'AFW');
  end apliq_confg;

  function obten_confg_a_apliq (pnu_evenm_notfb         in varchar2
                               ,pnu_seqnc_struc_aplic   in number
                               ,pva_code_domn           in varchar2 default null)
    return number
  is
    vnu_struc_aplic_contx_anter   number (10);
    vnu_struc_aplic_contx_supr    number (10);
    vnu_struc_aplic_contx_initl   number (10);
    vnu_prior_aplic_courn         number;
    vta_chemn                     typ_chemn;
    vre_valr                      typ_valr;
    vnu_atrib_struc_aplic         number (10);
    vnu_hierc_aplic               number (10);
    vnu_confg                     number (10);
    vnu_domn                      number (10);
  begin
    --Il faut déterminer les applications à lancer, dans l'ordre
    --On veut les applications hiérarchiques, à partir du contexte initialement obtenu, en ordre de priorité.
    --Lors de la résolution, on ne prend que les cas où le champ en question n'est pas null et dont il existe une occurence dans la table des osa

    vnu_prior_aplic_courn         := -1;

    vta_chemn.delete ();
    vta_chemn (1).nom_alias       := 'A';

    --On déterminer la structure applicative initiale
    select sa.seqnc
          ,sa.nom_struc_acces_don
      into vnu_struc_aplic_contx_anter
          ,vta_chemn (1).nom_struc_acces
      from vd_afw_01_evenm_notfb en
          ,vd_afw_12_struc_aplic sa
     where     en.seqnc = pnu_evenm_notfb
           and sa.seqnc = en.ref_struc_aplic;

    vnu_struc_aplic_contx_initl   := vnu_struc_aplic_contx_anter;

    --Tenter de trouver une résolution (application de la hiérarchie);
    loop
      --Trouver une application utile au traitement
      begin
        select seqnc
              ,aplic_prior
              ,ref_atrib_struc_aplic
              ,ref_sa_cle_etran
          into vnu_hierc_aplic
              ,vnu_prior_aplic_courn
              ,vnu_atrib_struc_aplic
              ,vnu_struc_aplic_contx_supr
          from (select seqnc
                      ,ha.aplic_prior
                      ,row_number () over (order by aplic_prior asc) rn
                      ,ref_atrib_struc_aplic
                      ,ref_sa_cle_etran
                  from vd_afw_01_hierc_aplic ha
                 where     ha.ref_evenm_notfb = pnu_evenm_notfb
                       and ref_sa = vnu_struc_aplic_contx_anter
                       and ha.aplic_prior >= vnu_prior_aplic_courn)
         where rn = 1;

        --la colonne obtenue doit être non nulle et présenter une configuration pour
        --l'utiliser, si elle est nulle, chercher une nouvelle application hiérarchique au même niveau.
        --Si elle est non nulle chercher une configuration et l'appliquer. Si aucune
        --configuration trouvée, remonter d'un niveau hiérarchique et chercher
        --une nouvelle configuration

        --Résoudre (obtenir la valeur de l'application)

        vta_chemn (vta_chemn.count () + 1).seqnc   := vnu_hierc_aplic;
        vre_valr                                   :=
          resdr_chemn_acces (pnu_seqnc_struc_aplic
                            ,vta_chemn);

        --Vérifier si la colonne est nulle
        if not valr_null (vre_valr)
        then --Si not nulle
          --tenter de trouver une configuration
          begin
            select ref_confg_evenm_notfb
              into vnu_confg
              from vd_afw_01_osa_evenm_notfb osa
             where     ref_hierc_aplic = vnu_hierc_aplic
                   and ref_seqnc_struc_aplic = vre_valr.vnu_valr;

            --Trouvé, sortir
            exit;
          exception
            when no_data_found
            then
              --Aucune configuration, tenter de trouver une application hiérarchiquement supérieure
              begin
                select ref_sa
                  into vnu_struc_aplic_contx_anter
                  from vd_afw_01_hierc_aplic ha
                 where     ha.ref_evenm_notfb = pnu_evenm_notfb
                       and ref_sa = vnu_struc_aplic_contx_supr;

                vnu_prior_aplic_courn   := -1;
              exception
                when no_data_found
                then
                  vnu_prior_aplic_courn   := vnu_prior_aplic_courn + 1;
              end;
          end;
        else --Si nulle, passer à la prochaine priorité d'exécution
          vta_chemn.delete (vta_chemn.last ()); --Supprimer de la liste de résolution et passer au prochain
          vnu_prior_aplic_courn   := vnu_prior_aplic_courn + 1;
        end if;
      exception
        when no_data_found
        then
          --si on ne trouve pas, gil n'y a plus rien à chercher
          exit;
      end;
    end loop;

    if vnu_confg is null
    then
      begin
        if pva_code_domn is not null
        then
          vnu_domn   := afw_12_domn_pkg.obten_seqnc_domn (pva_code_domn);
        else
          vnu_domn   := afw_12_domn_pkg.obten_domn_sesn ();
        end if;

        select seqnc
          into vnu_confg
          from vd_afw_01_confg_evenm_notfb cen
         where     cen.ref_evenm_notfb = pnu_evenm_notfb
               and ref_domn = vnu_domn
               and cen.indic_deft = 'O'
               and rownum = 1;
      exception
        when no_data_found
        then
          null;
      end;
    end if;

    return vnu_confg;
  end obten_confg_a_apliq;

  procedure propg_evenm_notfb (pva_evenm_notfb         in varchar2
                              ,pnu_seqnc_struc_aplic   in number
                              ,pva_code_prodt          in varchar2 default null
                              ,pva_code_domn           in varchar2 default null
                              ,pnu_utils_tracr_histr   in number default null
                              ,pnu_lang                in number default null)
  is
    vnu_confg         number (10);
    vnu_prodt         number (10);
    vnu_evenm_notfb   number (10);
  begin
    --Obtenir la configuration à appliquer
    vnu_prodt   := nvl (afw_11_prodt_pkg.obten_prodt (pva_code_prodt), afw_11_prodt_pkg.obten_prodt_sesn);

    select en.seqnc
      into vnu_evenm_notfb
      from vd_afw_01_evenm_notfb en
          ,vd_afw_12_struc_aplic sa
     where     en.code = pva_evenm_notfb
           and en.ref_struc_aplic = sa.seqnc
           and sa.ref_prodt = vnu_prodt;

    --    ete ('vnu_evenm_notfb'
    --        ,vnu_evenm_notfb);

    vnu_confg      :=
      obten_confg_a_apliq (vnu_evenm_notfb
                          ,pnu_seqnc_struc_aplic
                          ,pva_code_domn);

    --    if vnu_confg is null
    --    then
    --      ete ('Aucune configuration n''a été trouvée');
    --    else
    --      ete (   'La configuration "'
    --          || vnu_confg
    --          || '" a été utilisée');
    --    end if;

    if vnu_confg is not null
    then
      apliq_confg (vnu_confg
                  ,pnu_seqnc_struc_aplic
                  ,nvl (pnu_lang, afw_11_prodt_pkg.obten_lang_deft (vnu_prodt)));
    end if;

    if pnu_utils_tracr_histr is not null
    then
      insert into vd_afw_01_propg_evenm_notfb (ref_evenm_notfb
                                              ,ref_seqnc_struc_aplic
                                              ,ref_utils)
           values (vnu_evenm_notfb
                  ,pnu_seqnc_struc_aplic
                  ,pnu_utils_tracr_histr);
    end if;
  exception
    when others
    then
      ete ();
      raise;
  end propg_evenm_notfb;
end afw_01_evenm_notfb_cu_pkg;
/
