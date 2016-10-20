SET DEFINE OFF;
create or replace package body afw_07_apex_colct_pkg
is
  procedure suprm_colct (pva_colct_name in varchar2)
  is
  begin
    if apex_collection.collection_exists (pva_colct_name)
    then
      apex_collection.delete_collection (pva_colct_name);
    end if;
  end suprm_colct;

  procedure creer_colct (pva_colct_name in varchar2)
  is
  begin
    --apex_collection.create_or_truncate_collection (pva_colct_name);
    if not apex_collection.collection_exists (pva_colct_name)
    then
      apex_collection.create_collection (pva_colct_name);
    end if;
  end creer_colct;

  function obten_nombr_coln (pva_colct_name in varchar2)
    return number
  is
    vnu_colmn_count   number;
  begin
    select count (1)
      into vnu_colmn_count
      from wwv_flow_collections
     where collection_name = pva_colct_name;

    return vnu_colmn_count;
  exception
    when others
    then
      raise;
  end obten_nombr_coln;

  procedure maj_colct_membr_atrib (pva_colct_name    in varchar2
                                  ,pnu_seqnc         in number
                                  ,pnu_atrib_numbr   in number
                                  ,pnu_valr          in number)
  is
  begin
    apex_collection.update_member_attribute (p_collection_name   => pva_colct_name
                                            ,p_seq               => pnu_seqnc
                                            ,p_attr_number       => pnu_atrib_numbr
                                            ,p_number_value      => pnu_valr);
  end maj_colct_membr_atrib;

  procedure maj_colct_membr_atrib (pva_colct_name    in varchar2
                                  ,pnu_seqnc         in number
                                  ,pnu_atrib_numbr   in number
                                  ,pva_valr          in varchar2)
  is
  begin
    apex_collection.update_member_attribute (p_collection_name   => pva_colct_name
                                            ,p_seq               => pnu_seqnc
                                            ,p_attr_number       => pnu_atrib_numbr
                                            ,p_attr_value        => pva_valr);
  end maj_colct_membr_atrib;

  procedure ajout_membr (pva_colct_name   in varchar2
                        ,pva_c001         in varchar2 default null
                        ,pva_c002         in varchar2 default null
                        ,pva_c003         in varchar2 default null
                        ,pva_c004         in varchar2 default null
                        ,pva_c005         in varchar2 default null
                        ,pva_c006         in varchar2 default null
                        ,pva_c007         in varchar2 default null
                        ,pva_c008         in varchar2 default null
                        ,pva_c009         in varchar2 default null
                        ,pva_c010         in varchar2 default null
                        ,pva_c011         in varchar2 default null
                        ,pva_c012         in varchar2 default null
                        ,pva_c013         in varchar2 default null
                        ,pva_c014         in varchar2 default null
                        ,pva_c015         in varchar2 default null
                        ,pva_c016         in varchar2 default null
                        ,pva_c017         in varchar2 default null
                        ,pva_c018         in varchar2 default null
                        ,pva_c019         in varchar2 default null
                        ,pva_c020         in varchar2 default null
                        ,pva_c021         in varchar2 default null
                        ,pva_c022         in varchar2 default null
                        ,pva_c023         in varchar2 default null
                        ,pva_c024         in varchar2 default null
                        ,pva_c025         in varchar2 default null
                        ,pva_c026         in varchar2 default null
                        ,pva_c027         in varchar2 default null
                        ,pva_c028         in varchar2 default null
                        ,pva_c029         in varchar2 default null
                        ,pva_c030         in varchar2 default null
                        ,pva_c031         in varchar2 default null
                        ,pva_c032         in varchar2 default null
                        ,pva_c033         in varchar2 default null
                        ,pva_c034         in varchar2 default null
                        ,pva_c035         in varchar2 default null
                        ,pva_c036         in varchar2 default null
                        ,pva_c037         in varchar2 default null
                        ,pva_c038         in varchar2 default null
                        ,pva_c039         in varchar2 default null
                        ,pva_c040         in varchar2 default null
                        ,pva_c041         in varchar2 default null
                        ,pva_c042         in varchar2 default null
                        ,pva_c043         in varchar2 default null
                        ,pva_c044         in varchar2 default null
                        ,pva_c045         in varchar2 default null
                        ,pva_c046         in varchar2 default null
                        ,pva_c047         in varchar2 default null
                        ,pva_c048         in varchar2 default null
                        ,pva_c049         in varchar2 default null
                        ,pva_c050         in varchar2 default null
                        ,pnu_n001         in number default null
                        ,pnu_n002         in number default null
                        ,pnu_n003         in number default null
                        ,pnu_n004         in number default null
                        ,pnu_n005         in number default null
                        ,pda_d001         in date default null
                        ,pda_d002         in date default null
                        ,pda_d003         in date default null
                        ,pda_d004         in date default null
                        ,pda_d005         in date default null
                        ,pcl_cl001        in clob default empty_clob ()
                        ,pbl_bl001        in blob default empty_blob ()
                        ,pxm_x001         in xmltype default null
                        ,pva_genrt_md5    in varchar2 default 'NO')
  is
  begin
    apex_collection.add_member (p_collection_name   => pva_colct_name
                               ,p_c001              => pva_c001
                               ,p_c002              => pva_c002
                               ,p_c003              => pva_c003
                               ,p_c004              => pva_c004
                               ,p_c005              => pva_c005
                               ,p_c006              => pva_c006
                               ,p_c007              => pva_c007
                               ,p_c008              => pva_c008
                               ,p_c009              => pva_c009
                               ,p_c010              => pva_c010
                               ,p_c011              => pva_c011
                               ,p_c012              => pva_c012
                               ,p_c013              => pva_c013
                               ,p_c014              => pva_c014
                               ,p_c015              => pva_c015
                               ,p_c016              => pva_c016
                               ,p_c017              => pva_c017
                               ,p_c018              => pva_c018
                               ,p_c019              => pva_c019
                               ,p_c020              => pva_c020
                               ,p_c021              => pva_c021
                               ,p_c022              => pva_c022
                               ,p_c023              => pva_c023
                               ,p_c024              => pva_c024
                               ,p_c025              => pva_c025
                               ,p_c026              => pva_c026
                               ,p_c027              => pva_c027
                               ,p_c028              => pva_c028
                               ,p_c029              => pva_c029
                               ,p_c030              => pva_c030
                               ,p_c031              => pva_c031
                               ,p_c032              => pva_c032
                               ,p_c033              => pva_c033
                               ,p_c034              => pva_c034
                               ,p_c035              => pva_c035
                               ,p_c036              => pva_c036
                               ,p_c037              => pva_c037
                               ,p_c038              => pva_c038
                               ,p_c039              => pva_c039
                               ,p_c040              => pva_c040
                               ,p_c041              => pva_c041
                               ,p_c042              => pva_c042
                               ,p_c043              => pva_c043
                               ,p_c044              => pva_c044
                               ,p_c045              => pva_c045
                               ,p_c046              => pva_c046
                               ,p_c047              => pva_c047
                               ,p_c048              => pva_c048
                               ,p_c049              => pva_c049
                               ,p_c050              => pva_c050
                               ,p_n001              => pnu_n001
                               ,p_n002              => pnu_n002
                               ,p_n003              => pnu_n003
                               ,p_n004              => pnu_n004
                               ,p_n005              => pnu_n005
                               ,p_d001              => pda_d001
                               ,p_d002              => pda_d002
                               ,p_d003              => pda_d003
                               ,p_d004              => pda_d004
                               ,p_d005              => pda_d005
                               ,p_clob001           => pcl_cl001
                               ,p_blob001           => pbl_bl001
                               ,p_xmltype001        => pxm_x001
                               ,p_generate_md5      => pva_genrt_md5);
  end ajout_membr;

  procedure suprm_membr (pva_colct_name   in varchar2
                        ,pnu_seqnc        in number)
  is
  begin
    apex_collection.delete_member (p_collection_name   => pva_colct_name
                                  ,p_seq               => pnu_seqnc);
  end suprm_membr;

  procedure suprm_membr (pva_colct_name   in varchar2
                        ,pva_numr_atrib   in varchar2
                        ,pva_valr_atrib   in varchar2)
  is
  begin
    apex_collection.delete_members (p_collection_name   => pva_colct_name
                                   ,p_attr_number       => pva_numr_atrib
                                   ,p_attr_value        => pva_valr_atrib);
  end suprm_membr;

  function exist (pva_colct_name in varchar2)
    return boolean
  is
  begin
    return apex_collection.collection_exists (pva_colct_name);
  end exist;

  procedure re_seqnc_colct (pva_colct_name in varchar2)
  is
  begin
    apex_collection.resequence_collection (p_collection_name => pva_colct_name);
  end re_seqnc_colct;


  function exist_membr (pva_nom_colct    in varchar2
                       ,pnu_numr_atrib   in number
                       ,pva_valr_atrib   in varchar2)
    return boolean
  is
    vva_declr_sql   varchar2 (2000);
    vbo_trouv       boolean := false;
    vnu_nb_row      number;
  begin
    vva_declr_sql      :=
         'select 1  from apex_collections where collection_name = :1 and c'
      || lpad (pnu_numr_atrib
              ,3
              ,0)
      || '=:2';

    begin
      execute immediate vva_declr_sql
        into vnu_nb_row
        using pva_nom_colct
             ,pva_valr_atrib;
    exception
      when no_data_found
      then
        null;
      when others
      then
        ete;
    end;

    if vnu_nb_row > 0
    then
      vbo_trouv   := true;
    end if;

    return vbo_trouv;
  end exist_membr;
end afw_07_apex_colct_pkg;
/
