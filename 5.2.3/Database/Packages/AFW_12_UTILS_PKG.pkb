SET DEFINE OFF;
create or replace package body afw_12_utils_pkg
as
  procedure init
  is
  begin
    -- Ne sert qu'a lancer le bloc PL d'initialisation du package
    null;
  end;

  function obten_code_usagr_conct (pva_indic_forcr_apex in varchar2 default 'N')
    return varchar2
  is
  begin
    return sys_context ('ctx_infor_sesn'
                       ,'vva_code_utils');
  exception
    when others
    then
      return null;
  end obten_code_usagr_conct;

  function obten_usagr_conct (pva_indic_forcr_apex in varchar2 default 'N')
    return vd_i_afw_12_utils.seqnc%type
  is
    vnu_utils   vd_i_afw_12_utils.seqnc%type;
  begin
    return sys_context ('ctx_infor_sesn'
                       ,'vnu_seqnc_utils');
  exception
    when others
    then
      return null;
  end obten_usagr_conct;

  function obten_nom_formt_de_code_utils (pva_code_utils         in varchar2
                                         ,pva_indic_conxn_pour   in varchar2 default 'O'
                                         ,pva_indic_code         in varchar2 default 'N')
    return varchar2
  is
    vva_liste_code         varchar2 (61);
    vva_nom                varchar2 (200);
    vva_code               varchar2 (30);
    vva_nom_pour           varchar2 (200);
    vva_code_pour          varchar2 (30);
    vnu_seqnc_utils        number;
    vnu_seqnc_utils_pour   number;
  begin
    --exemple: CARLO@CONAL:INTER@INTER

    if instr (pva_code_utils
             ,':') > 0
    then
      vva_liste_code      :=
        substr (pva_code_utils
               ,1
               ,  instr (pva_code_utils
                        ,':')
                - 1);
    else
      vva_liste_code   := pva_code_utils;
    end if;

    if instr (vva_liste_code
             ,'@') > 0
    then
      vva_code      :=
        substr (vva_liste_code
               ,1
               ,  instr (vva_liste_code
                        ,'@')
                - 1);
      vva_code_pour      :=
        substr (vva_liste_code
               ,  instr (vva_liste_code
                        ,'@')
                + 1);
    else
      vva_code   := vva_liste_code;
    end if;

    select seqnc
      into vnu_seqnc_utils
      from vd_i_afw_12_utils ut
     where ut.code_utils = vva_code;

    vva_nom   := afw_12_utils_pkg.obten_nom_formt (vnu_seqnc_utils);

    if     pva_indic_conxn_pour = 'O'
       and vva_code_pour is not null
    then
      select seqnc
        into vnu_seqnc_utils_pour
        from vd_i_afw_12_utils ut
       where ut.code_utils = vva_code_pour;

      vva_nom_pour   := afw_12_utils_pkg.obten_nom_formt (vnu_seqnc_utils_pour);
    end if;

    --TODO::CARLO
    --Traduire le "pour"
    return    case pva_indic_code
                when 'O'
                then
                     '('
                  || vva_code
                  || ') '
                else
                  null
              end
           || vva_nom
           || case
                when     pva_indic_conxn_pour = 'O'
                     and vva_code_pour is not null
                then
                     ' pour '
                  || case pva_indic_code
                       when 'O'
                       then
                            '('
                         || vva_code_pour
                         || ') '
                       else
                         null
                     end
                  || vva_nom_pour
                else
                  null
              end;
  exception
    when others
    then
      return pva_code_utils;
  end obten_nom_formt_de_code_utils;

  procedure genr_audits (pva_code_audits in varchar2)
  is
  begin
    afw_15_htp_pkg.ecrir (obten_nom_formt_de_code_utils (afw_07_util_pkg.v (   'P'
                                                                            || afw_13_page_pkg.obten_numr_apex_page
                                                                            || '_'
                                                                            || upper (pva_code_audits)))
                         ,false);
  end genr_audits;

  function obten_nom_formt (pnu_utils in number)
    return varchar2
  is
    vva_nom         varchar2 (200);
    vnu_ref_emplo   number (10);
  begin
    select    ut.prenm
           || ' '
           || ut.nom
      into vva_nom
      from vd_i_afw_12_utils ut
     where ut.seqnc = pnu_utils;

    return vva_nom;
  exception
    when no_data_found
    then
      return null;
  end obten_nom_formt;

  function obten_nom_formt_de_utils (pnu_utils in number)
    return varchar2
  is
    vva_nom         varchar2 (200);
    vnu_ref_emplo   number (10);
  begin
    select    ut.prenm
           || ' '
           || ut.nom
      into vva_nom
      from vd_i_afw_12_utils ut
     where ut.seqnc = pnu_utils;

    return vva_nom;
  exception
    when no_data_found
    then
      return null;
  end obten_nom_formt_de_utils;

  function verfr_usagr_vald (pva_code_utils in varchar2)
    return boolean
  is
    vva_indic_presn   varchar2 (1) default 'N';
    vbo_vald          boolean default false;
  begin
    select 'O'
      into vva_indic_presn
      from vd_i_afw_12_utils ut
     where     indic_verl = 'N'
           and (   date_expir is null
                or date_expir >= sysdate)
           and ut.code_utils = upper (pva_code_utils);

    if vva_indic_presn = 'O'
    then
      vbo_vald   := true;
    end if;

    return vbo_vald;
  exception
    when no_data_found
    then
      return false;
  end verfr_usagr_vald;


  function obten_utils_de_code (pva_code in varchar2)
    return vd_i_afw_12_utils.seqnc%type
  is
    --vva_code    varchar2 (30);


    vva_liste_code   varchar2 (61);
    vnu_utils        vd_i_afw_12_utils.seqnc%type;
    vva_nom          varchar2 (200);
    vva_code         varchar2 (30);
    vnu_utils_pour   number (10);
    vva_nom_pour     varchar2 (200);
    vva_code_pour    varchar2 (30);
  begin
    --exemple: CARLO@CONAL:INTER@INTER

    if instr (pva_code
             ,':') > 0
    then
      vva_liste_code      :=
        substr (pva_code
               ,1
               ,  instr (pva_code
                        ,':')
                - 1);
    else
      vva_liste_code   := pva_code;
    end if;

    if instr (vva_liste_code
             ,'@') > 0
    then
      vva_code      :=
        substr (vva_liste_code
               ,1
               ,  instr (vva_liste_code
                        ,'@')
                - 1);
      vva_code_pour      :=
        substr (vva_liste_code
               ,  instr (vva_liste_code
                        ,'@')
                + 1);
    else
      vva_code   := vva_liste_code;
    end if;

    select ut.seqnc
      into vnu_utils
      from vd_i_afw_12_utils ut
     where ut.code_utils = vva_code;

    if vva_code_pour is not null
    then
      select ut.seqnc
        into vnu_utils_pour
        from vd_i_afw_12_utils ut
       where ut.code_utils = vva_code_pour;
    end if;

    return nvl (vnu_utils_pour, vnu_utils);
  exception
    when others
    then
      return null;
  end obten_utils_de_code;

  function obten_utils_de_courl (pva_courl in varchar2)
    return vd_i_afw_12_utils.seqnc%type
  is
    vnu_utils   vd_i_afw_12_utils.seqnc%type;
  begin
    select seqnc
      into vnu_utils
      from vd_i_afw_12_utils u
     where upper (u.courl) = upper (pva_courl);

    return vnu_utils;
  exception
    when others
    then
      return null;
  end obten_utils_de_courl;

  function obten_code_utils_de_courl (pva_courl in varchar2)
    return vd_i_afw_12_utils.code_utils%type
  is
    vva_code_utils   vd_i_afw_12_utils.code_utils%type;
  begin
    select code_utils
      into vva_code_utils
      from vd_i_afw_12_utils u
     where upper (u.courl) = upper (pva_courl);

    return vva_code_utils;
  exception
    when others
    then
      return null;
  end obten_code_utils_de_courl;

  function obten_utils_de_code_base_don (pva_code_base_don in varchar2)
    return vd_i_afw_12_utils.seqnc%type
  is
    vnu_utils   vd_i_afw_12_utils.seqnc%type;
  begin
    select seqnc
      into vnu_utils
      from vd_i_afw_12_utils u
     where upper (u.code_utils_base_don) = upper (pva_code_base_don);

    return vnu_utils;
  exception
    when others
    then
      return null;
  end obten_utils_de_code_base_don;

  function obten_cle_encry_utils_conct
    return raw
  is
    vva_date_creat   varchar2 (200);
  begin
    select    ora_hash (  to_number (to_char (date_creat
                                             ,'ddmmyy'))
                        + seqnc
                       ,seqnc)
           || ora_hash (seqnc
                       ,to_number (to_char (date_creat
                                           ,'ddmmyy')))
           || seqnc
           || ora_hash (utils_creat)
           || to_char (date_creat
                      ,'mmmmyydmmyymmddyyyymmddyydmmyydmmdd')
      into vva_date_creat
      from vd_i_afw_12_utils u
     where u.seqnc = afw_12_utils_pkg.obten_usagr_conct ('O');

    return hextoraw (substr (vva_date_creat
                            ,1
                            ,32));
  end obten_cle_encry_utils_conct;

  function obten_code_utils (pnu_seqnc in number)
    return vd_i_afw_12_utils.code_utils%type
  is
    vva_code_utils   vd_i_afw_12_utils.code_utils%type;
  begin
    select code_utils
      into vva_code_utils
      from vd_i_afw_12_utils
     where seqnc = pnu_seqnc;

    return vva_code_utils;
  exception
    when others
    then
      return null;
  end obten_code_utils;

  function creer_utils (pva_nom                     in varchar2
                       ,pva_prenm                   in varchar2
                       ,pva_code                    in varchar2
                       ,pva_courl                   in varchar2
                       ,pva_indic_verl              in varchar2 default 'N'
                       ,pva_indic_chang_mot_passe   in varchar2 default 'O'
                       ,pva_indic_actif             in vd_i_afw_12_utils.indic_actif%type default 'N'
                       ,pva_parmt_authe_exter_afw   in vd_i_afw_12_utils.parmt_authe_exter_afw%type default null)
    return vd_i_afw_12_utils.seqnc%type
  is
    vnu_utils   vd_i_afw_12_utils.seqnc%type;
  begin
    insert into vd_i_afw_12_utils (nom
                                  ,prenm
                                  ,code_utils
                                  ,courl
                                  ,indic_verl
                                  ,indic_chang_mot_passe
                                  ,indic_actif
                                  ,parmt_authe_exter_afw)
         values (pva_nom
                ,pva_prenm
                ,pva_code
                ,pva_courl
                ,pva_indic_verl
                ,pva_indic_chang_mot_passe
                ,pva_indic_actif
                ,pva_parmt_authe_exter_afw)
      returning seqnc
           into vnu_utils;

    return vnu_utils;
  end creer_utils;

  procedure creer_utils (pva_nom                     in varchar2
                        ,pva_prenm                   in varchar2
                        ,pva_code                    in varchar2
                        ,pva_courl                   in varchar2
                        ,pva_indic_verl              in varchar2 default 'N'
                        ,pva_indic_chang_mot_passe   in varchar2 default 'O'
                        ,pva_indic_actif             in vd_i_afw_12_utils.indic_actif%type default 'N'
                        ,pva_parmt_authe_exter_afw   in vd_i_afw_12_utils.parmt_authe_exter_afw%type default null)
  is
    vnu_utils   vd_i_afw_12_utils.seqnc%type;
  begin
    vnu_utils      :=
      creer_utils (pva_nom                     => pva_nom
                  ,pva_prenm                   => pva_prenm
                  ,pva_code                    => pva_code
                  ,pva_courl                   => pva_courl
                  ,pva_indic_verl              => pva_indic_verl
                  ,pva_indic_chang_mot_passe   => pva_indic_chang_mot_passe
                  ,pva_indic_actif             => pva_indic_actif
                  ,pva_parmt_authe_exter_afw   => pva_parmt_authe_exter_afw);
  end creer_utils;

  function obten_courl_utils (pnu_utils in number)
    return vd_i_afw_12_utils.courl%type
  is
    vva_courl   vd_i_afw_12_utils.courl%type;
  begin
    select u.courl
      into vva_courl
      from vd_i_afw_12_utils u
     where u.seqnc = pnu_utils;

    return vva_courl;
  exception
    when others
    then
      return null;
  end obten_courl_utils;

  /*
            CONAL : Cette fonction est rendue obselete puisque laccès aux applications est maintenant en drilldown.
            Autrement, elle servait conserver la dernière application choisie par l'utilisateur.
            Peut-être trouver une nouvelle façon de la réutiliser ?
  */
  function obten_dernr_aplic (pnu_utils in number)
    return vd_i_afw_12_utils.dernr_prodt_acces%type
  is
    vva_dernr_prodt_acces   vd_i_afw_12_utils.dernr_prodt_acces%type;
  begin
    select dernr_prodt_acces
      into vva_dernr_prodt_acces
      from vd_i_afw_12_utils
     where seqnc = pnu_utils;

    return vva_dernr_prodt_acces;
  end obten_dernr_aplic;

  /*
        CONAL : Cette fonction est rendue obselete puisque laccès aux applications est maintenant en drilldown.
            Autrement, elle servait conserver la dernière application choisie par l'utilisateur.
            Peut-être trouver une nouvelle façon de la réutiliser ?
  */
  procedure updat_dernr_aplic (pnu_utils        in number
                              ,pva_nouv_prodt   in varchar2)
  is
  begin
    update vd_i_afw_12_utils
       set dernr_prodt_acces   = pva_nouv_prodt
     where seqnc = pnu_utils;
  end updat_dernr_aplic;

  function obten_dernr_domn (pnu_utils in number)
    return vd_i_afw_12_domn.code%type
  is
    vva_domn   vd_i_afw_12_domn.code%type;
  begin
    select dernr_domn_acces
      into vva_domn
      from vd_i_afw_12_utils
     where seqnc = pnu_utils;

    return vva_domn;
  end obten_dernr_domn;

  procedure updat_dernr_domn (pnu_utils       in number
                             ,pva_nouv_domn   in varchar2)
  is
  begin
    update vd_i_afw_12_utils
       set dernr_domn_acces   = upper (pva_nouv_domn)
     where seqnc = pnu_utils;
  end updat_dernr_domn;

  function genr_code_utils (pva_nom     in vd_i_afw_12_utils.nom%type
                           ,pva_prenm   in vd_i_afw_12_utils.prenm%type)
    return vd_i_afw_12_utils.code_utils%type
  is
    vva_code_utils   vd_i_afw_12_utils.code_utils%type;
    vnu_exist        number;
    vnu_numr_incre   number;

    cursor cur_utils (pva_code_utils in varchar2)
    is
        select code_utils
          from vd_i_afw_12_utils
         where instr (code_utils
                     ,pva_code_utils) = 1
      order by to_number (substr (code_utils
                                 ,length (pva_code_utils) + 1)) desc nulls last;

    rec_utils        cur_utils%rowtype;
  begin
    vva_code_utils      :=
      upper (   substr (pva_nom
                       ,1
                       ,3)
             || substr (pva_prenm
                       ,1
                       ,2));

    --Remplacer les caractères spéciaux
    vva_code_utils      :=
      translate (vva_code_utils
                ,'àèìòùáéíóúýâêîôûäëïöüÿçñÀÈÌÒÙÁÉÍÓÚÝÂÊÎÔÛÄËÏÖÜÇÑ'
                ,'aeiouaeiouyaeiouaeiouycnaeiouaeiouyaeiouaeioucn');
    vva_code_utils      :=
      afw_07_util_pkg.multi_replc (vva_code_utils
                                  ,'œ'
                                  ,'oe'
                                  ,'Œ'
                                  ,'OE');

    -- mettre en majuscules
    vva_code_utils   := upper (vva_code_utils);

    open cur_utils (vva_code_utils);

    fetch cur_utils
      into rec_utils;

    if cur_utils%found
    then
      vnu_numr_incre      :=
          to_number (nvl (substr (rec_utils.code_utils
                                 ,length (vva_code_utils) + 1)
                         ,1))
        + 1;
      vva_code_utils      :=
           vva_code_utils
        || vnu_numr_incre;
    end if;

    close cur_utils;

    return vva_code_utils;
  end genr_code_utils;

  procedure defnr_item_aplic_apex
  is
  begin
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_12_UTILS_CODE'
                                    ,obten_code_usagr_conct);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_12_UTILS'
                                    ,obten_usagr_conct);
    afw_07_util_pkg.defnr_etat_sesn ('A_AFW_12_UTILS_NOM_FORMT'
                                    ,obten_nom_formt_de_utils (obten_usagr_conct));
  exception
    when others
    then
      raise;
  end defnr_item_aplic_apex;

  procedure modfr_nom_prenm_utils (pnu_utils   in vd_i_afw_12_utils.seqnc%type
                                  ,pva_nom     in vd_i_afw_12_utils.nom%type
                                  ,pva_prenm   in vd_i_afw_12_utils.prenm%type)
  is
  begin
    update vd_i_afw_12_utils
       set nom     = pva_nom
          ,prenm   = pva_prenm
     where seqnc = pnu_utils;
  end modfr_nom_prenm_utils;

  procedure modfr_courl_utils (pnu_utils   in vd_i_afw_12_utils.seqnc%type
                              ,pva_courl   in vd_i_afw_12_utils.courl%type)
  is
  begin
    update vd_i_afw_12_utils
       set courl   = pva_courl
     where seqnc = pnu_utils;
  end modfr_courl_utils;

  procedure modfr_code_utils (pnu_utils        in vd_i_afw_12_utils.seqnc%type
                             ,pva_code_utils   in vd_i_afw_12_utils.code_utils%type)
  is
  begin
    update vd_i_afw_12_utils
       set code_utils   = pva_code_utils
     where seqnc = pnu_utils;
  end modfr_code_utils;

  function obten_audit_usagr_conct
    return varchar2
  is
    vva_audit_usagr_conct   varchar2 (4000);
  begin
    if     gva_code_utils_pour is not null
       and gva_code_domn_pour is not null
    then
      vva_audit_usagr_conct      :=
           gva_code_utils
        || '@'
        || gva_code_utils_pour
        || ':'
        || gva_code_domn
        || '@'
        || gva_code_domn_pour;
    else
      vva_audit_usagr_conct      :=
           obten_code_usagr_conct
        || case
             when gva_code_domn is not null
             then
                  ':'
               || gva_code_domn
             else
               null
           end;
    end if;

    return vva_audit_usagr_conct;
  end obten_audit_usagr_conct;

  function obten_usagr_conct_sql (pva_code_utils in varchar2)
    return number
    result_cache relies_on (afw_12_utils)
  is
    vnu_seqnc_utils   number (10);
  begin
    select ut.seqnc
      into vnu_seqnc_utils
      from vd_i_afw_12_utils ut
     where ut.code_utils = pva_code_utils;

    return vnu_seqnc_utils;
  exception
    when others
    then
      return null;
  end obten_usagr_conct_sql;

  function obten_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return vd_i_afw_12_utils%rowtype
  is
    rec_utils   vd_i_afw_12_utils%rowtype;
  begin
    select *
      into rec_utils
      from vd_i_afw_12_utils
     where seqnc = pnu_utils;

    return rec_utils;
  exception
    when no_data_found
    then
      return null;
  end obten_utils;

  function obten_utils (pva_code_utils in vd_i_afw_12_utils.code_utils%type)
    return vd_i_afw_12_utils.seqnc%type
  is
    vnu_utils   vd_i_afw_12_utils.seqnc%type;
  begin
    select su.seqnc
      into vnu_utils
      from vd_i_afw_12_utils su
     where code_utils = pva_code_utils;

    return vnu_utils;
  exception
    when no_data_found
    then
      return null;
  end obten_utils;

  procedure verlr_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type)
  is
  begin
    update vd_i_afw_12_utils
       set indic_verl   = 'O'
     where seqnc = pnu_utils;
  end verlr_utils;

  procedure devrl_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type)
  is
  begin
    update vd_i_afw_12_utils
       set indic_verl   = 'N'
     where seqnc = pnu_utils;
  end devrl_utils;

  procedure activ_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type)
  is
  begin
    update vd_i_afw_12_utils
       set indic_actif   = 'O'
     where seqnc = pnu_utils;
  end activ_utils;

  procedure desct_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type)
  is
  begin
    update vd_i_afw_12_utils
       set indic_actif   = 'N'
     where seqnc = pnu_utils;
  end desct_utils;

  function valdr_formt_code_utils (pva_code_utils in vd_i_afw_12_utils.code_utils%type)
    return boolean
  is
  begin
    return regexp_like (pva_code_utils
                       ,'^[[:alnum:]]+(_[[:alnum:]]+)*$');
  end valdr_formt_code_utils;

  function valdr_formt_courl_utils (pva_courl in vd_i_afw_12_utils.courl%type)
    return boolean
  is
  begin
    return regexp_like (pva_courl
                       ,'^[[:alnum:]]+((_|\.|\-|)[[:alnum:]]+)*@[[:alnum:]]+(\-|[[:alnum:]]+)*(\.[[:alnum:]]+){1,2}$');
  end valdr_formt_courl_utils;

  function verfc_apart_super_utils (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean
  is
    vbo_reslt   boolean default false;

    cursor cur_super_utils
    is
      select 1
        from vd_i_afw_12_lien_group_utils lgu
            ,vd_i_afw_12_group_utils      gu
       where     lgu.ref_group = gu.seqnc
             and gu.code = 'SUPER_UTILS'
             and lgu.ref_utils = pnu_utils
             and lgu.ref_domn = afw_12_domn_pkg.obten_domn_sesn
             and lgu.date_debut_efect <= sysdate
             and (   lgu.date_fin_efect >= sysdate
                  or lgu.date_fin_efect is null)
             and rownum = 1;
  begin
    for rec_su in cur_super_utils
    loop
      vbo_reslt   := true;
    end loop;

    return vbo_reslt;
  end verfc_apart_super_utils;

  function verfc_apart_super_utils_n (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return number
  is
    vnu_reslt   number default 0;
  begin
    if verfc_apart_super_utils (pnu_utils)
    then
      vnu_reslt   := 1;
    end if;

    return vnu_reslt;
  end verfc_apart_super_utils_n;

  function verfc_apart_autor_conxn_derv (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean
  is
    vbo_reslt   boolean default false;

    cursor cur_autor_conxn_derv
    is
      select 1
        from vd_i_afw_12_lien_group_utils lgu
            ,vd_i_afw_12_group_utils      gu
       where     lgu.ref_group = gu.seqnc
             and gu.code = 'AUTOR_CONXN_DERV'
             and gu.ref_prodt = afw_11_prodt_pkg.obten_prodt ('AFW')
             and lgu.ref_utils = pnu_utils
             and lgu.ref_domn = afw_12_domn_pkg.obten_domn_sesn
             and lgu.date_debut_efect <= sysdate
             and (   lgu.date_fin_efect >= sysdate
                  or lgu.date_fin_efect is null)
             and rownum = 1;
  begin
    for rec_acd in cur_autor_conxn_derv
    loop
      vbo_reslt   := true;
    end loop;

    return vbo_reslt;
  end verfc_apart_autor_conxn_derv;

  function verfc_apart_autor_conxn_derv_n (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return number
  is
    vnu_reslt   number default 0;
  begin
    if verfc_apart_autor_conxn_derv (pnu_utils)
    then
      vnu_reslt   := 1;
    end if;

    return vnu_reslt;
  end verfc_apart_autor_conxn_derv_n;

  function obten_parmt_authe_exter_afw (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return vd_i_afw_12_utils.parmt_authe_exter_afw%type
  is
    vva_parmt_authe_exter_afw   vd_i_afw_12_utils.parmt_authe_exter_afw%type;
  begin
    select su.parmt_authe_exter_afw
      into vva_parmt_authe_exter_afw
      from vd_i_afw_12_utils su
     where su.seqnc = pnu_utils;

    return vva_parmt_authe_exter_afw;
  exception
    when others
    then
      return null;
  end obten_parmt_authe_exter_afw;

  function valdr_courl (pva_courl in varchar2)
    return boolean
  is
    vbo_vald   boolean := false;
  begin
    if (regexp_like (pva_courl
                    ,'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'))
    then
      vbo_vald   := true;
    end if;

    return vbo_vald;
  end valdr_courl;

  function valdr_courl_confr (pva_courl         in varchar2
                             ,pva_courl_confr   in varchar2)
    return boolean
  is
    vbo_vald   boolean default false;
  begin
    if     pva_courl is not null
       and pva_courl_confr is not null
       and pva_courl = pva_courl_confr
    then
      vbo_vald   := true;
    end if;

    return vbo_vald;
  end valdr_courl_confr;

  function verfr_utils_verlr (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean
  is
    vbo_utils_verlr   boolean default false;
    rec_utils         vd_i_afw_12_utils%rowtype;
  begin
    rec_utils   := obten_utils (pnu_utils);

    if rec_utils.indic_verl = 'O'
    then
      vbo_utils_verlr   := true;
    end if;

    return vbo_utils_verlr;
  end verfr_utils_verlr;

  function verfr_utils_activ (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean
  is
    vbo_utils_activ   boolean default false;
    rec_utils         vd_i_afw_12_utils%rowtype;
  begin
    rec_utils   := obten_utils (pnu_utils);

    if rec_utils.indic_actif = 'O'
    then
      vbo_utils_activ   := true;
    end if;

    return vbo_utils_activ;
  end verfr_utils_activ;

  function verfr_utils_est_utils_conct (pnu_utils in vd_i_afw_12_utils.seqnc%type)
    return boolean
  is
  begin
    return (obten_usagr_conct = pnu_utils);
  end verfr_utils_est_utils_conct;

  function verfr_utils_est_utils_conct (pva_code_utils in vd_i_afw_12_utils.code_utils%type)
    return boolean
  is
  begin
    return (obten_code_usagr_conct = pva_code_utils);
  end verfr_utils_est_utils_conct;

  procedure suprm_tous_utils
  is
  begin
    delete vd_i_afw_12_utils
     where code_utils <> 'AFW_ADMIN';
  end suprm_tous_utils;

  procedure verlr_tous_utils
  is
  begin
    update vd_i_afw_12_utils
       set indic_verl   = 'O'
     where code_utils <> 'AFW_ADMIN';
  end verlr_tous_utils;

  procedure desct_tous_utils
  is
  begin
    update vd_i_afw_12_utils
       set indic_actif   = 'N'
     where code_utils <> 'AFW_ADMIN';
  end desct_tous_utils;

  function obten_utils_infor_procd (pnu_domn    in number
                                   ,pnu_utils   in number)
    return gre_utils_infor%type
  is
    vva_progr_a_lancr   varchar2 (4000)
                          default    'begin '
                                  || '  afw_12_utils_pkg.gre_utils_infor := %PROCD_PERSN%(:p1); '
                                  || '  exception when others then ete();'
                                  || 'end;';
    vre_utils_infor     gty_utils_infor;

    vva_nom_procd       varchar2 (92) default afw_12_domn_pkg.obten_procd_infor_utils (pnu_domn);
  begin
    if vva_nom_procd is not null
    then
      vva_progr_a_lancr      :=
        replace (vva_progr_a_lancr
                ,'%PROCD_PERSN%'
                ,vva_nom_procd);

      execute immediate vva_progr_a_lancr using pnu_utils;

      vre_utils_infor   := gre_utils_infor;
    end if;

    return vre_utils_infor;
  end obten_utils_infor_procd;

  function obten_utils_infor_procd (pnu_domn         in number
                                   ,pva_code_utils   in varchar2)
    return gre_utils_infor%type
  is
    vre_utils_infor   gty_utils_infor;
  begin
    vre_utils_infor      :=
      obten_utils_infor_procd (pnu_domn
                              ,obten_utils_de_code (pva_code_utils));

    return vre_utils_infor;
  end obten_utils_infor_procd;

  function obten_utils_courl_infor_procd (pnu_domn    in number
                                         ,pnu_utils   in number)
    return varchar2
  is
    vva_courl   gre_utils_infor.courl%type;
  begin
    vva_courl      :=
      obten_utils_infor_procd (pnu_domn
                              ,pnu_utils).courl;

    return vva_courl;
  end obten_utils_courl_infor_procd;

  function obten_utils_formt_infor_procd (pnu_domn    in number
                                         ,pnu_utils   in number)
    return varchar2
  is
    vva_nom_formt   gre_utils_infor.utils_formt%type;
  begin
    vva_nom_formt      :=
      obten_utils_infor_procd (pnu_domn
                              ,pnu_utils).utils_formt;

    return vva_nom_formt;
  end obten_utils_formt_infor_procd;
begin
  gva_code_utils        := afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_UTILS');
  gva_code_utils_pour   := afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_UTILS_POUR');
  gva_code_domn         := afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN');
  gva_code_domn_pour    := afw_07_sesn_pkg.obten_valr_sesn ('S_AFW_12_DOMN_POUR');
end afw_12_utils_pkg;
/
