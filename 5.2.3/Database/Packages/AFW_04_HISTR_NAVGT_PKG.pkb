SET DEFINE OFF;
create or replace package body afw_04_histr_navgt_pkg
as
  procedure genr_histr
  is
    cursor cur_nagvt_histr (pnu_utils in number)
    is
      select dnr_libl libl
            ,dnr_url  url
            ,seqnc
        from vd_i_afw_04_navgt_histr nh
       where ref_utils = pnu_utils;

    vnu_sidf                    number (10);
    vbo_premr_rec_histr_navgt   boolean default true;
  begin
    select seqnc
      into vnu_sidf
      from vd_afw_04_fil_arian
     where page = 1;

    for rec_histr_navgt in cur_nagvt_histr (afw_12_utils_pkg.obten_usagr_conct ())
    loop
      if vbo_premr_rec_histr_navgt
      then
        afw_15_htp_pkg.ouvri_bals ('ul'
                                  ,'class'
                                  ,'ui-afw afw_04_histr_navgt');
        vbo_premr_rec_histr_navgt   := false;
      end if;

      afw_15_htp_pkg.ouvri_bals ('li');
      afw_15_htp_pkg.ouvri_bals ('a'
                                ,'href'
                                ,afw_07_util_pkg.multi_replc (rec_histr_navgt.url
                                                             ,'&APP_ID.'
                                                             ,afw_08_url_pkg.knu_app_id
                                                             ,'&APP_PAGE_ID.'
                                                             ,afw_08_url_pkg.knu_app_page_id
                                                             ,'&SESSION.'
                                                             ,afw_08_url_pkg.knu_sesn
                                                             ,'&NAVGT_HISTR.SEQNC.'
                                                             ,rec_histr_navgt.seqnc
                                                             ,'&SIDF.'
                                                             ,vnu_sidf)
                                ,'alt'
                                ,rec_histr_navgt.libl
                                ,'title'
                                ,rec_histr_navgt.libl);

      afw_15_htp_pkg.ecrir (rec_histr_navgt.libl);

      afw_15_htp_pkg.fermr_bals ('a');

      afw_15_htp_pkg.fermr_bals ('li');
    end loop;

    if not vbo_premr_rec_histr_navgt
    then
      afw_15_htp_pkg.fermr_bals ('ul');
    end if;
  end genr_histr;

  function creer_navgt (pva_libl   in varchar2
                       ,pva_url    in varchar2
                       ,pva_icon   in varchar2)
    return number
  is
    vnu_seqnc   number (10);
  begin
    insert into vd_i_afw_04_navgt_histr (ref_utils
                                        ,dnr_libl
                                        ,dnr_url
                                        ,dnr_icon)
         values (afw_12_utils_pkg.obten_usagr_conct ()
                ,pva_libl
                ,pva_url
                ,pva_icon)
      returning seqnc
           into vnu_seqnc;

    return vnu_seqnc;
  end creer_navgt;

  procedure creer_histr_de_page_acuei
  is
    vnu_seqnc_histr   number (10);
    vnu_sesn_id       number;
    vva_titre         varchar2 (60);
    vva_url           varchar2 (200); --XNH
    vnu_page          number;
  begin
    vnu_sesn_id   := afw_08_url_pkg.knu_sesn;

    select libl
          ,page
      into vva_titre
          ,vnu_page
      from (    select libl
                      ,page
                      ,rank () over (order by level desc) rng
                  from vd_afw_04_fil_arian fa
            --where session_id = 2893626644949881
            start with page = 1
            connect by ref_elemn_sup = prior seqnc)
     where rng = 1;

    --Crééer l'occurence de navigation
    vnu_seqnc_histr      :=
      creer_navgt (vva_titre
                  ,   'f?p=&APP_ID.:'
                   || vnu_page
                   || ':&SESSION.::::SIDF,SAPC:&SIDF.,XNH&NAVGT_HISTR.SEQNC.'
                  ,'icon');

    update vd_i_afw_04_fil_arian
       set session_id        = null
          ,ref_navgt_histr   = vnu_seqnc_histr
     where     session_id = vnu_sesn_id
           and page != 1;
  end creer_histr_de_page_acuei;

  procedure creer_fil_arian_de_histr (pnu_histr_navgt in number)
  is
    vnu_sesn_id   number;
    vva_titre     varchar2 (60);
    vva_url       varchar2 (200); --XNH
    vnu_page      number;
  begin
    vnu_sesn_id   := afw_08_url_pkg.knu_sesn;

    --supprimer tout ce qui est après la page d'accueil
    delete vd_afw_04_fil_arian
     where page != 1;

    update vd_i_afw_04_fil_arian_histr
       set session_id        = vnu_sesn_id
          ,ref_navgt_histr   = null
     where ref_navgt_histr = pnu_histr_navgt;
  end creer_fil_arian_de_histr;
end afw_04_histr_navgt_pkg;
/
