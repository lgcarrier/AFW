SET DEFINE OFF;
create or replace package afw_01_gestn_mesg_pkg
as
  kva_type_mesg_err         constant varchar2 (1) default 'E';
  kva_type_mesg_err_critq   constant varchar2 (1) default 'C';
  kva_type_mesg_infor       constant varchar2 (1) default 'I';
  kva_type_mesg_aide        constant varchar2 (1) default 'A';
  kva_type_mesg_avert       constant varchar2 (1) default 'W';

  function obten_seqnc_mesg (pva_numr_mesg    in varchar2
                            ,pva_code_prodt   in varchar2 default null)
    return vd_i_afw_01_mesg.seqnc%type;

  function obten_seqnc_mesg_lang_sesn (pva_numr_mesg    in varchar2
                                      ,pva_code_prodt   in varchar2 default null)
    return vd_i_afw_01_mesg_lang.seqnc%type;

  function obten_mesg (pnu_seqnc_mesg     in number
                      ,pva_valr_subst1    in varchar2 default null
                      ,pva_valr_subst2    in varchar2 default null
                      ,pva_valr_subst3    in varchar2 default null
                      ,pva_valr_subst4    in varchar2 default null
                      ,pva_valr_subst5    in varchar2 default null
                      ,pva_valr_subst6    in varchar2 default null
                      ,pva_valr_subst7    in varchar2 default null
                      ,pva_valr_subst8    in varchar2 default null
                      ,pva_valr_subst9    in varchar2 default null
                      ,pva_valr_subst10   in varchar2 default null)
    return varchar2;

  function obten_mesg_par_numr (pva_numr_mesg      in varchar2
                               ,pva_code_prodt     in varchar2 default null
                               ,pva_valr_subst1    in varchar2 default null
                               ,pva_valr_subst2    in varchar2 default null
                               ,pva_valr_subst3    in varchar2 default null
                               ,pva_valr_subst4    in varchar2 default null
                               ,pva_valr_subst5    in varchar2 default null
                               ,pva_valr_subst6    in varchar2 default null
                               ,pva_valr_subst7    in varchar2 default null
                               ,pva_valr_subst8    in varchar2 default null
                               ,pva_valr_subst9    in varchar2 default null
                               ,pva_valr_subst10   in varchar2 default null)
    return varchar2;

  procedure afich_mesg_par_numr (pva_numr_mesg      in varchar2
                                ,pva_code_prodt     in varchar2 default null
                                ,pva_valr_subst1    in varchar2 default null
                                ,pva_valr_subst2    in varchar2 default null
                                ,pva_valr_subst3    in varchar2 default null
                                ,pva_valr_subst4    in varchar2 default null
                                ,pva_valr_subst5    in varchar2 default null
                                ,pva_valr_subst6    in varchar2 default null
                                ,pva_valr_subst7    in varchar2 default null
                                ,pva_valr_subst8    in varchar2 default null
                                ,pva_valr_subst9    in varchar2 default null
                                ,pva_valr_subst10   in varchar2 default null);

  function obten_proch_numr (pva_catgr in varchar2)
    return varchar2;

  function obten_list_mesg_formt (pva_liste in varchar2)
    return varchar2;

  procedure creer_mesg_aide_lang (pnu_page    in number
                                 ,pnu_lang    in number
                                 ,pnu_prodt   in number
                                 ,pva_catgr   in varchar2);

  function genr_lang_mesg (pnu_mesg   in number
                          ,pnu_lang   in number
                          ,pva_mode   in varchar2)
    return boolean;

  procedure obten_aide_page_item (pnu_sidf           in number
                                 ,pnu_item_id_apex   in number
                                 ,pnu_lang           in number default null);

  function obten_nombr_item (pnu_page        in number
                            ,pnu_lang        in number
                            ,pva_type_item   in varchar2)
    return number;

  function creer_mesg (pva_catgr_numr_mesg   in varchar2
                      ,pva_texte_mesg        in vd_i_afw_01_mesg_lang.mesg%type
                      ,pva_type_mesg         in vd_i_afw_01_mesg.type_mesg%type
                      ,pnu_prodt             in vd_i_afw_01_mesg.ref_prodt%type default afw_11_prodt_pkg.obten_prodt_sesn
                      ,pnu_lang              in vd_i_afw_01_mesg_lang.ref_lang%type default afw_01_lang_pkg.obten_lang_sesn)
    return vd_i_afw_01_mesg.seqnc%type;

  procedure creer_mesg (pva_catgr_numr_mesg   in varchar2
                       ,pva_texte_mesg        in vd_i_afw_01_mesg_lang.mesg%type
                       ,pva_type_mesg         in vd_i_afw_01_mesg.type_mesg%type
                       ,pnu_prodt             in vd_i_afw_01_mesg.ref_prodt%type default afw_11_prodt_pkg.obten_prodt_sesn
                       ,pnu_lang              in vd_i_afw_01_mesg_lang.ref_lang%type default afw_01_lang_pkg.obten_lang_sesn);
end afw_01_gestn_mesg_pkg;
/
