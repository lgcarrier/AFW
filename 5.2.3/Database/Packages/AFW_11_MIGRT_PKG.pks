SET DEFINE OFF;
create or replace package afw_11_migrt_pkg
is
  gva_ligne_inser          varchar2 (32767);
  gva_ligne_selct          varchar2 (32767);
  gva_ligne_updat          varchar2 (32767);
  gva_indic_migrt          varchar2 (1) default 'N';
  gbo_presn_don            boolean default false;
  gva_nom_coln_cle_subst   varchar2 (30) default null;

  procedure maj_refrn_schem (pnu_versn in number);

  procedure maj_refrn_entit (pnu_versn in number);

  procedure metr_a_jour_refrn (pnu_versn in number);

  procedure telch_fichr_expor_metdn_afw (pva_contx         in varchar2
                                        ,pnu_seqnc_contx   in number
                                        ,pva_nom_fichr     in varchar2 default null
                                        ,pva_schem         in varchar2 default null
                                        ,pva_domn          in varchar2 default null);

  --Procédure pour le code générique
  procedure debt_enonc_inser (pva_table_tempr   in varchar2
                             ,pva_schem_tempr   in varchar2);

  procedure ajout_elemn_enonc_inser (pva_code_coln     in varchar2
                                    ,pva_valr          in varchar2
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_inser (pva_code_coln     in varchar2
                                    ,pnu_valr          in number
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_inser (pva_code_coln     in varchar2
                                    ,pda_valr          in date
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_inser (pva_code_coln     in varchar2
                                    ,pcl_valr          in clob
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure termn_enonc_inser (pva_entit in varchar2);

  procedure trait_genrq (pnu_seqnc_entit   in number
                        ,pva_entit         in varchar2
                        ,vva_enonc_sql        varchar2);

  procedure alimn_clob_selct (pnu_seqnc_entit   in number
                             ,pnu_seqnc_dev     in number);

  procedure alimn_clob_updat (pnu_seqnc_entit   in number
                             ,pnu_seqnc_dev     in number);

  procedure alimn_clob_segmn_clob (pcl_clob              in out nocopy clob
                                  ,pva_nom_table_tempr   in            varchar2
                                  ,pva_nom_atrib         in            varchar2
                                  ,pnu_seqnc_dev         in            number);

  procedure ajout_elemn_enonc_selct (pva_code_coln     in varchar2
                                    ,pva_valr          in varchar2
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_selct (pva_code_coln     in varchar2
                                    ,pnu_valr          in number
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_selct (pva_code_coln     in varchar2
                                    ,pda_valr          in date
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_selct (pva_code_coln     in varchar2
                                    ,pcl_valr          in clob
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_updat (pva_code_coln     in varchar2
                                    ,pva_valr          in varchar2
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_updat (pva_code_coln     in varchar2
                                    ,pnu_valr          in number
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_updat (pva_code_coln     in varchar2
                                    ,pda_valr          in date
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure ajout_elemn_enonc_updat (pva_code_coln     in varchar2
                                    ,pcl_valr          in clob
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2);

  procedure incre_nombr_ligne;
end afw_11_migrt_pkg;
/
