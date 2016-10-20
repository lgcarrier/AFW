SET DEFINE OFF;
create or replace package afw_16_vue_parmt_pkg
is
  cursor cur_utils (pva_struc_aplic         in     varchar2
                   ,pnu_membr_struc_admin   in     number
                   ,pva_code_struc          in     varchar2
                   ,gva_droit_acces         in     varchar2
                   ,gva_droit_creat         in     varchar2
                   ,gva_droit_modfc         in     varchar2
                   ,gva_droit_suprs         in     varchar2
                   ,gva_code_utils             out varchar2)
  is
    with gr_da
         as (select ref_group_utils
               from vd_i_afw_12_group_utils gu
                   ,vd_i_afw_12_defnt_acces da
                   ,vd_i_afw_12_struc_aplic sa
              where     (   gva_droit_acces = 'N'
                         or (    gva_droit_acces = 'O'
                             and da.indic_acces != 'REFS'
                             and da.indic_acces is not null))
                    and (   gva_droit_creat = 'N'
                         or (    gva_droit_creat = 'O'
                             and da.indic_creat != 'REFS'
                             and da.indic_creat is not null))
                    and (   gva_droit_modfc = 'N'
                         or (    gva_droit_modfc = 'O'
                             and da.indic_modfc != 'REFS'
                             and da.indic_modfc is not null))
                    and (   gva_droit_suprs = 'N'
                         or (    gva_droit_suprs = 'O'
                             and da.indic_suprs != 'REFS'
                             and da.indic_suprs is not null))
                    and sa.code = pva_struc_aplic
                    and gu.seqnc = da.ref_group_utils
                    and gu.code != 'SUPR_UTILS'
                    and sa.seqnc = da.ref_struc_aplic)
    select st.nom nom_struc
          ,   ut.nom
           || ', '
           || ut.prenm
             ref_utils_formt
          ,ms.seqnc
          ,ts.nom nom_type_struc
          ,ut.code_utils
      from vd_i_afw_12_utils       ut
          ,vd_i_afw_12_membr_struc ms
          ,vd_i_afw_12_struc_admin st
          ,vd_i_afw_12_type_struc  ts
          ,(select distinct (lien_utils.ref_utils)
              from afw_12_lien_group_utils lien_utils
                  ,(    select ref_group_utils_lie
                          from afw_12_lien_group_utils lgu
                    connect by     prior lgu.ref_group_utils_lie = lgu.seqnc
                               and lgu.ref_utils is null
                               and lgu.date_debut_efect <= sysdate
                               and (   lgu.date_fin_efect >= sysdate
                                    or lgu.date_fin_efect is null)
                    start with exists
                                 (select 1
                                    from gr_da
                                   where     lgu.ref_group in gr_da.ref_group_utils
                                         and lgu.ref_utils is null
                                         and lgu.date_debut_efect <= sysdate
                                         and (   lgu.date_fin_efect >= sysdate
                                              or lgu.date_fin_efect is null))
                    union all
                    select ref_group_utils ref_group
                      from gr_da) group_utils
             where     lien_utils.ref_group = group_utils.ref_group_utils_lie
                   and lien_utils.ref_group_utils_lie is null
                   and lien_utils.date_debut_efect <= sysdate
                   and (   lien_utils.date_fin_efect >= sysdate
                        or lien_utils.date_fin_efect is null)) utils
     where     utils.ref_utils = ut.seqnc
           and ut.seqnc = ms.ref_utils
           and (   ut.date_expir >= sysdate
                or ut.date_expir is null)
           and ms.ref_struc_admin = st.seqnc
           and ms.date_debut_efect <= sysdate
           and (   ms.date_fin_efect >= sysdate
                or ms.date_fin_efect is null)
           and (   st.seqnc = (select ref_struc_admin
                                 from vd_i_afw_12_membr_struc mss
                                where mss.seqnc = pnu_membr_struc_admin)
                or pnu_membr_struc_admin is null)
           and (   ts.code = pva_code_struc
                or pva_code_struc is null)
           and (ts.seqnc = st.ref_type_struc);

  type arr_typ_utils is table of cur_utils%rowtype;

  procedure creer_lov_utils_struc_aplic_1 (pva_struc_aplic         in     varchar2
                                          ,pva_droit               in     varchar2
                                          ,pnu_membr_struc_admin   in     number default null
                                          ,pva_code_type_struc     in     varchar2 default null
                                          ,pva_code_utils             out varchar2);

  function obten_lov_utils_struc_aplic
    return arr_typ_utils
    pipelined;

  function obten_membr_struc_de_code (pva_code in varchar2)
    return number;
end afw_16_vue_parmt_pkg;
/
