SET DEFINE OFF;
create or replace package afw_09_pile_pkg
as
  procedure init_pile (pva_nom_pile in varchar2);

  function obten_niv_recrs_courn (pva_nom_pile in varchar2)
    return number;

  procedure empil_numbr (pva_nom_pile   in varchar2
                        ,pnu_seqnc      in number);

  procedure empil_varch (pva_nom_pile   in varchar2
                        ,pva_clef       in varchar2);

  procedure empil_rowid (pva_nom_pile   in varchar2
                        ,pro_rowid      in rowid);

  function depil_numbr (pva_nom_pile in varchar2)
    return number;

  function depil_varch (pva_nom_pile in varchar2)
    return varchar2;

  function depil_rowid (pva_nom_pile in varchar2)
    return rowid;

  procedure mode_depil (pva_nom_pile in varchar2);

  procedure termn_utils_pile (pva_nom_pile              in varchar2
                             ,pbo_autor_pile_non_vide   in boolean default false);

  procedure vider_pile;

  function obten_sufx_ident_mode_decln (pbo_inser   in boolean
                                       ,pbo_modfc   in boolean
                                       ,pbo_suprs   in boolean)
    return varchar2;
end afw_09_pile_pkg;
/
