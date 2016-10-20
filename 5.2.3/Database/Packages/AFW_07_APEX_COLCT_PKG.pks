SET DEFINE OFF;
create or replace package afw_07_apex_colct_pkg
is
  empty_vc_arr   wwv_flow_global.vc_arr2;
  empty_n_arr    wwv_flow_global.n_arr;
  empty_d_arr    wwv_flow_global.d_arr;

  procedure suprm_colct (pva_colct_name in varchar2);

  procedure creer_colct (pva_colct_name in varchar2);

  function obten_nombr_coln (pva_colct_name in varchar2)
    return number;

  procedure maj_colct_membr_atrib (pva_colct_name    in varchar2
                                  ,pnu_seqnc         in number
                                  ,pnu_atrib_numbr   in number
                                  ,pnu_valr          in number);

  procedure maj_colct_membr_atrib (pva_colct_name    in varchar2
                                  ,pnu_seqnc         in number
                                  ,pnu_atrib_numbr   in number
                                  ,pva_valr          in varchar2);

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
                        ,pva_genrt_md5    in varchar2 default 'NO');

  procedure suprm_membr (pva_colct_name   in varchar2
                        ,pnu_seqnc        in number);

  procedure suprm_membr (pva_colct_name   in varchar2
                        ,pva_numr_atrib   in varchar2
                        ,pva_valr_atrib   in varchar2);

  function exist (pva_colct_name in varchar2)
    return boolean;

  procedure re_seqnc_colct (pva_colct_name in varchar2);

  function exist_membr (pva_nom_colct    in varchar2
                       ,pnu_numr_atrib   in number
                       ,pva_valr_atrib   in varchar2)
    return boolean;
end afw_07_apex_colct_pkg;
/
