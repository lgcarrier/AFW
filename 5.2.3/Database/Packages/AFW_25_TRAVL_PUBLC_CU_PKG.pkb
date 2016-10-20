SET DEFINE OFF;
create or replace package body afw_25_travl_publc_cu_pkg
is
  function obten_pdf (pnu_travl         in number
                     ,pnu_publc_travl   in number
                     ,pva_iden_procd    in varchar2)
    return blob
  is
    vbl_pdf   blob;
  begin
    execute immediate
         'select '
      || pva_iden_procd
      || '(:1, :2) from dual'
      into vbl_pdf
      using pnu_travl
           ,pnu_publc_travl;

    update vd_i_afw_25_travl
       set ref_stat      =
             afw_12_stat_pkg.obten_stat ('TRAVL'
                                        ,'TERMN'
                                        ,'AFW')
     where seqnc = pnu_travl;

    return vbl_pdf;
  exception
    when others
    then
      ete ();
      raise;
  end obten_pdf;
end afw_25_travl_publc_cu_pkg;
/
