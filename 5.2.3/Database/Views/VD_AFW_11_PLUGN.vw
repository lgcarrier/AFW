SET DEFINE OFF;
create or replace force view vd_afw_11_plugn
(
  seqnc
 ,code_inter
 ,nom
 ,nom_formt
 ,descr
 ,ref_versn
 ,ref_versn_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select p.seqnc
        ,p.code_inter
        ,p.nom
        ,   p.nom
         || ' '
         || (select afw_11_versn_pkg.obten_versn (v.numr_versn_1
                                                 ,v.numr_versn_2
                                                 ,v.numr_versn_3
                                                 ,v.numr_versn_4)
               from vd_i_afw_11_versn v
              where v.ref_plugn = p.seqnc)
           nom_formt
        ,p.descr
        ,p.ref_versn
        , (select afw_11_versn_pkg.obten_numr_versn (v.numr_versn_1
                                                    ,v.numr_versn_2
                                                    ,v.numr_versn_3
                                                    ,v.numr_versn_4)
             from vd_i_afw_11_versn v
            where v.ref_plugn = p.seqnc)
           ref_versn_formt
        ,p.date_creat
        ,p.utils_creat
        ,p.date_modfc
        ,p.utils_modfc
    from vd_i_afw_11_plugn p
/
