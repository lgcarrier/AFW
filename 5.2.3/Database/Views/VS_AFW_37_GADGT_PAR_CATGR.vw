SET DEFINE OFF;
create or replace force view vs_afw_37_gadgt_par_catgr
(
  ident
 ,ident_parnt
 ,titre
 ,code_type
 ,toltp_titre
 ,toltp_text
 ,catgr_ordre_presn
 ,gadgt_ordre_presn
)
as
      select    'CATGR_'
             || gc.seqnc
               as ident
            ,nvl2 (ref_gadgt_catgr
                  ,   'CATGR_'
                   || ref_gadgt_catgr
                  ,null)
               as ident_parnt
            ,gc.nom     as titre
            ,'CATGR'    as code_type
            ,null       as toltp_titre
            ,null       as toltp_text
            ,gc.ordre_presn as cagtr_ordre_presn
            ,null       as gadgt_ordre_presn
        from vd_afw_37_gadgt_catgr gc
  start with     gc.ref_gadgt_catgr is null
             and ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
  connect by prior gc.seqnc = gc.ref_gadgt_catgr
  union all
  select to_char (seqnc) as ident
        ,   'CATGR_'
         || ref_gadgt_catgr
           as ident_parnt
        ,nom             as titre
        ,'GADGT'         as code_type
        ,nom             as toltp_titre
        ,descr           as toltp_text
        ,null            as cagtr_ordre_presn
        ,gad.ordre_presn as gadgt_ordre_presn
    from vd_afw_37_gadgt gad
   where     ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
         and (   ref_struc_aplic is null
              or afw_12_secrt_pkg.verfc_droit_acces_numrq (afw_12_struc_aplic_pkg.obten_code (ref_struc_aplic)
                                                          ,'O') = 1)
/
