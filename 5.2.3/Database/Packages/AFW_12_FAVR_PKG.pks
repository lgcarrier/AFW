SET DEFINE OFF;
create or replace package afw_12_favr_pkg
as
  function obten_favr (pnu_struc_aplic         in number
                      ,pnu_seqnc_struc_aplic   in number
                      ,pnu_utils               in number default null)
    return number;

  procedure ajout_favr (pnu_struc_aplic         in number
                       ,pnu_seqnc_struc_aplic   in number
                       ,pnu_utils               in number default null
                       ,pbo_appel_plugn         in boolean default true
                       ,pva_clas                in varchar2 default 'fa-star'
                       ,pva_titre               in varchar2 default 'Supprimer de vos favoris'
                       ,pva_clas_inver          in varchar2 default 'fa-star-o');

  procedure suprm_favr (pnu_struc_aplic         in number
                       ,pnu_seqnc_struc_aplic   in number
                       ,pnu_utils               in number default null
                       ,pbo_appel_plugn         in boolean default true
                       ,pva_clas                in varchar2 default 'fa-star-o'
                       ,pva_titre               in varchar2 default 'Ajouter aux favoris'
                       ,pva_clas_inver          in varchar2 default 'fa-star');

  function obten_icone_favr (pnu_seqnc_struc_aplic   in number
                            ,pnu_struc_aplic         in number default null
                            ,pnu_utils               in number default null
                            ,pva_clas_selct          in varchar2 default 'fa-star'
                            ,pva_titre_selct         in varchar2 default 'Supprimer de vos favoris'
                            ,pva_clas_non_selct      in varchar2 default 'fa-star-o'
                            ,pva_titre_non_selct     in varchar2 default 'Ajouter aux favoris')
    return varchar2;
end afw_12_favr_pkg;
/
