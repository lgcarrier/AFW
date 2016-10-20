SET DEFINE OFF;
create or replace package body afw_04_tutrl_pkg
as
  /******************************************************************************
     NAME:       afw_04_tutrl_pkg
     PURPOSE:

     REVISIONS:
     Ver        Date        Author           Description
     ---------  ----------  ---------------  ------------------------------------
     1.0        2014/10/08      sylvain.michaud       1. Created this package body.
  ******************************************************************************/



  procedure ajout (pnu_tutrl       afw_13_tutrl.seqnc%type
                  ,pnu_ref_sesn    afw_04_tutrl.ref_sesn%type default afw_12_sesn_pkg.obten_sesn ())
  is
  begin
    insert into vd_i_afw_04_tutrl (ref_sesn
                                  ,ref_tutrl)
         values (pnu_ref_sesn
                ,pnu_tutrl);

    commit;
  end;

  procedure suprn (pnu_tutrl       afw_13_tutrl.seqnc%type
                  ,pnu_ref_sesn    afw_04_tutrl.ref_sesn%type default afw_12_sesn_pkg.obten_sesn ())
  is
  begin
    delete from afw_04_tutrl
          where     seqnc in (select seqnc
                                from vd_i_afw_13_tutrl
                               where ref_tutrl = pnu_tutrl)
                and ref_sesn = pnu_ref_sesn;
  end;

  procedure misj_chemn (pnu_tutrl          number
                       ,pnu_tutrl_suivn    number
                       ,pnu_utils          afw_12_utils.seqnc%type default afw_12_utils_pkg.obten_usagr_conct
                       ,pnu_ref_sesn       afw_04_tutrl.ref_sesn%type default afw_12_sesn_pkg.obten_sesn ())
  is
  begin
    -- Path utilisée
    ajout (pnu_tutrl
          ,pnu_ref_sesn);
    afw_12_tutrl_pkg.ajout (pnu_tutrl_suivn
                           ,0
                           ,pnu_utils);
  end;
end afw_04_tutrl_pkg;
/
