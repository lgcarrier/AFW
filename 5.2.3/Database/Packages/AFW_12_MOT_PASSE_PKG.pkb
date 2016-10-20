SET DEFINE OFF;
create or replace package body afw_12_mot_passe_pkg
is
  gnu_mod_encry         constant pls_integer default dbms_crypto.encrypt_aes256 + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5;
  gnu_longr_cle_encry   constant pls_integer default 256 / 8;
  gra_cle_encry_base             raw (2000) default 'D0F0F51AC7FCF834F47B6797951A8244B65809DD33ECA420D0F6446DAF9F47E8';
  gva_charc_set         constant varchar2 (12) default 'WE8MSWIN1252';

  function encry (pra_valr   in raw
                 ,pra_cle    in raw)
    return raw
  is
  begin
    return dbms_crypto.encrypt (pra_valr
                               ,gnu_mod_encry
                               ,substr (pra_cle
                                       ,1
                                       ,64) /*pra_cle*/
                                           );
  end encry;

  function encry_mot_passe (pva_code_utils        in varchar2
                           ,pva_mot_passe_clair   in varchar2
                           ,pda_date              in date)
    return raw
  is
    vra_cle_reel              raw (2000);
    vva_valr_cle_reel_encry   varchar2 (100)
                                default    to_char (pda_date
                                                   ,'JSSSSS')
                                        || pva_code_utils
                                        || pva_mot_passe_clair;
  begin
    --obtenir la clé réelle d'encryption
    vra_cle_reel      :=
      encry (utl_i18n.string_to_raw (vva_valr_cle_reel_encry
                                    ,gva_charc_set)
            ,gra_cle_encry_base);
    --encrypter selon la vraie clé
    return encry (utl_i18n.string_to_raw (pva_mot_passe_clair)
                 ,vra_cle_reel);
  end encry_mot_passe;

  procedure defnr_mot_passe (pva_code_utils   in varchar2
                            ,pva_mot_passe    in varchar2)
  is
    vva_code_utils       afw_12_utils.code_utils%type;
    vda_date_creat       afw_12_utils.date_creat%type;
    vra_nouv_mot_passe   afw_12_utils.mot_passe%type;
  begin
        select u.code_utils
              ,u.date_creat
          into vva_code_utils
              ,vda_date_creat
          from afw_12_utils u
         where u.code_utils = upper (pva_code_utils)
    for update wait 1;

    vra_nouv_mot_passe      :=
      encry_mot_passe (upper (vva_code_utils)
                      ,pva_mot_passe
                      ,vda_date_creat);

    update afw_12_utils u
       set u.mot_passe   = vra_nouv_mot_passe
     where u.code_utils = upper (pva_code_utils);
  end defnr_mot_passe;

  procedure defnr_mot_passe (pnu_utils       in vd_i_afw_12_utils.seqnc%type
                            ,pva_mot_passe   in varchar2)
  is
  begin
    defnr_mot_passe (afw_12_utils_pkg.obten_code_utils (pnu_utils)
                    ,pva_mot_passe);
  end;

  function valdr_mot_passe (pva_code_utils   in varchar2
                           ,pva_mot_passe    in varchar2)
    return boolean
  is
    vra_mot_passe   afw_12_utils.mot_passe%type;
    rec_utils       vd_i_afw_12_utils%rowtype;
    vbo_valdt       boolean default false;
  begin
    if     pva_code_utils is not null
       and pva_mot_passe is not null
    then
      rec_utils   := afw_12_utils_pkg.obten_utils (afw_12_utils_pkg.obten_utils_de_code (pva_code_utils));

      vra_mot_passe      :=
        encry_mot_passe (upper (pva_code_utils)
                        ,pva_mot_passe
                        ,rec_utils.date_creat);

      if rec_utils.mot_passe = vra_mot_passe
      then
        vbo_valdt   := true;
      end if;
    end if;

    return vbo_valdt;
  exception
    when others
    then
      return false;
  end valdr_mot_passe;

  function genr_mot_passe
    return varchar2
  is
    vva_mot_passe      varchar2 (10);
    vnu_compt          pls_integer;
    invalid_password   exception;

    function obten_mot_passe
      return varchar2
    is
    begin
      return dbms_random.string ('P'
                                ,10);
    end;

    /*
     Code qui provient de DBMS_RANDOM.STRING
    */
    function obten_mot_passe2
      return varchar2
      parallel_enable
    is
      len    number default 10;
      rng    number default 67;
      n      binary_integer;
      ccs    varchar2 (128)
               default    '!#$%*'
                       || '0123456789'
                       || 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                       || 'abcdefghijklmnopqrstuvwxyz';

      xstr   varchar2 (4000) := null;
    begin
      for i in 1 ..
               least (len
                     ,4000)
      loop
        /* Get random integer within specified range */
        n   := trunc (rng * dbms_random.value) + 1;
        /* Append character to string  */
        xstr      :=
             xstr
          || substr (ccs
                    ,n
                    ,1);
      end loop;

      return xstr;
    end;
  begin
    while not valdr_niv_secrt_mot_passe (vva_mot_passe)
    loop
      vva_mot_passe   := obten_mot_passe2;
      vnu_compt       := vnu_compt + 1;

      if vnu_compt = 50
      then
        raise invalid_password;
      end if;
    end loop;

    return vva_mot_passe;
  exception
    when invalid_password
    then
      raise;
  end genr_mot_passe;

  function valdr_secrt_mot_passe (pva_mot_passe   in varchar2
                                 ,pva_nom         in varchar2 default null
                                 ,pva_prenm       in varchar2 default null)
    return boolean
  is
    vbo_vald                    boolean default false;
    vnu_nombr_carct_mot_passe   number default length (pva_mot_passe);
    vnu_nombr_carct_prenm_nom   number
                                  default length (   pva_prenm
                                                  || ' '
                                                  || pva_nom);
    vva_mot_passe               varchar2 (50) default lower (pva_mot_passe);
    vva_prenm_nom               varchar2 (50)
                                  default lower (   pva_prenm
                                                 || ' '
                                                 || pva_nom);
    vnu_ascii                   number (3);
    vnu_vald_chifr              number (1) default 0;
    vnu_vald_carct_majsc        number (1) default 0;
    vnu_vald_carct_minsc        number (1) default 0;
    vnu_vald_carct_symbl        number (1) default 0;
    vbo_vald_contn_nom_prenm    boolean default true;
  begin
    /*
   Les règles appliquées concernant les mots de passe sont les suivantes :
       •    Ne pas contenir des parties du nom complet de l’utilisateur comptant plus de deux caractères successifs;
       •    Comporter au moins sept caractères;
       •    Contenir des caractères provenant de trois des quatre catégories suivantes :
           o    Caractères majuscules anglais (A à Z)
           o    Caractères minuscules anglais (a à z)
           o    Chiffres en base 10 (0 à 9)
           o    Caractères non alphabétiques (par exemple, !, $, #, %)
   */
    if vnu_nombr_carct_mot_passe >= 7
    then
      for i in 1 .. vnu_nombr_carct_mot_passe
      loop
        vnu_ascii      :=
          ascii (substr (pva_mot_passe
                        ,i
                        ,1));

        if     vnu_vald_carct_symbl = 0
           and vnu_ascii between 33 and 47
        then
          vnu_vald_carct_symbl   := 1;
        elsif     vnu_vald_chifr = 0
              and vnu_ascii between 48 and 57
        then
          vnu_vald_chifr   := 1;
        elsif     vnu_vald_carct_majsc = 0
              and vnu_ascii between 65 and 90
        then
          vnu_vald_carct_majsc   := 1;
        elsif     vnu_vald_carct_minsc = 0
              and vnu_ascii between 97 and 122
        then
          vnu_vald_carct_minsc   := 1;
        end if;
      end loop;

      if    pva_nom is not null
         or pva_prenm is not null
      then
        for i in 1 .. vnu_nombr_carct_prenm_nom - 2
        loop
          if instr (vva_mot_passe
                   ,substr (vva_prenm_nom
                           ,i
                           ,3)) > 0
          then
            vbo_vald_contn_nom_prenm   := false;
            exit;
          end if;
        end loop;
      end if;
    end if;

    vbo_vald      :=
          (vnu_vald_carct_symbl + vnu_vald_chifr + vnu_vald_carct_majsc + vnu_vald_carct_minsc) >= 3
      and vbo_vald_contn_nom_prenm;

    return vbo_vald;
  end valdr_secrt_mot_passe;

  function valdr_niv_secrt_mot_passe (pva_mot_passe   in varchar2
                                     ,pva_nom         in varchar2 default null
                                     ,pva_prenm       in varchar2 default null
                                     ,pnu_domn        in vd_i_afw_12_domn.seqnc%type default null)
    return boolean
  is
    vbo_vald   boolean default false;

    rec_domn   vd_i_afw_12_domn%rowtype;

    function valdt_procd_authe_exter_afw (pva_nom_procd   in varchar2
                                         ,pva_mot_passe   in varchar2
                                         ,pva_nom         in varchar2
                                         ,pva_prenm       in varchar2)
      return boolean
    is
      vbo_valdt_procd     boolean default false;
      vva_progr_a_lancr   varchar2 (4000)
                            default    'begin '
                                    || '  afw_12_mot_passe_pkg.gbo_valdt_procd_niv_secrt := %PROCD_PERSN%(:p1, :p2, :p3); '
                                    || '  exception when others then ete();'
                                    || 'end;';
    begin
      vva_progr_a_lancr           :=
        replace (vva_progr_a_lancr
                ,'%PROCD_PERSN%'
                ,pva_nom_procd);

      execute immediate vva_progr_a_lancr
        using pva_mot_passe
             ,pva_nom
             ,pva_prenm;

      vbo_valdt_procd             := gbo_valdt_procd_niv_secrt;

      gbo_valdt_procd_niv_secrt   := false;

      return vbo_valdt_procd;
    exception
      when others
      then
        return false;
    end valdt_procd_authe_exter_afw;

    function valdt_niv_secrt (pva_mot_passe   in varchar2
                             ,pva_nom         in varchar2
                             ,pva_prenm       in varchar2
                             ,pre_domn        in vd_i_afw_12_domn%rowtype)
      return boolean
    is
      vbo_vald                    boolean default false;
      vnu_nombr_carct_mot_passe   number default length (pva_mot_passe);
      vnu_nombr_carct_prenm_nom   number
                                    default length (   pva_prenm
                                                    || ' '
                                                    || pva_nom);
      vva_mot_passe               varchar2 (50) default lower (pva_mot_passe);
      vva_prenm_nom               varchar2 (50)
                                    default lower (   pva_prenm
                                                   || ' '
                                                   || pva_nom);
      vnu_ascii                   number (3);
      vnu_vald_chifr              number (1) default 0;
      vnu_vald_carct_majsc        number (1) default 0;
      vnu_vald_carct_minsc        number (1) default 0;
      vnu_vald_carct_symbl        number (1) default 0;
      vbo_vald_contn_nom_prenm    boolean default true;
    begin
      --TODO::CARLO

      /*
Les règles appliquées concernant les mots de passe sont les suivantes :
    •    Ne pas contenir des parties du nom complet de l’utilisateur comptant plus de deux caractères successifs;
    •    Comporter au moins sept caractères;
    •    Contenir des caractères provenant de trois des quatre catégories suivantes :
        o    Caractères majuscules anglais (A à Z)
        o    Caractères minuscules anglais (a à z)
        o    Chiffres en base 10 (0 à 9)
        o    Caractères non alphabétiques (par exemple, !, $, #, %)
*/
      /* 2012-07-10 DB - Simplifier les règles : Comporter au moins six caractères.
          if vnu_nombr_carct_mot_passe >= 7 then
            for i in 1 .. vnu_nombr_carct_mot_passe
            loop
              vnu_ascii   := ascii (substr (pva_mot_passe, i, 1));

              if vnu_vald_carct_symbl = 0
                 and vnu_ascii between 33 and 47 then
                vnu_vald_carct_symbl   := 1;
              elsif vnu_vald_chifr = 0
                    and vnu_ascii between 48 and 57 then
                vnu_vald_chifr   := 1;
              elsif vnu_vald_carct_majsc = 0
                    and vnu_ascii between 65 and 90 then
                vnu_vald_carct_majsc   := 1;
              elsif vnu_vald_carct_minsc = 0
                    and vnu_ascii between 97 and 122 then
                vnu_vald_carct_minsc   := 1;
              end if;
            end loop;

            if pva_nom is not null
               or pva_prenm is not null then
              for i in 1 .. vnu_nombr_carct_prenm_nom - 2
              loop
                if instr (vva_mot_passe, substr (vva_prenm_nom, i, 3)) > 0 then
                  vbo_vald_contn_nom_prenm   := false;
                  exit;
                end if;
              end loop;
            end if;
          end if;

          vbo_vald      :=
            (  vnu_vald_carct_symbl
             + vnu_vald_chifr
             + vnu_vald_carct_majsc
             + vnu_vald_carct_minsc) >= 3
            and vbo_vald_contn_nom_prenm;
      */

      if vnu_nombr_carct_mot_passe > 5
      then
        vbo_vald   := true;
      end if;

      return vbo_vald;
    end valdt_niv_secrt;
  begin
    rec_domn   := afw_12_domn_pkg.obten_domn (pnu_domn);

    -- Procédure externe pour valider le niveau de sécurité du mot de passe
    if rec_domn.procd_vald_niv_secrt_mot_passe is not null
    then
      vbo_vald      :=
        valdt_procd_authe_exter_afw (rec_domn.procd_vald_niv_secrt_mot_passe
                                    ,pva_mot_passe
                                    ,pva_nom
                                    ,pva_prenm);
    else
      vbo_vald      :=
        valdt_niv_secrt (pva_mot_passe
                        ,pva_nom
                        ,pva_prenm
                        ,rec_domn);
    end if;

    return vbo_vald;
  end valdr_niv_secrt_mot_passe;

  procedure reint_mot_passe_par_utils (pnu_utils             in number
                                      ,pva_mot_passe_actue   in varchar2
                                      ,pva_mot_passe         in varchar2
                                      ,pva_confr_mot_passe   in varchar2)
  is
  begin
    if afw_12_mot_passe_pkg.valdr_mot_passe (afw_12_utils_pkg.obten_code_utils (pnu_utils)
                                            ,pva_mot_passe_actue)
    then
      afw_12_authe_apex_pkg.reint_mot_passe (pnu_utils
                                            ,pva_mot_passe
                                            ,pva_confr_mot_passe
                                            ,afw_12_domn_pkg.obten_domn_sesn);
    else
      afw_01_err_apex_pkg.lever_err_apex_code ('SEC.000030'
                                              ,pva_code_prodt   => 'AFW');
    end if;
  end reint_mot_passe_par_utils;
end afw_12_mot_passe_pkg;
/
