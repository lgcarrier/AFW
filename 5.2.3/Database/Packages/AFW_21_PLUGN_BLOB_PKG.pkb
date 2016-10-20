SET DEFINE OFF;
create or replace package body afw_21_plugn_blob_pkg
is
  /*
 Gestion de Blob
 */
  function obten_nom_colct
    return varchar2
  is
  begin
    return kva_nom_colct_blob;
  end obten_nom_colct;

  procedure creer_colct
  is
  begin
    afw_07_apex_colct_pkg.creer_colct (kva_nom_colct_blob);
  end creer_colct;

  procedure suprm_colct
  is
  begin
    afw_07_apex_colct_pkg.suprm_colct (kva_nom_colct_blob);
  end suprm_colct;

  procedure suprm_fichr (pva_nom_fichr in varchar2)
  is
  begin
    afw_07_apex_colct_pkg.suprm_membr (kva_nom_colct_blob
                                      ,1
                                      ,pva_nom_fichr);
  end suprm_fichr;

  function colct_exist
    return boolean
  is
  begin
    return afw_07_apex_colct_pkg.exist (kva_nom_colct_blob);
  end colct_exist;

  procedure ajout_membr_colct (pva_nom_fichr   in            varchar2
                              ,pva_mime_type   in            varchar2
                              ,pbl_fichr       in out nocopy blob)
  is
  begin
    --afw_07_apex_colct_pkg.re_seqnc_colct (kva_nom_colct_blob);
    --ete ('dup_val_on_index1', pva_nom_fichr);
    afw_07_apex_colct_pkg.ajout_membr (pva_colct_name   => kva_nom_colct_blob
                                      ,pva_c001         => pva_nom_fichr
                                      ,pva_c002         => pva_mime_type
                                      ,pbl_bl001        => pbl_fichr);
  exception
    when dup_val_on_index
    then
      ete ('dup_val_on_index'
          ,pva_nom_fichr);
      ajout_membr_colct (pva_nom_fichr   => pva_nom_fichr
                        ,pva_mime_type   => pva_mime_type
                        ,pbl_fichr       => pbl_fichr);
  end ajout_membr_colct;

  /*
  Gestion des portions de Blob
  */
  function obten_nom_colct_portn
    return varchar2
  is
  begin
    return kva_nom_colct_portn_blob;
  end obten_nom_colct_portn;

  procedure creer_colct_portn
  is
  begin
    afw_07_apex_colct_pkg.creer_colct (kva_nom_colct_portn_blob);
  end creer_colct_portn;

  procedure suprm_colct_portn
  is
  begin
    afw_07_apex_colct_pkg.suprm_colct (kva_nom_colct_portn_blob);
  end suprm_colct_portn;

  procedure suprm_portn_fichr (pva_nom_fichr in varchar2)
  is
  begin
    afw_07_apex_colct_pkg.suprm_membr (kva_nom_colct_portn_blob
                                      ,1
                                      ,pva_nom_fichr);
  end suprm_portn_fichr;

  function colct_portn_exist
    return boolean
  is
  begin
    return afw_07_apex_colct_pkg.exist (kva_nom_colct_portn_blob);
  end colct_portn_exist;

  procedure ajout_membr_colct_portn (pva_nom_fichr      in varchar2
                                    ,pva_mime_type      in varchar2
                                    ,pnu_portn_part_1   in number
                                    ,pnu_portn_part_2   in number
                                    ,pva_portn          in varchar2)
  is
  begin
    --    afw_07_apex_colct_pkg.re_seqnc_colct (kva_nom_colct_portn_blob);
    --    ete ('dup_val_on_index1', pva_nom_fichr);
    afw_07_apex_colct_pkg.ajout_membr (pva_colct_name   => kva_nom_colct_portn_blob
                                      ,pva_c001         => pva_nom_fichr
                                      ,pva_c002         => pva_mime_type
                                      ,pva_c003         => pva_portn
                                      ,pnu_n001         => pnu_portn_part_1
                                      ,pnu_n002         => pnu_portn_part_2);
  --  exception
  --    when dup_val_on_index
  --    then
  --      ete ('dup_val_on_index', pva_nom_fichr);
  --      ajout_membr_colct_portn (pva_nom_fichr   => pva_nom_fichr
  --                              ,pva_mime_type   => pva_mime_type
  --                              ,pva_portn       => pva_portn);
  end ajout_membr_colct_portn;
end afw_21_plugn_blob_pkg;
/
