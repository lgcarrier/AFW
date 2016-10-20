SET DEFINE OFF;
create or replace package afw_03_journ_unitr_pkg
as
  procedure ajout_journ (actio_journ    varchar2 default null
                        ,don_nomnl      varchar2 default null
                        ,reslt          varchar2 default null
                        ,numr_err       varchar2 default null);

  procedure ecrir_journ;

  procedure defnr_struc_aplic_hierc (pva_code_struc_aplic    in varchar2
                                    ,pnu_seqnc_struc_aplic   in number);

  procedure suprm_struc_aplic_hierc (pva_code_struc_aplic    in varchar2
                                    ,pnu_seqnc_struc_aplic   in number);

  procedure reint;
end afw_03_journ_unitr_pkg;
/
