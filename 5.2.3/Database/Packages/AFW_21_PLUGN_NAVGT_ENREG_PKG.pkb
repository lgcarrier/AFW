SET DEFINE OFF;
create or replace package body afw_21_plugn_navgt_enreg_pkg
as
  --mode possible: PAGE | DIALG


  gbo_plugn_activ                 boolean default true;

  gva_mode                        varchar2 (23) default 'PAGE';

  kva_regn_precd_premr   constant varchar2 (200) default '<div class="afw_21_navgt_enreg precd"><i class="fa fa-fast-backward navgt_enreg_precd"></i></div>';
  kva_regn_precd         constant varchar2 (200) default '<div class="afw_21_navgt_enreg precd"><i class="fa fa-backward navgt_enreg_precd"></i></div>';

  kva_regn_suivn_dernr   constant varchar2 (200) default '<div class="afw_21_navgt_enreg suivn"><i class="fa fa-fast-forward navgt_enreg_suivn"></i></div>';
  kva_regn_suivn         constant varchar2 (200) default '<div class="afw_21_navgt_enreg suivn"><i class="fa fa-forward navgt_enreg_suivn"></i></div>';

  function valdr_prise_charg
    return boolean
  is
    vbo_retr          boolean default false;
    vva_navgt         varchar2 (1);
    vnu_nombr_enreg   number default 0;
  begin
    --Vérifier si sur page venant d'un IR et qu'il contient plus de 1 enregistrement

    --Vérifier si sur page venant d'un rapport SQL et qu'il contient plus de 1 enregistrement

    --Vérifier si dialogue et le rapport parent (SQL ou IR) contient plus de 1 enregistrement
    select p.indic_prise_charg_afw13_navgt
      into vva_navgt
      from vd_afw_13_page p
     where p.seqnc = afw_13_page_pkg.obten_page_sesn ();

    select count (1)
      into vnu_nombr_enreg
      from vd_afw_13_navgt_elemn;

    if     vva_navgt = 'O'
       and vnu_nombr_enreg > 1
    then
      vbo_retr   := true;
    end if;

    return     vbo_retr
           and gbo_plugn_activ;
  end valdr_prise_charg;

  function obten_si_dernr_enreg
    return boolean
  is
    vnu_numr_courn   number;
  begin
    select max (numr_elemn)
      into vnu_numr_courn
      from vd_afw_13_navgt_elemn;

    return vnu_numr_courn = afw_13_navgt_pkg.obten_numr_courn;
  end obten_si_dernr_enreg;

  function obten_si_premr_enreg
    return boolean
  is
  begin
    return afw_13_navgt_pkg.obten_numr_courn = 1;
  end obten_si_premr_enreg;

  function obten_url_premr_enreg
    return varchar2
  is
  begin
    return afw_13_navgt_pkg.obten_url_premr;
  end obten_url_premr_enreg;

  function obten_url_dernr_enreg
    return varchar2
  is
  begin
    return afw_13_navgt_pkg.obten_url_dernr (1);
  end obten_url_dernr_enreg;

  function obten_url_suivn_enreg
    return varchar2
  is
  begin
    if obten_si_dernr_enreg
    then
      return obten_url_premr_enreg;
    else
      return afw_13_navgt_pkg.obten_url_suivn;
    end if;
  end obten_url_suivn_enreg;

  function obten_url_precd_enreg
    return varchar2
  is
  begin
    if obten_si_premr_enreg
    then
      return obten_url_dernr_enreg;
    else
      return afw_13_navgt_pkg.obten_url_precd;
    end if;
  end obten_url_precd_enreg;

  function obten_regn_navgt_precd
    return varchar2
  is
  begin
    if obten_si_premr_enreg
    then
      return kva_regn_precd_premr;
    else
      return kva_regn_precd;
    end if;
  end obten_regn_navgt_precd;

  function obten_regn_navgt_suivn
    return varchar2
  is
  begin
    if obten_si_dernr_enreg
    then
      return kva_regn_suivn_dernr;
    else
      return kva_regn_suivn;
    end if;
  end obten_regn_navgt_suivn;

  procedure desct_navgt_enreg
  is
  begin
    gbo_plugn_activ   := false;
  end desct_navgt_enreg;

  function valdr_plugn_activ
    return boolean
  is
  begin
    return gbo_plugn_activ;
  end valdr_plugn_activ;
end afw_21_plugn_navgt_enreg_pkg;
/
