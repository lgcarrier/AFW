SET DEFINE OFF;
create or replace package afw_11_utils_pkg
as
  procedure ajout_role (pnu_utils   in number
                       ,pva_role    in varchar2);

  function verfc_role_prodt (pnu_seqnc_utils   in number
                            ,pnu_prodt_courn   in number
                            ,pva_role_reqs     in varchar2)
    return boolean;

  function verfc_role_prodt (pnu_seqnc_utils   in number
                            ,pva_code_prodt    in varchar2
                            ,pva_role_reqs     in varchar2)
    return boolean;

  function verfc_role_prodt_nombr (pnu_seqnc_utils   in number
                                  ,pnu_prodt_courn   in number
                                  ,pva_role_reqs     in varchar2)
    return number;
end afw_11_utils_pkg;
/
