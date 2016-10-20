SET DEFINE OFF;
create or replace force view vd_afw_12_struc_aplic
(
  seqnc
 ,nom
 ,descr
 ,ref_prodt
 ,ref_prodt_formt
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,code
 ,ref_mesg_err_suprs
 ,ref_code_mesg_err_suprs
 ,indic_extra_tout
 ,tail_tabl_extra
 ,nom_struc_acces_don
 ,ref_page_liste
 ,ref_page_forml
 ,nom_packg
 ,indic_dispn_docmn
 ,indic_stat_exist_formt
 ,indic_page_liee_exist_formt
 ,indic_evenm_notfb_exist_formt
 ,indic_atrib_destn_exist_formt
 ,indic_menu_lie_exist_formt
 ,nom_schem
 ,icon_font_awesm
 ,indic_dispn_procs_aprob
)
as
  select sa.seqnc
        ,sa.nom
        ,sa.descr
        ,sa.ref_prodt
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_11_prodt
            where seqnc = sa.ref_prodt)
           ref_prodt_formt
        ,sa.date_creat
        ,sa.utils_creat
        ,sa.date_modfc
        ,sa.utils_modfc
        ,sa.code
        ,sa.ref_mesg_err_suprs
        , (select m.numr_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = sa.ref_mesg_err_suprs)
           ref_code_mesg_err_suprs
        ,indic_extra_tout
        ,tail_tabl_extra
        ,nom_struc_acces_don
        ,ref_page_liste
        ,ref_page_forml
        ,nom_packg
        ,indic_dispn_docmn
        ,case (select 1
                 from vd_i_afw_12_stat s
                where     s.ref_struc_aplic = sa.seqnc
                      and rownum < 2)
           when 1 then '<i class="fa fa-check"></i>'
           else null
         end
           indic_stat_exist_formt
        ,case (select 1
                 from vd_i_afw_13_page p
                where     p.ref_struc_aplic = sa.seqnc
                      and rownum < 2)
           when 1 then '<i class="fa fa-check"></i>'
           else null
         end
           indic_page_liee_exist_formt
        ,case (select 1
                 from vd_i_afw_01_evenm_notfb en
                where     en.ref_struc_aplic = sa.seqnc
                      and rownum < 2)
           when 1 then '<i class="fa fa-check"></i>'
           else null
         end
           indic_evenm_notfb_exist_formt
        ,case (select 1
                 from vd_i_afw_12_atrib_struc_aplic asa
                where     asa.ref_struc_aplic = sa.seqnc
                      and asa.indic_destn = 'O'
                      and rownum < 2)
           when 1 then '<i class="fa fa-check"></i>'
           else null
         end
           indic_atrib_destn_exist_formt
        ,case (select 1
                 from vd_afw_13_item_menu m
                where     m.ref_struc_aplic = sa.seqnc
                      and rownum < 2)
           when 1 then '<i class="fa fa-check"></i>'
           else null
         end
           indic_menu_lie_exist_formt
        ,nom_schem
        ,icon_font_awesm
        ,indic_dispn_procs_aprob
    from vd_i_afw_12_struc_aplic sa
/
