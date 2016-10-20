SET DEFINE OFF;
create or replace package afw_21_plugn_calnd_coulr_pkg
as
  function obten_image_aperc_coulr (pnu_ordre_presn   in number
                                   ,pva_libl          in varchar2 default null
                                   ,pva_titre         in varchar2 default null)
    return varchar2;

  procedure defnr_css;
end afw_21_plugn_calnd_coulr_pkg;
/
