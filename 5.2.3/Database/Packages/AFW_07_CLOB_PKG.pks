SET DEFINE OFF;
create or replace package afw_07_clob_pkg
as
  subtype typ_index is pls_integer;

  subtype typ_segmn is varchar2 (16000);

  type typ_arr_segmn is table of typ_segmn
    index by typ_index;

  gar_segmn_vide      typ_arr_segmn;
  gar_segmn_courn     typ_arr_segmn;

  exc_ocurn_null      exception;
  exc_mot_trop_long   exception;

  subtype typ_mot_instr_debut_fin is varchar2 (32767);

  procedure creer_nouv;

  function creer_nouv
    return typ_index;

  procedure defnr_courn (pnu_index in typ_index);

  function tail (pnu_index in typ_index default null)
    return number;

  procedure ajout (pva_contn   in varchar2
                  ,pnu_index   in typ_index default null);

  procedure ajout_ligne (pva_ligne   in varchar2 default null
                        ,pnu_index   in typ_index default null);

  function obten (pnu_index in typ_index default null)
    return clob;

  procedure ajout_segmn (pse_segmn in typ_segmn);

  function clob_vers_table_segmn (pcl_clob          in clob
                                 ,pnu_longr_segmn   in number default 16000)
    return typ_arr_segmn;

  procedure table_segmn_vers_clob (pcl_clob    in out nocopy clob
                                  ,par_segmn   in            typ_arr_segmn);

  function table_segmn_vers_clob (par_segmn in typ_arr_segmn)
    return clob;

  function table_segmn_vers_clob
    return clob;

  function blob_vers_table_segmn (pbl_blob          in blob
                                 ,pnu_longr_segmn   in number default 160)
    return typ_arr_segmn;

  procedure table_segmn_vers_blob (pbl_blob    in out nocopy blob
                                  ,par_segmn   in            typ_arr_segmn);

  function table_segmn_vers_blob (par_segmn in typ_arr_segmn)
    return blob;

  function table_segmn_vers_blob
    return blob;

  function sous_chain_blob (pbl_blob     in blob
                           ,pnu_amount   in integer
                           ,pnu_offset   in integer default 1)
    return blob;

  function obten_table_segmn (pnu_index         in typ_index default null
                             ,pnu_longr_segmn   in number default 16000)
    return typ_arr_segmn;

  procedure termn (pnu_index in typ_index default null);

  procedure replc (pcl_clob          in out nocopy clob
                  ,pva_chain_rechr   in            varchar2
                  ,pva_chain_rempl   in            varchar2
                  ,pcl_clob_rempl    in            clob default null);

  function replc (pcl_clob          in clob
                 ,pva_chain_rechr   in varchar2
                 ,pva_chain_rempl   in varchar2
                 ,pcl_clob_rempl    in clob default null)
    return clob;

  function instr_lower (pcl_clob    in clob
                       ,pva_chain   in varchar)
    return varchar2;

  function count_instr_lower (pcl_clob    in out nocopy clob
                             ,pva_chain   in            varchar)
    return number;

  procedure instr_debut_fin (pcl_clob              in out nocopy clob
                            ,pva_debut             in            varchar2
                            ,pva_fin               in            varchar2
                            ,pnu_ofset_debut       in            pls_integer default 1
                            ,pnu_ocurn             in            pls_integer default 1
                            ,pva_carct_non_autor   in            varchar2 default null
                            ,pnu_debut                out        pls_integer
                            ,pnu_fin                  out        pls_integer
                            ,pva_chain_compl          out        varchar);

  procedure fusnr_clob (pnu_cible   in typ_index
                       ,pnu_sourc   in typ_index);

  function convr_clob_vers_blob (pcl_clob    in clob
                                ,pva_chars   in varchar2 default dbms_lob.default_csid)
    return blob;

  function convr_blob_vers_clob (pbl_blob    in blob
                                ,pva_chars   in varchar2 default dbms_lob.default_csid)
    return clob;

  function decd_base64 (pcl_clob in clob)
    return blob;

  function encod_base64 (pbl_blob in blob)
    return clob;

  procedure defnr_seprt_ligne (pva_seprt_ligne in varchar2);

  function extra_clob (pcl_clob    in out nocopy clob
                      ,pnu_debut   in            pls_integer
                      ,pnu_fin     in            pls_integer)
    return clob;
end afw_07_clob_pkg;
/
