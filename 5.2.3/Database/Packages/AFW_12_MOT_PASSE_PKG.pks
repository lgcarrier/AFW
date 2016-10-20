SET DEFINE OFF;
create or replace package afw_12_mot_passe_pkg
is
  gbo_valdt_procd_niv_secrt   boolean default false;

  procedure defnr_mot_passe (pva_code_utils   in varchar2
                            ,pva_mot_passe    in varchar2);

  procedure defnr_mot_passe (pnu_utils       in vd_i_afw_12_utils.seqnc%type
                            ,pva_mot_passe   in varchar2);

  function valdr_mot_passe (pva_code_utils   in varchar2
                           ,pva_mot_passe    in varchar2)
    return boolean;

  function genr_mot_passe
    return varchar2;

  function valdr_secrt_mot_passe (pva_mot_passe   in varchar2
                                 ,pva_nom         in varchar2 default null
                                 ,pva_prenm       in varchar2 default null)
    return boolean;

  function valdr_niv_secrt_mot_passe (pva_mot_passe   in varchar2
                                     ,pva_nom         in varchar2 default null
                                     ,pva_prenm       in varchar2 default null
                                     ,pnu_domn        in vd_i_afw_12_domn.seqnc%type default null)
    return boolean;

  procedure reint_mot_passe_par_utils (pnu_utils             in number
                                      ,pva_mot_passe_actue   in varchar2
                                      ,pva_mot_passe         in varchar2
                                      ,pva_confr_mot_passe   in varchar2);
end afw_12_mot_passe_pkg;
/
