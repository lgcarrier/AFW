SET DEFINE OFF;
create or replace package body afw_25_fusn_pdf_pkg
as
  procedure ajout_valr_champ_fusn (pnu_champ         in number
                                  ,pnu_publc_travl   in number
                                  ,pda_valr_date     in date)
  is
  begin
    insert into vd_i_afw_25_valr_champ (ref_champ
                                       ,ref_publc_travl
                                       ,valr_date)
         values (pnu_champ
                ,pnu_publc_travl
                ,pda_valr_date);
  end ajout_valr_champ_fusn;

  procedure ajout_valr_champ_fusn (pnu_champ         in number
                                  ,pnu_publc_travl   in number
                                  ,pnu_valr_nombr    in number)
  is
  begin
    insert into vd_i_afw_25_valr_champ (ref_champ
                                       ,ref_publc_travl
                                       ,valr_nombr)
         values (pnu_champ
                ,pnu_publc_travl
                ,pnu_valr_nombr);
  end ajout_valr_champ_fusn;

  procedure ajout_valr_champ_fusn (pnu_champ         in number
                                  ,pnu_publc_travl   in number
                                  ,pva_valr_varch    in varchar2)
  is
  begin
    insert into vd_i_afw_25_valr_champ (ref_champ
                                       ,ref_publc_travl
                                       ,valr_varch)
         values (pnu_champ
                ,pnu_publc_travl
                ,pva_valr_varch);
  end ajout_valr_champ_fusn;
end afw_25_fusn_pdf_pkg;
/
