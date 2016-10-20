SET DEFINE OFF;
create or replace package body afw_07_csv_pkg
as
  kva_apex_csv_impor_nom_colct    constant varchar2 (30) default 'CSV_IMPORT';
  kva_apex_inval_csv_vers_table   constant varchar2 (30) default 'INVAL_CSV_IMPOR';

  function obten_apex_csv_impor_nom_colct
    return varchar2
  is
  begin
    return kva_apex_csv_impor_nom_colct;
  end obten_apex_csv_impor_nom_colct;


  function valdr_fichr (pnu_id_fichr           in     number
                       ,pnu_nombr_coln_cible   in     number
                       ,pva_liste_coln_cible   in     varchar2
                       ,pva_code_ereur         in out varchar2)
    return boolean
  is
    vbo_vald   boolean default true;

    function valdr_type (pnu_id_fichr in number)
      return boolean
    is
      vbo_vald        boolean default true;
      vva_mime_type   varchar2 (255);
    begin
      vva_mime_type   := lower (afw_07_fichr_apex_pkg.obten_mime_type_fichr (pnu_id_fichr));

      if vva_mime_type not in ('application/csv'
                              ,'application/excel'
                              ,'application/vnd.ms-excel'
                              ,'text/csv')
      then
        vbo_vald   := false;

        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('IMP.000001');
      end if;

      return vbo_vald;
    end valdr_type;

    function valdr_nombr_coln
      return boolean
    is
      vbo_vald         boolean default true;
      vnu_nombr_coln   number;
    begin
      vnu_nombr_coln   := afw_07_apex_colct_pkg.obten_nombr_coln (kva_apex_csv_impor_nom_colct);

      if vnu_nombr_coln <> pnu_nombr_coln_cible
      then
        vbo_vald   := false;

        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('IMP.000002'
                                                       ,pva_valr_subst1   => pnu_nombr_coln_cible
                                                       ,pva_valr_subst2   => vnu_nombr_coln
                                                       ,pva_valr_subst3   => pva_liste_coln_cible);
      end if;

      return vbo_vald;
    exception
      when others
      then
        return false;
    end valdr_nombr_coln;
  begin
    if     vbo_vald
       and not valdr_type (pnu_id_fichr)
    then
      pva_code_ereur   := 'EREUR_TYPE_FICHR_INVAL';
      vbo_vald         := false;
    end if;

    if     vbo_vald
       and not valdr_nombr_coln
    then
      pva_code_ereur   := 'EREUR_NOMBR_COLN_INVAL';
      vbo_vald         := false;
    end if;

    if not vbo_vald
    then
      afw_07_fichr_apex_pkg.suprm_fichr (pnu_id_fichr);
    end if;

    return vbo_vald;
  end valdr_fichr;

  procedure charg_dons_csv (pnu_id_fichr                in number
                           ,pvc_cnams                   in apex_application_global.vc_arr2
                           ,pvc_uploa                   in apex_application_global.vc_arr2
                           ,pva_schem                   in varchar2
                           ,pva_table                   in varchar2
                           ,pvc_data_type               in apex_application_global.vc_arr2
                           ,pvc_data_formt              in apex_application_global.vc_arr2 default apex_application.empty_vc_arr
                           ,pvc_parsd_data_formt        in apex_application_global.vc_arr2 default apex_application.empty_vc_arr
                           ,pva_seprt                   in varchar2 default ','
                           ,pva_enclo_by                in varchar2 default null
                           ,pbo_first_row_is_col_name   in boolean default false
                           ,pva_load_to                 in varchar2 default 'EXIST'
                           ,pva_curnc                   in varchar2 default '$'
                           ,pva_numrc_chars             in varchar2 default '.,'
                           ,pva_chars                   in varchar2 default null
                           ,pnu_load_id                 in number default null)
  is
  begin
    apex_don_charg.load_csv_data (p_file_id                 => pnu_id_fichr
                                 ,p_cnames                  => pvc_cnams
                                 ,p_upload                  => pvc_uploa
                                 ,p_schema                  => pva_schem
                                 ,p_table                   => pva_table
                                 ,p_data_type               => pvc_data_type
                                 ,p_data_format             => pvc_data_formt
                                 ,p_parsed_data_format      => pvc_parsd_data_formt
                                 ,p_separator               => pva_seprt
                                 ,p_enclosed_by             => pva_enclo_by
                                 ,p_first_row_is_col_name   => pbo_first_row_is_col_name
                                 ,p_load_to                 => pva_load_to
                                 ,p_currency                => pva_curnc
                                 ,p_numeric_chars           => pva_numrc_chars
                                 ,p_charset                 => pva_chars
                                 ,p_load_id                 => pnu_load_id);
  end charg_dons_csv;

  procedure creer_colct_csv (pnu_id_fichr                in number
                            ,pva_seprt                   in varchar2 default ','
                            ,pva_enclo_by                in varchar2 default '"'
                            ,pbo_first_row_is_col_name   in boolean default false
                            ,pva_curnc                   in varchar2 default '$'
                            ,pva_numrc_chars             in varchar2 default '.,'
                            ,pva_chars                   in varchar2 default null)
  is
  begin
    apex_don_charg.create_csv_collection (p_file_id                 => pnu_id_fichr
                                         ,p_separator               => pva_seprt
                                         ,p_enclosed_by             => pva_enclo_by
                                         ,p_first_row_is_col_name   => pbo_first_row_is_col_name
                                         ,p_currency                => pva_curnc
                                         ,p_numeric_chars           => pva_numrc_chars
                                         ,p_charset                 => pva_chars);
  end creer_colct_csv;

  procedure maj_colct_fichr_csv (pta_rang_csv in tta_rang_csv)
  is
  begin
    if pta_rang_csv.count > 0
    then
      for i in pta_rang_csv.first .. pta_rang_csv.last
      loop
        -- bind column name
        afw_07_apex_colct_pkg.maj_colct_membr_atrib (pva_colct_name    => kva_apex_csv_impor_nom_colct
                                                    ,pnu_seqnc         => pta_rang_csv (i).ordre_presn
                                                    ,pnu_atrib_numbr   => 1
                                                    ,pva_valr          => upper (pta_rang_csv (i).nom_coln));

        -- bind data type
        afw_07_apex_colct_pkg.maj_colct_membr_atrib (pva_colct_name    => kva_apex_csv_impor_nom_colct
                                                    ,pnu_seqnc         => pta_rang_csv (i).ordre_presn
                                                    ,pnu_atrib_numbr   => 2
                                                    ,pva_valr          => pta_rang_csv (i).type_don);

        -- bind upload status
        afw_07_apex_colct_pkg.maj_colct_membr_atrib (pva_colct_name    => kva_apex_csv_impor_nom_colct
                                                    ,pnu_seqnc         => pta_rang_csv (i).ordre_presn
                                                    ,pnu_atrib_numbr   => 4
                                                    ,pva_valr          => pta_rang_csv (i).stat_charg);

        -- taille
        afw_07_apex_colct_pkg.maj_colct_membr_atrib (pva_colct_name    => kva_apex_csv_impor_nom_colct
                                                    ,pnu_seqnc         => pta_rang_csv (i).ordre_presn
                                                    ,pnu_atrib_numbr   => 5
                                                    ,pva_valr          => pta_rang_csv (i).tail_don);

        -- bind format mask
        afw_07_apex_colct_pkg.maj_colct_membr_atrib (pva_colct_name    => kva_apex_csv_impor_nom_colct
                                                    ,pnu_seqnc         => pta_rang_csv (i).ordre_presn
                                                    ,pnu_atrib_numbr   => 6
                                                    ,pva_valr          => pta_rang_csv (i).masq_formt);
      end loop;
    end if;
  end maj_colct_fichr_csv;

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
                                 ,pva_code_ereur              in out varchar2)
  is
    vvc_cnams              apex_application_global.vc_arr2;
    vvc_data_types         apex_application_global.vc_arr2;
    vvc_parsd_data_formt   apex_application_global.vc_arr2;
    vvc_uploa              apex_application_global.vc_arr2;
    vvc_data_formt         apex_application_global.vc_arr2;

    exc_long_datatype      exception;
    pragma exception_init (exc_long_datatype
                          ,-1461);
  begin
    if pta_rang_csv.count > 0
    then
      for i in pta_rang_csv.first .. pta_rang_csv.last
      loop
        vvc_cnams (pta_rang_csv (i).ordre_presn)              := pta_rang_csv (i).nom_coln;
        vvc_data_types (pta_rang_csv (i).ordre_presn)         := pta_rang_csv (i).type_don;
        vvc_parsd_data_formt (pta_rang_csv (i).ordre_presn)   := null;
        vvc_uploa (pta_rang_csv (i).ordre_presn)              := pta_rang_csv (i).stat_charg;
        vvc_data_formt (pta_rang_csv (i).ordre_presn)         := pta_rang_csv (i).masq_formt;
      end loop;
    end if;

    charg_dons_csv (pnu_id_fichr                => pnu_id_fichr
                   ,pvc_cnams                   => vvc_cnams
                   ,pvc_uploa                   => vvc_uploa
                   ,pva_schem                   => pva_schem_cible
                   ,pva_table                   => pva_table_cible
                   ,pvc_data_type               => vvc_data_types
                   ,pvc_data_formt              => vvc_data_formt
                   ,pvc_parsd_data_formt        => vvc_parsd_data_formt
                   ,pva_seprt                   => pva_seprt
                   ,pva_enclo_by                => pva_enclo_by
                   ,pbo_first_row_is_col_name   => pbo_first_row_is_col_name
                   ,pva_load_to                 => 'EXIST'
                   ,pva_curnc                   => pva_curnc
                   ,pva_numrc_chars             => pva_numrc_chars
                   ,pva_chars                   => pva_chars);
  exception
    when others
    then
      pva_code_ereur   := 'EREUR_LONG_DATATYPE';
      ete ();
      afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('IMP.000008');
  end fichr_csv_vers_table;

  function valdr_dons_charg (pnu_id_fichr      in     number
                            ,pva_utils_creat   in     varchar2 default afw_07_util_pkg.v ('APP_USER')
                            ,pnu_secrt_group   in     number default afw_07_util_pkg.nv ('FLOW_SECURITY_GROUP_ID')
                            ,pva_code_ereur    in out varchar2)
    return boolean
  is
    vbo_vald   boolean default true;

    function valdr_don_charg_journ_ereur
      return boolean
    is
      vbo_vald         boolean default true;
      vnu_faild_rows   number;
      vnu_load_id      number;

      vva_error_mesg   varchar2 (4000);

      cursor cur_dons_inval (pnu_load_id in number)
      is
        select adcje.errm mesg_ereur
              ,substr (adcje.data
                      ,  instr (adcje.data
                               ,':')
                       + 2)
                 as dons_ereur
              ,substr (adcje.data
                      ,6
                      ,  instr (adcje.data
                               ,':')
                       - 6)
                 as rang_ereur
          from apex_don_charg_journ_ereur adcje
         where adcje.load_id = pnu_load_id;
    begin
      afw_07_apex_colct_pkg.suprm_colct (kva_apex_inval_csv_vers_table);

      select adcd.failed_rows
            ,adcd.id
        into vnu_faild_rows
            ,vnu_load_id
        from apex_fichr           af
            ,apex_don_charg_dechr adcd
       where     af.id = pnu_id_fichr
             and af.id = adcd.data_id
             and adcd.security_group_id = pnu_secrt_group
             and adcd.created_by = pva_utils_creat
             and adcd.failed_rows > 0;

      vbo_vald   := false;
      afw_07_apex_colct_pkg.creer_colct (kva_apex_inval_csv_vers_table);

      for rec_dons_inval in cur_dons_inval (vnu_load_id)
      loop
        vva_error_mesg   := rec_dons_inval.mesg_ereur;

        afw_07_apex_colct_pkg.ajout_membr (kva_apex_inval_csv_vers_table
                                          ,rec_dons_inval.rang_ereur
                                          ,vva_error_mesg);
      end loop;

      -- supprimer le fichier csv
      afw_07_fichr_apex_pkg.suprm_fichr (pnu_id_fichr);

      return vbo_vald;
    exception
      when no_data_found
      then
        return true;
    end valdr_don_charg_journ_ereur;
  begin
    if not valdr_don_charg_journ_ereur
    then
      pva_code_ereur   := 'EREUR_DONS_CHARG';
      vbo_vald         := false;

      afw_07_fichr_apex_pkg.suprm_fichr (pnu_id_fichr);
    end if;

    return vbo_vald;
  exception
    when others
    then
      return false;
  end valdr_dons_charg;

  function obten_mesg_impor_inval
    return varchar2
  is
    vva_mesg_impor_inval   varchar2 (32767);
  begin
    select listagg (ac.c002
                   ,', ')
           within group (order by ac.seq_id)
      into vva_mesg_impor_inval
      from apex_collections ac
     where ac.collection_name = kva_apex_inval_csv_vers_table;

    return vva_mesg_impor_inval;
  end obten_mesg_impor_inval;

  function defnr_defnt_coln (pnu_ordre_presn   in number
                            ,pva_libl_coln     in varchar2
                            ,pva_nom_coln      in varchar2
                            ,pva_type_don      in varchar2
                            ,pva_masq_formt    in varchar2
                            ,pnu_tail_don      in number
                            ,pva_stat_charg    in varchar2 default 'Y')
    return tre_coln_csv
  is
    rec_coln_csv   tre_coln_csv;
  begin
    rec_coln_csv.ordre_presn   := pnu_ordre_presn;
    rec_coln_csv.libl_coln     := pva_libl_coln;
    rec_coln_csv.nom_coln      := pva_nom_coln;
    rec_coln_csv.type_don      := pva_type_don;
    rec_coln_csv.masq_formt    := pva_masq_formt;
    rec_coln_csv.tail_don      := pnu_tail_don;
    rec_coln_csv.stat_charg    := pva_stat_charg;

    return rec_coln_csv;
  end defnr_defnt_coln;

  function obten_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.blob_content%type
  is
    vbl_fichr   apex_fichr.blob_content%type;
  begin
    select blob_content
      into vbl_fichr
      from apex_fichr
     where name = pva_nom;

    return vbl_fichr;
  exception
    when others
    then
      return null;
  end obten_fichr;

  function obten_nom_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.filename%type
  is
    vva_nom_fichr   apex_fichr.filename%type;
  begin
    select filename
      into vva_nom_fichr
      from apex_fichr
     where name = pva_nom;

    return vva_nom_fichr;
  exception
    when others
    then
      return null;
  end obten_nom_fichr;

  function obten_id_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.id%type
  is
    vnu_id_fichr   apex_fichr.id%type;
  begin
    select id
      into vnu_id_fichr
      from apex_fichr
     where name = pva_nom;

    return vnu_id_fichr;
  exception
    when others
    then
      return null;
  end obten_id_fichr;

  procedure suprm_fichr (pva_nom in apex_fichr.name%type)
  is
  begin
    delete apex_fichr
     where name = pva_nom;
  end suprm_fichr;
end afw_07_csv_pkg;
/
