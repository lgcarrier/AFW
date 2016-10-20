SET DEFINE OFF;
create or replace package body afw_11_aplic_pkg
is
  gda_const_date   constant date
                              default to_date (   '1'
                                               || '9'
                                               || '8'
                                               || '7'
                                               || '-'
                                               || '0'
                                               || '7'
                                               || '-'
                                               || '0'
                                               || '9'
                                              ,'yyyy-mm-dd') ;
  gnu_versn_niv_1           number default 2;
  gnu_versn_niv_2           number default 3;
  gnu_versn_niv_3           number default 0;
  gnu_versn_niv_4           number default 0;
  gnu_numr_aplic_apex       number;

  function obten_lang_deft (pnu_aplic in vd_i_afw_11_aplic.seqnc%type)
    return vd_afw_01_lang.seqnc%type
  is
    vnu_lang   vd_afw_01_lang.seqnc%type;
  begin
    select l.seqnc
      into vnu_lang
      from vd_i_afw_11_aplic a
          ,apex_aplic        aa
          ,vd_i_afw_01_lang  l
     where     a.seqnc = pnu_aplic
           and aa.id = a.numr_aplic_apex
           and upper (aa.flow_language) = l.code;

    return vnu_lang;
  exception
    when no_data_found
    then
      return null;
  end obten_lang_deft;

  function obten_lang_deft_formt (pnu_aplic in vd_i_afw_11_aplic.seqnc%type)
    return apex_aplic.flow_language%type
  is
    vva_lang   apex_aplic.flow_language%type;
  begin
    select aa.flow_language
      into vva_lang
      from apex_aplic        aa
          ,vd_i_afw_11_aplic a
     where     aa.id = a.numr_aplic_apex
           and a.seqnc = pnu_aplic;

    return vva_lang;
  exception
    when no_data_found
    then
      return null;
  end obten_lang_deft_formt;

  function obten_aplic_sesn
    return vd_i_afw_11_aplic.seqnc%type
  is
    vnu_seqnc_aplic   vd_i_afw_11_aplic.seqnc%type;
  begin
    /*
    select a.seqnc
      into vnu_seqnc_aplic
      from vd_i_afw_11_aplic a
     where a.numr_aplic_apex = nvl (afw_07_util_pkg.v ('APP_ID'), gnu_numr_aplic_apex);

    return vnu_seqnc_aplic;
   */
    return afw_07_polc_pkg.obten_valr_contx_seqnc_aplic;
  exception
    when no_data_found
    then
      raise;
  end obten_aplic_sesn;

  function obten_aplic (pva_code_aplic in vd_i_afw_11_aplic.code%type)
    return vd_i_afw_11_aplic.seqnc%type
  is
    vnu_aplic   vd_i_afw_11_aplic.seqnc%type;
  begin
    select a.seqnc
      into vnu_aplic
      from vd_i_afw_11_aplic a
     where a.code = pva_code_aplic;

    return vnu_aplic;
  exception
    when no_data_found
    then
      return null;
  end obten_aplic;

  function obten_aplic (pnu_numr_apex in vd_i_afw_11_aplic.numr_aplic_apex%type)
    return vd_i_afw_11_aplic.seqnc%type
  is
    vnu_aplic   vd_i_afw_11_aplic.seqnc%type;
  begin
    select a.seqnc
      into vnu_aplic
      from vd_i_afw_11_aplic a
     where a.numr_aplic_apex = pnu_numr_apex;

    return vnu_aplic;
  end obten_aplic;

  function obten_aplic_numr_apex (pnu_numr_apex in vd_i_afw_11_aplic.numr_aplic_apex%type)
    return vd_i_afw_11_aplic.seqnc%type
  is
    vnu_aplic   vd_i_afw_11_aplic.seqnc%type;
  begin
    select a.seqnc
      into vnu_aplic
      from vd_i_afw_11_aplic a
     where a.numr_aplic_apex = pnu_numr_apex;

    return vnu_aplic;
  end obten_aplic_numr_apex;

  function obten_numr_apex_aplic (pnu_seqnc in number default obten_aplic_sesn)
    return vd_i_afw_11_aplic.numr_aplic_apex%type
  is
    vnu_numr_aplic_apex   vd_i_afw_11_aplic.numr_aplic_apex%type;
  begin
    select a.numr_aplic_apex
      into vnu_numr_aplic_apex
      from vd_i_afw_11_aplic a
     where a.seqnc = pnu_seqnc;

    return vnu_numr_aplic_apex;
  exception
    when others
    then
      return null;
  end obten_numr_apex_aplic;

  function obten_numr_apex_aplic (pva_code_aplic in varchar2)
    return vd_i_afw_11_aplic.numr_aplic_apex%type
  is
    vnu_numr_aplic_apex   vd_i_afw_11_aplic.numr_aplic_apex%type;
  begin
    select a.numr_aplic_apex
      into vnu_numr_aplic_apex
      from vd_i_afw_11_aplic a
     where a.code = pva_code_aplic;

    return vnu_numr_aplic_apex;
  exception
    when others
    then
      return null;
  end obten_numr_apex_aplic;

  function obten_code_aplic (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.code%type
  is
    vva_code   vd_i_afw_11_aplic.code%type;
  begin
    select a.code
      into vva_code
      from vd_i_afw_11_aplic a
     where a.seqnc = pnu_aplic;

    return vva_code;
  end obten_code_aplic;

  function obten_nom_aplic (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.nom%type
  is
    vva_nom   vd_i_afw_11_aplic.nom%type;
  begin
    select a.nom
      into vva_nom
      from vd_i_afw_11_aplic a
     where a.seqnc = pnu_aplic;

    return vva_nom;
  end obten_nom_aplic;

  function obten_page_conxn (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_page_conxn%type
  is
    vnu_page_conxn   vd_i_afw_11_aplic.ref_page_conxn%type;
  begin
    select a.ref_page_conxn
      into vnu_page_conxn
      from vd_i_afw_11_aplic a
     where a.seqnc = pnu_aplic;

    return vnu_page_conxn;
  exception
    when others
    then
      raise;
  end obten_page_conxn;

  function obten_numr_apex_page_conxn (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return number
  is
    vnu_numr_apex_page_conxn   number;
  begin
    select afw_13_page_pkg.obten_numr_apex_page (a.ref_page_conxn)
      into vnu_numr_apex_page_conxn
      from vd_i_afw_11_aplic a
     where     a.ref_page_conxn is not null
           and a.seqnc = pnu_aplic;

    return vnu_numr_apex_page_conxn;
  exception
    when no_data_found
    then
      return null;
  end obten_numr_apex_page_conxn;

  function obten_page_acuei (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_page_acuei%type
  is
    vnu_page_acuei   vd_i_afw_11_aplic.ref_page_acuei%type;
  begin
    select a.ref_page_acuei
      into vnu_page_acuei
      from vd_i_afw_11_aplic a
     where a.seqnc = pnu_aplic;

    return vnu_page_acuei;
  exception
    when others
    then
      raise;
  end obten_page_acuei;

  function obten_numr_apex_page_acuei (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return number
  is
    vnu_numr_apex_page_acuei   number;
  begin
    select afw_13_page_pkg.obten_numr_apex_page (a.ref_page_acuei)
      into vnu_numr_apex_page_acuei
      from vd_i_afw_11_aplic a
     where     a.ref_page_acuei is not null
           and a.seqnc = pnu_aplic;

    return vnu_numr_apex_page_acuei;
  exception
    when no_data_found
    then
      return null;
  end obten_numr_apex_page_acuei;

  function obten_page_conxn_aplic_authe (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_page_conxn%type
  is
  begin
    return obten_page_conxn (obten_aplic_authe (pnu_aplic));
  exception
    when no_data_found
    then
      return null;
  end obten_page_conxn_aplic_authe;

  /*
      OBSOLETE: il faut utiliser AFW_11_VERSN_PKG.OBTEN_NUMR_VERSN
  */
  function obten_numr_versn (pnu_versn_niv_1   in number
                            ,pnu_versn_niv_2   in number
                            ,pnu_versn_niv_3   in number
                            ,pnu_versn_niv_4   in number)
    return number
    deterministic
  is
  begin
    return afw_11_versn_pkg.obten_numr_versn (pnu_versn_niv_1
                                             ,pnu_versn_niv_2
                                             ,pnu_versn_niv_3
                                             ,pnu_versn_niv_4);
  end obten_numr_versn;

  function obten_numr_versn_aplic (pnu_numr_aplic in number default null)
    return number
  is
    vnu_versn_formt   number;
  begin
    --TODO revoir cette partie lorsqu'on remplacera le repartiteur
    if pnu_numr_aplic is null
    then
      return obten_numr_versn (gnu_versn_niv_1
                              ,gnu_versn_niv_2
                              ,gnu_versn_niv_3
                              ,gnu_versn_niv_4);
    else
      select (select afw_11_aplic_pkg.obten_numr_versn (v.numr_versn_1
                                                       ,v.numr_versn_2
                                                       ,v.numr_versn_3
                                                       ,v.numr_versn_4)
                from vd_i_afw_11_versn v
               where v.ref_aplic = p.seqnc)
        into vnu_versn_formt
        from vd_afw_11_aplic p
       where p.numr_aplic_apex = pnu_numr_aplic;

      return vnu_versn_formt;
    end if;
  end obten_numr_versn_aplic;

  /*
  OBSOLETE: il faut utiliser AFW_11_VERSN_PKG.OBTEN_VERSN
  */
  function obten_versn (pnu_versn_niv_1   in number
                       ,pnu_versn_niv_2   in number
                       ,pnu_versn_niv_3   in number
                       ,pnu_versn_niv_4   in number)
    return varchar2
    deterministic
  is
  begin
    return afw_11_versn_pkg.obten_versn (pnu_versn_niv_1
                                        ,pnu_versn_niv_2
                                        ,pnu_versn_niv_3
                                        ,pnu_versn_niv_4);
  end obten_versn;

  function obten_versn
    return varchar2
  is
    vva_nom   varchar2 (200);
  begin
    select    a.nom
           || ' '
           || (select afw_11_aplic_pkg.obten_versn (v.numr_versn_1
                                                   ,v.numr_versn_2
                                                   ,v.numr_versn_3
                                                   ,v.numr_versn_4)
                 from vd_i_afw_11_versn v
                where     v.ref_aplic = a.seqnc
                      and rownum = 1)
      into vva_nom
      from vd_i_afw_11_aplic a
     where a.seqnc = obten_aplic_sesn;

    return vva_nom;
  end obten_versn;

  function obten_schem (pnu_seqnc in number default null)
    return varchar2
  is
    vva_schem   varchar2 (60);
  begin
    if pnu_seqnc is null
    then
      select aa.owner
        into vva_schem
        from apex_aplic aa
       where aa.id = afw_07_util_pkg.nv ('APP_ID');
    else
      select aa.owner
        into vva_schem
        from apex_aplic        aa
            ,vd_i_afw_11_aplic a
       where     aa.id = a.numr_aplic_apex
             and a.seqnc = pnu_seqnc;
    end if;

    return vva_schem;
  end obten_schem;

  procedure defnr_varbl_numr_aplic
  is
    cursor cur_aplic
    is
      select a.code
            ,a.numr_aplic_apex
        from vd_i_afw_11_aplic a;

    vva_nom_item   varchar2 (60);
  begin
    for rec_aplic in cur_aplic
    loop
      vva_nom_item      :=
           'A_AFW_11_'
        || rec_aplic.code;

      if afw_07_util_pkg.exist_item (vva_nom_item)
      then
        afw_07_util_pkg.defnr_etat_sessn (vva_nom_item
                                         ,rec_aplic.numr_aplic_apex);
      end if;
    end loop;
  end defnr_varbl_numr_aplic;

  function obten_aplic_sga
    return number
  is
    vnu_numr_aplic   number;
  begin
    select a.numr_aplic_apex
      into vnu_numr_aplic
      from vd_i_afw_11_aplic a
     where a.code = 'SGA';

    return vnu_numr_aplic;
  exception
    when no_data_found
    then
      return null;
  end obten_aplic_sga;

  function obten_aplic_sdp
    return number
  is
    vnu_numr_aplic   number;
  begin
    select a.numr_aplic_apex
      into vnu_numr_aplic
      from vd_i_afw_11_aplic a
     where a.code = 'SAFP';

    return vnu_numr_aplic;
  exception
    when no_data_found
    then
      return null;
  end obten_aplic_sdp;

  function obten_code_aplic_sdp
    return varchar2
  is
    vva_numr_aplic   varchar2 (10);
  begin
    select a.code
      into vva_numr_aplic
      from vd_i_afw_11_aplic a
     where a.code = 'SAFP';

    return vva_numr_aplic;
  exception
    when no_data_found
    then
      return null;
  end obten_code_aplic_sdp;

  procedure inser_aplic (pva_code              in varchar2
                        ,pva_nom               in varchar2
                        ,pnu_numr_aplic_apex   in number
                        ,pnu_numr_versn_1      in number
                        ,pnu_numr_versn_2      in number
                        ,pnu_numr_versn_3      in number
                        ,pnu_numr_versn_4      in number)
  is
    vnu_aplic   afw_11_aplic.seqnc%type;
    vnu_versn   afw_11_versn.seqnc%type;
  begin
    insert into vd_i_afw_11_aplic (code
                                  ,nom
                                  ,numr_aplic_apex)
         values (pva_code
                ,pva_nom
                ,pnu_numr_aplic_apex)
      returning seqnc
           into vnu_aplic;

    insert into vd_i_afw_11_versn (ref_aplic
                                  ,numr_versn_1
                                  ,numr_versn_2
                                  ,numr_versn_3
                                  ,numr_versn_4)
         values (vnu_aplic
                ,pnu_numr_versn_1
                ,pnu_numr_versn_2
                ,pnu_numr_versn_3
                ,pnu_numr_versn_4)
      returning seqnc
           into vnu_versn;

    update vd_i_afw_11_aplic a
       set a.ref_versn   = vnu_versn
     where a.seqnc = vnu_aplic;
  exception
    when others
    then
      raise_application_error (-20001
                              ,   'Erreur - afw_11_aplic_pkg.inser_aplic - '
                               || sqlerrm);
  end inser_aplic;

  function maj_aplic (pva_code              in varchar2
                     ,pva_nom               in varchar2
                     ,pnu_numr_aplic_apex   in number
                     ,pnu_ref_prodt         in number
                     ,pnu_ref_versn_courn   in number default null)
    return number
  is
    vnu_seqnc   number;
  begin
    begin
      select a.seqnc
        into vnu_seqnc
        from vd_i_afw_11_aplic a
       where a.code = upper (pva_code);

      update vd_i_afw_11_aplic a
         set a.nom               = pva_nom
            ,a.numr_aplic_apex   = pnu_numr_aplic_apex
            ,a.ref_versn         = pnu_ref_versn_courn
            ,a.ref_prodt         = pnu_ref_prodt
            ,a.dnr_ref_prodt     = pnu_ref_prodt
       where a.seqnc = vnu_seqnc;
    exception
      when no_data_found
      then
        null;

        insert into vd_i_afw_11_aplic (code
                                      ,nom
                                      ,numr_aplic_apex
                                      ,ref_prodt
                                      ,dnr_ref_prodt)
             values (pva_code
                    ,pva_nom
                    ,pnu_numr_aplic_apex
                    ,pnu_ref_prodt
                    ,pnu_ref_prodt)
          returning seqnc
               into vnu_seqnc;
    end;

    return vnu_seqnc;
  exception
    when others
    then
      --TODO: revoir la gestion des erreurs selon AFW
      raise_application_error (-20001
                              ,   'Erreur - afw_11_aplic_pkg.maj_aplic - '
                               || sqlerrm);
  end maj_aplic;

  function obten_lang (pva_code    in vd_afw_01_lang.code%type
                      ,pnu_prodt   in number default afw_11_prodt_pkg.obten_prodt_sesn)
    return vd_afw_01_lang.seqnc%type
  is
    vnu_seqnc   vd_afw_01_lang.seqnc%type;
  begin
    select l.seqnc
      into vnu_seqnc
      from vd_afw_11_prodt_lang pl
          ,vd_afw_01_lang       l
     where     pl.ref_prodt = pnu_prodt
           and l.seqnc = pl.ref_lang
           and l.code = upper (pva_code);

    return vnu_seqnc;
  exception
    when others
    then
      return null;
  end obten_lang;

  function obten_lang_sesn (pva_code_deft in varchar2 default null)
    return vd_afw_01_lang.seqnc%type
  is
    vnu_lang        vd_afw_01_lang.seqnc%type;
    vva_code_lang   varchar2 (10) default afw_01_lang_pkg.obten_lang_furtr ();
  begin
    -- Determiner si la langue du browser existe pour l'application
    vnu_lang   := obten_lang (vva_code_lang);

    -- Si la langue du browser n'existe pas pour l'application
    -- Determiner si la langue du browser sans territoire existe pour l'application
    if     vnu_lang is null
       and instr (vva_code_lang
                 ,'-') > 0
    then
      vnu_lang      :=
        obten_lang (substr (vva_code_lang
                           ,1
                           ,  instr (vva_code_lang
                                    ,'-')
                            - 1));
    end if;

    -- Si la langue du browser sans territoire n'existe pas pour l'application
    -- Utiliser la langue par defaut
    if     vnu_lang is null
       and pva_code_deft is not null
    then
      vnu_lang   := obten_lang (pva_code_deft);
    end if;

    --Prendre l'application primaire de l'application
    if vnu_lang is null
    then
      vnu_lang   := obten_lang (afw_01_lang_pkg.obten_lang_aplic_deft ());
    end if;

    return vnu_lang;
  end obten_lang_sesn;

  function obten_code_lang_sesn (pva_code_deft in varchar2 default null)
    return vd_i_afw_01_lang.code%type
  is
    vva_code   vd_i_afw_01_lang.code%type;
  begin
    select code
      into vva_code
      from vd_i_afw_01_lang l
     where l.seqnc = obten_lang_sesn (pva_code_deft);

    return vva_code;
  end obten_code_lang_sesn;

  function obten_secrt_group_id (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return apex_aplic.security_group_id%type
  is
    vnu_secrt_group_id   apex_aplic.security_group_id%type;
  begin
    select aa.security_group_id
      into vnu_secrt_group_id
      from apex_aplic      aa
          ,vd_afw_11_aplic a
     where     aa.id = a.numr_aplic_apex
           and a.seqnc = pnu_aplic;

    return vnu_secrt_group_id;
  end obten_secrt_group_id;

  function obten_theme_apex (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return apex_aplic.theme_id%type
  is
    vnu_theme_id   apex_aplic.theme_id%type;
  begin
    select aa.theme_id
      into vnu_theme_id
      from apex_aplic      aa
          ,vd_afw_11_aplic a
     where     aa.id = a.numr_aplic_apex
           and a.seqnc = pnu_aplic;

    return vnu_theme_id;
  exception
    when no_data_found
    then
      return null;
  end obten_theme_apex;

  function obten_versn_courn (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_versn%type
  is
    vnu_versn   vd_i_afw_11_aplic.ref_versn%type;
  begin
    select a.ref_versn
      into vnu_versn
      from vd_i_afw_11_aplic a
     where a.seqnc = pnu_aplic;

    return vnu_versn;
  end obten_versn_courn;

  function obten_aplic_authe (pnu_aplic in vd_i_afw_11_aplic.seqnc%type default obten_aplic_sesn)
    return vd_i_afw_11_aplic.ref_aplic_authe%type
  is
    vnu_ref_aplic_authe   vd_i_afw_11_aplic.ref_aplic_authe%type;
  begin
    select a.ref_aplic_authe
      into vnu_ref_aplic_authe
      from vd_i_afw_11_aplic a
     where a.seqnc = pnu_aplic;

    return vnu_ref_aplic_authe;
  end obten_aplic_authe;

  function obten_prodt (pnu_aplic in vd_i_afw_11_aplic.seqnc%type)
    return vd_i_afw_11_prodt.seqnc%type
  is
    vnu_prodt   vd_i_afw_11_prodt.seqnc%type;
  begin
    select s.seqnc
      into vnu_prodt
      from vd_i_afw_11_prodt s
          ,vd_i_afw_11_aplic p
     where     s.seqnc = p.ref_prodt
           and p.seqnc = pnu_aplic;

    return vnu_prodt;
  exception
    when no_data_found
    then
      return null;
  end obten_prodt;

  procedure defnr_app_id (pnu_numr_aplic_apex in number)
  is
  begin
    gnu_numr_aplic_apex   := pnu_numr_aplic_apex;
  end defnr_app_id;

  function obten_aplic_tradc_courn (pnu_aplic_base in number)
    return number
  is
    vnu_translation_flow_id   number;
  begin
    select translation_flow_id
      into vnu_translation_flow_id
      from apex_tradc
     where     primary_language_flow_id = pnu_aplic_base
           and translation_flow_language_code = afw_01_lang_pkg.obten_code_lang_sesn ();

    return vnu_translation_flow_id;
  exception
    when others
    then
      return pnu_aplic_base;
  end obten_aplic_tradc_courn;
end afw_11_aplic_pkg;
/
