SET DEFINE OFF;
create or replace package body afw_03_journ_pkg
is
  gva_travl   varchar2 (200);


  procedure ecrir_journ (pva_expli              in varchar2 default null
                        ,pva_travl              in varchar2 default null
                        ,pva_code_clas_inter    in varchar2 default null
                        ,pbo_notfr_mesg_infor   in boolean default false)
  is
    pragma autonomous_transaction;
    vva_ereur          varchar2 (500)
                         default substr (sqlerrm
                                        ,1
                                        ,500);
    rec_afw_03_journ   afw_03_journ%rowtype;
  begin
    insert into afw_03_journ (expli
                             ,ereur
                             ,pile_trace
                             ,travl)
         values (substr (nvl (pva_expli, afw_07_util_pkg.procd_appel (1))
                        ,1
                        ,4000)
                ,vva_ereur
                ,dbms_utility.format_error_backtrace ()
                ,nvl (pva_travl, gva_travl))
      returning date_heure
               ,expli
               ,ereur
               ,pile_trace
               ,travl
               ,date_heure
           into rec_afw_03_journ.date_heure
               ,rec_afw_03_journ.expli
               ,rec_afw_03_journ.ereur
               ,rec_afw_03_journ.pile_trace
               ,rec_afw_03_journ.travl
               ,rec_afw_03_journ.date_heure;

    commit;

    if pva_code_clas_inter is not null
    then
      afw_03_envoi_courl_pkg.notfr_clas_inter (afw_11_prodt_pkg.obten_prodt_sesn
                                              ,pva_code_clas_inter
                                              ,rec_afw_03_journ);
    end if;

    if pbo_notfr_mesg_infor
    then
      if afw_08_url_pkg.knu_sesn is not null
      then
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('SAF.000030'
                                                       ,rec_afw_03_journ.date_heure
                                                       ,pva_code_prodt   => 'AFW');
      end if;
    end if;

    commit;
  end ecrir_journ;

  procedure defnr_travl (pva_travl in varchar2)
  is
  begin
    gva_travl   := pva_travl;
  end defnr_travl;

  procedure purgr
  is
  begin
    execute immediate 'truncate table afw_03_journ';
  end purgr;
end afw_03_journ_pkg;
/
