SET DEFINE OFF;
create or replace package body afw_09_pile_pkg
as
  type typ_elemn_pile is record
  (
    niv_recrs     pls_integer
   ,mode_pile     varchar2 (3)
   ,valr_rowid    rowid
   ,valr_number   number
   ,valr_varch    varchar2 (4000)
  );

  type typ_pile is table of typ_elemn_pile
    index by pls_integer;

  type typ_defnt_pile is record
  (
    nom               varchar2 (60)
   ,niv_recrs_courn   pls_integer
   ,mode_pile_courn   varchar2 (3)
   ,elemn             typ_pile
  );

  type typ_defnt_piles is table of typ_defnt_pile
    index by pls_integer;

  gnu_nombr_recrv_max   pls_integer default 10;
  gtb_piles             typ_defnt_piles;

  procedure init_pile (pva_nom_pile in varchar2)
  is
    vbo_pile_trouv   boolean default false;
  begin
    --Ajouter la pile dans la session

    --Trouver l'endroit où ajouter la pile
    if gtb_piles.count () != 0
    then
      for i in gtb_piles.first () .. gtb_piles.last ()
      loop
        if gtb_piles.exists (i)
        then
          if gtb_piles (i).nom = pva_nom_pile
          then
            vbo_pile_trouv                  := true;

            if gtb_piles (i).niv_recrs_courn >= gnu_nombr_recrv_max
            then
              raise_application_error (-20999
                                      ,   'Nombre maximum de requêtes récursives atteint ('
                                       || gnu_nombr_recrv_max
                                       || ') pour la pile "'
                                       || gtb_piles (i).nom
                                       || '".');
            end if;

            gtb_piles (i).niv_recrs_courn   := gtb_piles (i).niv_recrs_courn + 1;
            gtb_piles (i).mode_pile_courn   := 'EMP';
            exit;
          end if;
        end if;
      end loop;

      if not vbo_pile_trouv
      then
        gtb_piles (gtb_piles.last () + 1).nom           := pva_nom_pile;
        gtb_piles (gtb_piles.last ()).niv_recrs_courn   := 1;
        gtb_piles (gtb_piles.last ()).mode_pile_courn   := 'EMP';
      end if;
    else
      gtb_piles (1).nom               := pva_nom_pile;
      gtb_piles (1).niv_recrs_courn   := 1;
      gtb_piles (1).mode_pile_courn   := 'EMP';
    end if;
  end init_pile;

  function obten_indic_courn (pva_nom_pile in varchar2)
    return pls_integer
  is
    vnu_indic_courn   pls_integer;
  begin
    if gtb_piles.count () != 0
    then
      for i in gtb_piles.first () .. gtb_piles.last ()
      loop
        if gtb_piles.exists (i)
        then
          if gtb_piles (i).nom = pva_nom_pile
          then
            vnu_indic_courn   := i;
            exit;
          end if;
        end if;
      end loop;
    else
      vnu_indic_courn   := 0;
    end if;

    return vnu_indic_courn;
  end obten_indic_courn;

  function obten_niv_recrs_courn (pva_nom_pile in varchar2)
    return number
  is
    vnu_indic_courn   pls_integer;
  begin
    vnu_indic_courn   := obten_indic_courn (pva_nom_pile);

    if vnu_indic_courn != 0
    then
      return gtb_piles (vnu_indic_courn).niv_recrs_courn;
    else
      return 0;
    end if;
  end obten_niv_recrs_courn;

  procedure mode_depil (pva_nom_pile in varchar2)
  is
    vnu_indic_courn   pls_integer;
  begin
    vnu_indic_courn   := obten_indic_courn (pva_nom_pile);

    if vnu_indic_courn != 0
    then
      if gtb_piles (vnu_indic_courn).mode_pile_courn = 'DEP'
      then
        raise_application_error (-20999
                                ,   'La pile '
                                 || pva_nom_pile
                                 || ' est déjà en mode dépilage');
      else
        gtb_piles (vnu_indic_courn).mode_pile_courn   := 'DEP';

        --trouver tous les enfants et les mettre en mode dépile
        if gtb_piles (vnu_indic_courn).elemn.count () != 0
        then
          for i in gtb_piles (vnu_indic_courn).elemn.first () .. gtb_piles (vnu_indic_courn).elemn.last ()
          loop
            if gtb_piles (vnu_indic_courn).elemn (i).niv_recrs = gtb_piles (vnu_indic_courn).niv_recrs_courn
            then
              gtb_piles (vnu_indic_courn).elemn (i).mode_pile   := 'DEP';
            end if;
          end loop;
        end if;
      end if;
    end if;
  end mode_depil;

  procedure empil_numbr (pva_nom_pile   in varchar2
                        ,pnu_seqnc      in number)
  is
    vnu_indic_courn   pls_integer;
  begin
    vnu_indic_courn   := obten_indic_courn (pva_nom_pile);

    if vnu_indic_courn != 0
    then
      if gtb_piles (vnu_indic_courn).mode_pile_courn = 'DEP'
      then
        raise_application_error (-20999
                                ,   'La pile '
                                 || pva_nom_pile
                                 || ' est en mode dépilage, impossible d''ajouter une valeur à son contenu');
      end if;

      gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.count () + 1).valr_number   := pnu_seqnc;
      gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.count ()).niv_recrs         := gtb_piles (vnu_indic_courn).niv_recrs_courn;
      gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.count ()).mode_pile         := 'EMP';
    end if;
  end empil_numbr;

  procedure empil_varch (pva_nom_pile   in varchar2
                        ,pva_clef       in varchar2)
  is
    vnu_indic_courn   pls_integer;
  begin
    vnu_indic_courn   := obten_indic_courn (pva_nom_pile);

    if vnu_indic_courn != 0
    then
      if gtb_piles (vnu_indic_courn).mode_pile_courn = 'DEP'
      then
        raise_application_error (-20999
                                ,   'La pile '
                                 || pva_nom_pile
                                 || ' est en mode dépilage, impossible d''ajouter une valeur à son contenu');
      end if;

      gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.count () + 1).valr_varch   := pva_clef;
      gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.count ()).niv_recrs        := gtb_piles (vnu_indic_courn).niv_recrs_courn;
      gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.count ()).mode_pile        := 'EMP';
    end if;
  end empil_varch;

  procedure empil_rowid (pva_nom_pile   in varchar2
                        ,pro_rowid      in rowid)
  is
    vnu_indic_courn   pls_integer;
  begin
    vnu_indic_courn   := obten_indic_courn (pva_nom_pile);

    if vnu_indic_courn != 0
    then
      if gtb_piles (vnu_indic_courn).mode_pile_courn = 'DEP'
      then
        raise_application_error (-20999
                                ,   'La pile '
                                 || pva_nom_pile
                                 || ' est en mode dépilage, impossible d''ajouter une valeur à son contenu');
      end if;

      gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.count () + 1).valr_rowid   := pro_rowid;
      gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.count ()).niv_recrs        := gtb_piles (vnu_indic_courn).niv_recrs_courn;
      gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.count ()).mode_pile        := 'EMP';
    end if;
  end empil_rowid;

  function depil_numbr (pva_nom_pile in varchar2)
    return number
  is
    vnu_indic_courn   pls_integer;
    vnu_elemn_retr    number;
  begin
    --on retourne pour le niveau courant
    vnu_indic_courn   := obten_indic_courn (pva_nom_pile);

    if vnu_indic_courn != 0
    then
      if gtb_piles (vnu_indic_courn).mode_pile_courn = 'DEP'
      then
        if gtb_piles (vnu_indic_courn).elemn.count () != 0
        then
          if     gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).mode_pile = 'DEP'
             and gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).niv_recrs = gtb_piles (vnu_indic_courn).niv_recrs_courn
          then
            vnu_elemn_retr   := gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).valr_number;
            gtb_piles (vnu_indic_courn).elemn.delete (gtb_piles (vnu_indic_courn).elemn.last ());
          end if;
        end if;
      end if;
    end if;

    return vnu_elemn_retr;
  end depil_numbr;

  function depil_varch (pva_nom_pile in varchar2)
    return varchar2
  is
    vnu_indic_courn   pls_integer;
    vva_elemn_retr    varchar2 (4000);
  begin
    --on retourne pour le niveau courant
    vnu_indic_courn   := obten_indic_courn (pva_nom_pile);

    if vnu_indic_courn != 0
    then
      if gtb_piles (vnu_indic_courn).mode_pile_courn = 'DEP'
      then
        if gtb_piles (vnu_indic_courn).elemn.count () != 0
        then
          if     gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).mode_pile = 'DEP'
             and gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).niv_recrs = gtb_piles (vnu_indic_courn).niv_recrs_courn
          then
            vva_elemn_retr   := gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).valr_varch;
            gtb_piles (vnu_indic_courn).elemn.delete (gtb_piles (vnu_indic_courn).elemn.last ());
          end if;
        end if;
      end if;
    end if;

    return vva_elemn_retr;
  end depil_varch;

  function depil_rowid (pva_nom_pile in varchar2)
    return rowid
  is
    vnu_indic_courn   pls_integer;
    vro_elemn_retr    rowid;
  begin
    --on retourne pour le niveau courant
    vnu_indic_courn   := obten_indic_courn (pva_nom_pile);

    if vnu_indic_courn != 0
    then
      if gtb_piles (vnu_indic_courn).mode_pile_courn = 'DEP'
      then
        if gtb_piles (vnu_indic_courn).elemn.count () != 0
        then
          if     gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).mode_pile = 'DEP'
             and gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).niv_recrs = gtb_piles (vnu_indic_courn).niv_recrs_courn
          then
            vro_elemn_retr   := gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).valr_rowid;
            gtb_piles (vnu_indic_courn).elemn.delete (gtb_piles (vnu_indic_courn).elemn.last ());
          end if;
        end if;
      end if;
    end if;

    return vro_elemn_retr;
  end depil_rowid;

  procedure termn_utils_pile (pva_nom_pile              in varchar2
                             ,pbo_autor_pile_non_vide   in boolean default false)
  is
    vnu_indic_courn   pls_integer;
  begin
    --on retourne pour le niveau courant
    vnu_indic_courn   := obten_indic_courn (pva_nom_pile);

    if vnu_indic_courn != 0
    then
      if gtb_piles (vnu_indic_courn).elemn.count != 0
      then
        if gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).mode_pile = 'DEP'
        then
          for i in reverse gtb_piles (vnu_indic_courn).elemn.first () .. gtb_piles (vnu_indic_courn).elemn.last ()
          loop
            if gtb_piles (vnu_indic_courn).elemn.exists (i)
            then
              if     gtb_piles (vnu_indic_courn).elemn (i).mode_pile = 'DEP'
                 and gtb_piles (vnu_indic_courn).elemn (i).niv_recrs = gtb_piles (vnu_indic_courn).niv_recrs_courn
              then
                if pbo_autor_pile_non_vide
                then
                  gtb_piles (vnu_indic_courn).elemn.delete (i);
                else
                  raise_application_error (-20999
                                          ,   'La pile '
                                           || pva_nom_pile
                                           || ' n''est pas vide');
                end if;
              else
                exit;
              end if;
            end if;
          end loop;
        end if;
      end if;

      --supprimer la pile
      if gtb_piles (vnu_indic_courn).niv_recrs_courn = 1
      then
        gtb_piles.delete (vnu_indic_courn);
      else
        --selon le niveau de récursivité,
        if gtb_piles (vnu_indic_courn).elemn.count () = 0
        then
          gtb_piles (vnu_indic_courn).niv_recrs_courn   := gtb_piles (vnu_indic_courn).niv_recrs_courn - 1;
          gtb_piles (vnu_indic_courn).mode_pile_courn   := 'DEP';
        else
          gtb_piles (vnu_indic_courn).niv_recrs_courn   := gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).niv_recrs;
          gtb_piles (vnu_indic_courn).mode_pile_courn   := gtb_piles (vnu_indic_courn).elemn (gtb_piles (vnu_indic_courn).elemn.last ()).mode_pile;
        end if;
      end if;
    end if;
  end termn_utils_pile;

  procedure vider_pile
  is
  begin
    --On vide le tout
    gtb_piles.delete ();
  end vider_pile;

  function obten_sufx_ident_mode_decln (pbo_inser   in boolean
                                       ,pbo_modfc   in boolean
                                       ,pbo_suprs   in boolean)
    return varchar2
  is
    vva_sufx_ident_mode_decln   varchar2 (6);
  begin
    if inserting
    then
      vva_sufx_ident_mode_decln   := '_INSER';
    elsif updating
    then
      vva_sufx_ident_mode_decln   := '_UPDAT';
    elsif deleting
    then
      vva_sufx_ident_mode_decln   := '_DELT';
    end if;

    return vva_sufx_ident_mode_decln;
  end obten_sufx_ident_mode_decln;
end afw_09_pile_pkg;
/
