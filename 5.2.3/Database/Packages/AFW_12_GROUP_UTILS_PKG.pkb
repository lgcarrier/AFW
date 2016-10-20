SET DEFINE OFF;
create or replace package body afw_12_group_utils_pkg
as
  function obten_code (pnu_group_utils in vd_i_afw_12_group_utils.seqnc%type)
    return vd_i_afw_12_group_utils.code%type
  is
    pva_code   vd_i_afw_12_group_utils.code%type;
  begin
    select gu.code
      into pva_code
      from vd_i_afw_12_group_utils gu
     where gu.seqnc = pnu_group_utils;

    return pva_code;
  exception
    when others
    then
      return null;
  end obten_code;

  function obten_nom (pnu_group_utils in vd_i_afw_12_group_utils.seqnc%type)
    return vd_i_afw_12_group_utils.nom%type
  is
    vva_nom   vd_i_afw_12_group_utils.nom%type;
  begin
    select gu.nom
      into vva_nom
      from vd_afw_12_group_utils gu
     where gu.seqnc = pnu_group_utils;

    return vva_nom;
  exception
    when others
    then
      return null;
  end obten_nom;

  function obten_seqnc (pva_code    in vd_i_afw_12_group_utils.code%type
                       ,pnu_prodt   in vd_i_afw_11_prodt.seqnc%type default null
                       ,pnu_domn    in vd_i_afw_12_domn.seqnc%type default null)
    return vd_i_afw_12_group_utils.seqnc%type
  is
    pnu_seqnc   vd_i_afw_12_group_utils.seqnc%type;
  begin
    select gu.seqnc
      into pnu_seqnc
      from vd_i_afw_12_group_utils gu
     where     gu.code = pva_code
           and (   gu.ref_prodt = pnu_prodt
                or (    gu.ref_prodt is null
                    and pnu_prodt is null))
           and (   gu.ref_domn = pnu_domn
                or (    gu.ref_domn is null
                    and pnu_domn is null));

    return pnu_seqnc;
  exception
    when others
    then
      return null;
  end obten_seqnc;

  function ajout_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                       ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                       ,pda_debut_efect   in date default sysdate
                       ,pda_fin_efect     in date default null
                       ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return vd_i_afw_12_lien_group_utils.seqnc%type
  is
    vnu_lien_group_utils   vd_i_afw_12_lien_group_utils.seqnc%type;
  begin
    if     pnu_utils is not null
       and pnu_group_utils is not null
    then
      insert into vd_i_afw_12_lien_group_utils (ref_utils
                                               ,ref_group
                                               ,date_debut_efect
                                               ,date_fin_efect
                                               ,ref_domn)
           values (pnu_utils
                  ,pnu_group_utils
                  ,pda_debut_efect
                  ,pda_fin_efect
                  ,pnu_domn)
        returning seqnc
             into vnu_lien_group_utils;
    end if;

    return vnu_lien_group_utils;
  end ajout_utils;

  procedure ajout_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                        ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                        ,pda_debut_efect   in date default sysdate
                        ,pda_fin_efect     in date default null
                        ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
  is
    vnu_lien_group_utils   vd_i_afw_12_lien_group_utils.seqnc%type;
  begin
    vnu_lien_group_utils      :=
      ajout_utils (pnu_utils
                  ,pnu_group_utils
                  ,pda_debut_efect
                  ,pda_fin_efect
                  ,pnu_domn);
  end ajout_utils;

  function exist_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                       ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                       ,pda_date          in date
                       ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return boolean
  is
    vnu_exist   number (1);
  begin
    begin
      select 1
        into vnu_exist
        from vd_i_afw_12_lien_group_utils lgu
       where     lgu.ref_utils = pnu_utils
             and lgu.ref_group = pnu_group_utils
             and (    lgu.date_debut_efect <= pda_date
                  and (   pda_date <= lgu.date_fin_efect
                       or lgu.date_fin_efect is null))
             and (   lgu.ref_domn = pnu_domn
                  or (    pnu_domn is null
                      and lgu.ref_domn is null))
             and rownum < 2;
    exception
      when no_data_found
      then
        return false;
    end;

    if vnu_exist = 1
    then
      return true;
    end if;
  end exist_utils;

  function ajout_group_utils (pnu_group         in vd_i_afw_12_group_utils.seqnc%type
                             ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                             ,pda_debut_efect   in date default sysdate
                             ,pda_fin_efect     in date default null
                             ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return vd_i_afw_12_lien_group_utils.seqnc%type
  is
    vnu_lien_group_utils   vd_i_afw_12_lien_group_utils.seqnc%type;
  begin
    if     pnu_group is not null
       and pnu_group_utils is not null
    then
      insert into vd_i_afw_12_lien_group_utils (ref_group_utils_lie
                                               ,ref_group
                                               ,date_debut_efect
                                               ,date_fin_efect
                                               ,ref_domn)
           values (pnu_group
                  ,pnu_group_utils
                  ,pda_debut_efect
                  ,pda_fin_efect
                  ,pnu_domn)
        returning seqnc
             into vnu_lien_group_utils;
    end if;

    return vnu_lien_group_utils;
  end ajout_group_utils;

  procedure ajout_group_utils (pnu_group         in vd_i_afw_12_group_utils.seqnc%type
                              ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                              ,pda_debut_efect   in date default sysdate
                              ,pda_fin_efect     in date default null
                              ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
  is
    vnu_lien_group_utils   vd_i_afw_12_lien_group_utils.seqnc%type;
  begin
    vnu_lien_group_utils      :=
      ajout_group_utils (pnu_group
                        ,pnu_group_utils
                        ,pda_debut_efect
                        ,pda_fin_efect
                        ,pnu_domn);
  end ajout_group_utils;

  --À n'utiliser que pendant la création de domaine
  procedure ajout_group_utils_domn (pnu_group_utils_sourc   in vd_i_afw_12_group_utils.seqnc%type
                                   ,pnu_domn_cible          in vd_i_afw_12_domn.seqnc%type)
  is
    cursor cur_lien_group_utils
    is
      select ref_group_utils_lie
            ,date_debut_efect
            ,date_fin_efect
        from vd_i_afw_12_lien_group_utils
       where ref_group = pnu_group_utils_sourc;

    vnu_group_utils   vd_i_afw_12_group_utils.seqnc%type;
  begin
    vnu_group_utils   := afw_12_group_utils_seq.nextval;

    insert into vd_i_afw_12_group_utils (seqnc
                                        ,nom
                                        ,descr
                                        ,code
                                        ,ref_domn)
      select vnu_group_utils
            ,nom
            ,descr
            ,code
            ,pnu_domn_cible
        from vd_i_afw_12_group_utils
       where seqnc = pnu_group_utils_sourc;

    for rec_lgu in cur_lien_group_utils
    loop
      insert into vd_i_afw_12_lien_group_utils (ref_group
                                               ,date_debut_efect
                                               ,date_fin_efect
                                               ,ref_group_utils_lie)
           values (vnu_group_utils
                  ,rec_lgu.date_debut_efect
                  ,rec_lgu.date_fin_efect
                  ,rec_lgu.ref_group_utils_lie);
    end loop;
  end ajout_group_utils_domn;

  function ajout_utils_group_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                   ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                                   ,pda_debut_efect   in date default sysdate
                                   ,pda_fin_efect     in date default null
                                   ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return number
  is
    vnu_seqnc_lien   vd_i_afw_12_lien_group_utils.seqnc%type;
    vda_fin_efect    vd_i_afw_12_lien_group_utils.date_fin_efect%type;

    cursor cur_utils
    is
        select seqnc
              ,date_fin_efect
          from vd_i_afw_12_lien_group_utils lgu
         where     lgu.ref_utils = pnu_utils
               and lgu.ref_group = pnu_group_utils
               and lgu.ref_domn = pnu_domn
      order by lgu.date_debut_efect;
  begin
    open cur_utils;

    fetch cur_utils
      into vnu_seqnc_lien
          ,vda_fin_efect;

    close cur_utils;

    if vnu_seqnc_lien is not null
    then
      --Si ligne déjà existante, seulement nullifier la date de fin effectivité
      if vda_fin_efect is not null
      then
        activ_utils (pnu_utils
                    ,pnu_group_utils
                    ,pnu_domn);
      end if;
    --Sinon, on ne fait rien.
    else
      vnu_seqnc_lien      :=
        ajout_utils (pnu_utils
                    ,pnu_group_utils
                    ,pda_debut_efect
                    ,pda_fin_efect
                    ,pnu_domn);
    end if;

    return vnu_seqnc_lien;
  end ajout_utils_group_utils;

  procedure ajout_utils_group_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                                    ,pda_debut_efect   in date default sysdate
                                    ,pda_fin_efect     in date default null
                                    ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
  is
    vnu_seqnc_lien   vd_i_afw_12_lien_group_utils.seqnc%type;
  begin
    vnu_seqnc_lien      :=
      ajout_utils_group_utils (pnu_utils
                              ,pnu_group_utils
                              ,pda_debut_efect
                              ,pda_fin_efect
                              ,pnu_domn);
  end ajout_utils_group_utils;

  procedure duplq_utils_group_utils (pnu_utils_sourc   in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_utils_cible   in vd_i_afw_12_utils.seqnc%type)
  is
  begin
    insert into vd_i_afw_12_lien_group_utils (ref_group
                                             ,ref_utils
                                             ,date_debut_efect
                                             ,date_fin_efect
                                             ,ref_group_utils_lie
                                             ,dnr_ref_prodt
                                             ,ref_domn)
      select lgu.ref_group
            ,pnu_utils_cible
            ,lgu.date_debut_efect
            ,lgu.date_fin_efect
            ,lgu.ref_group_utils_lie
            ,lgu.dnr_ref_prodt
            ,lgu.ref_domn
        from vd_i_afw_12_lien_group_utils lgu
       where     lgu.ref_utils = pnu_utils_sourc
             and (   sysdate <= lgu.date_debut_efect
                  or (    sysdate >= lgu.date_debut_efect
                      and (   sysdate <= lgu.date_fin_efect
                           or lgu.date_fin_efect is null)));
  end duplq_utils_group_utils;

  procedure termn_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                        ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                        ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn
                        ,pda_fin_efect     in date default sysdate)
  is
  begin
    update vd_i_afw_12_lien_group_utils lgu
       set lgu.date_fin_efect   = pda_fin_efect
     where     lgu.ref_utils = pnu_utils
           and lgu.ref_group = pnu_group_utils
           and lgu.ref_domn = pnu_domn
           and lgu.date_fin_efect is null;
  end termn_utils;

  procedure activ_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                        ,pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                        ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
  is
  begin
    update vd_i_afw_12_lien_group_utils lgu
       set lgu.date_fin_efect   = null
     where     lgu.ref_utils = pnu_utils
           and lgu.ref_group = pnu_group_utils
           and lgu.ref_domn = pnu_domn
           and lgu.date_fin_efect is not null;
  end activ_utils;

  function ajout_utils_super_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                   ,pda_debut_efect   in date default sysdate
                                   ,pda_fin_efect     in date default null
                                   ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return number
  is
    vnu_seqnc_lien    vd_i_afw_12_lien_group_utils.seqnc%type;
    vda_fin_efect     vd_i_afw_12_lien_group_utils.date_fin_efect%type;
    vnu_super_utils   vd_i_afw_12_group_utils.seqnc%type default afw_12_group_utils_pkg.obten_seqnc ('SUPER_UTILS');

    cursor cur_utils
    is
        select seqnc
              ,date_fin_efect
          from vd_i_afw_12_lien_group_utils lgu
         where     lgu.ref_utils = pnu_utils
               and lgu.ref_group = vnu_super_utils
               and lgu.ref_domn = pnu_domn
      order by lgu.date_debut_efect;
  begin
    open cur_utils;

    fetch cur_utils
      into vnu_seqnc_lien
          ,vda_fin_efect;

    close cur_utils;

    if vnu_seqnc_lien is not null
    then
      --Si ligne déjà existante, seulement nullifier la date de fin effectivité
      if vda_fin_efect is not null
      then
        activ_utils (pnu_utils
                    ,vnu_super_utils
                    ,pnu_domn);
      end if;
    --Sinon, on ne fait rien.
    else
      vnu_seqnc_lien      :=
        ajout_utils (pnu_utils
                    ,vnu_super_utils
                    ,pda_debut_efect
                    ,pda_fin_efect
                    ,pnu_domn);
    end if;

    return vnu_seqnc_lien;
  end ajout_utils_super_utils;

  procedure ajout_utils_super_utils (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                    ,pda_debut_efect   in date default sysdate
                                    ,pda_fin_efect     in date default null
                                    ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
  is
    vnu_seqnc_lien   vd_i_afw_12_lien_group_utils.seqnc%type;
  begin
    vnu_seqnc_lien      :=
      ajout_utils_super_utils (pnu_utils
                              ,pda_debut_efect
                              ,pda_fin_efect
                              ,pnu_domn);
  end ajout_utils_super_utils;

  function ajout_utils_conxn_derv (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                  ,pda_debut_efect   in date default sysdate
                                  ,pda_fin_efect     in date default null
                                  ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
    return number
  is
    vnu_seqnc_lien   vd_i_afw_12_lien_group_utils.seqnc%type;
    vda_fin_efect    vd_i_afw_12_lien_group_utils.date_fin_efect%type;
    vnu_conxn_derv   vd_i_afw_12_group_utils.seqnc%type
                       default afw_12_group_utils_pkg.obten_seqnc ('AUTOR_CONXN_DERV'
                                                                  ,afw_11_prodt_pkg.obten_prodt ('AFW'));

    cursor cur_utils
    is
        select seqnc
              ,date_fin_efect
          from vd_i_afw_12_lien_group_utils lgu
         where     lgu.ref_utils = pnu_utils
               and lgu.ref_group = vnu_conxn_derv
               and lgu.ref_domn = pnu_domn
      order by lgu.date_debut_efect;
  begin
    open cur_utils;

    fetch cur_utils
      into vnu_seqnc_lien
          ,vda_fin_efect;

    close cur_utils;

    if vnu_seqnc_lien is not null
    then
      --Si ligne déjà existante, seulement nullifier la date de fin effectivité
      if vda_fin_efect is not null
      then
        activ_utils (pnu_utils
                    ,vnu_conxn_derv
                    ,pnu_domn);
      end if;
    --Sinon, on ne fait rien.
    else
      vnu_seqnc_lien      :=
        ajout_utils (pnu_utils
                    ,vnu_conxn_derv
                    ,pda_debut_efect
                    ,pda_fin_efect
                    ,pnu_domn);
    end if;

    return vnu_seqnc_lien;
  end ajout_utils_conxn_derv;

  procedure ajout_utils_conxn_derv (pnu_utils         in vd_i_afw_12_utils.seqnc%type
                                   ,pda_debut_efect   in date default sysdate
                                   ,pda_fin_efect     in date default null
                                   ,pnu_domn          in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn)
  is
    vnu_seqnc_lien   vd_i_afw_12_lien_group_utils.seqnc%type;
  begin
    vnu_seqnc_lien      :=
      ajout_utils_conxn_derv (pnu_utils
                             ,pda_debut_efect
                             ,pda_fin_efect
                             ,pnu_domn);
  end ajout_utils_conxn_derv;

  procedure termn_utils_super_utils (pnu_utils       in vd_i_afw_12_utils.seqnc%type
                                    ,pnu_domn        in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn
                                    ,pda_fin_efect   in date default sysdate)
  is
    vnu_super_utils   vd_i_afw_12_group_utils.seqnc%type default afw_12_group_utils_pkg.obten_seqnc ('SUPER_UTILS');
  begin
    termn_utils (pnu_utils
                ,vnu_super_utils
                ,pnu_domn
                ,pda_fin_efect);
  end termn_utils_super_utils;

  procedure termn_utils_conxn_derv (pnu_utils       in vd_i_afw_12_utils.seqnc%type
                                   ,pnu_domn        in vd_i_afw_12_domn.seqnc%type default afw_12_domn_pkg.obten_domn_sesn
                                   ,pda_fin_efect   in date default sysdate)
  is
    vnu_conxn_derv   vd_i_afw_12_group_utils.seqnc%type
                       default afw_12_group_utils_pkg.obten_seqnc ('AUTOR_CONXN_DERV'
                                                                  ,afw_11_prodt_pkg.obten_prodt ('AFW'));
  begin
    termn_utils (pnu_utils
                ,vnu_conxn_derv
                ,pnu_domn
                ,pda_fin_efect);
  end termn_utils_conxn_derv;


  function creer_group_utils_domn (pva_nom                       in vd_i_afw_12_group_utils.nom%type
                                  ,pva_descr                     in vd_i_afw_12_group_utils.descr%type default null
                                  ,pva_code                      in vd_i_afw_12_group_utils.code%type default null
                                  ,pva_code_prefx                in varchar2 default null
                                  ,pva_indic_ignor_group_admin   in vd_i_afw_12_group_utils.indic_ignor_group_admin%type default 'N'
                                  ,pva_indic_systm               in vd_i_afw_12_group_utils.indic_systm%type default 'N'
                                  ,pnu_domn                      in vd_i_afw_12_group_utils.ref_domn%type default afw_12_domn_pkg.obten_domn_sesn
                                  ,pva_indic_group_aplic         in vd_i_afw_12_group_utils.indic_group_aplic%type default 'N')
    return vd_i_afw_12_group_utils.seqnc%type
  is
    vnu_seqnc         vd_i_afw_12_group_utils.seqnc%type;
    vnu_retrn_seqnc   vd_i_afw_12_group_utils.seqnc%type;
  begin
    if pva_code is null
    then
      vnu_seqnc   := afw_12_group_utils_seq.nextval;
    end if;

    insert into vd_i_afw_12_group_utils (seqnc
                                        ,nom
                                        ,descr
                                        ,code
                                        ,indic_ignor_group_admin
                                        ,indic_systm
                                        ,ref_domn
                                        ,indic_group_aplic)
         values (vnu_seqnc
                ,pva_nom
                ,pva_descr
                ,nvl (pva_code
                     ,   nvl (pva_code_prefx, 'DOMN')
                      || '_'
                      || vnu_seqnc)
                ,pva_indic_ignor_group_admin
                ,pva_indic_systm
                ,pnu_domn
                ,pva_indic_group_aplic)
      returning seqnc
           into vnu_retrn_seqnc;

    return vnu_retrn_seqnc;
  end creer_group_utils_domn;

  procedure creer_group_utils_domn (pva_nom                       in vd_i_afw_12_group_utils.nom%type
                                   ,pva_descr                     in vd_i_afw_12_group_utils.descr%type default null
                                   ,pva_code                      in vd_i_afw_12_group_utils.code%type default null
                                   ,pva_code_prefx                in varchar2 default null
                                   ,pva_indic_ignor_group_admin   in vd_i_afw_12_group_utils.indic_ignor_group_admin%type default 'N'
                                   ,pva_indic_systm               in vd_i_afw_12_group_utils.indic_systm%type default 'N'
                                   ,pnu_domn                      in vd_i_afw_12_group_utils.ref_domn%type default afw_12_domn_pkg.obten_domn_sesn
                                   ,pva_indic_group_aplic         in vd_i_afw_12_group_utils.indic_group_aplic%type default 'N')
  is
    vnu_seqnc   vd_i_afw_12_group_utils.seqnc%type;
  begin
    vnu_seqnc      :=
      creer_group_utils_domn (pva_nom
                             ,pva_descr
                             ,pva_code
                             ,pva_code_prefx
                             ,pva_indic_ignor_group_admin
                             ,pva_indic_systm
                             ,pnu_domn
                             ,pva_indic_group_aplic);
  end creer_group_utils_domn;

  procedure modfr_group_utils (pnu_group_utils   in vd_i_afw_12_group_utils.seqnc%type
                              ,pva_nom           in vd_i_afw_12_group_utils.nom%type
                              ,pva_descr         in vd_i_afw_12_group_utils.descr%type)
  is
  begin
    update vd_i_afw_12_group_utils sgu
       set nom     = pva_nom
          ,descr   = pva_descr
     where     sgu.seqnc = pnu_group_utils
           and (   nom <> pva_nom
                or (   (descr <> pva_descr)
                    or (    descr is null
                        and pva_descr is not null)
                    or (    descr is not null
                        and pva_descr is null)));
  end modfr_group_utils;

  procedure suprm_group_utils (pnu_group_utils in vd_i_afw_12_group_utils.seqnc%type)
  is
  begin
    delete vd_i_afw_12_group_utils
     where seqnc = pnu_group_utils;
  end suprm_group_utils;
end afw_12_group_utils_pkg;
/
