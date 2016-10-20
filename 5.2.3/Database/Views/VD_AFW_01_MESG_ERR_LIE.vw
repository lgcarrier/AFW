SET DEFINE OFF;
create or replace force view vd_afw_01_mesg_err_lie
(
  seqnc
 ,ref_code_err_oracl
 ,ref_code_err_oracl_formt
 ,nom_table
 ,nom_coln
 ,nom_contr
 ,page
 ,page_formt
 ,comnt
 ,ref_prodt
 ,ref_prodt_formt
 ,type_liais
 ,ref_mesg
 ,ref_numr_mesg
)
as
  select seqnc
        ,ref_code_err_oracl
        , (select err_code
             from vd_i_afw_01_code_err_oracl ceo
            where ceo.seqnc = mel.ref_code_err_oracl)
           ref_code_err_oracl_formt
        ,nom_table
        ,nom_coln
        ,nom_contr
        ,page
        , -- Ajouter un numéro d'application à la vue pour rendre unique la combinaison page, ref_prodt et aplic.
         page /*(SELECT numr || ' - ' || nom
                 FROM vs_afw_13_page
                WHERE numr = mel.page AND mel.ref_prodt = seqnc_prodt AND )*/
             page_formt
        ,comnt
        ,ref_prodt
        , (select    code
                  || ' - '
                  || nom
             from vd_i_afw_11_prodt
            where seqnc = mel.ref_prodt)
           ref_prodt_formt
        ,type_liais
        ,ref_mesg
        , (select m.numr_mesg
             from vd_i_afw_01_mesg m
            where m.seqnc = mel.ref_mesg)
           ref_numr_mesg
    from vd_i_afw_01_mesg_err_lie mel
/
