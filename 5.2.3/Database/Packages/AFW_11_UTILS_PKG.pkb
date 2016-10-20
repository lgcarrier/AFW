SET DEFINE OFF;
create or replace package body afw_11_utils_pkg
as
  procedure ajout_role (pnu_utils   in number
                       ,pva_role    in varchar2)
  is
  begin
    insert into vd_i_afw_11_utils (ref_prodt
                                  ,ref_utils
                                  ,role)
         values (afw_07_sesn_pkg.gva_prodt_en_cours
                ,pnu_utils
                ,pva_role);
  end ajout_role;

  function verfc_role_prodt (pnu_seqnc_utils   in number
                            ,pnu_prodt_courn   in number
                            ,pva_role_reqs     in varchar2)
    return boolean
  is
    pva_role_utils        varchar2 (5);
    pnu_numr_role_utils   number;
    pnu_numr_role_reqs    number;
  begin
    if afw_12_secrt_pkg.verfr_presn_utils_group ('SUPER_UTILS')
    then
      return true;
    end if;

    begin
      select role
        into pva_role_utils
        from vd_afw_11_utils
       where     ref_prodt = pnu_prodt_courn
             and ref_utils = pnu_seqnc_utils;
    exception
      when no_data_found
      then
        return false;
    end;

    case pva_role_utils
      when 'ADMIN'
      then
        pnu_numr_role_utils   := 1;
      when 'DEVLP'
      then
        pnu_numr_role_utils   := 2;
    end case;

    case pva_role_reqs
      when 'ADMIN'
      then
        pnu_numr_role_reqs   := 1;
      when 'DEVLP'
      then
        pnu_numr_role_reqs   := 2;
    end case;

    return pnu_numr_role_utils <= pnu_numr_role_reqs;
  end verfc_role_prodt;

  function verfc_role_prodt (pnu_seqnc_utils   in number
                            ,pva_code_prodt    in varchar2
                            ,pva_role_reqs     in varchar2)
    return boolean
  is
    pnu_prodt   number (10);
  begin
    pnu_prodt   := afw_11_prodt_pkg.obten_prodt (pva_code_prodt);

    return verfc_role_prodt (pnu_seqnc_utils
                            ,pnu_prodt
                            ,pva_role_reqs);
  end verfc_role_prodt;

  function verfc_role_prodt_nombr (pnu_seqnc_utils   in number
                                  ,pnu_prodt_courn   in number
                                  ,pva_role_reqs     in varchar2)
    return number
  is
  begin
    if verfc_role_prodt (pnu_seqnc_utils
                        ,pnu_prodt_courn
                        ,pva_role_reqs)
    then
      return 1;
    else
      return 0;
    end if;
  end verfc_role_prodt_nombr;
end afw_11_utils_pkg;
/
