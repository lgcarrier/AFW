SET DEFINE OFF;
create or replace package body afw_25_fusn_don_pkg
as
  vva_indic    varchar2 (50);
  vva_indic2   varchar2 (50);
  vva_indic3   varchar2 (50);

  procedure impri_don_trace (pob_don        typ_don_raprt
                            ,pbo_table   in boolean default false)
  is
    procedure ecrit_trace (pva_un     in varchar2
                          ,pva_deux   in varchar2)
    is
    begin
      if pbo_table
      then
        ete (pva_un
            ,nvl (pva_deux, '[--null--]'));
      else
        op (pva_un
           ,nvl (pva_deux, '[--null--]'));
      end if;
    end ecrit_trace;
  begin
    ecrit_trace ('Données scalaires'
                ,'---------------');
    vva_indic   := pob_don.don_scalr.first;

    while vva_indic is not null
    loop
      ecrit_trace (vva_indic
                  ,pob_don.don_scalr (vva_indic));

      vva_indic   := pob_don.don_scalr.next (vva_indic);
    end loop;



    if pob_don.don_tablr.count = 0
    then
      ecrit_trace ('Aucune donnée tabulaire'
                  ,'---------------');
    else
      ecrit_trace ('Données tabulaires'
                  ,'---------------');
      vva_indic   := pob_don.don_tablr.first;

      while vva_indic is not null
      loop
        ecrit_trace (   '--Section '
                     || vva_indic
                    ,   'Nombre de lignes de la section : '
                     || pob_don.don_tablr (vva_indic).lignes.count ());

        vva_indic2   := pob_don.don_tablr (vva_indic).lignes.first;

        while vva_indic2 is not null
        loop
          vva_indic3   := pob_don.don_tablr (vva_indic).lignes (vva_indic2).items.first;

          while vva_indic3 is not null
          loop
            ecrit_trace (vva_indic3
                        ,pob_don.don_tablr (vva_indic).lignes (vva_indic2).items (vva_indic3));
            vva_indic3   := pob_don.don_tablr (vva_indic).lignes (vva_indic2).items.next (vva_indic3);
          end loop;


          vva_indic2   := pob_don.don_tablr (vva_indic).lignes.next (vva_indic2);
        end loop;

        vva_indic    := pob_don.don_tablr.next (vva_indic);
      end loop;
    end if;
  end impri_don_trace;



  procedure exect_fusn (pnu_travl         in number
                       ,pnu_travl_publc   in number)
  is
    vva_code_type_publc    varchar2 (23);
    vva_code_publc         varchar2 (23);
    vva_code_plsql_prodt   varchar2 (4000);
    vnu_versn_publc        number (10);

    vva_iden_acces         varchar2 (500);
    vva_elemn_subst        varchar2 (32767);
    vcl_html_base          clob;
    vcl_docmn              clob;

    vbo_subst_efect        boolean default false;

    procedure obten_debut_fin_subst (pva_html    in out nocopy varchar2
                                    ,pnu_debut      out        pls_integer
                                    ,pnu_fin        out        pls_integer)
    is
    begin
      pnu_debut      :=
        instr (pva_html
              ,'##|');

      if pnu_debut > 0
      then
        pnu_fin      :=
            instr (pva_html
                  ,'|##'
                  ,pnu_debut)
          + 3;
      else
        return;
      end if;

      if pnu_fin = 0
      then
        pnu_debut   := 0;
      end if;
    end obten_debut_fin_subst;

    procedure rempl_valr (pcl_clob    in clob
                         ,pva_chain   in varchar2
                         ,pva_valr    in varchar2
                         ,pbl_img     in typ_img default null)
    is
    begin
      if pva_valr is null
      then
        afw_07_clob_pkg.replc (vcl_docmn
                              ,   '##|'
                               || pva_chain
                               || '|##'
                              ,pva_valr);
      else
        afw_07_clob_pkg.replc (vcl_docmn
                              ,   '##|'
                               || pva_chain
                               || '|##'
                              ,   '"data:'
                               || pbl_img.mime_type
                               || ';base64,#contn_base64#"');
        afw_07_clob_pkg.replc (vcl_docmn
                              ,'#contn_base64#'
                              ,null
                              ,afw_07_clob_pkg.encod_base64 (pbl_img.contn_binr));
      end if;
    end rempl_valr;

    procedure rempl_valr_tablr (pva_html    in out nocopy varchar2
                               ,pva_chain   in            varchar2
                               ,pva_valr    in            varchar2)
    is
    begin
      pva_html      :=
        replace (pva_html
                ,   '##|'
                 || pva_chain
                 || '|##'
                ,pva_valr);
    end rempl_valr_tablr;

    procedure obten_varbl_subst_versn_publc (pva_code_subst    in     varchar2
                                            ,pnu_versn_publc   in     number
                                            ,pva_valr_subst       out varchar2
                                            ,pva_type_subst       out varchar2)
    is
    begin
      select valr_subst
            ,type_subst
        into pva_valr_subst
            ,pva_type_subst
        from vd_i_afw_25_versn_publc_subst vps
       where     vps.ref_versn_publc = pnu_versn_publc
             and vps.code_subst = pva_code_subst;
    exception
      when no_data_found
      then
        null;
    end obten_varbl_subst_versn_publc;

    function exect_subst_recrs (pva_sectn         in varchar2
                               ,pva_html          in varchar2
                               ,pnu_versn_publc   in number
                               ,pva_iden_parnt    in varchar2 default null)
      return varchar2;

    function exect_subst_recrs (pva_sectn         in varchar2
                               ,pva_html          in varchar2
                               ,pnu_versn_publc   in number
                               ,pva_iden_parnt    in varchar2 default null)
      return varchar2
    is
      vva_elemn_base     varchar2 (4000);

      vnu_debut          pls_integer;
      vnu_fin            pls_integer;

      vva_code_subst     varchar2 (50);

      vva_retr           varchar2 (32767);
      vva_html_a_susbt   varchar2 (4000);
      vva_type_subst     varchar2 (23);
    begin
      if gob_don.don_tablr.exists (pva_sectn)
      then
        for i in 1 .. gob_don.don_tablr (pva_sectn).lignes.count
        loop
          --Ne traiter que les éléments correspondantes à l'occurence parent
          if pva_iden_parnt is not null
          then
            if gob_don.don_tablr (pva_sectn).lignes (i).iden_parnt = pva_iden_parnt
            then
              null;
            else
              continue;
            end if;
          end if;

          vva_elemn_base   := pva_html;
          obten_debut_fin_subst (vva_elemn_base
                                ,vnu_debut
                                ,vnu_fin);

          while vnu_debut > 0
          loop
            vva_code_subst      :=
              substr (vva_elemn_base
                     ,vnu_debut + 3
                     ,vnu_fin - vnu_debut - 6);
            --vérifier si variable existante dans la BD
            obten_varbl_subst_versn_publc (vva_code_subst
                                          ,pnu_versn_publc
                                          ,vva_html_a_susbt
                                          ,vva_type_subst);

            if vva_html_a_susbt is null
            then
              --substituer la portion scalaire de la donnée tabulaire
              rempl_valr_tablr (vva_elemn_base
                               ,vva_code_subst
                               ,gob_don.don_tablr (pva_sectn).lignes (i).items (vva_code_subst));
            else
              --Se rappeler pour gérer la continuité
              rempl_valr_tablr (vva_elemn_base
                               ,vva_code_subst
                               ,exect_subst_recrs (vva_code_subst
                                                  ,vva_html_a_susbt
                                                  ,gob_don.don_tablr (pva_sectn).lignes (i).iden));
            end if;

            obten_debut_fin_subst (vva_elemn_base
                                  ,vnu_debut
                                  ,vnu_fin);
          end loop;

          vva_retr         :=
               vva_retr
            || vva_elemn_base;
        end loop;
      end if;

      return vva_retr;
    end exect_subst_recrs;

    procedure exect_subst
    is
      vnu_debut        pls_integer;
      vnu_fin          pls_integer;

      vva_code_subst   varchar2 (50);
      vva_valr_subst   varchar2 (4000);
      vva_type_subst   varchar2 (23);
    begin
      --Trouver les variables de substitution
      vnu_debut      :=
        dbms_lob.instr (vcl_html_base
                       ,'##|');

      ete ('exécuter la substitution'
          ,vnu_debut);

      if vnu_debut != 0
      then
        dbms_lob.copy (vcl_docmn
                      ,vcl_html_base
                      ,dbms_lob.getlength (vcl_html_base));
      end if;

      while vnu_debut != 0
      loop
        vnu_fin      :=
          dbms_lob.instr (vcl_docmn
                         ,'|##'
                         ,vnu_debut);

        if vnu_fin > 0
        then
          vva_code_subst      :=
            lower (dbms_lob.substr (vcl_docmn
                                   ,vnu_fin - vnu_debut - 3
                                   ,vnu_debut + 3));
        else
          exit;
        end if;

        --Vérifier la présence dans la table de substitution
        obten_varbl_subst_versn_publc (vva_code_subst
                                      ,vnu_versn_publc
                                      ,vva_valr_subst
                                      ,vva_type_subst);

        if vva_valr_subst is null
        then
          --Remplacer dans le clob toutes les occurences de cette variable
          begin
            rempl_valr (vcl_docmn
                       ,vva_code_subst
                       ,gob_don.don_scalr (vva_code_subst));
          exception
            when no_data_found
            then
              ete (vva_code_subst
                  ,'Cette variable n''existe pas dans les données obtenues');
              rempl_valr (vcl_docmn
                         ,vva_code_subst
                         ,null);
          end;
        elsif     vva_elemn_subst is not null
              and vva_type_subst = 'HTML'
        then
          --Démarrer la re-substitution pour cette portion
          vva_elemn_subst      :=
            exect_subst_recrs (vva_code_subst
                              ,vva_valr_subst
                              ,vnu_versn_publc);
          rempl_valr (vcl_docmn
                     ,vva_code_subst
                     ,vva_elemn_subst);
        elsif     vva_elemn_subst is not null
              and vva_type_subst = 'IMAGE'
        then
          --gob_img
          null;
        end if;

        vnu_debut      :=
          dbms_lob.instr (vcl_docmn
                         ,'##|');
      end loop;
    exception
      when others
      then
        ete ();
        raise;
    end exect_subst;
  begin
    ete (1);

    select tp.code
          ,p.code
          ,pr.procd_initl_sesn
          ,vp.seqnc
      into vva_code_type_publc
          ,vva_code_publc
          ,vva_code_plsql_prodt
          ,vnu_versn_publc
      from vd_i_afw_25_type_publc  tp
          ,vd_i_afw_25_publc       p
          ,vd_i_afw_25_versn_publc vp
          ,vd_i_afw_25_publc_travl pt
          ,vd_i_afw_11_prodt       pr
     where     pt.seqnc = pnu_travl_publc
           and pt.ref_versn_publc = vp.seqnc
           and vp.ref_publc = p.seqnc
           and p.ref_type_publc = tp.seqnc
           and tp.dnr_ref_prodt = pr.seqnc;

    dbms_session.set_context ('AFW'
                             ,'pnu_travl'
                             ,pnu_travl);
    dbms_session.set_context ('AFW'
                             ,'pnu_travl_publc'
                             ,pnu_travl_publc);
    ete (1.2);

    --exécuter le code spécifique au produit
    if vva_code_plsql_prodt is not null
    then
      execute immediate vva_code_plsql_prodt;
    end if;

    --Alimenter la table temporaire de paramètres
    afw_25_travl_publc_pkg.defnr_contx_exect_raprt (pnu_travl
                                                   ,pnu_travl_publc
                                                   ,vva_code_type_publc
                                                   ,vva_code_publc);
    ete (1.3);

    begin
      --Obtenir les données à fusionner
      select evp.iden_acces
            ,evp.html_base
        into vva_iden_acces
            ,vcl_html_base
        from vd_i_afw_25_versn_publc       vp
            ,vd_i_afw_25_publc_travl       pt
            ,vd_i_afw_25_engin_versn_publc evp
            ,vd_i_afw_25_engin             e
       where     pt.ref_versn_publc = vp.seqnc
             and pt.seqnc = pnu_travl_publc
             and evp.ref_versn_publc = vp.seqnc
             and evp.ref_engin = e.seqnc
             and e.code = 'PD4ML';
    exception
      when no_data_found
      then
        raise;
    end;

    ete (1.4);
    --Invoquer le traitement
    gob_don   := null;

    execute immediate
         'begin afw_25_fusn_don_pkg.gob_don := '
      || vva_iden_acces
      || ' end;';

    --impri_don_trace (gob_don);

    --Effectuer la substitution
    dbms_lob.createtemporary (vcl_docmn
                             ,true);
    ete (1.5);
    exect_subst;

    update afw_25_publc_travl
       set reslt_html   = vcl_docmn
     where seqnc = pnu_travl_publc;

    ete (1.6);
  exception
    when others
    then
      ete ();
      raise;
  end exect_fusn;
end afw_25_fusn_don_pkg;
/
