SET DEFINE OFF;
create or replace package body afw_20_docmn_pkg
as
  function obten_sect_simpl_docmn (pva_code_struc_aplic    in varchar2
                                  ,pnu_seqnc_struc_aplic   in number
                                  ,pva_code_sectn_docmn    in varchar2)
    return varchar2
  is
    vva_valr   varchar2 (4000);
  begin
    --manque un code

    select valr
      into vva_valr
      from vd_i_afw_20_detl_docmn  dd
          ,vd_i_afw_20_docmn       d
          ,vd_i_afw_12_struc_aplic sa
          ,vd_i_afw_20_sectn_docmn sc
     where     d.ref_seqnc_struc_aplic = pnu_seqnc_struc_aplic
           and sa.seqnc = d.ref_struc_aplic
           and sa.code = pva_code_struc_aplic
           and sa.ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn
           and dd.ref_sectn_docmn = sc.seqnc
           and sc.ref_struc_aplic = sa.seqnc
           and dd.ref_docmn = d.seqnc
           and sc.nom = pva_code_sectn_docmn;

    return nvl (vva_valr, 'Aucune description pour cette section.');
  end obten_sect_simpl_docmn;

  function formt_propr_docmn (pnu_docmn in number)
    return varchar2
  is
    vnu_seqnc             number (10);
    vva_fonct_formt       varchar2 (61);
    vva_valr_formt        varchar2 (200);
    vva_nom_coln          varchar2 (50);
    vva_nom_struc_acces   varchar2 (50);
  begin
    --Obtenir la structure applicative pour la formater
    /*select d.ref_seqnc_struc_aplic,
               sa.nom_packg || '.' || sa.nom_fonct_valr_formt
      into vnu_seqnc,
           vva_fonct_formt
      from vd_i_afw_20_docmn d,
           vd_i_afw_12_struc_aplic sa
     where sa.seqnc = d.ref_struc_aplic
      and d.seqnc = pnu_docmn;
    execute immediate 'select ' || vva_fonct_formt || '(:1) from dual'
                                          into vva_valr_formt
      using vnu_seqnc;*/

    select nom_coln
      into vva_nom_coln
      from vd_afw_12_atrib_struc_aplic
     where     ref_dv_natr_infor = afw_14_domn_valr_pkg.obten_seqnc ('NATR_INFOR_STRUC_APLIC'
                                                                    ,'NOM_FORMT'
                                                                    ,'AFW')
           and ref_struc_aplic = (select seqnc
                                    from vd_afw_12_struc_aplic
                                   where seqnc = (select ref_struc_aplic
                                                    from vd_i_afw_20_docmn d
                                                   where d.seqnc = pnu_docmn));

    select nom_struc_acces_don
      into vva_nom_struc_acces
      from vd_i_afw_12_struc_aplic sa
     where sa.seqnc = (select ref_struc_aplic
                         from vd_i_afw_20_docmn d
                        where d.seqnc = pnu_docmn);

    execute immediate
         'select '
      || vva_nom_coln
      || ' from '
      || vva_nom_struc_acces
      || ' where seqnc = (select ref_seqnc_struc_aplic from vd_i_afw_20_docmn where seqnc = '
      || pnu_docmn
      || ')'
      into vva_valr_formt;

    return vva_valr_formt;
  --return vva_valr_formt;
  end formt_propr_docmn;

  procedure creer_detl_docmn
  is
    vva_nom_struc_acces_don   varchar2 (30);
    vva_sql                   varchar2 (500);
    vnu_lang                  number (10) default 121; --FR pour AFW

    cursor cur_struc_aplic_docmn
    is
      select seqnc
        from vd_i_afw_12_struc_aplic sa
       where sa.indic_dispn_docmn = 'O';
  begin
    for rec_struc_aplic in cur_struc_aplic_docmn
    loop
      delete tc_afw_07_seqnc;

      select nom_struc_acces_don
        into vva_nom_struc_acces_don
        from vd_i_afw_12_struc_aplic sa
       where seqnc = rec_struc_aplic.seqnc;

      vva_sql      :=
           'insert into tc_afw_07_seqnc(seqnc) select seqnc from '
        || vva_nom_struc_acces_don;

      execute immediate vva_sql;

      merge into vd_i_afw_20_docmn cible
           using tc_afw_07_seqnc sourc
              on (    sourc.seqnc = cible.ref_seqnc_struc_aplic
                  and cible.ref_struc_aplic = rec_struc_aplic.seqnc
                  and cible.ref_prodt_lang = vnu_lang)
      when not matched
      then
        insert     (ref_prodt_lang
                   ,ref_struc_aplic
                   ,ref_seqnc_struc_aplic)
            values (vnu_lang
                   ,rec_struc_aplic.seqnc
                   ,sourc.seqnc);

      merge into vd_i_afw_20_detl_docmn cible
           using (select sd.seqnc seqnc_sectn
                        ,d.seqnc  seqnc_docmn
                    from vd_i_afw_20_sectn_docmn sd
                        ,vd_i_afw_20_docmn       d
                   where     sd.ref_struc_aplic = rec_struc_aplic.seqnc
                         and d.ref_struc_aplic = rec_struc_aplic.seqnc
                         and d.ref_seqnc_struc_aplic in (select tc.seqnc
                                                           from tc_afw_07_seqnc tc)
                         and ref_dv_type_sectn != afw_14_domn_valr_pkg.obten_seqnc ('TYPE_SECTN'
                                                                                   ,'TABL')) sourc
              on (    cible.ref_docmn = sourc.seqnc_docmn
                  and cible.ref_sectn_docmn = sourc.seqnc_sectn)
      when not matched
      then
        insert     (ref_docmn
                   ,ref_sectn_docmn)
            values (sourc.seqnc_docmn
                   ,sourc.seqnc_sectn);
    end loop;
  end creer_detl_docmn;
end afw_20_docmn_pkg;
/
