SET DEFINE OFF;
create or replace package body afw_12_insta_scenr_notfc_pkg
as
  function creer_insta (pnu_atrib_scenr_notfc   in vd_i_afw_12_insta_scenr_notfc.ref_atrib_scenr_notfc%type
                       ,pnu_scenr_notfc_actio   in vd_i_afw_12_insta_scenr_notfc.ref_scenr_notfc_actio%type
                       ,pva_indic_notfr         in vd_i_afw_12_insta_scenr_notfc.indic_notfr%type default 'O'
                       ,pnu_domn                in vd_i_afw_12_insta_scenr_notfc.ref_domn%type default afw_12_domn_pkg.obten_domn_sesn)
    return vd_i_afw_12_insta_scenr_notfc.seqnc%type
  is
    vnu_seqnc   number;
  begin
    ete ();

    insert into vd_i_afw_12_insta_scenr_notfc (ref_domn
                                              ,ref_atrib_scenr_notfc
                                              ,ref_scenr_notfc_actio
                                              ,indic_notfr)
         values (pnu_domn
                ,pnu_atrib_scenr_notfc
                ,pnu_scenr_notfc_actio
                ,pva_indic_notfr)
      returning seqnc
           into vnu_seqnc;

    return vnu_seqnc;
  end creer_insta;

  procedure creer_insta (pnu_atrib_scenr_notfc   in vd_i_afw_12_insta_scenr_notfc.ref_atrib_scenr_notfc%type
                        ,pnu_scenr_notfc_actio   in vd_i_afw_12_insta_scenr_notfc.ref_scenr_notfc_actio%type
                        ,pva_indic_notfr         in vd_i_afw_12_insta_scenr_notfc.indic_notfr%type default 'O'
                        ,pnu_domn                in vd_i_afw_12_insta_scenr_notfc.ref_domn%type default afw_12_domn_pkg.obten_domn_sesn)
  is
    vnu_seqnc   number;
  begin
    vnu_seqnc      :=
      creer_insta (pnu_atrib_scenr_notfc
                  ,pnu_scenr_notfc_actio
                  ,pva_indic_notfr
                  ,pnu_domn);
  end creer_insta;

  procedure suprm_insta (pnu_seqnc in vd_i_afw_12_insta_scenr_notfc.seqnc%type)
  is
  begin
    delete from vd_i_afw_12_insta_scenr_notfc
          where seqnc = pnu_seqnc;
  end suprm_insta;

  procedure maj_indic_notfc (pnu_seqnc         in vd_i_afw_12_insta_scenr_notfc.seqnc%type
                            ,pva_indic_notfr   in vd_i_afw_12_insta_scenr_notfc.indic_notfr%type)
  is
  begin
    update vd_i_afw_12_insta_scenr_notfc
       set indic_notfr   = pva_indic_notfr
     where seqnc = pnu_seqnc;
  end maj_indic_notfc;

  procedure activ_insta (pnu_seqnc in vd_i_afw_12_insta_scenr_notfc.seqnc%type)
  is
  begin
    maj_indic_notfc (pnu_seqnc
                    ,'O');
  end activ_insta;

  procedure desct_insta (pnu_seqnc in vd_i_afw_12_insta_scenr_notfc.seqnc%type)
  is
  begin
    maj_indic_notfc (pnu_seqnc
                    ,'N');
  end desct_insta;

  function obten_actio (pnu_seqnc in vd_i_afw_12_insta_scenr_notfc.seqnc%type)
    return vd_i_afw_12_insta_scenr_notfc.ref_scenr_notfc_actio%type
  is
    vnu_actio   number (10);
  begin
    select ref_scenr_notfc_actio
      into vnu_actio
      from vd_i_afw_12_insta_scenr_notfc
     where seqnc = pnu_seqnc;

    return vnu_actio;
  end obten_actio;
end afw_12_insta_scenr_notfc_pkg;
/
