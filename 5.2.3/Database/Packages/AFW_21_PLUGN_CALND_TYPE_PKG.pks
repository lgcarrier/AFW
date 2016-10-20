SET DEFINE OFF;
create or replace package afw_21_plugn_calnd_type_pkg
as
  function obten_image_aperc_coulr (pnu_type_afich   in number
                                   ,pva_titre        in varchar2 default null
                                   ,pva_id_distn     in varchar2 default null)
    return varchar2;
end afw_21_plugn_calnd_type_pkg;
/
