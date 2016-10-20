SET DEFINE OFF;
create or replace package body afw_07_sql_util_pkg
as
  --TODO: Faire un overload de la fonction "insert" a laquelle on va passer un sys_refcursor
  --      et qui va looper les insert pour chaque record
  --TODO: Trouver une façon simple de faire un update si PK/UK existe déjà à l'insert

  gin_clob_courn          afw_07_clob_pkg.typ_index;

  gbo_dernr_ligne_vide    boolean default false;
  gnu_tail_inden          number default 2;
  gnu_inden               number default 0;
  gnu_nb_ligne            number default 0;
  gbo_init_gestn_ereur    boolean default false;

  gbo_bloc_gestn_ereur    boolean default false;
  gva_nom_gestn_ereur     varchar2 (200);
  gnu_ligne_debut_bloc    number;
  gnu_parti_gestn_ereur   number;

  -- Fonctions pour formater les différents types de données, prêts à insérer dans du SQL
  function v (pva_valr in varchar2)
    return varchar2
  is
  begin
    if pva_valr is null
    then
      return 'null';
    else
      return    ''''
             || replace (pva_valr
                        ,''''
                        ,'''''')
             || '''';
    end if;
  end;

  function nv (pnu_valr in number)
    return varchar2
  is
    vva_valr   varchar2 (100) default pnu_valr;
  begin
    if pnu_valr is null
    then
      return 'null';
    else
      vva_valr      :=
        replace (vva_valr
                ,','
                ,'.');

      if vva_valr like '.%'
      then
        vva_valr      :=
             '0'
          || vva_valr;
      end if;

      return vva_valr;
    end if;
  end;

  function dv (pda_valr in date)
    return varchar2
  is
  begin
    if pda_valr is null
    then
      return 'null';
    else
      return    'to_date('''
             || to_char (pda_valr
                        ,'YYYY-MM-DD HH24:MI:SS')
             || ''', ''YYYY-MM-DD HH24:MI:SS'')';
    end if;
  end;


  -- Fonctions utilitaires
  function liste_valrs (pva_valr_01   in varchar2 default null
                       ,pva_valr_02   in varchar2 default null
                       ,pva_valr_03   in varchar2 default null
                       ,pva_valr_04   in varchar2 default null
                       ,pva_valr_05   in varchar2 default null
                       ,pva_valr_06   in varchar2 default null
                       ,pva_valr_07   in varchar2 default null
                       ,pva_valr_08   in varchar2 default null
                       ,pva_valr_09   in varchar2 default null
                       ,pva_valr_10   in varchar2 default null
                       ,pva_valr_11   in varchar2 default null
                       ,pva_valr_12   in varchar2 default null
                       ,pva_valr_13   in varchar2 default null
                       ,pva_valr_14   in varchar2 default null
                       ,pva_valr_15   in varchar2 default null
                       ,pva_valr_16   in varchar2 default null
                       ,pva_valr_17   in varchar2 default null
                       ,pva_valr_18   in varchar2 default null
                       ,pva_valr_19   in varchar2 default null
                       ,pva_valr_20   in varchar2 default null
                       ,pva_valr_21   in varchar2 default null
                       ,pva_valr_22   in varchar2 default null
                       ,pva_valr_23   in varchar2 default null
                       ,pva_valr_24   in varchar2 default null
                       ,pva_valr_25   in varchar2 default null
                       ,pva_valr_26   in varchar2 default null
                       ,pva_valr_27   in varchar2 default null
                       ,pva_valr_28   in varchar2 default null
                       ,pva_valr_29   in varchar2 default null
                       ,pva_valr_30   in varchar2 default null
                       ,pva_valr_31   in varchar2 default null
                       ,pva_valr_32   in varchar2 default null
                       ,pva_valr_33   in varchar2 default null
                       ,pva_valr_34   in varchar2 default null
                       ,pva_valr_35   in varchar2 default null
                       ,pva_valr_36   in varchar2 default null
                       ,pva_valr_37   in varchar2 default null
                       ,pva_valr_38   in varchar2 default null
                       ,pva_valr_39   in varchar2 default null
                       ,pva_valr_40   in varchar2 default null
                       ,pva_valr_41   in varchar2 default null
                       ,pva_valr_42   in varchar2 default null
                       ,pva_valr_43   in varchar2 default null
                       ,pva_valr_44   in varchar2 default null
                       ,pva_valr_45   in varchar2 default null
                       ,pva_valr_46   in varchar2 default null
                       ,pva_valr_47   in varchar2 default null
                       ,pva_valr_48   in varchar2 default null
                       ,pva_valr_49   in varchar2 default null
                       ,pva_valr_50   in varchar2 default null)
    return typ_liste_valrs
  is
    vin_index        typ_index default 0;
    vty_liste_valr   typ_liste_valrs;

    procedure ajout_valr (pva_valr varchar2)
    is
    begin
      if pva_valr is not null
      then
        vin_index                             := vin_index + 1;

        vty_liste_valr (vin_index).va_expre   := pva_valr;
      end if;
    end;
  begin
    ajout_valr (pva_valr_01);
    ajout_valr (pva_valr_02);
    ajout_valr (pva_valr_03);
    ajout_valr (pva_valr_04);
    ajout_valr (pva_valr_05);
    ajout_valr (pva_valr_06);
    ajout_valr (pva_valr_07);
    ajout_valr (pva_valr_08);
    ajout_valr (pva_valr_09);
    ajout_valr (pva_valr_10);
    ajout_valr (pva_valr_11);
    ajout_valr (pva_valr_12);
    ajout_valr (pva_valr_13);
    ajout_valr (pva_valr_14);
    ajout_valr (pva_valr_15);
    ajout_valr (pva_valr_16);
    ajout_valr (pva_valr_17);
    ajout_valr (pva_valr_18);
    ajout_valr (pva_valr_19);
    ajout_valr (pva_valr_20);
    ajout_valr (pva_valr_21);
    ajout_valr (pva_valr_22);
    ajout_valr (pva_valr_23);
    ajout_valr (pva_valr_24);
    ajout_valr (pva_valr_25);
    ajout_valr (pva_valr_26);
    ajout_valr (pva_valr_27);
    ajout_valr (pva_valr_28);
    ajout_valr (pva_valr_29);
    ajout_valr (pva_valr_30);
    ajout_valr (pva_valr_31);
    ajout_valr (pva_valr_32);
    ajout_valr (pva_valr_33);
    ajout_valr (pva_valr_34);
    ajout_valr (pva_valr_35);
    ajout_valr (pva_valr_36);
    ajout_valr (pva_valr_37);
    ajout_valr (pva_valr_38);
    ajout_valr (pva_valr_39);
    ajout_valr (pva_valr_40);
    ajout_valr (pva_valr_41);
    ajout_valr (pva_valr_42);
    ajout_valr (pva_valr_43);
    ajout_valr (pva_valr_44);
    ajout_valr (pva_valr_45);
    ajout_valr (pva_valr_46);
    ajout_valr (pva_valr_47);
    ajout_valr (pva_valr_48);
    ajout_valr (pva_valr_49);
    ajout_valr (pva_valr_50);

    return vty_liste_valr;
  end;

  function obten_liste_valrs (pty_liste_valrs in typ_liste_valrs)
    return varchar2
  is
    vin_index   typ_index default 0;
    vva_liste   varchar2 (32000) default null;
  begin
    vin_index   := pty_liste_valrs.first ();

    if vin_index is not null
    then
      vva_liste   := pty_liste_valrs (vin_index).va_expre;

      for vin_index in pty_liste_valrs.first () + 1 .. pty_liste_valrs.last ()
      loop
        vva_liste      :=
             vva_liste
          || ','
          || pty_liste_valrs (vin_index).va_expre;
      end loop;
    end if;

    return vva_liste;
  end;

  function fusn_liste_valrs (pty_liste_01   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_02   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_03   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_04   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_05   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_06   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_07   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_08   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_09   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_10   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_11   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_12   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_13   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_14   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_15   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_16   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_17   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_18   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_19   in typ_liste_valrs default gty_liste_valrs_vide
                            ,pty_liste_20   in typ_liste_valrs default gty_liste_valrs_vide)
    return typ_liste_valrs
  is
    vin_index        typ_index default 0;
    vty_liste_fusn   typ_liste_valrs;

    procedure ajout_liste_valrs (pva_liste in typ_liste_valrs)
    is
    begin
      if pva_liste.first () is not null
      then
        for i in pva_liste.first () .. pva_liste.last ()
        loop
          vin_index                    := vin_index + 1;
          vty_liste_fusn (vin_index)   := pva_liste (i);
        end loop;
      end if;
    end;
  begin
    ajout_liste_valrs (pty_liste_01);
    ajout_liste_valrs (pty_liste_02);
    ajout_liste_valrs (pty_liste_03);
    ajout_liste_valrs (pty_liste_04);
    ajout_liste_valrs (pty_liste_05);
    ajout_liste_valrs (pty_liste_06);
    ajout_liste_valrs (pty_liste_07);
    ajout_liste_valrs (pty_liste_08);
    ajout_liste_valrs (pty_liste_09);
    ajout_liste_valrs (pty_liste_10);
    ajout_liste_valrs (pty_liste_11);
    ajout_liste_valrs (pty_liste_12);
    ajout_liste_valrs (pty_liste_13);
    ajout_liste_valrs (pty_liste_14);
    ajout_liste_valrs (pty_liste_15);
    ajout_liste_valrs (pty_liste_16);
    ajout_liste_valrs (pty_liste_17);
    ajout_liste_valrs (pty_liste_18);
    ajout_liste_valrs (pty_liste_19);
    ajout_liste_valrs (pty_liste_20);

    return vty_liste_fusn;
  end;

  function compt_liste_valrs (pty_liste_valrs in typ_liste_valrs)
    return number
  is
  begin
    return pty_liste_valrs.count;
  end;

  function sous_selct (pva_liste_valrs   in varchar2
                      ,pva_nom_table     in varchar2
                      ,pva_condt         in varchar2 default null
                      ,pva_autre_claus   in varchar2 default null)
    return varchar2
  is
  begin
    return    '(select '
           || nvl (pva_liste_valrs, 'null')
           || ' from '
           || pva_nom_table
           || case
                when pva_condt is not null
                then
                     ' where '
                  || pva_condt
                else
                  null
              end
           || case
                when pva_autre_claus is not null
                then
                     ' '
                  || pva_autre_claus
                else
                  null
              end
           || ')';
  end;

  function sous_selct (pty_liste_valrs   in typ_liste_valrs
                      ,pva_nom_table     in varchar2
                      ,pva_condt         in varchar2 default null
                      ,pva_autre_claus   in varchar2 default null)
    return varchar2
  is
  begin
    -- TODO: Tester l'existence des tables/vues
    -- TODO: Aliaser si pas deja
    -- TODO: Prefixer les noms de champs
    -- TODO: Mieux controler les conditions

    return sous_selct (obten_liste_valrs (pty_liste_valrs)
                      ,pva_nom_table
                      ,pva_condt
                      ,pva_autre_claus);
  end;


  -- Fonctions d'insertion au script
  procedure inden
  is
  begin
    gnu_inden   := gnu_inden + 1;
  end;

  procedure de_inden
  is
  begin
    gnu_inden   := gnu_inden - 1;

    if gnu_inden < 0
    then
      --TODO: raiser une erreur "trop de dé-indentation"
      null;
    end if;
  end;

  procedure ajout_ligne (pva_ligne in varchar2 default null)
  is
    vva_debut_ligne   varchar2 (100) default null;
  begin
    if pva_ligne is null
    then
      if gbo_dernr_ligne_vide
      then
        return;
      end if;

      gbo_dernr_ligne_vide   := true;
    else
      gbo_dernr_ligne_vide   := false;
    end if;

    vva_debut_ligne      :=
      rpad (' '
           ,least (gnu_inden * gnu_tail_inden
                  ,100)
           ,' ');

    afw_07_clob_pkg.ajout_ligne (   vva_debut_ligne
                                 || pva_ligne
                                ,gin_clob_courn);
    dbms_output.put_line (   vva_debut_ligne
                          || pva_ligne);

    gnu_nb_ligne   := gnu_nb_ligne + 1;
  end;

  procedure ajout_comnt (pva_ligne in varchar2)
  is
    vva_comnt       varchar2 (10) := '-- ';
    vva_fin_ligne   varchar2 (10) := chr (10);
  begin
    ajout_ligne (   vva_comnt
                 || pva_ligne);
  end;


  -- Fonctions de construction de script
  procedure debtr (pva_titre_1       in varchar2 default null
                  ,pva_titre_2       in varchar2 default null
                  ,pbo_gestn_ereur   in boolean default true)
  is
  begin
    gin_clob_courn         := afw_07_clob_pkg.creer_nouv ();
    gbo_dernr_ligne_vide   := false;
    gnu_inden              := 0;
    gbo_init_gestn_ereur   := false;

    ajout_ligne ('set define off');
    ajout_ligne ('set serveroutput on');
    ajout_ligne ('set feedback off');
    ajout_ligne ();
    ajout_comnt (rpad ('#'
                      ,length (pva_titre_1)
                      ,'#'));
    ajout_comnt (pva_titre_1);
    ajout_comnt (rpad ('#'
                      ,length (pva_titre_1)
                      ,'#'));
    ajout_comnt (pva_titre_2);
    ajout_comnt (   'Date de creation: '
                 || to_char (sysdate
                            ,'yyyy-mm-dd hh24:mi:ss'));
    ajout_ligne ();

    if pbo_gestn_ereur
    then
      init_gestn_ereur ();
    end if;
  end;

  procedure debtr_bloc
  is
  begin
    ajout_ligne ('begin');
    inden ();
  end;

  procedure ignor_duplc_valr
  is
  begin
    de_inden ();
    ajout_ligne ('exception');
    ajout_ligne ('when dup_val_on_index then');
    inden ();
    ajout_ligne ('null;');
  end;

  procedure termn_bloc
  is
  begin
    de_inden ();
    ajout_ligne ('end;');

    if gnu_inden = 0
    then
      ajout_ligne ('/');
    end if;

    ajout_ligne ();
  end;


  procedure inser (pva_nom_table     in varchar2
                  ,pty_colns         in typ_liste_valrs
                  ,pty_liste_valrs   in typ_liste_valrs
                  ,pva_retr          in varchar2 default null
                  ,pva_into          in varchar2 default null)
  is
  begin
    -- TODO: Tester que la vue existe
    -- TODO: Tester que toutes les colonnes existent et sont updatable
    -- TODO: Tester qu'au moins 1 colonne est passée

    if compt_liste_valrs (pty_colns) <> compt_liste_valrs (pty_liste_valrs)
    then
      --TODO: Raiser une erreur "nombre de valeurs ne correspondent pas"
      afw_01_err_apex_pkg.lever_err_apex_mesg ('Le nombre de valeurs ne correspondent pas');
    end if;

    ajout_ligne (   'insert into '
                 || pva_nom_table);
    ajout_ligne (   '          ( '
                 || obten_liste_valrs (pty_colns)
                 || ')');

    if pva_retr is null
    then
      ajout_ligne (   '   values ( '
                   || obten_liste_valrs (pty_liste_valrs)
                   || ');');
    else
      ajout_ligne (   '   values ( '
                   || obten_liste_valrs (pty_liste_valrs)
                   || ')');
      ajout_ligne (   '  returning '
                   || pva_retr);
      ajout_ligne (   '       into '
                   || pva_into
                   || ';');
    end if;

    ajout_ligne ();
  end;

  procedure updat (pva_nom_table     in varchar2
                  ,pty_colns         in typ_liste_valrs
                  ,pty_liste_valrs   in typ_liste_valrs
                  ,pva_condt         in varchar2 default null)
  is
    vnu_index   typ_index;
  begin
    -- TODO: Tester que la vue existe
    -- TODO: Tester que toutes les colonnes existent et sont updatable
    -- TODO: Tester qu'au moins 1 colonne est passée

    if compt_liste_valrs (pty_colns) <> compt_liste_valrs (pty_liste_valrs)
    then
      --TODO: Raiser une erreur "nombre de valeurs ne correspondent pas"
      afw_01_err_apex_pkg.lever_err_apex_mesg ('Le nombre de valeurs ne correspondent pas');
    end if;

    vnu_index   := pty_colns.first ();

    ajout_ligne (   'update '
                 || pva_nom_table);
    ajout_ligne (   '   set '
                 || pty_colns (vnu_index).va_expre
                 || ' = '
                 || pty_liste_valrs (vnu_index).va_expre);

    vnu_index   := pty_colns.next (vnu_index);

    while vnu_index is not null
    loop
      ajout_ligne (   '       '
                   || pty_colns (vnu_index).va_expre
                   || ' = '
                   || pty_liste_valrs (vnu_index).va_expre);

      vnu_index   := pty_colns.next (vnu_index);
    end loop;

    if pva_condt is not null
    then
      ajout_ligne (   ' where '
                   || pva_condt
                   || ';');
    else
      ajout_ligne (';');
    end if;

    ajout_ligne ();
  end;

  function obten
    return clob
  is
  begin
    if gbo_init_gestn_ereur
    then
      -- Terminer la gestion des erreurs si encore ouverte
      concl_gestn_ereur ();
    end if;

    return afw_07_clob_pkg.obten ();
  end;


  -- Fonctions de gestion d'erreurs
  procedure init_gestn_ereur
  is
  begin
    ajout_ligne ('create or replace package z$afw_gestn_err_pkg as');
    inden ();
    ajout_ligne ('vnu_sql_code      number default 0;');
    ajout_ligne ('vva_sql_errm      varchar2(4000);');
    ajout_ligne ('vva_back_trace    varchar2(32500);');
    ajout_ligne ('vva_nom_bloc_err  varchar2(100);');
    ajout_ligne ();
    ajout_ligne ('procedure defnr_ereur (pva_nom in varchar2);');
    termn_bloc ();

    ajout_ligne ('create or replace package body z$afw_gestn_err_pkg as');
    inden ();
    ajout_ligne ('procedure defnr_ereur (pva_nom in varchar2) is');
    debtr_bloc ();
    ajout_ligne ('vnu_sql_code := sqlcode;');
    ajout_ligne ('vva_sql_errm := sqlerrm;');
    ajout_ligne ('vva_back_trace := substr(dbms_utility.format_call_stack (), 1, 32500);');
    ajout_ligne ('vva_nom_bloc_err := pva_nom;');
    termn_bloc ();
    termn_bloc ();

    gbo_init_gestn_ereur   := true;
    gbo_bloc_gestn_ereur   := false;
  end;

  procedure debtr_bloc_gestn_ereur (pva_nom_bloc in varchar2)
  is
  begin
    if not gbo_init_gestn_ereur
    then
      --TODO: S'assurer que la gestion d'erreur a été initiée
      null;
    end if;

    if gbo_bloc_gestn_ereur
    then
      --Raiser une erreur "bloc de gestion d'erreur précédent non terminé"
      afw_01_err_apex_pkg.lever_err_apex_mesg ('Le bloc de gestion d''erreur précédent n''est pas terminé');
    end if;

    gva_nom_gestn_ereur     := pva_nom_bloc;
    gnu_ligne_debut_bloc    := gnu_nb_ligne;
    gnu_parti_gestn_ereur   := 1;

    debtr_bloc ();
    ajout_ligne ('if z$afw_gestn_err_pkg.vnu_sql_code = 0 then');
    inden ();
  end;

  procedure termn_bloc_gestn_ereur
  is
  begin
    --TODO: S'assurer que la gestion d'erreur a été initiée

    if gbo_bloc_gestn_ereur
    then
      --Raiser une erreur "bloc de gestion d'erreur non débuté"
      afw_01_err_apex_pkg.lever_err_apex_mesg ('Aucun bloc de gestion d''erreur  n''est débuté');
    end if;

    -- S'assurer d'avoir au moins 1 instruction dans le bloc
    ajout_ligne ('null;');
    de_inden ();
    ajout_ligne ('end if;');
    de_inden ();
    ajout_ligne ('exception');
    ajout_ligne ('when others then');
    inden ();
    ajout_ligne (   'z$afw_gestn_err_pkg.defnr_ereur ('
                 || v (   gva_nom_gestn_ereur
                       || case
                            when gnu_parti_gestn_ereur > 1
                            then
                                 '(partie '
                              || gnu_parti_gestn_ereur
                              || ')'
                            else
                              null
                          end)
                 || ');');
    termn_bloc ();
  end;

  procedure rompr_bloc_gestn_ereur (pnu_nb_ligne in number default 500)
  is
    vnu_parti   number;
  begin
    if gnu_nb_ligne >= gnu_ligne_debut_bloc + pnu_nb_ligne
    then
      vnu_parti               := gnu_parti_gestn_ereur;
      termn_bloc_gestn_ereur ();
      debtr_bloc_gestn_ereur (gva_nom_gestn_ereur);
      gnu_parti_gestn_ereur   := vnu_parti + 1;
    end if;
  end;

  procedure concl_gestn_ereur
  is
  begin
    debtr_bloc ();
    ajout_ligne ('if z$afw_gestn_err_pkg.vnu_sql_code = 0 then');
    ajout_ligne ('  commit;');
    ajout_ligne (   '  dbms_output.put_line ('
                 || v ('La migration s''est completee correctement.')
                 || ');');
    ajout_ligne ('else');
    ajout_ligne ('  rollback;');
    ajout_ligne ('  afw_13_condt_piltb_pkg.vbo_en_charg := false;');
    ajout_ligne ('  dbms_output.put_line (');
    ajout_ligne (   '    '
                 || v ('Une erreur est survenue lors de l''execution du script de migration.'));
    ajout_ligne ('  );');
    ajout_ligne ('  dbms_output.put_line (''Bloc   : '' || z$afw_gestn_err_pkg.vva_nom_bloc_err);');
    ajout_ligne ('  dbms_output.put_line (''Code   : '' || z$afw_gestn_err_pkg.vnu_sql_code);');
    ajout_ligne ('  dbms_output.put_line (''Message: '' || z$afw_gestn_err_pkg.vva_sql_errm);');
    ajout_ligne ('  dbms_output.put_line (''Pile   :'');');
    ajout_ligne ('  dbms_output.put_line (z$afw_gestn_err_pkg.vva_back_trace);');
    ajout_ligne ('  afw_03_journ_pkg.ecrir_journ (z$afw_gestn_err_pkg.vva_sql_errm);');
    ajout_ligne ('  afw_03_journ_pkg.ecrir_journ (z$afw_gestn_err_pkg.vva_back_trace);');
    ajout_ligne ('end if;');
    termn_bloc ();

    debtr_bloc ();
    ajout_ligne ('if z$afw_gestn_err_pkg.vnu_sql_code <> 0 then');
    ajout_ligne ('  raise_application_error (-20100, z$afw_gestn_err_pkg.vva_sql_errm);');
    ajout_ligne ('end if;');
    termn_bloc ();

    ajout_ligne ('drop package z$afw_gestn_err_pkg;');
  end;
end afw_07_sql_util_pkg;
/
