SET DEFINE OFF;
create or replace package afw_10_dba_pkg
as
  type typ_audit is record
  (
    nom_table     varchar2 (50)
   ,seqnc         number (10)
   ,date_creat    date
   ,utils_creat   varchar2 (30)
   ,date_modfc    date
   ,utils_modfc   varchar2 (30)
  );

  type typ_arr_audit is table of typ_audit;

  procedure index_foreign_key (pva_schem in varchar2);

  procedure creer_trigr_audit (pva_schem               in varchar2
                              ,pva_nom_table           in varchar2
                              ,pbo_alimt_seqnc         in boolean default true
                              ,pbo_creat_seqnc         in boolean default false
                              ,pbo_audit_colmn         in boolean default true
                              ,pbo_creat_audit_colmn   in boolean default false);

  procedure creer_vue (pva_schem       in varchar2
                      ,pva_nom_table   in varchar2);

  function creer_trg_pile_table (pva_schema        in varchar2
                                ,pva_table         in varchar2
                                ,pva_table_abreg   in varchar2
                                ,pbo_creat_bd      in boolean default true)
    return varchar2;

  procedure creer_trg_pile_table (pva_schema        in varchar2
                                 ,pva_table         in varchar2
                                 ,pva_table_abreg   in varchar2
                                 ,pbo_creat_bd      in boolean default true);

  function creer_fk (pva_cle in varchar2)
    return boolean;

  function obten_seqnc_max_table (pva_table varchar2)
    return number;

  procedure corgr_seqnc_trop_petit (pbo_mode_debug boolean default true);

  function audit_touts_table (pva_utils       in varchar2 default null
                             ,pda_date_minm   in date default null
                             ,pda_date_maxm   in date default null)
    return typ_arr_audit
    pipelined;
end afw_10_dba_pkg;
/
