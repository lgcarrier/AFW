SET DEFINE OFF;
create or replace package body afw_01_evenm_notfb_pkg
as
  procedure verfr_presn_doubl_aplic (pnu_evenm_notfb in number)
  is
    cursor cur_doubl
    is
      select sa.nom
            ,ha.seqnc
        from (  select max (seqnc) seqnc
                      ,ref_sa
                      ,aplic_prior
                      ,count (1) cnt
                  from vd_afw_01_hierc_aplic
                 where ref_evenm_notfb = pnu_evenm_notfb
              group by ref_sa
                      ,aplic_prior
                having count (1) > 1) ha
            ,vd_i_afw_12_struc_aplic sa
       where ha.ref_sa = sa.seqnc;
  begin
    for rec_doubl in cur_doubl
    loop
      if verfr_presn_doubl (rec_doubl.seqnc)
      then
        afw_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('EVN.000001'
                                                       ,pva_code_prodt    => 'AFW'
                                                       ,pva_valr_subst1   => rec_doubl.nom);
      end if;
    end loop;
  end;

  function verfr_presn_doubl (pnu_hierc_aplic in number)
    return boolean
  is
    vbo_presn_doubl   boolean default false;
    vnu_evenm_notfb   number (10);
    vnu_struc_aplic   number (10);
    vnu_aplic_prior   number (10);
    vva_void          varchar2 (1);
  begin
    select ref_evenm_notfb
          ,ref_sa
          ,aplic_prior
      into vnu_evenm_notfb
          ,vnu_struc_aplic
          ,vnu_aplic_prior
      from vd_afw_01_hierc_aplic
     where seqnc = pnu_hierc_aplic;

    begin
      select null
        into vva_void
        from vd_afw_01_hierc_aplic
       where     ref_sa = vnu_struc_aplic
             and ref_evenm_notfb = vnu_evenm_notfb
             and aplic_prior = vnu_aplic_prior;

      return false;
    exception
      when too_many_rows
      then
        return true;
    end;
  end verfr_presn_doubl;

  procedure ajout_confg_en_domn (pnu_domn_confg_en   in number
                                ,pnu_domn_cible      in number)
  is
    cursor cur_elemn_confg_en
    is
      select seqnc
        from vd_i_afw_01_elemn_confg_en
       where ref_confg_evenm_notfb = pnu_domn_confg_en;

    cursor cur_destn_confg_en
    is
      select seqnc
        from vd_i_afw_01_destn_confg_en
       where ref_confg_evenm_notfb = pnu_domn_confg_en;

    cursor cur_destn_confg_enl
    is
      select seqnc
        from vd_i_afw_01_confg_evenm_n_lang
       where ref_confg_evenm_notfb = pnu_domn_confg_en;


    vnu_seqnc_cen   vd_i_afw_01_confg_evenm_notfb.seqnc%type;
  begin
    vnu_seqnc_cen   := afw_01_confg_evenm_notfb_seq.nextval;

    insert into vd_i_afw_01_confg_evenm_notfb (seqnc
                                              ,ref_type_comnc
                                              ,ref_evenm_notfb
                                              ,nom
                                              ,descr
                                              ,ref_domn
                                              ,ref_compt_twili
                                              ,ref_profl_courl
                                              ,indic_deft)
      select vnu_seqnc_cen
            ,ref_type_comnc
            ,ref_evenm_notfb
            ,nom
            ,descr
            ,pnu_domn_cible
            ,ref_compt_twili
            ,afw_17_profl_courl_pkg.obten_seqnc (afw_17_profl_courl_pkg.obten_code (ref_profl_courl)
                                                ,afw_12_domn_pkg.obten_code_domn (pnu_domn_cible))
            ,indic_deft
        from vd_i_afw_01_confg_evenm_notfb
       where seqnc = pnu_domn_confg_en;

    for rec_ecen in cur_elemn_confg_en
    loop
      insert into vd_i_afw_01_elemn_confg_en (ref_confg_evenm_notfb
                                             ,code
                                             ,ident_acces
                                             ,ident_acces_formt
                                             ,formt)
        select vnu_seqnc_cen
              ,code
              ,ident_acces
              ,ident_acces_formt
              ,formt
          from vd_i_afw_01_elemn_confg_en
         where seqnc = rec_ecen.seqnc;
    end loop;

    for rec_dcen in cur_destn_confg_en
    loop
      insert into vd_i_afw_01_destn_confg_en (ref_dv_natr_destn
                                             ,ref_confg_evenm_notfb
                                             ,ref_destn
                                             ,ref_reslt_destn
                                             ,ref_atrib_sa_nom_formt
                                             ,ref_atrib_sa_adres_destn)
        select ref_dv_natr_destn
              ,vnu_seqnc_cen
              ,ref_destn
              ,ref_reslt_destn
              ,ref_atrib_sa_nom_formt
              ,ref_atrib_sa_adres_destn
          from vd_i_afw_01_destn_confg_en
         where seqnc = rec_dcen.seqnc;
    end loop;

    for rec_dcenl in cur_destn_confg_enl
    loop
      insert into vd_i_afw_01_confg_evenm_n_lang (ref_confg_evenm_notfb
                                                 ,ref_lang
                                                 ,objet
                                                 ,titre_mesg
                                                 ,mesg_sms
                                                 ,mesg)
        select vnu_seqnc_cen
              ,ref_lang
              ,objet
              ,titre_mesg
              ,mesg_sms
              ,mesg
          from vd_i_afw_01_confg_evenm_n_lang
         where seqnc = rec_dcenl.seqnc;
    end loop;
  end ajout_confg_en_domn;
end afw_01_evenm_notfb_pkg;
/
