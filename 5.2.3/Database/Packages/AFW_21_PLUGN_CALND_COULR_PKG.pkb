SET DEFINE OFF;
create or replace package body afw_21_plugn_calnd_coulr_pkg
as
  function obten_image_aperc_coulr (pnu_ordre_presn   in number
                                   ,pva_libl          in varchar2 default null
                                   ,pva_titre         in varchar2 default null)
    return varchar2
  is
    vva_img     varchar2 (500) default '<img align="absmiddle" style="background: none repeat scroll 0% 0% %coulr%;" alt="" class="colorpreview"
         src="/i/1px_trans.gif" title="%titre%">';
    vva_coulr   varchar2 (7);
    vva_titre   varchar2 (30) default null;
  begin
    select gca.coulr
      into vva_coulr
      from vd_i_afw_21_plugn_calnd_coulr gca
     where gca.ordre_presn = pnu_ordre_presn;

    vva_img      :=
      afw_07_util_pkg.multi_replc (vva_img
                                  ,'%coulr%'
                                  ,vva_coulr
                                  ,'%titre%'
                                  ,pva_titre);
    return vva_img;
  exception
    when no_data_found
    then
      return null;
  end obten_image_aperc_coulr;

  procedure defnr_css
  is
    vva_style   varchar2 (32767);

    cursor cur_calnd_coulr
    is
        select ordre_presn
              ,coulr
              ,coulr_text
          from vd_afw_21_plugn_calnd_coulr
      order by ordre_presn;
  begin
    for rec_calnd_coulr in cur_calnd_coulr
    loop
      vva_style      :=
           vva_style
        || '.fc-event-skin.agend_'
        || rec_calnd_coulr.ordre_presn
        || ', .fc-event-skin.agend_'
        || rec_calnd_coulr.ordre_presn
        || ' .fc-event-skin {'
        || 'background-color:'
        || rec_calnd_coulr.coulr
        || ';'
        || 'border-color:'
        || rec_calnd_coulr.coulr
        || ';'
        || 'color:'
        || rec_calnd_coulr.coulr_text
        || ';'
        || '}';
    end loop;

    afw_21_util_pkg.ajout_css (vva_style);
  end defnr_css;
end afw_21_plugn_calnd_coulr_pkg;
/
