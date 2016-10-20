SET DEFINE OFF;
create or replace package body afw_13_resrc_pkg
as
  function obten_chemn_resrc (pva_propr        in varchar2
                             ,pva_code_resrc   in varchar2
                             ,pva_code_formt   in varchar2
                             ,pva_code_ocurn   in varchar2 default null)
    return varchar2
  is
    vva_chemn_compl   varchar2 (500);
    vnu_prodt         number (10) default afw_11_prodt_pkg.obten_prodt_sesn ();
  begin
    select    edv.empla
           || ore.nom_physq
             icone
      into vva_chemn_compl
      from vd_afw_13_empla_dosr_virtl edv
          ,vd_afw_13_resrc            r
          ,vd_afw_13_ocurn_resrc      ore
          ,vd_afw_13_formt_resrc      fr
     where     edv.ref_dosr_virtl = r.ref_dosr_virtl
           and r.indic_stock_meme_reprt = 'O'
           and ore.ref_resrc = r.seqnc
           and r.code = pva_code_resrc
           and (   (    pva_propr = 'PLUGN'
                    and r.ref_plugn is not null)
                or (    pva_propr = 'STRUC_APLIC'
                    and r.ref_struc_aplic is not null)
                or (    pva_propr = 'PRODT'
                    and r.ref_prodt is not null))
           and ore.ref_formt_resrc = fr.seqnc
           and fr.code = pva_code_formt
           and fr.ref_prodt = vnu_prodt
           and (   ore.nom = pva_code_ocurn
                or pva_code_ocurn is null)
    union all
    select    edv.empla
           || ore.nom_physq
             icone
      from vd_afw_13_empla_dosr_virtl edv
          ,vd_afw_13_resrc            r
          ,vd_afw_13_ocurn_resrc      ore
          ,vd_afw_13_formt_resrc      fr
     where     edv.ref_dosr_virtl = ore.ref_dosr_virtl
           and r.indic_stock_meme_reprt = 'N'
           and ore.ref_resrc = r.seqnc
           and r.code = pva_code_resrc
           and (   (    pva_propr = 'PLUGN'
                    and r.ref_plugn is not null)
                or (    pva_propr = 'STRUC_APLIC'
                    and r.ref_struc_aplic is not null)
                or (    pva_propr = 'PRODT'
                    and r.ref_prodt is not null))
           and ore.ref_formt_resrc = fr.seqnc
           and fr.code = pva_code_formt
           and fr.ref_prodt = vnu_prodt
           and (   ore.nom = pva_code_ocurn
                or pva_code_ocurn is null);

    return vva_chemn_compl;
  end obten_chemn_resrc;
end afw_13_resrc_pkg;
/
