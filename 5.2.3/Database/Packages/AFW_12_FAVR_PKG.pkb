SET DEFINE OFF;
create or replace package body afw_12_favr_pkg
as
  gnu_utils                      vd_afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct ();
  gnu_struc_aplic                number (10) default afw_13_page_pkg.obten_struc_aplic (afw_13_page_pkg.obten_page_sesn ());

  kva_clas_base_ajout   constant varchar2 (50) default 'afw_12_suprm_favr ajout_suprm_favr fa ';
  kva_clas_base_suprm   constant varchar2 (50) default 'afw_12_ajout_favr ajout_suprm_favr fa ';

  function obten_favr (pnu_struc_aplic         in number
                      ,pnu_seqnc_struc_aplic   in number
                      ,pnu_utils               in number default null)
    return number
  is
    vnu_favr    vd_afw_12_favr.seqnc%type;
    vnu_utils   vd_afw_12_utils.seqnc%type;
  begin
    vnu_utils   := nvl (pnu_utils, gnu_utils);

    select seqnc
      into vnu_favr
      from vd_afw_12_favr
     where     ref_struc_aplic = pnu_struc_aplic
           and ref_seqnc_struc_aplic = pnu_seqnc_struc_aplic
           and ref_utils = pnu_utils;

    return vnu_favr;
  exception
    when others
    then
      return null;
  end obten_favr;

  procedure ajout_favr (pnu_struc_aplic         in number
                       ,pnu_seqnc_struc_aplic   in number
                       ,pnu_utils               in number default null
                       ,pbo_appel_plugn         in boolean default true
                       ,pva_clas                in varchar2 default 'fa-star'
                       ,pva_titre               in varchar2 default 'Supprimer de vos favoris'
                       ,pva_clas_inver          in varchar2 default 'fa-star-o')
  is
    vnu_utils   vd_afw_12_utils.seqnc%type;
  begin
    vnu_utils   := nvl (pnu_utils, gnu_utils);

    if obten_favr (pnu_struc_aplic
                  ,pnu_seqnc_struc_aplic
                  ,pnu_utils)
         is null
    then
      insert into vd_afw_12_favr (ref_struc_aplic
                                 ,ref_seqnc_struc_aplic
                                 ,ref_utils)
           values (pnu_struc_aplic
                  ,pnu_seqnc_struc_aplic
                  ,vnu_utils);

      if     sql%rowcount = 1
         and pbo_appel_plugn
      then
        afw_15_htp_pkg.ecrir (   '{"class_ajout":"'
                              || pva_clas
                              || '","class_delt":"'
                              || pva_clas_inver
                              || '","title":"'
                              || pva_titre
                              || '"}');
      end if;
    end if;
  exception
    when others
    then
      ete (sqlerrm);
  end ajout_favr;

  procedure suprm_favr (pnu_struc_aplic         in number
                       ,pnu_seqnc_struc_aplic   in number
                       ,pnu_utils               in number default null
                       ,pbo_appel_plugn         in boolean default true
                       ,pva_clas                in varchar2 default 'fa-star-o'
                       ,pva_titre               in varchar2 default 'Ajouter aux favoris'
                       ,pva_clas_inver          in varchar2 default 'fa-star')
  is
    vnu_utils   vd_afw_12_utils.seqnc%type;
    vnu_favr    vd_afw_12_favr.seqnc%type;
  begin
    vnu_utils   := nvl (pnu_utils, gnu_utils);

    vnu_favr      :=
      obten_favr (pnu_struc_aplic
                 ,pnu_seqnc_struc_aplic
                 ,vnu_utils);

    delete vd_afw_12_favr
     where seqnc = vnu_favr;

    if     sql%rowcount = 1
       and pbo_appel_plugn
    then
      afw_15_htp_pkg.ecrir (   '{"class_ajout":"'
                            || pva_clas
                            || '","class_delt":"'
                            || pva_clas_inver
                            || '","title":"'
                            || pva_titre
                            || '"}');
    end if;
  exception
    when others
    then
      ete (sqlerrm);
  end suprm_favr;

  function obten_icone_favr_selct (pnu_struc_aplic         in number
                                  ,pnu_seqnc_struc_aplic   in number
                                  ,pva_clas                in varchar2 default 'fa-star'
                                  ,pva_titre               in varchar2 default 'Supprimer de vos favoris')
    return varchar2
  is
    vva_icone_favr   varchar2 (4000);
  begin
    vva_icone_favr      :=
         afw_15_htp_pkg.ouvri_bals ('i'
                                   ,'class'
                                   ,   kva_clas_base_ajout
                                    || pva_clas
                                   ,'title'
                                   ,pva_titre
                                   ,'onclick'
                                   ,   'javascript:afw.afw_21.actio_dynmq.favr.ajout_suprm(this,'
                                    || pnu_struc_aplic
                                    || ','
                                    || pnu_seqnc_struc_aplic
                                    || ');')
      || afw_15_htp_pkg.fermr_bals ('i');

    return vva_icone_favr;
  end obten_icone_favr_selct;

  function obten_icone_favr_non_selct (pnu_struc_aplic         in number
                                      ,pnu_seqnc_struc_aplic   in number
                                      ,pva_clas                in varchar2 default 'fa-star-o'
                                      ,pva_titre               in varchar2 default 'Ajouter aux favoris')
    return varchar2
  is
    vva_icone_favr   varchar2 (4000);
  begin
    vva_icone_favr      :=
         afw_15_htp_pkg.ouvri_bals ('i'
                                   ,'class'
                                   ,   kva_clas_base_suprm
                                    || pva_clas
                                   ,'title'
                                   ,pva_titre
                                   ,'onclick'
                                   ,   'javascript:afw.afw_21.actio_dynmq.favr.ajout_suprm(this,'
                                    || pnu_struc_aplic
                                    || ','
                                    || pnu_seqnc_struc_aplic
                                    || ');')
      || afw_15_htp_pkg.fermr_bals ('i');
    return vva_icone_favr;
  end obten_icone_favr_non_selct;

  function obten_icone_favr (pnu_seqnc_struc_aplic   in number
                            ,pnu_struc_aplic         in number default null
                            ,pnu_utils               in number default null
                            ,pva_clas_selct          in varchar2 default 'fa-star'
                            ,pva_titre_selct         in varchar2 default 'Supprimer de vos favoris'
                            ,pva_clas_non_selct      in varchar2 default 'fa-star-o'
                            ,pva_titre_non_selct     in varchar2 default 'Ajouter aux favoris')
    return varchar2
  is
    vnu_struc_aplic   vd_afw_12_struc_aplic.seqnc%type;
    vnu_utils         vd_afw_12_utils.seqnc%type;
    vva_icone_favr    varchar2 (4000);
  begin
    vnu_struc_aplic   := nvl (pnu_struc_aplic, gnu_struc_aplic);

    vnu_utils         := nvl (pnu_utils, gnu_utils);

    if obten_favr (vnu_struc_aplic
                  ,pnu_seqnc_struc_aplic
                  ,vnu_utils)
         is null
    then
      vva_icone_favr      :=
        obten_icone_favr_non_selct (vnu_struc_aplic
                                   ,pnu_seqnc_struc_aplic
                                   ,pva_clas_non_selct
                                   ,pva_titre_non_selct);
    else
      vva_icone_favr      :=
        obten_icone_favr_selct (vnu_struc_aplic
                               ,pnu_seqnc_struc_aplic
                               ,pva_clas_selct
                               ,pva_titre_selct);
    end if;

    return vva_icone_favr;
  end;
end afw_12_favr_pkg;
/
