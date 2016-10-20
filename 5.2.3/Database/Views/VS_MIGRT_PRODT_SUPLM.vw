SET DEFINE OFF;
create or replace force view vs_migrt_prodt_suplm
(
  seqnc_prodt
 ,code_prodt
 ,seqnc_domn
)
as
  select distinct seqnc_prodt
                 ,code_prodt
                 ,seqnc_domn
    from (select cen.seqnc                  seqnc_concp
                ,'AFW_01_CONFG_EVENM_NOTFB' sourc
                ,p.seqnc                    seqnc_prodt
                ,p.code                     code_prodt
                ,d.seqnc                    seqnc_domn
                ,d.code                     code_domn
            from afw_12_domn              d
                ,afw_01_confg_evenm_notfb cen
                ,afw_01_evenm_notfb       en
                ,afw_11_prodt             p
           where     cen.dnr_ref_domn = d.seqnc
                 and en.seqnc = cen.ref_evenm_notfb
                 and p.seqnc = en.dnr_ref_prodt
          union all
          select df.seqnc            seqnc_concp
                ,'AFW_12_DOMN_FONCT' sourc
                ,p.seqnc             seqnc_prodt
                ,p.code              code_prodt
                ,d.seqnc             seqnc_domn
                ,d.code              code_domn
            from afw_12_domn       d
                ,afw_12_domn_fonct df
                ,afw_12_fonct      f
                ,afw_11_prodt      p
           where     df.dnr_ref_domn = d.seqnc
                 and df.ref_fonct = f.seqnc
                 and f.dnr_ref_prodt = p.seqnc
          union all
          select ln.seqnc             seqnc_concp
                ,'AFW_13_LISTE_NAVGT' sourc
                ,p.seqnc              seqnc_prodt
                ,p.code               code_prodt
                ,d.seqnc              seqnc_domn
                ,d.code               code_domn
            from afw_12_domn        d
                ,afw_13_liste_navgt ln
                ,afw_13_page        pa
                ,afw_11_aplic       a
                ,afw_11_prodt       p
           where     ln.dnr_ref_domn = d.seqnc
                 and ln.ref_page = pa.seqnc
                 and pa.dnr_ref_aplic = a.seqnc
                 and a.dnr_ref_prodt = p.seqnc)
/
