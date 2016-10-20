SET DEFINE OFF;
create or replace package afw_12_utils_avatr_pkg
is
  function exist_logo_tail_large (pnu_utils   in vd_i_afw_12_utils_avatr.ref_utils%type
                                 ,pnu_domn    in vd_i_afw_12_utils_avatr.ref_domn%type)
    return boolean;

  function exist_logo_tail_moyn (pnu_utils   in vd_i_afw_12_utils_avatr.ref_utils%type
                                ,pnu_domn    in vd_i_afw_12_utils_avatr.ref_domn%type)
    return boolean;

  function exist_logo_tail_pet (pnu_utils   in vd_i_afw_12_utils_avatr.ref_utils%type
                               ,pnu_domn    in vd_i_afw_12_utils_avatr.ref_domn%type)
    return boolean;

  function valdr_sesn (pnu_utils   in vd_i_afw_12_utils_avatr.ref_utils%type
                      ,pnu_sesn    in vd_i_afw_12_sesn.id_sesn%type)
    return boolean;

  procedure downl_logo_tail_large (pnu_utils    in vd_i_afw_12_utils_avatr.ref_utils%type
                                  ,pnu_domn     in vd_i_afw_12_utils_avatr.ref_domn%type
                                  ,pnu_sesn     in vd_i_afw_12_sesn.id_sesn%type
                                  ,pbl_inline   in boolean default true);
end afw_12_utils_avatr_pkg;
/
