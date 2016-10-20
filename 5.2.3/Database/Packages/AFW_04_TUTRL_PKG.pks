SET DEFINE OFF;
create or replace package afw_04_tutrl_pkg
as
  procedure ajout (pnu_tutrl       afw_13_tutrl.seqnc%type
                  ,pnu_ref_sesn    afw_04_tutrl.ref_sesn%type default afw_12_sesn_pkg.obten_sesn ());

  procedure suprn (pnu_tutrl       afw_13_tutrl.seqnc%type
                  ,pnu_ref_sesn    afw_04_tutrl.ref_sesn%type default afw_12_sesn_pkg.obten_sesn ());

  procedure misj_chemn (pnu_tutrl          number
                       ,pnu_tutrl_suivn    number
                       ,pnu_utils          afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct
                       ,pnu_ref_sesn       afw_04_tutrl.ref_sesn%type default afw_12_sesn_pkg.obten_sesn ());
end afw_04_tutrl_pkg;
/
