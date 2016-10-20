SET DEFINE OFF;
create or replace package body afw_13_opert_pkg
as
  procedure creer_opert (pva_code_prodt   in varchar2
                        ,pva_code         in varchar2
                        ,pva_nom          in varchar2
                        ,pva_descr        in varchar2
                        ,pnu_ref_fonct    in number default null)
  is
  begin
    insert into vd_i_afw_13_opert (code
                                  ,nom
                                  ,descr
                                  ,ref_fonct
                                  ,ref_prodt
                                  ,dnr_ref_prodt)
         values (pva_code
                ,pva_nom
                ,pva_descr
                ,pnu_ref_fonct
                ,afw_11_prodt_pkg.obten_prodt (pva_code_prodt)
                ,afw_11_prodt_pkg.obten_prodt (pva_code_prodt));
  end creer_opert;

  procedure suprm_opert (pnu_opert in number)
  is
  begin
    delete vd_i_afw_13_opert
     where seqnc = pnu_opert;
  end suprm_opert;

  procedure suprm_opert (pva_code_prodt   in varchar2
                        ,pva_code         in varchar2)
  is
  begin
    delete vd_i_afw_13_opert
     where     (   ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt)
                or (    pva_code_prodt is null
                    and ref_prodt is null))
           and code = pva_code;
  end suprm_opert;

  procedure modfc_code_opert (pva_code_prodt   in varchar2
                             ,pva_code_ancn    in varchar2
                             ,pva_code_nouv    in varchar2
                             ,pva_nom_nouv     in varchar2
                             ,pva_descr_nouv   in varchar2)
  is
  begin
    update vd_i_afw_13_opert
       set code    = pva_code_nouv
          ,nom     = nvl (pva_nom_nouv, nom)
          ,descr   = nvl (pva_descr_nouv, descr)
     where     code = pva_code_ancn
           and (   ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt)
                or (    pva_code_prodt is null
                    and ref_prodt is null));
  end modfc_code_opert;
end afw_13_opert_pkg;
/
