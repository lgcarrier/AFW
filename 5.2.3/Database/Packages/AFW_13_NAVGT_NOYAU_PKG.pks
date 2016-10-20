SET DEFINE OFF;
create or replace package afw_13_navgt_noyau_pkg
as
  type typ_item_rechr is record
  (
    nom_coln      varchar2 (30)
   ,nom_item      varchar2 (60)
   ,type_don      varchar2 (60)
   ,formt         varchar2 (100)
   ,valr_rechr    varchar2 (4000)
   ,indic_rechr   varchar2 (1)
  );

  type typ_arr_item_rechr is table of typ_item_rechr
    index by pls_integer;

  function obten_item_rechr (pnu_ref_page          in number
                            ,pva_schem             in varchar2
                            ,pva_table             in varchar2
                            ,pva_inclu_non_rechr   in varchar2 default 'N')
    return typ_arr_item_rechr;

  function obten_sql (pnu_navgt in number)
    return varchar2;

  function obten_indic_extra_total (pnu_page in number)
    return varchar2;

  function obten_tail_tabl_extra (pnu_page in number)
    return number;

  function obten_indic_extra_total_prodt (pnu_prodt in number)
    return varchar2;

  function obten_tail_tabl_extra_prodt (pnu_prodt in number)
    return number;

  procedure suprm_navgt_courn;

  function creer_navgt (pva_indic_extra_total   in varchar2
                       ,pva_indic_extra_termn   in varchar2
                       ,pnu_nombr_rang_extra    in number
                       ,pva_selct               in varchar2
                       ,pnu_tail_tabl_extra     in number
                       ,pnu_rpts_id             in number
                       ,pnu_ref_ir              in number)
    return number;

  function obten_navgt_courn (pnu_navgt               out number
                             ,pva_indic_extra_total   out varchar2
                             ,pva_indic_extra_termn   out varchar2
                             ,pnu_nombr_rang_extra    out number
                             ,pnu_tail_tabl_extra     out number
                             ,pnu_rpts_id             out number
                             ,pnu_ref_ir              out number)
    return boolean;

  procedure maj_navgt (pnu_navgt               in number
                      ,pva_indic_extra_total   in varchar2
                      ,pva_indic_extra_termn   in varchar2
                      ,pnu_nombr_rang_extra    in number
                      ,pnu_rpts_id             in number
                      ,pnu_ref_ir              in number);

  procedure ajout_elemn_navgt (pnu_navgt         in number
                              ,pnu_numr_elemn    in number
                              ,pnu_sspc          in number
                              ,pva_indic_courn   in varchar2);

  procedure defnr_elemn_courn_sspc (pnu_sspc in number);

  function obten_sspc_numr_elemn (pva_indic_extra_termn   in     varchar2
                                 ,pnu_numr                in     number
                                 ,pnu_numr_elemn             out number)
    return number;

  function obten_sspc_numr_elemn (pva_indic_extra_termn   in varchar2
                                 ,pnu_numr                in number)
    return number;

  function obten_numr_elemn_sspc (pnu_sspc in number)
    return number;
end afw_13_navgt_noyau_pkg;
/
