SET DEFINE OFF;
create or replace force view vd_afw_11_versn
(
  seqnc
 ,code
 ,nom
 ,nom_formt
 ,numr_versn_1
 ,numr_versn_2
 ,numr_versn_3
 ,numr_versn_4
 ,versn_formt
 ,numr_versn_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,ref_prodt
 ,ref_plugn
 ,indic_docmn_verl
 ,ref_aplic
)
as
  select seqnc
        ,code
        ,nom
        ,   case
              when nom is not null
              then
                   nom
                || ' '
              else
                null
            end
         || afw_11_versn_pkg.obten_versn (numr_versn_1
                                         ,numr_versn_2
                                         ,numr_versn_3
                                         ,numr_versn_4)
        ,numr_versn_1
        ,numr_versn_2
        ,numr_versn_3
        ,numr_versn_4
        ,afw_11_versn_pkg.obten_versn (numr_versn_1
                                      ,numr_versn_2
                                      ,numr_versn_3
                                      ,numr_versn_4)
        ,afw_11_versn_pkg.obten_numr_versn (numr_versn_1
                                           ,numr_versn_2
                                           ,numr_versn_3
                                           ,numr_versn_4)
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,ref_prodt
        ,ref_plugn
        ,indic_docmn_verl
        ,ref_aplic
    from vd_i_afw_11_versn
/
