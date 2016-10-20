SET DEFINE OFF;
create or replace package afw_13_page_lang_cu_pkg
  authid current_user
as
  gva_libl                     varchar2 (4000) default null;
  --a utiliser lorsque sequence est nulle pour libelle page
  gva_mesg_par_deft            varchar2 (4000) default null;
  kva_mesg_par_deft   constant varchar2 (50) default 'Page non definie dans le systeme de pilotage';

  function genr_libl_page (pnu_numr_page_apex    in number
                          ,pnu_lang              in number default afw_01_lang_pkg.obten_lang_sesn ()
                          ,pnu_numr_aplic_apex   in number default afw_11_aplic_pkg.obten_numr_apex_aplic
                          ,pnu_seqnc_contx       in number default null)
    return varchar2;
end afw_13_page_lang_cu_pkg;
/
