SET DEFINE OFF;
create or replace package afw_15_htp_pkg
as
  gva_nom_temn_trait_servr       varchar2 (50) default 'TRAIT_SERVR';

  kda_date_expir_temn   constant date
                                   default to_date ('1990/01/01'
                                                   ,'YYYY/MM/DD') ;

  -- Écriture différée
  procedure ecrit_difr (pbo_ecrit_difr in boolean default true);

  procedure vider;

  procedure efect_subst (pcl_clob in out nocopy clob);

  function echap_atrib (pva_texte in varchar2)
    return varchar2;

  function echap_url (pva_texte in varchar2)
    return varchar2;

  function echap_url_inver (pva_texte in varchar2)
    return varchar2;

  function echap_apex (pva_texte in varchar2)
    return varchar2;

  function echap (pva_texte           in varchar2
                 ,pva_rempl_retr_br   in varchar2 default 'N')
    return varchar2;

  procedure echap (pva_texte in varchar2 /*,
          pva_rempl_retr_br   in varchar2 default 'N'*/
                                        );

  procedure echap /*(
    pva_rempl_retr_br   in varchar2 default 'N')*/
                 ;

  procedure ecrir (pva_ligne   in varchar2
                  ,pbo_retr    in boolean default true);

  procedure ecrir;

  function obten (pbo_vider in boolean default true)
    return varchar2;

  function obten_clob (pbo_vider in boolean default true)
    return clob;

  function obten_arr (pbo_vider in boolean default true)
    return owa.vc_arr;

  function ouvri_bals (pva_nom        in varchar2
                      ,pva_parmt_1    in varchar2 default null
                      ,pva_valr_1     in varchar2 default null
                      ,pva_parmt_2    in varchar2 default null
                      ,pva_valr_2     in varchar2 default null
                      ,pva_parmt_3    in varchar2 default null
                      ,pva_valr_3     in varchar2 default null
                      ,pva_parmt_4    in varchar2 default null
                      ,pva_valr_4     in varchar2 default null
                      ,pva_parmt_5    in varchar2 default null
                      ,pva_valr_5     in varchar2 default null
                      ,pva_parmt_6    in varchar2 default null
                      ,pva_valr_6     in varchar2 default null
                      ,pva_parmt_7    in varchar2 default null
                      ,pva_valr_7     in varchar2 default null
                      ,pva_parmt_8    in varchar2 default null
                      ,pva_valr_8     in varchar2 default null
                      ,pva_parmt_9    in varchar2 default null
                      ,pva_valr_9     in varchar2 default null
                      ,pva_parmt_10   in varchar2 default null
                      ,pva_valr_10    in varchar2 default null
                      ,pva_parmt_11   in varchar2 default null
                      ,pva_valr_11    in varchar2 default null
                      ,pva_parmt_12   in varchar2 default null
                      ,pva_valr_12    in varchar2 default null
                      ,pva_parmt_13   in varchar2 default null
                      ,pva_valr_13    in varchar2 default null
                      ,pva_parmt_14   in varchar2 default null
                      ,pva_valr_14    in varchar2 default null
                      ,pva_parmt_15   in varchar2 default null
                      ,pva_valr_15    in varchar2 default null
                      ,pva_parmt_16   in varchar2 default null
                      ,pva_valr_16    in varchar2 default null
                      ,pva_parmt_17   in varchar2 default null
                      ,pva_valr_17    in varchar2 default null
                      ,pva_parmt_18   in varchar2 default null
                      ,pva_valr_18    in varchar2 default null
                      ,pva_parmt_19   in varchar2 default null
                      ,pva_valr_19    in varchar2 default null
                      ,pva_parmt_20   in varchar2 default null
                      ,pva_valr_20    in varchar2 default null
                      ,pva_extra      in varchar2 default null)
    return varchar2;

  procedure ouvri_bals (pva_nom        in varchar2
                       ,pva_parmt_1    in varchar2 default null
                       ,pva_valr_1     in varchar2 default null
                       ,pva_parmt_2    in varchar2 default null
                       ,pva_valr_2     in varchar2 default null
                       ,pva_parmt_3    in varchar2 default null
                       ,pva_valr_3     in varchar2 default null
                       ,pva_parmt_4    in varchar2 default null
                       ,pva_valr_4     in varchar2 default null
                       ,pva_parmt_5    in varchar2 default null
                       ,pva_valr_5     in varchar2 default null
                       ,pva_parmt_6    in varchar2 default null
                       ,pva_valr_6     in varchar2 default null
                       ,pva_parmt_7    in varchar2 default null
                       ,pva_valr_7     in varchar2 default null
                       ,pva_parmt_8    in varchar2 default null
                       ,pva_valr_8     in varchar2 default null
                       ,pva_parmt_9    in varchar2 default null
                       ,pva_valr_9     in varchar2 default null
                       ,pva_parmt_10   in varchar2 default null
                       ,pva_valr_10    in varchar2 default null
                       ,pva_parmt_11   in varchar2 default null
                       ,pva_valr_11    in varchar2 default null
                       ,pva_parmt_12   in varchar2 default null
                       ,pva_valr_12    in varchar2 default null
                       ,pva_parmt_13   in varchar2 default null
                       ,pva_valr_13    in varchar2 default null
                       ,pva_parmt_14   in varchar2 default null
                       ,pva_valr_14    in varchar2 default null
                       ,pva_parmt_15   in varchar2 default null
                       ,pva_valr_15    in varchar2 default null
                       ,pva_parmt_16   in varchar2 default null
                       ,pva_valr_16    in varchar2 default null
                       ,pva_parmt_17   in varchar2 default null
                       ,pva_valr_17    in varchar2 default null
                       ,pva_parmt_18   in varchar2 default null
                       ,pva_valr_18    in varchar2 default null
                       ,pva_parmt_19   in varchar2 default null
                       ,pva_valr_19    in varchar2 default null
                       ,pva_parmt_20   in varchar2 default null
                       ,pva_valr_20    in varchar2 default null
                       ,pva_extra      in varchar2 default null);

  function fermr_bals (pva_nom in varchar2)
    return varchar2;

  procedure fermr_bals (pva_nom in varchar2);

  function style (pva_parmt_1    in varchar2 default null
                 ,pva_valr_1     in varchar2 default null
                 ,pva_parmt_2    in varchar2 default null
                 ,pva_valr_2     in varchar2 default null
                 ,pva_parmt_3    in varchar2 default null
                 ,pva_valr_3     in varchar2 default null
                 ,pva_parmt_4    in varchar2 default null
                 ,pva_valr_4     in varchar2 default null
                 ,pva_parmt_5    in varchar2 default null
                 ,pva_valr_5     in varchar2 default null
                 ,pva_parmt_6    in varchar2 default null
                 ,pva_valr_6     in varchar2 default null
                 ,pva_parmt_7    in varchar2 default null
                 ,pva_valr_7     in varchar2 default null
                 ,pva_parmt_8    in varchar2 default null
                 ,pva_valr_8     in varchar2 default null
                 ,pva_parmt_9    in varchar2 default null
                 ,pva_valr_9     in varchar2 default null
                 ,pva_parmt_10   in varchar2 default null
                 ,pva_valr_10    in varchar2 default null
                 ,pva_extra      in varchar2 default null)
    return varchar2;

  function bals_anchor (pva_url       in varchar2
                       ,pva_text      in varchar2
                       ,pva_parmt_1   in varchar2 default null
                       ,pva_valr_1    in varchar2 default null
                       ,pva_parmt_2   in varchar2 default null
                       ,pva_valr_2    in varchar2 default null
                       ,pva_parmt_3   in varchar2 default null
                       ,pva_valr_3    in varchar2 default null
                       ,pva_parmt_4   in varchar2 default null
                       ,pva_valr_4    in varchar2 default null
                       ,pva_parmt_5   in varchar2 default null
                       ,pva_valr_5    in varchar2 default null
                       ,pva_parmt_6   in varchar2 default null
                       ,pva_valr_6    in varchar2 default null
                       ,pva_parmt_7   in varchar2 default null
                       ,pva_valr_7    in varchar2 default null
                       ,pva_parmt_8   in varchar2 default null
                       ,pva_valr_8    in varchar2 default null
                       ,pva_parmt_9   in varchar2 default null
                       ,pva_valr_9    in varchar2 default null
                       ,pva_extra     in varchar2 default null)
    return varchar2;

  function bals_image (pva_url       in varchar2
                      ,pva_parmt_1   in varchar2 default null
                      ,pva_valr_1    in varchar2 default null
                      ,pva_parmt_2   in varchar2 default null
                      ,pva_valr_2    in varchar2 default null
                      ,pva_parmt_3   in varchar2 default null
                      ,pva_valr_3    in varchar2 default null
                      ,pva_parmt_4   in varchar2 default null
                      ,pva_valr_4    in varchar2 default null
                      ,pva_parmt_5   in varchar2 default null
                      ,pva_valr_5    in varchar2 default null
                      ,pva_parmt_6   in varchar2 default null
                      ,pva_valr_6    in varchar2 default null
                      ,pva_parmt_7   in varchar2 default null
                      ,pva_valr_7    in varchar2 default null
                      ,pva_parmt_8   in varchar2 default null
                      ,pva_valr_8    in varchar2 default null
                      ,pva_parmt_9   in varchar2 default null
                      ,pva_valr_9    in varchar2 default null
                      ,pva_extra     in varchar2 default null)
    return varchar2;

  procedure ecrir_clob (pcl_clob in out nocopy clob);

  procedure reint_temn_trait_servr;

  procedure creer_temn_trait_servr;

  function obten_valr_temn (pva_nom in varchar2)
    return varchar2;

  procedure ajout_temn (pva_nom          in varchar2
                       ,pva_valr         in varchar2
                       ,pda_expir        in date default null
                       ,pva_chemn        in varchar2 default null
                       ,pva_domn         in varchar2 default null
                       ,pva_secrt        in varchar2 default null
                       ,pva_http_seulm   in varchar2 default null);
end afw_15_htp_pkg;
/
