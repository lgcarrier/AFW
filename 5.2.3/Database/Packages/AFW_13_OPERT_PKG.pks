SET DEFINE OFF;
create or replace package afw_13_opert_pkg
as
  procedure creer_opert (pva_code_prodt   in varchar2
                        ,pva_code         in varchar2
                        ,pva_nom          in varchar2
                        ,pva_descr        in varchar2
                        ,pnu_ref_fonct    in number default null);

  procedure suprm_opert (pnu_opert in number);

  procedure suprm_opert (pva_code_prodt   in varchar2
                        ,pva_code         in varchar2);

  procedure modfc_code_opert (pva_code_prodt   in varchar2
                             ,pva_code_ancn    in varchar2
                             ,pva_code_nouv    in varchar2
                             ,pva_nom_nouv     in varchar2
                             ,pva_descr_nouv   in varchar2);
end afw_13_opert_pkg;
/
