SET DEFINE OFF;
create or replace package body afw_21_plugn_calnd_type_pkg
as
  function obten_image_aperc_coulr (pnu_type_afich   in number
                                   ,pva_titre        in varchar2 default null
                                   ,pva_id_distn     in varchar2 default null)
    return varchar2
  is
    vva_img     varchar2 (500) default '<img align="absmiddle" style="background: none repeat scroll 0% 0% %coulr%;" alt="" class="colorpreview"
         id="P%num_page%_PRN_BORDER_COLOR_PREVIEW%id%" src="/i/1px_trans.gif" title="%titre%">';
    vva_coulr   varchar2 (7);
  begin
    select coulr_arier_plan
      into vva_coulr
      from vd_i_afw_21_plugn_calnd_type pct
     where pct.seqnc = pnu_type_afich;

    vva_img      :=
      afw_07_util_pkg.multi_replc (vva_img
                                  ,'%coulr%'
                                  ,vva_coulr
                                  ,'%num_page%'
                                  ,afw_08_url_pkg.knu_app_page_id
                                  ,'%id%'
                                  ,pva_id_distn
                                  ,'%titre%'
                                  ,pva_titre);
    return vva_img;
  exception
    when no_data_found
    then
      return null;
  end obten_image_aperc_coulr;
end afw_21_plugn_calnd_type_pkg;
/
