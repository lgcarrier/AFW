SET DEFINE OFF;
create or replace package afw_25_fusn_pdf_pkg
as
  procedure ajout_valr_champ_fusn (pnu_champ         in number
                                  ,pnu_publc_travl   in number
                                  ,pda_valr_date     in date);

  procedure ajout_valr_champ_fusn (pnu_champ         in number
                                  ,pnu_publc_travl   in number
                                  ,pnu_valr_nombr    in number);

  procedure ajout_valr_champ_fusn (pnu_champ         in number
                                  ,pnu_publc_travl   in number
                                  ,pva_valr_varch    in varchar2);
end afw_25_fusn_pdf_pkg;
/
