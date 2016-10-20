SET DEFINE OFF;
create or replace package afw_07_csv_pkg
as
  type tre_coln_csv is record
  (
    ordre_presn   number
   ,libl_coln     varchar2 (100 char)
   ,nom_coln      varchar2 (30 char)
   ,type_don      varchar2 (30 char)
   ,masq_formt    varchar2 (30 char)
   ,tail_don      number
   ,stat_charg    varchar2 (1 char) default 'Y'
  );

  type tta_rang_csv is table of tre_coln_csv;

  function obten_apex_csv_impor_nom_colct
    return varchar2;

  function valdr_fichr (pnu_id_fichr           in     number
                       ,pnu_nombr_coln_cible   in     number
                       ,pva_liste_coln_cible   in     varchar2
                       ,pva_code_ereur         in out varchar2)
    return boolean;

  procedure creer_colct_csv (pnu_id_fichr                in number
                            ,pva_seprt                   in varchar2 default ','
                            ,pva_enclo_by                in varchar2 default '"'
                            ,pbo_first_row_is_col_name   in boolean default false
                            ,pva_curnc                   in varchar2 default '$'
                            ,pva_numrc_chars             in varchar2 default '.,'
                            ,pva_chars                   in varchar2 default null);

  procedure maj_colct_fichr_csv (pta_rang_csv in tta_rang_csv);

  procedure fichr_csv_vers_table (pnu_id_fichr                in     number
                                 ,pva_seprt                   in     varchar2 default ','
                                 ,pva_enclo_by                in     varchar2 default '"'
                                 ,pbo_first_row_is_col_name   in     boolean default false
                                 ,pva_curnc                   in     varchar2 default '$'
                                 ,pva_numrc_chars             in     varchar2 default '.,'
                                 ,pva_chars                   in     varchar2 default null
                                 ,pta_rang_csv                in     tta_rang_csv
                                 ,pva_schem_cible             in     varchar2
                                 ,pva_table_cible             in     varchar2
                                 ,pva_code_ereur              in out varchar2);

  function valdr_dons_charg (pnu_id_fichr      in     number
                            ,pva_utils_creat   in     varchar2 default afw_07_util_pkg.v ('APP_USER')
                            ,pnu_secrt_group   in     number default afw_07_util_pkg.nv ('FLOW_SECURITY_GROUP_ID')
                            ,pva_code_ereur    in out varchar2)
    return boolean;

  function obten_mesg_impor_inval
    return varchar2;

  function defnr_defnt_coln (pnu_ordre_presn   in number
                            ,pva_libl_coln     in varchar2
                            ,pva_nom_coln      in varchar2
                            ,pva_type_don      in varchar2
                            ,pva_masq_formt    in varchar2
                            ,pnu_tail_don      in number
                            ,pva_stat_charg    in varchar2 default 'Y')
    return tre_coln_csv;

  function obten_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.blob_content%type;

  function obten_nom_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.filename%type;

  function obten_id_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.id%type;

  procedure suprm_fichr (pva_nom in apex_fichr.name%type);
end afw_07_csv_pkg;
/
