SET DEFINE OFF;
create or replace package afw_21_plugn_blob_pkg
is
  kva_nom_colct_blob         constant varchar2 (255) default 'IO_AFW_21_COLCT_BLOB';
  kva_nom_colct_portn_blob   constant varchar2 (255) default 'IO_AFW_21_COLCT_PORTN_BLOB';

  /*
 Gestion de Blob
 */
  function obten_nom_colct
    return varchar2;

  procedure creer_colct;

  procedure suprm_colct;

  procedure suprm_fichr (pva_nom_fichr in varchar2);

  function colct_exist
    return boolean;

  procedure ajout_membr_colct (pva_nom_fichr   in            varchar2
                              ,pva_mime_type   in            varchar2
                              ,pbl_fichr       in out nocopy blob);

  /*
  Gestion des portions de Blob
  */
  function obten_nom_colct_portn
    return varchar2;

  procedure creer_colct_portn;

  procedure suprm_colct_portn;

  procedure suprm_portn_fichr (pva_nom_fichr in varchar2);

  function colct_portn_exist
    return boolean;

  procedure ajout_membr_colct_portn (pva_nom_fichr      in varchar2
                                    ,pva_mime_type      in varchar2
                                    ,pnu_portn_part_1   in number
                                    ,pnu_portn_part_2   in number
                                    ,pva_portn          in varchar2);
end afw_21_plugn_blob_pkg;
/
