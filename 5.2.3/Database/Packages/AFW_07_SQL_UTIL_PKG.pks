SET DEFINE OFF;
create or replace package afw_07_sql_util_pkg
as
  subtype typ_index is pls_integer;

  type typ_valr is record
  (
    va_expre   varchar2 (32000)
   ,va_alias   varchar2 (50)
  );

  type typ_liste_valrs is table of typ_valr
    index by typ_index;

  gty_liste_valrs_vide   typ_liste_valrs;

  -- Fonctions pour formater les différents types de données, prêts à insérer dans du SQL
  function v (pva_valr in varchar2)
    return varchar2;

  function nv (pnu_valr in number)
    return varchar2;

  function dv (pda_valr in date)
    return varchar2;


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
    return typ_liste_valrs;

  function obten_liste_valrs (pty_liste_valrs in typ_liste_valrs)
    return varchar2;

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
    return typ_liste_valrs;

  function compt_liste_valrs (pty_liste_valrs in typ_liste_valrs)
    return number;

  function sous_selct (pva_liste_valrs   in varchar2
                      ,pva_nom_table     in varchar2
                      ,pva_condt         in varchar2 default null
                      ,pva_autre_claus   in varchar2 default null)
    return varchar2;

  function sous_selct (pty_liste_valrs   in typ_liste_valrs
                      ,pva_nom_table     in varchar2
                      ,pva_condt         in varchar2 default null
                      ,pva_autre_claus   in varchar2 default null)
    return varchar2;


  -- Fonctions d'insertion au script
  procedure ajout_ligne (pva_ligne in varchar2 default null);

  procedure ajout_comnt (pva_ligne in varchar2);


  -- Fonctions de construction de script
  procedure debtr (pva_titre_1       in varchar2 default null
                  ,pva_titre_2       in varchar2 default null
                  ,pbo_gestn_ereur   in boolean default true);

  procedure debtr_bloc;

  procedure ignor_duplc_valr;

  procedure termn_bloc;

  procedure inser (pva_nom_table     in varchar2
                  ,pty_colns         in typ_liste_valrs
                  ,pty_liste_valrs   in typ_liste_valrs
                  ,pva_retr          in varchar2 default null
                  ,pva_into          in varchar2 default null);

  procedure updat (pva_nom_table     in varchar2
                  ,pty_colns         in typ_liste_valrs
                  ,pty_liste_valrs   in typ_liste_valrs
                  ,pva_condt         in varchar2 default null);

  function obten
    return clob;


  -- Fonctions de gestion d'erreurs
  procedure init_gestn_ereur;

  procedure debtr_bloc_gestn_ereur (pva_nom_bloc in varchar2);

  procedure termn_bloc_gestn_ereur;

  procedure rompr_bloc_gestn_ereur (pnu_nb_ligne in number default 500);

  procedure concl_gestn_ereur;
end afw_07_sql_util_pkg;
/
