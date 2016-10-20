SET DEFINE OFF;
create or replace force view vd_afw_01_destn
(
  seqnc
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_atrib_struc_aplic
 ,ref_sa
 ,ref_sa_formt
 ,ref_sa_prodt
 ,descr
)
as
  select seqnc
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_atrib_struc_aplic
        , (select ref_struc_aplic
             from vd_i_afw_12_atrib_struc_aplic asa
            where asa.seqnc = d.ref_atrib_struc_aplic)
           ref_sa
        , (select sa.nom
             from vd_i_afw_12_struc_aplic       sa
                 ,vd_i_afw_12_atrib_struc_aplic asa
            where     asa.seqnc = d.ref_atrib_struc_aplic
                  and sa.seqnc = asa.ref_struc_aplic)
           ref_sa_formt
        , (select sa.ref_prodt
             from vd_i_afw_12_struc_aplic       sa
                 ,vd_i_afw_12_atrib_struc_aplic asa
            where     asa.seqnc = d.ref_atrib_struc_aplic
                  and sa.seqnc = asa.ref_struc_aplic)
           ref_sa_prodt
        ,descr
    from vd_i_afw_01_destn d
/
