SET DEFINE OFF;
create or replace package body afw_11_migrt_pkg
is
  kva_nom_fichr_insta              constant varchar2 (30) default 'install.sql';
  kva_nom_fichr_insta_aplic        constant varchar2 (30) default 'install_app.sql';
  kva_nom_fichr_log_aplic          constant varchar2 (30) default 'install_aplic_log.txt';
  kva_nom_fichr_insta_meta         constant varchar2 (30) default 'install_meta.sql';
  kva_nom_fichr_log_meta           constant varchar2 (30) default 'install_meta_log.txt';
  kva_nom_fichr_insta_post_aplic   constant varchar2 (30) default 'post_apps.sql';
  kva_nom_fichr_insta_pre_aplic    constant varchar2 (30) default 'pre_apps.sql';
  kva_nom_fichr_insta_grant_pre    constant varchar2 (30) default 'install_grant_pre.sql';
  kva_nom_fichr_insta_grant_post   constant varchar2 (30) default 'install_grant_post.sql';

  type typ_rec_elemn_enonc_inser is record
  (
    seqnc             number (10)
   ,nom_schem_refrn   varchar2 (30)
   ,nom_entit_refrn   varchar2 (30)
   ,nom_coln          varchar2 (30)
   ,valr_varch        varchar2 (32767)
   ,valr_numbr        number
   ,valr_date         date
   ,valr_clob         clob
   ,indic_selct       varchar2 (1)
   ,indic_updat       varchar2 (1)
  );

  type typ_tab_elemn_enonc_inser is table of typ_rec_elemn_enonc_inser
    index by pls_integer;

  type typ_tabl_seqnc is table of varchar2 (200)
    index by varchar2 (61);

  type typ_tab_schem_custm is table of varchar2 (30)
    index by varchar2 (20);

  gta_tabl_schem_custm                      typ_tab_schem_custm;

  gta_tabl_seqnc                            typ_tabl_seqnc;

  gta_elemn_enonc_inser                     typ_tab_elemn_enonc_inser;
  gnu_prodt                                 vd_i_afw_11_prodt.seqnc%type;
  gnu_prodt_tempr                           vd_i_afw_11_prodt.seqnc%type;
  gnu_aplic                                 vd_i_afw_11_aplic.seqnc%type;
  gva_domn                                  varchar2 (4000);
  gnu_domn                                  vd_i_afw_12_domn.seqnc%type;
  gnu_schem                                 vd_i_afw_11_schem_prodt.seqnc%type;
  gva_contx                                 varchar2 (23);
  gva_contx_courn                           varchar2 (23);
  gnu_versn_afw                             vd_i_afw_11_versn.seqnc%type;
  gnu_versn                                 vd_i_afw_11_versn.seqnc%type;
  gnu_index_alimn_table                     afw_07_clob_pkg.typ_index;
  gnu_index_genrl                           afw_07_clob_pkg.typ_index;
  gnu_index_prodt                           afw_07_clob_pkg.typ_index;
  gnu_index_aplic                           afw_07_clob_pkg.typ_index;
  gnu_index_selct                           afw_07_clob_pkg.typ_index;
  gnu_index_updat                           afw_07_clob_pkg.typ_index;
  gnu_index_clob                            afw_07_clob_pkg.typ_index;
  gva_fin_ligne                             varchar2 (10) := chr (10);
  gnu_nombr_seprt                           number (10) default null;
  gnu_compt_ligne_bloc                      number (10) default 0;
  gbo_merge                                 boolean default false;
  gbl_zip                                   blob;
  gva_schem                                 varchar2 (30);
  gva_schem_afw                             varchar2 (30);
  gva_prodt_charg_domn                      varchar2 (200);
  gbo_alimn_prodt_suplm                     boolean default false;
  gva_crlf                                  varchar2 (2)
                                              default    chr (13)
                                                      || chr (10);


  procedure maj_refrn_schem (pnu_versn in number)
  is
    vnu_ref_prodt    vd_i_afw_11_prodt.seqnc%type;
    vva_code_prodt   vd_i_afw_11_prodt.code%type;
  begin
    select p.seqnc
          ,p.code
      into vnu_ref_prodt
          ,vva_code_prodt
      from vd_i_afw_11_versn v
          ,vd_i_afw_11_prodt p
     where     v.seqnc = pnu_versn
           and v.ref_prodt = p.seqnc;

    --Mettre ceux qui ne sont plus dans les schemas disponibles à ne pas déployer
    update vd_i_afw_11_schem_prodt sp
       set indic_deplm   = 'N'
     where     ref_versn = pnu_versn
           and not exists
                 (select 1
                    from vs_schem_apex_dispn_prodt sadp
                   where     sadp.seqnc_prodt = vnu_ref_prodt
                         and upper (sadp.code) = sp.code);

    --Insertion de ceux qui n'existent pas
    merge into vd_i_afw_11_schem_prodt dest
         using (select upper (sadp.code)   code
                      ,initcap (sadp.code) nom
                      ,pnu_versn           ref_versn
                  from vs_schem_apex_dispn_prodt sadp
                 where sadp.seqnc_prodt = vnu_ref_prodt) sourc
            on (    dest.code = sourc.code
                and dest.ref_versn = sourc.ref_versn)
    when not matched
    then
      insert     (code
                 ,nom
                 ,ref_versn)
          values (sourc.code
                 ,sourc.nom
                 ,sourc.ref_versn);
  end maj_refrn_schem;

  procedure maj_refrn_entit (pnu_versn in number)
  is
    vnu_ref_prodt    vd_i_afw_11_prodt.seqnc%type;
    vva_code_prodt   vd_i_afw_11_prodt.code%type;
  begin
    select p.seqnc
          ,p.code
      into vnu_ref_prodt
          ,vva_code_prodt
      from vd_i_afw_11_versn v
          ,vd_i_afw_11_prodt p
     where     v.seqnc = pnu_versn
           and v.ref_prodt = p.seqnc;

    --Supprimer les attributs d'entites qui n'existent plus
    delete vd_afw_11_atrib_entit sourc
     where     not exists
                 (select 1
                    from all_tab_columns         tc
                        ,vd_i_afw_11_entit       e
                        ,vd_i_afw_11_schem_prodt sp
                   where     tc.table_name = e.nom
                         and tc.owner = sp.code
                         and sp.indic_deplm = 'O'
                         and e.seqnc = sourc.ref_entit
                         and tc.column_name = sourc.nom
                         and sp.ref_versn = pnu_versn)
           and pnu_versn = (select ref_versn
                              from vd_i_afw_11_entit e
                             where e.seqnc = sourc.ref_entit);

    --Supprimer les entites qui n'existent plus
    delete vd_i_afw_11_entit sourc
     where     nom not in (select table_name
                             from all_tables              t
                                 ,vd_i_afw_11_schem_prodt sp
                            where     t.owner = sp.code
                                  and sp.ref_versn = pnu_versn
                                  and sp.indic_deplm = 'O')
           and ref_versn = pnu_versn;

    --Mettre a jour les entites
    merge into vd_i_afw_11_entit dest
         using (select at.table_name
                      ,sp.ref_versn
                      ,sp.seqnc
                  from all_tables              at
                      ,vd_i_afw_11_schem_prodt sp
                 where     at.owner = sp.code
                       and sp.ref_versn = pnu_versn
                       and sp.indic_deplm = 'O') sourc
            on (    sourc.table_name = dest.nom
                and sourc.ref_versn = dest.ref_versn
                and sourc.seqnc = dest.ref_schem_prodt)
    when not matched
    then
      insert     (nom
                 ,nom_table_tempr
                 ,nom_table_ereur
                 ,indic_creer_ocurn
                 ,indic_modif_ocurn
                 ,indic_suprm_ocurn
                 ,indic_nouvl_entit
                 ,ref_versn
                 ,ref_schem_prodt)
          values (sourc.table_name
                 ,replace (sourc.table_name
                          ,'_'
                          ,'$')
                 ,replace (sourc.table_name
                          ,'_'
                          ,'#')
                 ,'N'
                 ,'N'
                 ,'N'
                 ,'O'
                 ,sourc.ref_versn
                 ,sourc.seqnc);

    --Mettre a jour les attributs d'entite
    merge into vd_i_afw_11_atrib_entit dest
         using (select atc.column_name
                      ,atc.data_type
                      ,atc.table_name
                      ,sp.code schem_prodt_code
                      ,e.seqnc ref_entit
                  from all_tab_columns         atc
                      ,all_tables              at
                      ,vd_i_afw_11_schem_prodt sp
                      ,vd_i_afw_11_entit       e
                 where     atc.owner = at.owner
                       and atc.table_name = at.table_name
                       and at.owner = sp.code
                       and sp.ref_versn = pnu_versn
                       and sp.indic_deplm = 'O'
                       and sp.seqnc = e.ref_schem_prodt
                       and e.nom = atc.table_name) sourc2
            on (    sourc2.column_name = dest.nom
                and dest.ref_entit = sourc2.ref_entit)
    when not matched
    then
      insert     (dest.nom
                 ,dest.type_don
                 ,dest.compr_migrt
                 ,dest.ref_entit
                 ,dest.indic_nouvl_atrib)
          values (sourc2.column_name
                 , (decode (sourc2.data_type,  'CLOB', 'C',  'BLOB', 'B',  'DATE', 'D',  'VARCHAR2', 'V',  'NUMBER', 'N',  'V'))
                 , (case
                      when sourc2.column_name in ('SEQNC'
                                                 ,'DNR_REF_PRODT'
                                                 ,'DNR_REF_APLIC')
                      then
                        'CLE_SUBST'
                      when sourc2.column_name = 'CODE'
                      then
                        'CLE_FONCT'
                      when sourc2.column_name in ('DATE_CREAT'
                                                 ,'DATE_MODFC'
                                                 ,'UTILS_CREAT'
                                                 ,'UTILS_MODFC')
                      then
                        'NON_MIGRE'
                      else
                        'VALR_MIGRE'
                    end)
                 ,sourc2.ref_entit
                 ,'O');
  end maj_refrn_entit;

  --Obselete
  procedure metr_a_jour_refrn (pnu_versn in number)
  is
    vnu_ref_prodt   number (10);
    vva_owner       varchar2 (60);
  begin
    --Obtenir le schema du framework
    vnu_ref_prodt   := afw_11_prodt_pkg.obten_prodt ('AFW');

    vva_owner       := afw_11_prodt_pkg.obten_schem_afw;

    --Supprimer les attributs d'entites qui n'existent plus
    delete vd_afw_11_atrib_entit sourc
     where     not exists
                 (select 1
                    from all_tab_columns   tc
                        ,vd_i_afw_11_entit e
                   where     tc.table_name = e.nom
                         and tc.owner = vva_owner
                         and e.seqnc = sourc.ref_entit
                         and tc.column_name = sourc.nom)
           and pnu_versn = (select ref_versn
                              from vd_i_afw_11_entit e
                             where e.seqnc = sourc.ref_entit);

    --Supprimer les entites qui n'existent plus
    delete vd_i_afw_11_entit sourc
     where     nom not in (select table_name
                             from all_tables
                            where owner = vva_owner)
           and ref_versn = pnu_versn;

    --Mettre a jour les entites
    merge into vd_i_afw_11_entit dest
         using (select table_name
                  from all_tables at
                 where     at.owner = vva_owner
                       and at.table_name like 'AFW%') sourc
            on (    sourc.table_name = dest.nom
                and dest.ref_versn = pnu_versn)
    when not matched
    then
      insert     (nom
                 ,nom_table_tempr
                 ,nom_table_ereur
                 ,indic_creer_ocurn
                 ,indic_modif_ocurn
                 ,indic_suprm_ocurn
                 ,indic_nouvl_entit
                 ,ref_versn)
          values (sourc.table_name
                 ,   'TC$'
                  || replace (substr (sourc.table_name
                                     ,5)
                             ,'_'
                             ,'$')
                 ,   'EM$'
                  || substr (sourc.table_name
                            ,5)
                 ,'N'
                 ,'N'
                 ,'N'
                 ,'O'
                 ,pnu_versn);

    --Mettre a jour les attributs d'entite
    merge into vd_i_afw_11_atrib_entit dest
         using (select atc.column_name
                      ,atc.data_type
                      ,atc.table_name
                      , (select se.seqnc
                           from vd_i_afw_11_entit se
                          where     se.nom = atc.table_name
                                and se.ref_versn = pnu_versn)
                         as ref_entit
                  from all_tab_columns atc
                      ,all_tables      at
                 where     atc.owner = at.owner
                       and atc.table_name = at.table_name
                       and at.owner = vva_owner
                       and at.table_name like 'AFW%') sourc2
            on (    sourc2.column_name = dest.nom
                and dest.ref_entit = sourc2.ref_entit)
    /* when matched then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       update set dest.type_don = (decode (sourc2.data_type, 'DATE', 'D', 'VARCHAR2', 'V', 'NUMBER', 'N', 'V'))*/
    when not matched
    then
      insert     (dest.nom
                 ,dest.type_don
                 ,dest.compr_migrt
                 ,dest.ref_entit
                 ,dest.indic_nouvl_atrib)
          values (sourc2.column_name
                 , (decode (sourc2.data_type,  'CLOB', 'C',  'BLOB', 'B',  'DATE', 'D',  'VARCHAR2', 'V',  'NUMBER', 'N',  'V'))
                 , (case
                      when sourc2.column_name in ('SEQNC'
                                                 ,'DNR_REF_PRODT'
                                                 ,'DNR_REF_APLIC')
                      then
                        'CLE_SUBST'
                      when sourc2.column_name = 'CODE'
                      then
                        'CLE_FONCT'
                      when sourc2.column_name in ('DATE_CREAT'
                                                 ,'DATE_MODFC'
                                                 ,'UTILS_CREAT'
                                                 ,'UTILS_MODFC')
                      then
                        'NON_MIGRE'
                      else
                        'VALR_MIGRE'
                    end)
                 ,sourc2.ref_entit
                 ,'O');
  end metr_a_jour_refrn;

  function obten_type_atrib (pva_type_don   in varchar2
                            ,pva_seprt      in varchar2)
    return varchar2
  is
    vva_ligne   varchar2 (200);
  begin
    case pva_type_don
      when 'N'
      then
        vva_ligne      :=
             ' number'
          || pva_seprt;
      when 'D'
      then
        vva_ligne      :=
             ' date'
          || pva_seprt;
      when 'V'
      then
        vva_ligne      :=
             ' varchar2(4000)'
          || pva_seprt;
      when 'C'
      then
        vva_ligne      :=
             ' clob'
          || pva_seprt;
      when 'B'
      then
        vva_ligne      :=
             ' blob'
          || pva_seprt;
    end case;

    return vva_ligne;
  end obten_type_atrib;

  function obten_indic_tabl_index (pnu_seqnc_entit in number)
    return varchar2
  is
    vva_indic_tabl_index   varchar2 (1);
  begin
    select indic_expor_tabl_index
      into vva_indic_tabl_index
      from vd_i_afw_11_entit
     where seqnc = pnu_seqnc_entit;

    return vva_indic_tabl_index;
  end obten_indic_tabl_index;

  function obten_indic_suprm_don_prodt (pnu_seqnc_entit in number)
    return varchar2
  is
    vva_indic_suprm_don_prodt   varchar2 (1);
  begin
    select indic_suprm_don_prodt
      into vva_indic_suprm_don_prodt
      from vd_i_afw_11_entit
     where seqnc = pnu_seqnc_entit;

    return vva_indic_suprm_don_prodt;
  end obten_indic_suprm_don_prodt;

  function formt_chain_enonc (pva_enonc   in varchar2
                             ,pva_replc   in varchar2 default ',')
    return varchar2
  is
  begin
    return substr (pva_enonc
                  ,1
                  ,  instr (pva_enonc
                           ,pva_replc
                           ,-1)
                   - 1);
  end formt_chain_enonc;

  function formt_chain (pva_valr in varchar2)
    return varchar2
  is
  begin
    if pva_valr is null
    then
      return 'null';
    else
      return    ''''
             || replace (pva_valr
                        ,''''
                        ,'''''')
             || '''';
    end if;
  end formt_chain;

  function formt_numrq (pnu_valr in number)
    return varchar2
  is
    vva_valr   varchar2 (100) default pnu_valr;
  begin
    if pnu_valr is null
    then
      return 'null';
    else
      vva_valr      :=
        replace (vva_valr
                ,','
                ,'.');

      if vva_valr like '.%'
      then
        vva_valr      :=
             '0'
          || vva_valr;
      end if;

      return vva_valr;
    end if;
  end formt_numrq;

  function formt_date (pda_valr in date)
    return varchar2
  is
  begin
    if pda_valr is null
    then
      return 'null';
    else
      return    'to_date('''
             || to_char (pda_valr
                        ,'YYYY-MM-DD HH24:MI:SS')
             || ''', ''YYYY-MM-DD HH24:MI:SS'')';
    end if;
  end formt_date;

  procedure alimn_tabl_entit (pva_schem        in varchar2
                             ,pva_code_entit   in varchar2
                             ,pva_valr         in varchar2)
  is
  begin
    if not gta_tabl_seqnc.exists (   lower (pva_schem)
                                  || '.'
                                  || pva_code_entit)
    then
      gta_tabl_seqnc (   lower (pva_schem)
                      || '.'
                      || pva_code_entit)      :=
        pva_valr;
    end if;
  end alimn_tabl_entit;

  function obten_tabl_entit (pva_schem        in varchar2
                            ,pva_code_entit   in varchar2)
    return varchar2
  is
  begin
    return gta_tabl_seqnc (   pva_schem
                           || '.'
                           || pva_code_entit);
  exception
    when no_data_found
    then
      return 'NOT_DEFINED';
  end obten_tabl_entit;

  function formt_ref (pnu_valr    in number
                     ,pva_varbl   in varchar2)
    return varchar2
  is
    vva_valr   varchar2 (200) default pnu_valr;
  begin
    if pnu_valr is null
    then
      return 'null';
    else
      return    'afw$migrt$pkg.'
             || pva_varbl
             || '('
             || formt_numrq (pnu_valr)
             || ')';
    end if;
  end formt_ref;

  function formt_fonct (pnu_valr    in number
                       ,pva_varbl   in varchar2
                       ,pva_contx   in varchar2 default null)
    return varchar2
  is
  begin
    if pnu_valr is null
    then
      return 'null';
    else
      return    'afw$migrt$pkg.obten_'
             || pva_varbl
             || '('
             || formt_numrq (pnu_valr)
             || ', '
             || formt_chain (pva_contx)
             || ')';
    end if;
  end formt_fonct;

  function formt_detl_domn_valr (pva_code_domn    in varchar2
                                ,pva_code_valr    in varchar2
                                ,pva_code_prodt   in varchar2 default 'AFW')
    return varchar2
  is
  begin
    if    pva_code_domn is null
       or pva_code_valr is null
    then
      return 'null';
    else
      return    'afw_14_domn_valr_pkg.obten_seqnc('
             || formt_chain (pva_code_domn)
             || ','
             || formt_chain (pva_code_valr)
             || ','
             || pva_code_prodt
             || ')';
    end if;
  end formt_detl_domn_valr;

  function formt_nom_entit (vva_nom_entit in varchar2)
    return varchar2
  is
  begin
    --commence par afw_xx_ (NB le nombre pourrait prendre plus de 2 caracteres)
    return lower (vva_nom_entit);
  /*
  return lower (substr (vva_nom_entit
                       ,  instr (vva_nom_entit
                                ,'_'
                                ,5)
                        + 1
                       ,20));*/
  end formt_nom_entit;

  procedure ajout_ligne (pva_ligne   in varchar2 default null
                        ,pnu_index   in afw_07_clob_pkg.typ_index default gnu_index_genrl)
  is
  begin
    afw_07_clob_pkg.ajout_ligne (pva_ligne
                                ,pnu_index);
  exception
    when others
    then
      raise;
  end ajout_ligne;

  procedure debtr_bloc (pva_table   in varchar2
                       ,pnu_index   in afw_07_clob_pkg.typ_index default gnu_index_genrl)
  is
  begin
    afw_03_journ_pkg.ecrir_journ (   'debut bloc: '
                                  || pva_table);
    ajout_ligne ('begin'
                ,pnu_index);
    ajout_ligne ('if afw$migrt$pkg.vnu_sql_code = 0 then'
                ,pnu_index);
    ajout_ligne (   'afw_03_journ_pkg.ecrir_journ('
                 || formt_chain (pva_table)
                 || ');'
                ,pnu_index);
  end;

  procedure termn_bloc (pva_table   in varchar2
                       ,pnu_index   in afw_07_clob_pkg.typ_index default gnu_index_genrl)
  is
  begin
    afw_03_journ_pkg.ecrir_journ (   'fin bloc: '
                                  || pva_table);
    ajout_ligne ('null;'
                ,pnu_index);
    ajout_ligne ('end if;'
                ,pnu_index);
    ajout_ligne ('exception'
                ,pnu_index);
    ajout_ligne ('when others then'
                ,pnu_index);
    ajout_ligne (   'afw$migrt$pkg.defnr_ereur ('
                 || formt_chain (pva_table)
                 || ');'
                ,pnu_index);
    ajout_ligne ('end;'
                ,pnu_index);
    ajout_ligne ('/'
                ,pnu_index);
    ajout_ligne (''
                ,pnu_index);
  end;

  function obten_fonct_entit_spec (pva_nom_fonct in varchar2)
    return varchar2
  is
  begin
    return    'function obten_'
           || pva_nom_fonct
           || ' (pnu_seqnc in number, pva_contx in varchar2 default null) return number;';
  end obten_fonct_entit_spec;

  function obten_fonct_entit_body (pva_nom_fonct in varchar2)
    return varchar2
  is
    vva_fonct   varchar2 (32000);
  begin
    vva_fonct      :=
         'function obten_'
      || pva_nom_fonct
      || ' (pnu_seqnc in number, 
                                                      pva_contx in varchar2 default null) 
                    return number is
                  begin
                    return afw$migrt$pkg.'
      || pva_nom_fonct
      || '(pnu_seqnc);
                  exception
                    when others then
                      raise;
                  end obten_'
      || pva_nom_fonct
      || ';';

    return vva_fonct;
  end obten_fonct_entit_body;

  function obten_sql_entit (pnu_entit         in number
                           ,pnu_versn         in number
                           ,pva_indic_genrl   in varchar2 default 'N'
                           ,pbo_expor_page    in boolean default false)
    return varchar2
  is
    vva_enonc   varchar2 (32767);
    vnu_prodt   number (10);

    cursor cur_entit
    is
      select nom
            ,niv_inclu_migrt
            ,confg_inclu_migrt
            ,lower (ref_schem_prodt_code) schem_entit
            ,where_claus_custm
        from vd_afw_11_entit e
       where seqnc = pnu_entit;

    rec_entit   cur_entit%rowtype;

    cursor cur_atrib
    is
        select ae.nom
              ,ae.type_don
              ,ae.compr_migrt
          from vd_afw_11_atrib_entit ae
         where     ae.ref_entit = pnu_entit
               and ae.compr_migrt not in ('NON_MIGRE')
      order by ae.nom;
  begin
    open cur_entit;

    fetch cur_entit
      into rec_entit;

    close cur_entit;

    vva_enonc   := 'select ';

    for rec_atrib in cur_atrib
    loop
      vva_enonc      :=
           vva_enonc
        || rec_atrib.nom
        || ', ';
    end loop;

    vva_enonc   := formt_chain_enonc (vva_enonc);
    vva_enonc      :=
         vva_enonc
      || ' from '
      || rec_entit.schem_entit
      || '.'
      || lower (rec_entit.nom)
      || ' p';

    case rec_entit.niv_inclu_migrt
      when 'PRODT'
      then
        vva_enonc      :=
             vva_enonc
          || ' where dnr_ref_prodt = '
          || gnu_prodt;
      when 'APLIC'
      then
        vva_enonc      :=
             vva_enonc
          || ' where dnr_ref_aplic = '
          || gnu_aplic;
      when 'DOMN'
      then
        vva_enonc      :=
             vva_enonc
          || ' where dnr_ref_domn = '
          || gnu_domn;
      when 'CONTX'
      then
        if gva_contx_courn = 'PRODT'
        then
          vva_enonc      :=
               vva_enonc
            || ' where dnr_ref_prodt = '
            || gnu_prodt;
        elsif gva_contx_courn = 'APLIC'
        then
          vva_enonc      :=
               vva_enonc
            || ' where dnr_ref_aplic = '
            || gnu_aplic;
        elsif gva_contx_courn = 'DOMN'
        then
          vva_enonc      :=
               vva_enonc
            || ' where dnr_ref_domn = '
            || gnu_domn;
        end if;
      when 'PERSN'
      then
        if rec_entit.where_claus_custm is not null
        then
          vva_enonc      :=
               vva_enonc
            || ' where '
            || trim (rec_entit.where_claus_custm);
        end if;
      else
        null;
    end case;

    return vva_enonc;
  end obten_sql_entit;

  function obten_ligne_atrib (pva_atrib           in varchar2
                             ,pva_mode            in varchar2
                             ,pva_alias_table_1   in varchar2 default null
                             ,pva_alias_table_2   in varchar2 default null
                             ,pva_seprt           in varchar2 default null
                             ,pva_conjc           in varchar2 default null)
    return varchar2
  is
    vva_ligne_atrib   varchar2 (32767) default null;
  begin
    case pva_mode
      when 'INSER'
      then
        if pva_alias_table_1 is not null
        then
          vva_ligne_atrib      :=
               pva_alias_table_1
            || '.';
        end if;

        vva_ligne_atrib      :=
             vva_ligne_atrib
          || pva_atrib
          || ', ';
      when 'UPDAT'
      then
        if pva_alias_table_1 is not null
        then
          vva_ligne_atrib      :=
               pva_alias_table_1
            || '.';
        end if;

        vva_ligne_atrib      :=
             vva_ligne_atrib
          || pva_atrib
          || ' = ';

        if pva_alias_table_2 is not null
        then
          vva_ligne_atrib      :=
               vva_ligne_atrib
            || pva_alias_table_2
            || '.';
        end if;

        vva_ligne_atrib      :=
             vva_ligne_atrib
          || pva_atrib
          || ', ';
      when 'MERGE'
      then
        vva_ligne_atrib   := '(';

        if pva_alias_table_1 is not null
        then
          vva_ligne_atrib      :=
               vva_ligne_atrib
            || pva_alias_table_1
            || '.';
        end if;

        vva_ligne_atrib      :=
             vva_ligne_atrib
          || pva_atrib
          || ' = ';

        if pva_alias_table_2 is not null
        then
          vva_ligne_atrib      :=
               vva_ligne_atrib
            || pva_alias_table_2
            || '.';
        end if;

        vva_ligne_atrib      :=
             vva_ligne_atrib
          || pva_atrib;

        if pva_atrib like 'ref_%'
        then
          vva_ligne_atrib      :=
               vva_ligne_atrib
            || ' or ('
            || pva_alias_table_1
            || '.'
            || pva_atrib
            || ' is null and '
            || pva_alias_table_2
            || '.'
            || pva_atrib
            || ' is null'
            || ') or '
            || pva_alias_table_2
            || '.'
            || pva_atrib
            || ' is null ';
        end if;

        vva_ligne_atrib      :=
             vva_ligne_atrib
          || ') and ';
      when 'CUSTM'
      then
        if pva_alias_table_1 is not null
        then
          vva_ligne_atrib      :=
               pva_alias_table_1
            || '.';
        end if;

        vva_ligne_atrib      :=
             vva_ligne_atrib
          || pva_atrib
          || ' '
          || pva_seprt
          || ' ';

        if pva_alias_table_2 is not null
        then
          vva_ligne_atrib      :=
               vva_ligne_atrib
            || pva_alias_table_2
            || '.';
        end if;

        vva_ligne_atrib      :=
             vva_ligne_atrib
          || pva_atrib
          || case
               when pva_conjc is not null
               then
                    ' '
                 || pva_conjc
                 || ' '
               else
                 null
             end;
      else
        null;
    end case;

    return vva_ligne_atrib;
  end obten_ligne_atrib;

  function obten_ligne_atrib_entit (pnu_entit           in number
                                   ,pva_mode            in varchar2 default 'INSER'
                                   ,pva_compr           in varchar2 default '''VALR_MIGRE'''
                                   ,pva_alias_table_1   in varchar2 default null
                                   ,pva_alias_table_2   in varchar2 default null
                                   ,pva_replc           in varchar2 default ','
                                   ,pva_seprt           in varchar2 default null)
    return varchar2
  is
    cur_atrib               sys_refcursor;
    vnu_seqnc_atrib         number (10);
    vva_nom_atrib           varchar2 (30);
    vva_enonc_sql           varchar2 (500);
    vva_ligne_atrib_entit   varchar2 (32767);
  begin
    vva_enonc_sql      :=
         'select seqnc, lower(nom) nom from vd_i_afw_11_atrib_entit where nom != ''SEQNC'' and ref_entit = :1 and compr_migrt in ('
      || pva_compr
      || ') order by nom';

    open cur_atrib for vva_enonc_sql using pnu_entit;

    loop
      fetch cur_atrib
        into vnu_seqnc_atrib
            ,vva_nom_atrib;

      exit when cur_atrib%notfound;

      vva_ligne_atrib_entit      :=
           vva_ligne_atrib_entit
        || obten_ligne_atrib (vva_nom_atrib
                             ,pva_mode
                             ,pva_alias_table_1
                             ,pva_alias_table_2
                             ,pva_seprt
                             ,pva_replc);
    end loop;

    if     obten_indic_tabl_index (pnu_entit) = 'N'
       and pva_mode = 'MERGE'
    then
      vva_ligne_atrib_entit      :=
        obten_ligne_atrib ('seqnc'
                          ,pva_mode
                          ,pva_alias_table_1
                          ,pva_alias_table_2
                          ,pva_seprt
                          ,pva_replc);
    elsif     obten_indic_tabl_index (pnu_entit) = 'N'
          and pva_mode = 'INSER'
    then
      vva_ligne_atrib_entit      :=
           vva_ligne_atrib_entit
        || obten_ligne_atrib ('seqnc'
                             ,pva_mode
                             ,pva_alias_table_1
                             ,pva_alias_table_2
                             ,pva_seprt
                             ,pva_replc);
    end if;

    return formt_chain_enonc (vva_ligne_atrib_entit
                             ,pva_replc);
  exception
    when others
    then
      raise;
  end obten_ligne_atrib_entit;

  procedure ajout_ligne_comnt (pva_ligne   in varchar2
                              ,pnu_index   in afw_07_clob_pkg.typ_index default gnu_index_genrl)
  is
    vva_comnt   varchar2 (10) := '--';
  begin
    ajout_ligne (   vva_comnt
                 || pva_ligne
                ,pnu_index);
  end ajout_ligne_comnt;

  procedure ajout_clob_fichr_compr (pnu_index       in afw_07_clob_pkg.typ_index
                                   ,pva_nom_fichr   in varchar2)
  is
    vlb             blob;
    vnu_off_sourc   pls_integer default 1;
    vnu_off_dest    pls_integer default 1;
    vnu_lang        pls_integer default 0;
    vnu_warng       pls_integer;
    vnu_chars_id    pls_integer default 873;
  begin
    dbms_lob.createtemporary (vlb
                             ,true);
    dbms_lob.converttoblob (vlb
                           ,afw_07_clob_pkg.obten (pnu_index)
                           ,dbms_lob.lobmaxsize
                           ,vnu_off_dest
                           ,vnu_off_sourc
                           ,vnu_chars_id
                           ,vnu_lang
                           ,vnu_warng);

    afw_07_util_compr_zip_pkg.ajout_fichr (gbl_zip
                                          ,pva_nom_fichr
                                          ,vlb);
  end ajout_clob_fichr_compr;

  procedure termn_fichr_compr
  is
  begin
    afw_07_util_compr_zip_pkg.clotr_fichr (gbl_zip
                                          ,'Export metadonnees SAF');
  end termn_fichr_compr;

  procedure genr_fichr_migrt_meta
  is
    cursor cur_aplic
    is
        select ea.ref_aplic_code
              ,nvl (ea.numr_aplic_cible, ea.numr_aplic_courn) as numr_aplic_cible
          from vd_afw_13_expor_aplic ea
         where ea.ref_sesn = afw_12_sesn_pkg.obten_sesn ()
      order by ea.ref_aplic_aplic_authe nulls first;

    cursor cur_domn
    is
        select    d.seqnc
               || '_'
               || lower (d.code)
                 domn
          from vd_afw_12_domn                                     d
              ,table (afw_07_util_pkg.strin_to_table_nu (gva_domn)) d2
         where d.seqnc = d2.column_value
      order by d.code;

    --TODO voir si besoin ordre exécution inter-schéma
    cursor cur_schem
    is
        select sp.code
              ,sp.seqnc schem
          from vd_afw_11_schem_prodt sp
         where     sp.indic_deplm = 'O'
               and sp.ref_versn = gnu_versn
      --and 1 = 2
      order by sp.code;

    vnu_index_fichr_globl   afw_07_clob_pkg.typ_index;
  begin
    vnu_index_fichr_globl   := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne (   'spool '
                 || kva_nom_fichr_log_meta
                 || ';'
                ,vnu_index_fichr_globl);

    ajout_ligne (   '@'
                 || kva_nom_fichr_insta_pre_aplic
                 || ';'
                ,vnu_index_fichr_globl);

    for rec_aplic in cur_aplic
    loop
      ajout_ligne (   '@f'
                   || rec_aplic.numr_aplic_cible
                   || '_meta.sql;'
                  ,vnu_index_fichr_globl);
    end loop;

    --Portion domaine
    for rec_domn in cur_domn
    loop
      ajout_ligne (   '@d'
                   || rec_domn.domn
                   || '_meta.sql;'
                  ,vnu_index_fichr_globl);
    end loop;


    --Portion custom SI on ne fait pas partie du produit AFW  (Flag en enlever si jamais APEXFRAMEWORK gère plusieurs schéma)
    if gnu_versn != gnu_versn_afw
    then
      for rec_schem in cur_schem
      loop
        ajout_ligne (   '@s'
                     || rec_schem.schem
                     || '_meta.sql;'
                    ,vnu_index_fichr_globl);
      end loop;
    end if;

    ajout_ligne (   '@'
                 || kva_nom_fichr_insta_post_aplic
                 || ';'
                ,vnu_index_fichr_globl);

    ajout_ligne ('spool off;'
                ,vnu_index_fichr_globl);

    ajout_clob_fichr_compr (vnu_index_fichr_globl
                           ,kva_nom_fichr_insta_meta);
  end genr_fichr_migrt_meta;

  procedure genr_fichr_migrt_app
  is
    vnu_index_fichr_globl    afw_07_clob_pkg.typ_index;
    vnu_id_fichr             number;
    vbl_aplic_apex           blob;
    vva_nom_fichr            varchar2 (400);

    vcl_aplic_apex           clob;
    vnu_blob_csid            number := afw_07_util_pkg.obten_ident_jeu_carct ('AL32UTF8');

    cursor cur_aplic
    is
        select ea.numr_aplic_courn
              ,aa.security_group_id
          from apex_aplic          aa
              ,vd_afw_13_expor_aplic ea
         where     aa.id = ea.numr_aplic_courn
               and ea.ref_sesn = afw_12_sesn_pkg.obten_sesn ()
               and ea.indic_ajout_aplic_apex = 'O'
      order by numr_aplic_courn;

    vnu_afw_secrt_group_id   apex_aplic.security_group_id%type := afw_11_aplic_pkg.obten_secrt_group_id (afw_11_aplic_pkg.obten_aplic ('SAFP'));
  begin
    vnu_index_fichr_globl   := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne (   'spool '
                 || kva_nom_fichr_log_aplic
                 || ';'
                ,vnu_index_fichr_globl);

    for rec_aplic in cur_aplic
    loop
      --Security Group ID de l'application APEX migrée
      apex_secrt.g_security_group_id   := rec_aplic.security_group_id;
      apex_api.set_security_group_id (rec_aplic.security_group_id);

      --Caller export apex
      -- p_debugging_override........Set the application debugging status to this value (1 = Yes, 0 = No)
      apex_flow_gen_api2.export (rec_aplic.numr_aplic_courn
                                ,p_format                     => 'DB'
                                ,p_export_comments            => 'Y'
                                ,p_export_ir_public_reports   => 'Y'
                                ,p_debugging_override         => 0);

      --Security Group ID de AFW
      apex_secrt.g_security_group_id   := vnu_afw_secrt_group_id;
      apex_api.set_security_group_id (vnu_afw_secrt_group_id);

      --Obtenir id fichier généré + contenu
      vnu_id_fichr                     := wwv_flow_id.curr_val;

      select blob_content
            ,title
        into vbl_aplic_apex
            ,vva_nom_fichr
        from apex_fichr
       where id = vnu_id_fichr;

      vcl_aplic_apex                   :=
        afw_07_clob_pkg.convr_blob_vers_clob (pbl_blob    => vbl_aplic_apex
                                             ,pva_chars   => dbms_lob.default_csid);

      vbl_aplic_apex                   :=
        afw_07_clob_pkg.convr_clob_vers_blob (pcl_clob    => vcl_aplic_apex
                                             ,pva_chars   => vnu_blob_csid);

      --Ajouter fichier dans zip + ajout call dans install_app.sql
      afw_07_util_compr_zip_pkg.ajout_fichr (gbl_zip
                                            ,vva_nom_fichr
                                            ,vbl_aplic_apex);

      ajout_ligne (   '@'
                   || vva_nom_fichr
                   || ';'
                  ,vnu_index_fichr_globl);

      --Supprimer fichier dans table apex
      delete from apex_fichr
            where id = vnu_id_fichr;
    end loop;

    ajout_ligne ('spool off;'
                ,vnu_index_fichr_globl);

    ajout_clob_fichr_compr (vnu_index_fichr_globl
                           ,kva_nom_fichr_insta_aplic);
  end genr_fichr_migrt_app;

  procedure genr_fichr_migrt_globl
  is
    vnu_index_fichr_globl   afw_07_clob_pkg.typ_index;
  begin
    vnu_index_fichr_globl   := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne (   '@'
                 || kva_nom_fichr_insta_aplic
                 || ';'
                ,vnu_index_fichr_globl);
    ajout_ligne (   '@'
                 || kva_nom_fichr_insta_meta
                 || ';'
                ,vnu_index_fichr_globl);

    ajout_clob_fichr_compr (vnu_index_fichr_globl
                           ,kva_nom_fichr_insta);
  end genr_fichr_migrt_globl;

  procedure valdt_entit (pva_nom               in varchar2
                        ,pva_nom_table_tempr   in varchar2
                        ,pva_nom_table_ereur   in varchar2)
  is
  begin
    if    pva_nom = pva_nom_table_tempr
       or pva_nom = pva_nom_table_ereur
       or pva_nom_table_tempr = pva_nom_table_ereur
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SAF.000045'
                                              ,upper (pva_nom)
                                              ,pva_code_prodt   => 'AFW');
    end if;
  end valdt_entit;

  /*
    Cette fonction s'occupe de créer le package de migration (afw$migrt$pkg)
    ainsi que d'initialiser les variables nécessaires à la migration
  */
  procedure genr_fichr_migrt_initl
  is
    cursor cur_entit
    is
        select seqnc
              ,lower (nom)                nom
              ,lower (nom_table_tempr)    nom_table_tempr
              ,lower (nom_table_ereur)    nom_table_ereur
              ,indic_creer_ocurn
              ,indic_modif_ocurn
              ,indic_suprm_ocurn
              ,indic_force_selct
              ,ref_versn
              ,longr_bloc
              ,indic_expor_tabl_index
              ,indic_suprm_don_prodt
              ,where_claus_custm
              ,indic_deplm_inter_prodt
              ,lower (ref_schem_prodt_code) schem
          from vd_afw_11_entit e
         where     ref_versn = gnu_versn_afw
               and niv_inclu_migrt is not null
      /*and (   afw_11_prodt_pkg.obten_code_prodt (gnu_prodt) = 'AFW'
           or     afw_11_prodt_pkg.obten_code_prodt (gnu_prodt) != 'AFW'
              and e.nom not in ('AFW_11_ENTIT'
                               ,'AFW_11_ATRIB_ENTIT'
                               ,'AFW_11_PLUGN'))*/
      order by ordre_exect;

    cursor cur_entit_custm
    is
        select e.seqnc
              ,lower (e.nom)              nom
              ,lower (nom_table_tempr)    nom_table_tempr
              ,lower (nom_table_ereur)    nom_table_ereur
              ,indic_creer_ocurn
              ,indic_modif_ocurn
              ,indic_suprm_ocurn
              ,indic_force_selct
              ,e.ref_versn
              ,longr_bloc
              ,indic_expor_tabl_index
              ,indic_suprm_don_prodt
              ,where_claus_custm
              ,indic_deplm_inter_prodt
              ,lower (ref_schem_prodt_code) schem
          from vd_afw_11_entit     e
              ,vd_afw_11_schem_prodt sp
         where     e.ref_schem_prodt = sp.seqnc
               and sp.ref_versn = gnu_versn
               and sp.ref_versn != gnu_versn_afw
               and sp.indic_deplm = 'O'
               and niv_inclu_migrt = 'PERSN'
      --and 1 = 2
      order by e.ordre_exect;

    cursor cur_atrib_entit (pnu_entit in number)
    is
        select seqnc
              ,lower (nom) nom
              ,type_don
              ,compr_migrt
          from vd_i_afw_11_atrib_entit
         where     ref_entit = pnu_entit
               and compr_migrt not in ('NON_MIGRE')
      order by nom;

    cursor cur_aplic_authe
    is
      select a.seqnc
            ,a.code
        from vd_afw_11_aplic a
       where     a.ref_aplic_authe is null
             and a.ref_prodt = gnu_prodt;

    cur_sys                    sys_refcursor;
    vva_enonc_sql              varchar2 (32767);
    vnu_versn_prodt            number (10);
    vva_ligne                  varchar2 (32767);
    vva_ligne_creat_table      varchar2 (32767);
    vnu_index_table_tempr      afw_07_clob_pkg.typ_index;
    vnu_index_arr              afw_07_clob_pkg.typ_index;
    vnu_index_fonct_spec       afw_07_clob_pkg.typ_index;
    vnu_index_fonct_body       afw_07_clob_pkg.typ_index;
    vnu_index_suprm_table      afw_07_clob_pkg.typ_index;
    vnu_index_alimn_clob       afw_07_clob_pkg.typ_index;
    versn_non_trouv            exception;
    vvc_note_scrip_pre_migrt   apex_application_global.vc_arr2;
  begin
    if gnu_versn_afw is null
    then
      raise versn_non_trouv;
    end if;

    vnu_index_table_tempr   := afw_07_clob_pkg.creer_nouv ();
    vnu_index_arr           := afw_07_clob_pkg.creer_nouv ();
    vnu_index_fonct_spec    := afw_07_clob_pkg.creer_nouv ();
    vnu_index_fonct_body    := afw_07_clob_pkg.creer_nouv ();
    vnu_index_suprm_table   := afw_07_clob_pkg.creer_nouv ();

    --Tableaux de séquences
    ajout_ligne ('  var_prodt_authe typ_arr_seqnc;'
                ,vnu_index_arr);

    for rec_entit in cur_entit
    loop
      valdt_entit (rec_entit.nom
                  ,rec_entit.nom_table_tempr
                  ,rec_entit.nom_table_ereur);

      --Définir tableaux de varray (mapping nom)
      alimn_tabl_entit (rec_entit.schem
                       ,rec_entit.nom
                       ,   'var_'
                        || formt_nom_entit (rec_entit.seqnc));

      --Tableaux de séquences
      ajout_ligne (   obten_tabl_entit (rec_entit.schem
                                       ,rec_entit.nom)
                   || ' typ_arr_seqnc;'
                  ,vnu_index_arr);

      --générer fonction entité spec
      ajout_ligne (   '  '
                   || obten_fonct_entit_spec (obten_tabl_entit (rec_entit.schem
                                                               ,rec_entit.nom))
                  ,vnu_index_fonct_spec);

      --générer fonction entité body
      ajout_ligne (   '  '
                   || obten_fonct_entit_body (obten_tabl_entit (rec_entit.schem
                                                               ,rec_entit.nom))
                  ,vnu_index_fonct_body);

      --générer tables erreurs
      ajout_ligne ('begin'
                  ,vnu_index_table_tempr);
      ajout_ligne (   'dbms_errlog.create_error_log('
                   || formt_chain (upper (rec_entit.nom))
                   || ', '
                   || formt_chain (upper (rec_entit.nom_table_ereur))
                   || ', '
                   --                   || formt_chain (upper (gva_schem))
                   || 'afw$migrt$pkg.vva_schem_afw'
                   || ', null, true);'
                  ,vnu_index_table_tempr);
      ajout_ligne (   '  exception
                        when others then
                          ete('''
                   || rec_entit.nom_table_ereur
                   || ''',sqlerrm);
                      end;'
                  ,vnu_index_table_tempr);

      ajout_ligne (null
                  ,vnu_index_table_tempr);

      ajout_ligne (   'execute immediate ''delete from '
                   || rec_entit.nom_table_ereur
                   || ''';'
                  ,vnu_index_table_tempr);

      ajout_ligne (null
                  ,vnu_index_table_tempr);

      --générer tables temporaires
      ajout_ligne ('  begin'
                  ,vnu_index_table_tempr);
      ajout_ligne (   '   execute immediate ''create table '
                   || rec_entit.nom_table_tempr
                  ,vnu_index_table_tempr);

      vva_ligne_creat_table   := '    (';

      for rec_atrib_entit in cur_atrib_entit (rec_entit.seqnc)
      loop
        vva_ligne_creat_table      :=
             vva_ligne_creat_table
          || gva_fin_ligne
          || '      '
          || rec_atrib_entit.nom
          || obten_type_atrib (rec_atrib_entit.type_don
                              ,',');
      end loop;

      vva_ligne_creat_table   := formt_chain_enonc (vva_ligne_creat_table);
      ajout_ligne (   vva_ligne_creat_table
                   || gva_fin_ligne
                   || '    )'';'
                  ,vnu_index_table_tempr);
      ajout_ligne (   '  exception
                        when others then
                          ete('''
                   || rec_entit.nom_table_tempr
                   || ''',sqlerrm);
                      end;'
                  ,vnu_index_table_tempr);
      ajout_ligne (null
                  ,vnu_index_table_tempr);

      --supprimer tables temporaires
      ajout_ligne ('  begin'
                  ,vnu_index_suprm_table);
      ajout_ligne (   '    execute immediate ''drop table '
                   || rec_entit.nom_table_tempr
                   || ''';'
                  ,vnu_index_suprm_table);
      ajout_ligne (   '  exception
                        when others then
                          ete('''
                   || rec_entit.nom_table_tempr
                   || ''',sqlerrm);
                      end;'
                  ,vnu_index_suprm_table);
      ajout_ligne (null
                  ,vnu_index_suprm_table);

      --supprimer les tables d'erreurs qui sont vides
      ajout_ligne ('declare'
                  ,vnu_index_suprm_table);
      ajout_ligne ('  vnu_count pls_integer;'
                  ,vnu_index_suprm_table);
      ajout_ligne ('begin'
                  ,vnu_index_suprm_table);
      ajout_ligne (   'execute immediate  ''select count(1) from '
                   || rec_entit.nom_table_ereur
                   || ''' into vnu_count;'
                  ,vnu_index_suprm_table);
      ajout_ligne (null
                  ,vnu_index_suprm_table);
      ajout_ligne ('  if vnu_count = 0 then'
                  ,vnu_index_suprm_table);
      ajout_ligne (   '    execute immediate ''drop table '
                   || rec_entit.nom_table_ereur
                   || ''';'
                  ,vnu_index_suprm_table);
      ajout_ligne ('  end if;'
                  ,vnu_index_suprm_table);
      ajout_ligne ('exception'
                  ,vnu_index_suprm_table);
      ajout_ligne (   '  when others then
                          ete('''
                   || rec_entit.nom_table_ereur
                   || ''',sqlerrm);
                      end;'
                  ,vnu_index_suprm_table);
      ajout_ligne (null
                  ,vnu_index_suprm_table);
    end loop;

    for rec_entit in cur_entit_custm
    loop
      valdt_entit (rec_entit.nom
                  ,rec_entit.nom_table_tempr
                  ,rec_entit.nom_table_ereur);

      --Définir tableaux de varray (mapping nom)
      alimn_tabl_entit (rec_entit.schem
                       ,rec_entit.nom
                       ,   'var_'
                        || formt_nom_entit (rec_entit.seqnc));

      --Tableaux de séquences
      ajout_ligne (   obten_tabl_entit (rec_entit.schem
                                       ,rec_entit.nom)
                   || ' typ_arr_seqnc;'
                  ,vnu_index_arr);

      --générer fonction entité spec
      ajout_ligne (   '  '
                   || obten_fonct_entit_spec (obten_tabl_entit (rec_entit.schem
                                                               ,rec_entit.nom))
                  ,vnu_index_fonct_spec);

      --générer fonction entité body
      ajout_ligne (   '  '
                   || obten_fonct_entit_body (obten_tabl_entit (rec_entit.schem
                                                               ,rec_entit.nom))
                  ,vnu_index_fonct_body);

      --générer tables erreurs
      ajout_ligne ('begin'
                  ,vnu_index_table_tempr);
      ajout_ligne (   'dbms_errlog.create_error_log('
                   || formt_chain (   upper (rec_entit.schem)
                                   || '.'
                                   || upper (rec_entit.nom))
                   || ', '
                   || formt_chain (upper (rec_entit.nom_table_ereur))
                   || ', '
                   || formt_chain (upper (rec_entit.schem))
                   || ', null, true);'
                  ,vnu_index_table_tempr);
      ajout_ligne (   '  exception
                        when others then
                          ete('''
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_ereur
                   || ''',sqlerrm);
                      end;'
                  ,vnu_index_table_tempr);

      ajout_ligne (null
                  ,vnu_index_table_tempr);

      ajout_ligne (   'execute immediate ''delete from '
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_ereur
                   || ''';'
                  ,vnu_index_table_tempr);

      ajout_ligne (null
                  ,vnu_index_table_tempr);

      --générer tables temporaires
      ajout_ligne ('  begin'
                  ,vnu_index_table_tempr);
      ajout_ligne (   '   execute immediate ''create table '
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_tempr
                  ,vnu_index_table_tempr);

      vva_ligne_creat_table   := '    (';

      for rec_atrib_entit in cur_atrib_entit (rec_entit.seqnc)
      loop
        vva_ligne_creat_table      :=
             vva_ligne_creat_table
          || gva_fin_ligne
          || '      '
          || rec_atrib_entit.nom
          || obten_type_atrib (rec_atrib_entit.type_don
                              ,',');
      end loop;

      vva_ligne_creat_table   := formt_chain_enonc (vva_ligne_creat_table);
      ajout_ligne (   vva_ligne_creat_table
                   || gva_fin_ligne
                   || '    )'';'
                  ,vnu_index_table_tempr);
      ajout_ligne (   '  exception
                        when others then
                          ete('''
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_tempr
                   || ''',sqlerrm);
                      end;'
                  ,vnu_index_table_tempr);
      ajout_ligne (null
                  ,vnu_index_table_tempr);

      --supprimer tables temporaires
      ajout_ligne ('  begin'
                  ,vnu_index_suprm_table);
      ajout_ligne (   '    execute immediate ''drop table '
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_tempr
                   || ''';'
                  ,vnu_index_suprm_table);
      ajout_ligne (   '  exception
                        when others then
                          ete('''
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_tempr
                   || ''',sqlerrm);
                      end;'
                  ,vnu_index_suprm_table);
      ajout_ligne (null
                  ,vnu_index_suprm_table);

      --supprimer les tables d'erreurs qui sont vides
      ajout_ligne ('declare'
                  ,vnu_index_suprm_table);
      ajout_ligne ('  vnu_count pls_integer;'
                  ,vnu_index_suprm_table);
      ajout_ligne ('begin'
                  ,vnu_index_suprm_table);
      ajout_ligne (   'execute immediate  ''select count(1) from '
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_ereur
                   || ''' into vnu_count;'
                  ,vnu_index_suprm_table);
      ajout_ligne (null
                  ,vnu_index_suprm_table);
      ajout_ligne ('  if vnu_count = 0 then'
                  ,vnu_index_suprm_table);
      ajout_ligne (   '    execute immediate ''drop table '
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_ereur
                   || ''';'
                  ,vnu_index_suprm_table);
      ajout_ligne ('  end if;'
                  ,vnu_index_suprm_table);
      ajout_ligne ('exception'
                  ,vnu_index_suprm_table);
      ajout_ligne (   '  when others then
                          ete('''
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_ereur
                   || ''',sqlerrm);
                      end;'
                  ,vnu_index_suprm_table);
      ajout_ligne (null
                  ,vnu_index_suprm_table);
    end loop;

    --Définir entête
    gnu_index_genrl         := afw_07_clob_pkg.creer_nouv ();
    ajout_ligne ('set define off');
    ajout_ligne ('set serveroutput on');
    ajout_ligne ('set feedback off');
    ajout_ligne ();
    --    ajout_ligne (   'alter session set current_schema = '
    --                 || gva_schem
    --                 || ';');

    ajout_ligne ();

    ajout_ligne ('prompt ================================================================================');

    ajout_ligne ('prompt ..._....___..___.__..__.___..___...._....__..__..___.__......__.___...___.._..__');
    ajout_ligne ('prompt ../_\..| _ \| __|\ \/ /| __|| _ \../_\..|  \/  || __|\ \    / // _ \.| _ \| |/ /');
    ajout_ligne ('prompt ./ _ \.|  _/| _|..>  <.| _|.|   /./ _ \.| |\/| || _|..\ \/\/ /| (_) ||   /|   <.');
    ajout_ligne ('prompt /_/.\_\|_|..|___|/_/\_\|_|..|_|_\/_/.\_\|_|..|_||___|..\_/\_/..\___/.|_|_\|_|\_\');

    ajout_ligne ('prompt ================================================================================');
    ajout_ligne (   'prompt AFW '
                 || afw_11_prodt_pkg.obten_numr_versn_prodt_afw);
    ajout_ligne ('prompt ================================================================================');

    if afw_11_prodt_pkg.obten_note_scrip_pre_migrt (gnu_prodt) is not null
    then
      --note script pre-migration
      vvc_note_scrip_pre_migrt      :=
        afw_07_util_pkg.string_to_table (afw_11_prodt_pkg.obten_note_scrip_pre_migrt (gnu_prodt)
                                        ,   chr (13)
                                         || chr (10));
    end if;

    if vvc_note_scrip_pre_migrt.count > 0
    then
      for i in vvc_note_scrip_pre_migrt.first .. vvc_note_scrip_pre_migrt.last
      loop
        ajout_ligne (   'prompt '
                     || vvc_note_scrip_pre_migrt (i));
      end loop;

      ajout_ligne ('prompt ================================================================================');
    end if;

    ajout_ligne (   'prompt Installation du produit: '
                 || afw_11_prodt_pkg.obten_code_prodt (gnu_prodt)
                 || ' - '
                 || convert (afw_11_prodt_pkg.obten_nom (gnu_prodt)
                            ,'US7ASCII')
                 || ' '
                 || afw_11_prodt_pkg.obten_numr_versn_prodt (gnu_prodt));
    ajout_ligne (   'prompt Date generation: '
                 || to_char (sysdate
                            ,'YYYY-MM-DD HH24:MI:SS'));
    ajout_ligne ('prompt ================================================================================');

    ajout_ligne ('prompt Pre-applications');

    ajout_ligne ();
    ajout_ligne_comnt ('Fichier installation');
    ajout_ligne_comnt (   'Code produit: '
                       || afw_11_prodt_pkg.obten_code_prodt (gnu_prodt));
    ajout_ligne_comnt (   'Date de creation: '
                       || to_char (sysdate
                                  ,'yyyy-mm-dd hh24:mi:ss'));

    --Création du package de migration
    ajout_ligne ('create or replace package afw$migrt$pkg as');
    ajout_ligne ('  vnu_sql_code                number default 0;');
    ajout_ligne ('  vva_sql_errm                varchar2(4000);');
    ajout_ligne ('  vva_back_trace              varchar2(32500);');
    ajout_ligne ('  vva_nom_bloc_err            varchar2(100);');
    ajout_ligne ();
    ajout_ligne ('  vnu_seqnc_prodt             number;');
    ajout_ligne ('  vnu_seqnc_prodt_temp             number;');
    ajout_ligne ('  vnu_seqnc_aplic             number;');
    ajout_ligne ('  vva_code_prodt              varchar2(23);');
    ajout_ligne ('  vva_code_prodt_afw              varchar2(23);');
    ajout_ligne ();
    ajout_ligne (   '  vva_schem_afw               varchar2(30) default '
                 || formt_chain (upper (gva_schem))
                 || ';');

    ajout_ligne ();
    ajout_ligne ('  type typ_arr_seqnc is table of number(10) index by pls_integer;');
    ajout_ligne ('  type typ_arr_clob is table of clob index by varchar2(75);');
    ajout_ligne ('  type typ_arr_blob is table of blob index by varchar2(75);');
    ajout_ligne ();
    ajout_ligne_comnt ('Tableaux de CLOBs / BLOBs');
    ajout_ligne ();
    ajout_ligne ('  gar_clob typ_arr_clob;');
    ajout_ligne ('  gar_blob typ_arr_blob;');
    ajout_ligne ();
    ajout_ligne_comnt ('Tableaux de sequences');

    afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                               ,vnu_index_arr);
    afw_07_clob_pkg.termn (vnu_index_arr);

    ajout_ligne_comnt ('Fonctions de garde, spec');

    afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                               ,vnu_index_fonct_spec);
    afw_07_clob_pkg.termn (vnu_index_fonct_spec);

    ajout_ligne ();
    ajout_ligne ('  procedure ecrir_clob (pva_id in varchar2, pva_texte in varchar2);');
    ajout_ligne ();
    ajout_ligne ('  procedure init_clob (pva_id in varchar2);');
    ajout_ligne ();
    ajout_ligne ('  procedure termn_clob (pva_id in varchar2);');
    ajout_ligne ();
    ajout_ligne ('  procedure ecrir_blob (pva_id in varchar2, pva_texte in varchar2);');
    ajout_ligne ();
    ajout_ligne ('  procedure defnr_ereur (pva_nom in varchar2);');
    ajout_ligne ();
    ajout_ligne ('  procedure creer_table_tempr;');
    ajout_ligne ();
    ajout_ligne ('  procedure suprm_table_tempr;');
    ajout_ligne ('end afw$migrt$pkg;');
    ajout_ligne ('/');
    ajout_ligne ();

    ajout_ligne ('create or replace package body afw$migrt$pkg as');
    ajout_ligne ('  procedure defnr_ereur (pva_nom in varchar2) is');
    ajout_ligne ('  begin');
    ajout_ligne ('    vnu_sql_code := sqlcode;');
    ajout_ligne ('    vva_sql_errm := sqlerrm;');
    ajout_ligne ('    vva_back_trace := dbms_utility.format_error_backtrace();');
    ajout_ligne ('    vva_nom_bloc_err := pva_nom;');
    ajout_ligne ('  end defnr_ereur;');
    ajout_ligne ();

    ajout_ligne_comnt ('Fonctions de garde, body');
    afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                               ,vnu_index_fonct_body);
    afw_07_clob_pkg.termn (vnu_index_fonct_body);
    ajout_ligne ();

    ajout_ligne ('  procedure ecrir_clob (pva_id in varchar2, pva_texte in varchar2) is');
    ajout_ligne ('  begin');
    ajout_ligne ('    sys.dbms_lob.append(gar_clob(pva_id), pva_texte);');
    ajout_ligne ('    null;');
    ajout_ligne ('  exception');
    ajout_ligne ('    when others then');
    ajout_ligne ('      ete(''ERROR::ECRIR_CLOB'', pva_id);');
    ajout_ligne ('      ete();');
    ajout_ligne ('      raise;');
    ajout_ligne ('  end ecrir_clob;');
    ajout_ligne ();

    ajout_ligne ('  procedure init_clob (pva_id in varchar2) is');
    ajout_ligne ('    vcl_clob clob;');
    ajout_ligne ('  begin');
    ajout_ligne ('    gar_clob(pva_id) := vcl_clob;');
    ajout_ligne ('    sys.dbms_lob.createtemporary (gar_clob(pva_id) ,true);');
    ajout_ligne ('    null;');
    ajout_ligne ('  exception');
    ajout_ligne ('    when others then');
    ajout_ligne ('      ete(''ERROR::INIT_CLOB'', pva_id);');
    ajout_ligne ('      ete();');
    ajout_ligne ('      raise;');
    ajout_ligne ('  end init_clob;');
    ajout_ligne ();

    ajout_ligne ('  procedure termn_clob (pva_id in varchar2) is');
    ajout_ligne ('  begin');
    ajout_ligne ('    sys.dbms_lob.freetemporary (gar_clob(pva_id));');
    ajout_ligne ('    null;');
    ajout_ligne ('  exception');
    ajout_ligne ('    when others then');
    ajout_ligne ('      ete(''ERROR::TERMN_CLOB'', pva_id);');
    ajout_ligne ('      ete();');
    ajout_ligne ('      raise;');
    ajout_ligne ('  end termn_clob;');
    ajout_ligne ();

    ajout_ligne ('  procedure ecrir_blob (pva_id in varchar2, pva_texte in varchar2) is');
    ajout_ligne ('  begin');
    ajout_ligne ('    --TODO');
    ajout_ligne ('    null;');
    ajout_ligne ('  exception');
    ajout_ligne ('    when others then');
    ajout_ligne ('      raise;');
    ajout_ligne ('  end ecrir_blob;');
    ajout_ligne ();

    ajout_ligne ('  procedure creer_table_tempr is');
    ajout_ligne ('  begin');

    afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                               ,vnu_index_table_tempr);
    afw_07_clob_pkg.termn (vnu_index_table_tempr);

    ajout_ligne ('  end creer_table_tempr;');
    ajout_ligne ();
    ajout_ligne ('  procedure suprm_table_tempr is');
    ajout_ligne ('  begin');

    afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                               ,vnu_index_suprm_table);
    afw_07_clob_pkg.termn (vnu_index_suprm_table);

    ajout_ligne ('  end suprm_table_tempr;');
    ajout_ligne ('end afw$migrt$pkg;');
    ajout_ligne ('/');
    ajout_ligne ();

    ajout_ligne ('prompt ...Initialisation des tables temporaires');

    ajout_ligne ();
    debtr_bloc ('Debut - Initialisation');
    ajout_ligne ('  afw_11_migrt_pkg.gva_indic_migrt := ''O'';');
    ajout_ligne ('  afw$migrt$pkg.vva_code_prodt_afw := ''AFW'';');
    ajout_ligne ('  afw$migrt$pkg.vva_code_prodt := ''AFW'';');
    ajout_ligne ();
    ajout_ligne ('  afw$migrt$pkg.suprm_table_tempr;');
    ajout_ligne ('  afw$migrt$pkg.creer_table_tempr;');
    termn_bloc ('Fin - Initialisation');
    ajout_ligne ();

    ajout_ligne ('prompt ...Initialisation des applications d''authentification');
    ajout_ligne ();

    debtr_bloc ('Debut - Initialisation applications authentification');

    for rec_aplic_authe in cur_aplic_authe
    loop
      ajout_ligne (   'afw$migrt$pkg.'
                   || obten_tabl_entit ('apexframework'
                                       ,'afw_11_aplic')
                   || '(' --var_aplic('
                   || rec_aplic_authe.seqnc
                   || ') := afw_11_aplic_pkg.obten_aplic('
                   || formt_chain (rec_aplic_authe.code)
                   || ');');
    end loop;

    termn_bloc ('Fin - Initialisation applications authentification');
  exception
    when versn_non_trouv
    then
      raise;
    when others
    then
      raise;
  end genr_fichr_migrt_initl;

  procedure genr_fichr_migrt_prodt
  is
    cursor cur_entit
    is
        select seqnc
              ,lower (nom)                nom
              ,lower (nom_table_tempr)    nom_table_tempr
              ,lower (nom_table_ereur)    nom_table_ereur
              ,indic_creer_ocurn
              ,indic_modif_ocurn
              ,indic_suprm_ocurn
              ,indic_force_selct
              ,ref_versn
              ,longr_bloc
              ,indic_expor_tabl_index
              ,indic_suprm_don_prodt
              ,indic_deplm_inter_prodt
              ,where_claus_custm
              ,lower (ref_schem_prodt_code) schem
          from vd_afw_11_entit e
         where     ref_versn = gnu_versn_afw
               and (   niv_inclu_migrt in ('GLOBL'
                                          ,'PRODT')
                    or     niv_inclu_migrt = 'CONTX'
                       and exists
                             (select 1
                                from vd_i_afw_11_atrib_entit ae
                               where     ae.nom = 'DNR_REF_PRODT'
                                     and ae.ref_entit = e.seqnc))
      order by ordre_exect;

    cursor cur_atrib_entit (pnu_entit in number)
    is
        select seqnc
              ,lower (nom) nom
              ,type_don
              ,compr_migrt
          from vd_i_afw_11_atrib_entit
         where     ref_entit = pnu_entit
               and compr_migrt not in ('NON_MIGRE')
      order by nom;

    cursor cur_afw_11_prodt
    is
      select seqnc
            ,code
            ,nom
            ,procd_expor_metdn
            ,tail_tabl_extra
            ,indic_extra_tout
            ,ref_group_utils_admin
            ,ref_versn
            ,ident_envir
            ,dosr_fichr
            ,mesg_tout_droit_resrv
            ,jquer_ui_css_scope
            ,indic_afich_err_code
            ,indic_page_inexs_maj_refrn
            ,ref_mesg_sucs
            ,ref_mesg_echec
            ,ref_mesg_fetch
            ,ref_mesg_range_suprm
            ,ref_mesg_range_modf
            ,ref_mesg_range_inser
            ,ref_mesg_aucun_don_trouv
            ,ref_mesg_trop_don_trouv
            ,fonct_obten_base_url
            ,ref_aplic_acuei
            ,ref_page_acuei
            ,ref_aplic_comnt_bogue
            ,ref_page_comnt_bogue
            ,procd_impre_entet_pdf_ir
            ,procd_impre_pied_page_pdf_ir
            ,procd_plpdf_coulr
            ,compt_genrl
            ,domn_docmn_html
            ,initl_comps_javsc
            ,note_scrip_pre_migrt
            ,note_scrip_post_migrt
            ,procd_initl_sesn
            ,fonct_migrt_persn
            ,indic_systm
        from vd_i_afw_11_prodt
       where seqnc = gnu_prodt;

    vva_enonc_sql               varchar2 (32767);
    rec_afw_11_prodt            cur_afw_11_prodt%rowtype;
    vvc_note_scrip_post_migrt   apex_application_global.vc_arr2;
  begin
    ajout_ligne ('set define off');
    ajout_ligne ('set serveroutput on');
    ajout_ligne ('set feedback off');
    ajout_ligne ();
    --    ajout_ligne (   'alter session set current_schema = '
    --                 || gva_schem
    --                 || ';');
    ajout_ligne ();


    open cur_afw_11_prodt;

    fetch cur_afw_11_prodt
      into rec_afw_11_prodt;

    close cur_afw_11_prodt;

    --Mettre à jour le produit et initialiser les valeurs si nous sommes en train de migrer un produit

    ajout_ligne ('prompt ...Initialisation du produit');
    ajout_ligne ();

    debtr_bloc ('Debut - Initialisation - Produit');

    if gva_contx = 'PRODT'
    then
      ajout_ligne (   '  afw$migrt$pkg.vnu_seqnc_prodt := afw_11_prodt_pkg.maj_prodt ('
                   || formt_chain (rec_afw_11_prodt.code)
                   || ','
                   || formt_chain (rec_afw_11_prodt.nom)
                   || ','
                   || formt_chain (rec_afw_11_prodt.procd_expor_metdn)
                   || ','
                   || formt_numrq (rec_afw_11_prodt.tail_tabl_extra)
                   || ','
                   || formt_chain (rec_afw_11_prodt.indic_extra_tout)
                   || ');');
    else
      ajout_ligne (   '  afw$migrt$pkg.vnu_seqnc_prodt := afw_11_prodt_pkg.obten_prodt ('
                   || formt_chain (rec_afw_11_prodt.code)
                   || ');');
    end if;

    termn_bloc ('Fin - Initialisation - Produit');
    ajout_ligne ();

    --Ouvrir un clob pour les updates à faire.
    gnu_index_updat   := afw_07_clob_pkg.creer_nouv ();
    ajout_ligne ('set define off'
                ,gnu_index_updat);
    ajout_ligne ('set serveroutput on'
                ,gnu_index_updat);
    ajout_ligne ('set feedback off'
                ,gnu_index_updat);
    ajout_ligne (null
                ,gnu_index_updat);
    --    ajout_ligne (   'alter session set current_schema = '
    --                 || gva_schem
    --                 || ';'
    --                ,gnu_index_updat);
    ajout_ligne (null
                ,gnu_index_updat);

    ajout_ligne ('prompt ========================================'
                ,gnu_index_updat);
    ajout_ligne ('prompt Post-applications'
                ,gnu_index_updat);

    ajout_ligne (null
                ,gnu_index_updat);

    ajout_ligne ('prompt ...Metadonnees des entites'
                ,gnu_index_updat);

    for rec_entit in cur_entit
    loop
      valdt_entit (rec_entit.nom
                  ,rec_entit.nom_table_tempr
                  ,rec_entit.nom_table_ereur);
      --Définir tableaux de varray (mapping nom)
      alimn_tabl_entit (rec_entit.schem
                       ,rec_entit.nom
                       ,   'var_'
                        || formt_nom_entit (rec_entit.seqnc));
      ajout_ligne (   'prompt ......'
                   || substr (rec_entit.nom
                             ,  instr (rec_entit.nom
                                      ,'_'
                                      ,5)
                              + 1)
                  ,gnu_index_updat);

      --Section clob_update
      begin
        ajout_ligne ('begin'
                    ,gnu_index_updat);
        ajout_ligne ('if afw$migrt$pkg.vnu_sql_code = 0 then'
                    ,gnu_index_updat);
      end;

      ajout_ligne_comnt (   'Debut - '
                         || rec_entit.nom);

      debtr_bloc (   'Debut - '
                  || rec_entit.nom);

      gnu_nombr_seprt         := rec_entit.longr_bloc;
      vva_enonc_sql           :=
        obten_sql_entit (rec_entit.seqnc
                        ,rec_entit.ref_versn);


      gnu_index_selct         := afw_07_clob_pkg.creer_nouv ();
      gnu_index_alimn_table   := afw_07_clob_pkg.creer_nouv ();
      gnu_index_clob          := afw_07_clob_pkg.creer_nouv ();


      if    rec_entit.indic_creer_ocurn = 'O'
         or rec_entit.indic_modif_ocurn = 'O'
         or rec_entit.indic_suprm_ocurn = 'O'
         or rec_entit.indic_force_selct = 'O'
      then
        trait_genrq (rec_entit.seqnc
                    ,rec_entit.nom
                    ,vva_enonc_sql);
      end if;

      if     rec_entit.indic_force_selct = 'N'
         and gva_contx = 'PRODT'
      then
        afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                   ,gnu_index_alimn_table);
      end if;

      afw_07_clob_pkg.termn (gnu_index_alimn_table);

      termn_bloc (   'Début Clob - '
                  || rec_entit.nom);
      afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                 ,gnu_index_clob);
      afw_07_clob_pkg.termn (gnu_index_clob);
      debtr_bloc (   'Fin Clob - '
                  || rec_entit.nom);

      if     gbo_presn_don
         and gva_contx = 'PRODT'
      then
        if gnu_nombr_seprt is not null
        then
          termn_bloc (   'Fin partie - '
                      || rec_entit.nom);
          debtr_bloc (   'Debut partie - '
                      || rec_entit.nom);
        end if;

        --Ajouter nouvelle ligne, update celle présente
        if (   rec_entit.indic_creer_ocurn = 'O'
            or rec_entit.indic_modif_ocurn = 'O')
        then
          if rec_entit.indic_suprm_don_prodt = 'O'
          then
            ajout_ligne ();
            ajout_ligne (   'delete from '
                         || rec_entit.nom
                         || '
                            where dnr_ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt;');
          end if;

          ajout_ligne ();
          ajout_ligne (   'merge into '
                       || rec_entit.nom
                       || ' t
                        using '
                       || rec_entit.nom_table_tempr
                       || ' tf
               on ('
                       || obten_ligne_atrib_entit (rec_entit.seqnc
                                                  ,'MERGE'
                                                  ,'''CLE_FONCT'''
                                                  ,'t'
                                                  ,'tf'
                                                  ,' and')
                       || ')');

          if rec_entit.indic_creer_ocurn = 'O'
          then
            ajout_ligne (   'when not matched then
              insert ('
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'INSER'
                                                    ,'''VALR_MIGRE'', ''CLE_FONCT'''
                                                    ,'t')
                         || ')
              values ('
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'INSER'
                                                    ,'''VALR_MIGRE'', ''CLE_FONCT'''
                                                    ,'tf')
                         || ')');
          end if;

          if rec_entit.indic_modif_ocurn = 'O'
          then
            ajout_ligne (   'when matched then
              update set '
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'UPDAT'
                                                    ,'''VALR_MIGRE'''
                                                    ,'t'
                                                    ,'tf'));
          end if;

          ajout_ligne (   'log errors into '
                       || rec_entit.nom_table_ereur
                       || '(''Merge'')');
          ajout_ligne ('reject limit unlimited');

          ajout_ligne (';');
          ajout_ligne ();

          ajout_ligne ('declare');
          ajout_ligne ('  vnu_count pls_integer;');
          ajout_ligne ('begin');
          ajout_ligne (   '  select count(1) into vnu_count from '
                       || rec_entit.nom_table_ereur
                       || ';');
          ajout_ligne ();
          ajout_ligne ('  if vnu_count > 0 then');
          ajout_ligne (   '    afw$migrt$pkg.defnr_ereur ('
                       || formt_chain (   'Merge sur '
                                       || rec_entit.nom)
                       || ');');
          ajout_ligne ('  end if;');
          ajout_ligne ('end;');
          ajout_ligne ();
        end if;

        if rec_entit.indic_suprm_ocurn = 'O'
        then
          ajout_ligne (   'delete '
                       || rec_entit.nom
                       || ' t
            where t.dnr_ref_prodt = afw$migrt$pkg.vnu_seqnc_prodt
              and not exists (select null
                                from '
                       || rec_entit.nom_table_tempr
                       || ' tf
                               where '
                       || obten_ligne_atrib_entit (rec_entit.seqnc
                                                  ,'MERGE'
                                                  ,'''CLE_FONCT'''
                                                  ,'t'
                                                  ,'tf'
                                                  ,' and')
                       || ');');
          ajout_ligne ();
        end if;

        if gnu_nombr_seprt is not null
        then
          termn_bloc (   'Fin partie - '
                      || rec_entit.nom);
          debtr_bloc (   'Debut partie - '
                      || rec_entit.nom);
        end if;

        gbo_presn_don   := false;
      end if;

      --Storer la nouvelle seqnc
      afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                 ,gnu_index_selct);
      afw_07_clob_pkg.termn (gnu_index_selct);

      ajout_ligne_comnt (   'Fin - '
                         || rec_entit.nom);
      termn_bloc (   'Fin - '
                  || rec_entit.nom);

      --Section clob_update
      begin
        ajout_ligne ('declare'
                    ,gnu_index_updat);
        ajout_ligne ('  vnu_count pls_integer;'
                    ,gnu_index_updat);
        ajout_ligne ('begin'
                    ,gnu_index_updat);
        ajout_ligne (   '  select count(1) into vnu_count from '
                     || rec_entit.nom_table_ereur
                     || ';'
                    ,gnu_index_updat);
        ajout_ligne (null
                    ,gnu_index_updat);
        ajout_ligne ('  if vnu_count > 0 then'
                    ,gnu_index_updat);
        ajout_ligne (   '    afw$migrt$pkg.defnr_ereur ('
                     || formt_chain (   'Update sur '
                                     || rec_entit.nom)
                     || ');'
                    ,gnu_index_updat);
        ajout_ligne ('  end if;'
                    ,gnu_index_updat);
        ajout_ligne ('end;'
                    ,gnu_index_updat);
        ajout_ligne ('null;'
                    ,gnu_index_updat);
        ajout_ligne ('end if;'
                    ,gnu_index_updat);
        ajout_ligne ('exception'
                    ,gnu_index_updat);
        ajout_ligne ('when others then'
                    ,gnu_index_updat);
        ajout_ligne (   'afw$migrt$pkg.defnr_ereur ('
                     || formt_chain (   'Update sur '
                                     || rec_entit.nom)
                     || ');'
                    ,gnu_index_updat);
        ajout_ligne ('end;'
                    ,gnu_index_updat);
        ajout_ligne ('/'
                    ,gnu_index_updat);
        ajout_ligne (''
                    ,gnu_index_updat);
      end;
    end loop;

    if gva_contx = 'PRODT'
    then
      ajout_ligne ('prompt ...Mise a jour du produit'
                  ,gnu_index_updat);

      ajout_ligne ('begin'
                  ,gnu_index_updat);
      ajout_ligne ('if afw$migrt$pkg.vnu_sql_code = 0 then'
                  ,gnu_index_updat);
      ajout_ligne (   'update afw_11_prodt
                       set indic_extra_tout = '
                   || formt_chain (rec_afw_11_prodt.indic_extra_tout)
                   || ',
                           ref_group_utils_admin = '
                   || formt_fonct (rec_afw_11_prodt.ref_group_utils_admin
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_12_group_utils') --'var_group_utils'
                                  ,'Update')
                   || ',
                           dosr_fichr = '
                   || formt_chain (rec_afw_11_prodt.dosr_fichr)
                   || ',
                           ref_versn = '
                   || formt_fonct (rec_afw_11_prodt.ref_versn
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_11_versn') --'var_versn'
                                  ,'Update')
                   || ',
                           mesg_tout_droit_resrv = '
                   || formt_chain (rec_afw_11_prodt.mesg_tout_droit_resrv)
                   || ',
                           jquer_ui_css_scope = '
                   || formt_chain (rec_afw_11_prodt.jquer_ui_css_scope)
                   || ',
                           indic_afich_err_code = '
                   || formt_chain (rec_afw_11_prodt.indic_afich_err_code)
                   || ',
                           indic_page_inexs_maj_refrn = '
                   || formt_chain (rec_afw_11_prodt.indic_page_inexs_maj_refrn)
                   || ',
                           fonct_obten_base_url = '
                   || formt_chain (rec_afw_11_prodt.fonct_obten_base_url)
                   || ',
                           ref_mesg_sucs = '
                   || formt_fonct (rec_afw_11_prodt.ref_mesg_sucs
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_01_mesg') --'var_mesg'
                                  ,'Update')
                   || ',
                           ref_mesg_echec = '
                   || formt_fonct (rec_afw_11_prodt.ref_mesg_echec
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_01_mesg') --'var_mesg'
                                  ,'Update')
                   || ',
                           ref_mesg_fetch = '
                   || formt_fonct (rec_afw_11_prodt.ref_mesg_fetch
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_01_mesg') --'var_mesg'
                                  ,'Update')
                   || ',
                           ref_mesg_range_suprm = '
                   || formt_fonct (rec_afw_11_prodt.ref_mesg_range_suprm
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_01_mesg') --'var_mesg'
                                  ,'Update')
                   || ',
                           ref_mesg_range_modf = '
                   || formt_fonct (rec_afw_11_prodt.ref_mesg_range_modf
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_01_mesg') --'var_mesg'
                                  ,'Update')
                   || ',
                           ref_mesg_range_inser = '
                   || formt_fonct (rec_afw_11_prodt.ref_mesg_range_inser
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_01_mesg') --'var_mesg'
                                  ,'Update')
                   || ',
                           ref_mesg_aucun_don_trouv = '
                   || formt_fonct (rec_afw_11_prodt.ref_mesg_aucun_don_trouv
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_01_mesg') --'var_mesg'
                                  ,'Update')
                   || ',
                           ref_mesg_trop_don_trouv = '
                   || formt_fonct (rec_afw_11_prodt.ref_mesg_trop_don_trouv
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_01_mesg') --'var_mesg'
                                  ,'Update')
                   || ',
                           ref_aplic_acuei = '
                   || formt_fonct (rec_afw_11_prodt.ref_aplic_acuei
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_11_aplic') --'var_aplic'
                                  ,'Update')
                   || ',
                           ref_page_acuei = '
                   || formt_fonct (rec_afw_11_prodt.ref_page_acuei
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_13_page') --'var_page'
                                  ,'Update')
                   || ',
                           ref_aplic_comnt_bogue = '
                   || formt_fonct (rec_afw_11_prodt.ref_aplic_comnt_bogue
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_11_aplic') --'var_aplic'
                                  ,'Update')
                   || ',
                           ref_page_comnt_bogue = '
                   || formt_fonct (rec_afw_11_prodt.ref_page_comnt_bogue
                                  ,obten_tabl_entit ('apexframework'
                                                    ,'afw_13_page') --'var_page'
                                  ,'Update')
                   || ',
                           procd_impre_entet_pdf_ir = '
                   || formt_chain (rec_afw_11_prodt.procd_impre_entet_pdf_ir)
                   || ',
                           procd_impre_pied_page_pdf_ir = '
                   || formt_chain (rec_afw_11_prodt.procd_impre_pied_page_pdf_ir)
                   || ',
                           procd_plpdf_coulr = '
                   || formt_chain (rec_afw_11_prodt.procd_plpdf_coulr)
                   || ',
                           compt_genrl = '
                   || formt_chain (rec_afw_11_prodt.compt_genrl)
                   || ',
                           domn_docmn_html = '
                   || formt_chain (rec_afw_11_prodt.domn_docmn_html)
                   || ',
                           initl_comps_javsc = '
                   || formt_chain (rec_afw_11_prodt.initl_comps_javsc)
                   || ',
                           note_scrip_pre_migrt = '
                   || formt_chain (rec_afw_11_prodt.note_scrip_pre_migrt)
                   || ',
                           note_scrip_post_migrt = '
                   || formt_chain (rec_afw_11_prodt.note_scrip_post_migrt)
                   || ',
                           procd_initl_sesn = '
                   || formt_chain (rec_afw_11_prodt.procd_initl_sesn)
                   || ',
                           fonct_migrt_persn = '
                   || formt_chain (rec_afw_11_prodt.fonct_migrt_persn)
                   || ',
                           indic_systm = '
                   || formt_chain (rec_afw_11_prodt.indic_systm)
                   || '
                     where seqnc = afw$migrt$pkg.vnu_seqnc_prodt;'
                  ,gnu_index_updat);
      ajout_ligne ('end if;'
                  ,gnu_index_updat);
      ajout_ligne ('exception'
                  ,gnu_index_updat);
      ajout_ligne ('when others then'
                  ,gnu_index_updat);
      ajout_ligne ('afw$migrt$pkg.defnr_ereur (''Update sur afw_11_prodt'');'
                  ,gnu_index_updat);
      ajout_ligne ('end;'
                  ,gnu_index_updat);
      ajout_ligne ('/'
                  ,gnu_index_updat);
    end if;


    --FIN PACKAGE MIGRT
    ajout_ligne ('prompt ========================================'
                ,gnu_index_updat);
    ajout_ligne ('begin'
                ,gnu_index_updat);
    ajout_ligne ('  if afw$migrt$pkg.vnu_sql_code = 0 then'
                ,gnu_index_updat);
    ajout_ligne ('    commit;'
                ,gnu_index_updat);

    ajout_ligne (   '    dbms_output.put_line ('
                 || formt_chain ('Deploiement complete correctement')
                 || ');'
                ,gnu_index_updat);

    ajout_ligne ('  else'
                ,gnu_index_updat);
    ajout_ligne ('    rollback;'
                ,gnu_index_updat);
    ajout_ligne ('    afw_13_condt_piltb_pkg.vbo_en_charg := false;'
                ,gnu_index_updat);
    ajout_ligne (   '    dbms_output.put_line ('
                 || formt_chain ('Une erreur est survenue lors de l''execution du script de deploiement.')
                 || ');'
                ,gnu_index_updat);
    ajout_ligne ('    dbms_output.put_line (''Bloc   : '' || afw$migrt$pkg.vva_nom_bloc_err);'
                ,gnu_index_updat);
    ajout_ligne ('    dbms_output.put_line (''Code   : '' || afw$migrt$pkg.vnu_sql_code);'
                ,gnu_index_updat);
    ajout_ligne ('    dbms_output.put_line (''Message: '' || afw$migrt$pkg.vva_sql_errm);'
                ,gnu_index_updat);
    ajout_ligne ('    dbms_output.put_line (''Pile   :'');'
                ,gnu_index_updat);
    ajout_ligne ('    dbms_output.put_line (afw$migrt$pkg.vva_back_trace);'
                ,gnu_index_updat);
    ajout_ligne ('    afw_03_journ_pkg.ecrir_journ (afw$migrt$pkg.vva_sql_errm);'
                ,gnu_index_updat);
    ajout_ligne ('    afw_03_journ_pkg.ecrir_journ (afw$migrt$pkg.vva_back_trace);'
                ,gnu_index_updat);
    ajout_ligne ('  end if;'
                ,gnu_index_updat);
    ajout_ligne ('end;'
                ,gnu_index_updat);
    ajout_ligne ('/'
                ,gnu_index_updat);
    ajout_ligne (null
                ,gnu_index_updat);
    ajout_ligne ('begin'
                ,gnu_index_updat);
    ajout_ligne ('  if afw$migrt$pkg.vnu_sql_code <> 0 then'
                ,gnu_index_updat);
    ajout_ligne ('    raise_application_error (-20100, afw$migrt$pkg.vva_sql_errm);'
                ,gnu_index_updat);
    ajout_ligne ('  end if;'
                ,gnu_index_updat);
    ajout_ligne ('end;'
                ,gnu_index_updat);
    ajout_ligne ('/'
                ,gnu_index_updat);
    ajout_ligne (null
                ,gnu_index_updat);
    ajout_ligne ('prompt ========================================'
                ,gnu_index_updat);
    ajout_ligne ('prompt Nettoyage des objets temporaires'
                ,gnu_index_updat);
    ajout_ligne (null
                ,gnu_index_updat);
    ajout_ligne ('exec afw$migrt$pkg.suprm_table_tempr;'
                ,gnu_index_updat);
    ajout_ligne (null
                ,gnu_index_updat);
    ajout_ligne ('drop package afw$migrt$pkg;'
                ,gnu_index_updat);
    ajout_ligne (null
                ,gnu_index_updat);

    ajout_ligne ('begin 
                    afw_11_migrt_pkg.gva_indic_migrt := ''N''; 
                  end;
                  /'
                ,gnu_index_updat);

    ajout_ligne (null
                ,gnu_index_updat);

    --note script post-migration
    vvc_note_scrip_post_migrt      :=
      afw_07_util_pkg.string_to_table (afw_11_prodt_pkg.obten_note_scrip_post_migrt (gnu_prodt)
                                      ,   chr (13)
                                       || chr (10));

    if vvc_note_scrip_post_migrt.count > 0
    then
      ajout_ligne ('prompt ================================================================================'
                  ,gnu_index_updat);

      for i in vvc_note_scrip_post_migrt.first .. vvc_note_scrip_post_migrt.last
      loop
        ajout_ligne (   'prompt '
                     || vvc_note_scrip_post_migrt (i)
                    ,gnu_index_updat);
      end loop;
    end if;

    ajout_ligne ('prompt ================================================================================'
                ,gnu_index_updat);
    ajout_ligne ('prompt ..._....___..___.__..__.___..___...._....__..__..___.__......__.___...___.._..__'
                ,gnu_index_updat);
    ajout_ligne ('prompt ../_\..| _ \| __|\ \/ /| __|| _ \../_\..|  \/  || __|\ \    / // _ \ | _ \| |/ /'
                ,gnu_index_updat);
    ajout_ligne ('prompt ./ _ \.|  _/| _|  >  < | _|.|   /./ _ \.| |\/| || _|..\ \/\/ /| (_) ||   /|   < '
                ,gnu_index_updat);
    ajout_ligne ('prompt /_/.\_\|_|..|___|/_/\_\|_|..|_|_\/_/.\_\|_|..|_||___|..\_/\_/..\___/.|_|_\|_|\_\'
                ,gnu_index_updat);
    ajout_ligne ('prompt ================================================================================'
                ,gnu_index_updat);
    ajout_ligne ('prompt "Never send a human to do a machine''s job." -Agent Smith'
                ,gnu_index_updat);
    ajout_ligne ('prompt ================================================================================'
                ,gnu_index_updat);

    ajout_clob_fichr_compr (gnu_index_genrl
                           ,kva_nom_fichr_insta_pre_aplic);
    ajout_clob_fichr_compr (gnu_index_updat
                           ,kva_nom_fichr_insta_post_aplic);

    afw_07_clob_pkg.termn (gnu_index_genrl);
    afw_07_clob_pkg.termn (gnu_index_updat);
  end genr_fichr_migrt_prodt;

  procedure genr_fichr_migrt_aplic
  is
    cursor cur_entit
    is
        select seqnc
              ,lower (nom)                nom
              ,lower (nom_table_tempr)    nom_table_tempr
              ,lower (nom_table_ereur)    nom_table_ereur
              ,indic_creer_ocurn
              ,indic_modif_ocurn
              ,indic_suprm_ocurn
              ,indic_force_selct
              ,ref_versn
              ,longr_bloc
              ,indic_expor_tabl_index
              ,indic_suprm_don_prodt
              ,lower (ref_schem_prodt_code) schem
          from vd_afw_11_entit e
         where     ref_versn = gnu_versn_afw
               and (   niv_inclu_migrt in ('APLIC')
                    or     niv_inclu_migrt = 'CONTX'
                       and exists
                             (select 1
                                from vd_i_afw_11_atrib_entit ae
                               where     ae.nom = 'DNR_REF_APLIC'
                                     and ae.ref_entit = e.seqnc))
      order by ordre_exect;

    cursor cur_atrib_entit (pnu_entit in number)
    is
        select seqnc
              ,lower (nom) nom
              ,type_don
              ,compr_migrt
          from vd_i_afw_11_atrib_entit
         where     ref_entit = pnu_entit
               and compr_migrt not in ('NON_MIGRE')
      order by nom;

    cursor cur_afw_11_aplic
    is
      select ea.seqnc
            ,ea.ref_aplic
            ,ea.ref_aplic_code
            ,ea.ref_aplic_nom
            ,nvl (ea.numr_aplic_cible, ea.numr_aplic_courn) numr_aplic_cible
            ,a.ref_versn
            ,a.indic_aplic_authe
            ,a.ref_aplic_authe
            ,a.ref_page_conxn
            ,a.ref_page_acuei
        from vd_afw_13_expor_aplic ea
            ,vd_afw_11_aplic       a
       where     ea.ref_aplic = gnu_aplic
             and ea.ref_aplic = a.seqnc;

    vva_enonc_sql      varchar2 (32767);
    rec_afw_11_aplic   cur_afw_11_aplic%rowtype;
  begin
    --Mettre à jour le produit et initialiser les valeurs si nous sommes en train de migrer un produit
    open cur_afw_11_aplic;

    fetch cur_afw_11_aplic
      into rec_afw_11_aplic;

    close cur_afw_11_aplic;

    gnu_index_genrl   := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne ('set define off');
    ajout_ligne ('set serveroutput on');
    ajout_ligne ('set feedback off');
    ajout_ligne ();
    --    ajout_ligne (   'alter session set current_schema = '
    --                 || gva_schem
    --                 || ';');
    ajout_ligne ();

    ajout_ligne ('prompt ========================================');
    ajout_ligne (   'prompt Installation de l''application: '
                 || rec_afw_11_aplic.ref_aplic_code
                 || ' - '
                 || convert (rec_afw_11_aplic.ref_aplic_nom
                            ,'US7ASCII'));

    ajout_ligne ();
    debtr_bloc (   'Debut - Initialisation - Application - '
                || rec_afw_11_aplic.ref_aplic_code);
    ajout_ligne (   '  afw$migrt$pkg.'
                 || obten_tabl_entit ('apexframework'
                                     ,'afw_11_aplic')
                 || '(' --var_aplic('
                 || formt_numrq (rec_afw_11_aplic.ref_aplic)
                 || ') := afw_11_aplic_pkg.maj_aplic ('
                 || formt_chain (rec_afw_11_aplic.ref_aplic_code)
                 || ','
                 || formt_chain (rec_afw_11_aplic.ref_aplic_nom)
                 || ','
                 || formt_numrq (rec_afw_11_aplic.numr_aplic_cible)
                 || ', afw$migrt$pkg.vnu_seqnc_prodt);');
    ajout_ligne ();
    ajout_ligne (   '  afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.'
                 || obten_tabl_entit ('apexframework'
                                     ,'afw_11_aplic')
                 || '(' --var_aplic('
                 || formt_numrq (rec_afw_11_aplic.ref_aplic)
                 || '),''O'');');
    termn_bloc (   'Fin - Initialisation - Application - '
                || rec_afw_11_aplic.ref_aplic_code);
    ajout_ligne ();

    --Ouvrir un clob pour les updates à faire.
    gnu_index_updat   := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne ('prompt ...Metadonnees des entites');

    for rec_entit in cur_entit
    loop
      valdt_entit (rec_entit.nom
                  ,rec_entit.nom_table_tempr
                  ,rec_entit.nom_table_ereur);
      --Définir tableaux de varray (mapping nom)
      alimn_tabl_entit (rec_entit.schem
                       ,rec_entit.nom
                       ,   'var_'
                        || formt_nom_entit (rec_entit.seqnc));

      --Section clob_update
      begin
        ajout_ligne ('begin'
                    ,gnu_index_updat);
        ajout_ligne ('if afw$migrt$pkg.vnu_sql_code = 0 then'
                    ,gnu_index_updat);
      end;

      ajout_ligne (   'prompt ......'
                   || substr (rec_entit.nom
                             ,  instr (rec_entit.nom
                                      ,'_'
                                      ,5)
                              + 1));

      ajout_ligne_comnt (   'Debut - '
                         || rec_entit.nom);
      debtr_bloc (   'Debut - '
                  || rec_entit.nom);

      ajout_ligne (   'delete from '
                   || rec_entit.nom_table_tempr
                   || ';');
      ajout_ligne ();

      gnu_nombr_seprt         := rec_entit.longr_bloc;
      vva_enonc_sql           :=
        obten_sql_entit (rec_entit.seqnc
                        ,rec_entit.ref_versn);


      gnu_index_selct         := afw_07_clob_pkg.creer_nouv ();
      gnu_index_alimn_table   := afw_07_clob_pkg.creer_nouv ();
      gnu_index_clob          := afw_07_clob_pkg.creer_nouv ();

      if    rec_entit.indic_creer_ocurn = 'O'
         or rec_entit.indic_modif_ocurn = 'O'
         or rec_entit.indic_suprm_ocurn = 'O'
         or rec_entit.indic_force_selct = 'O'
      then
        trait_genrq (rec_entit.seqnc
                    ,rec_entit.nom
                    ,vva_enonc_sql);
      end if;

      if rec_entit.indic_force_selct = 'N'
      then
        afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                   ,gnu_index_alimn_table);
      end if;

      afw_07_clob_pkg.termn (gnu_index_alimn_table);


      termn_bloc (   'Début Clob - '
                  || rec_entit.nom);
      afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                 ,gnu_index_clob);
      afw_07_clob_pkg.termn (gnu_index_clob);
      debtr_bloc (   'Fin Clob - '
                  || rec_entit.nom);

      if gbo_presn_don
      then
        if gnu_nombr_seprt is not null
        then
          termn_bloc (   'Fin partie - '
                      || rec_entit.nom);
          debtr_bloc (   'Debut partie - '
                      || rec_entit.nom);
        end if;

        --Ajouter nouvelle ligne, update celle présente
        if (   rec_entit.indic_creer_ocurn = 'O'
            or rec_entit.indic_modif_ocurn = 'O')
        then
          if rec_entit.indic_suprm_don_prodt = 'O'
          then
            ajout_ligne ();
            ajout_ligne (   'delete from '
                         || rec_entit.nom
                         || '
                            where dnr_ref_aplic = afw$migrt$pkg.'
                         || obten_tabl_entit ('apexframework'
                                             ,'afw_11_aplic')
                         || '(' --var_aplic('
                         || formt_numrq (rec_afw_11_aplic.ref_aplic)
                         || ');');
          end if;

          ajout_ligne ();
          ajout_ligne (   'merge into '
                       || rec_entit.nom
                       || ' t
                        using '
                       || rec_entit.nom_table_tempr
                       || ' tf
               on ('
                       || obten_ligne_atrib_entit (rec_entit.seqnc
                                                  ,'MERGE'
                                                  ,'''CLE_FONCT'''
                                                  ,'t'
                                                  ,'tf'
                                                  ,' and')
                       || ')');

          if rec_entit.indic_creer_ocurn = 'O'
          then
            ajout_ligne (   'when not matched then
              insert ('
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'INSER'
                                                    ,'''VALR_MIGRE'', ''CLE_FONCT'''
                                                    , /*, ''CLE_REFRN''',*/
                                                     't')
                         || ')
              values ('
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'INSER'
                                                    ,'''VALR_MIGRE'', ''CLE_FONCT'''
                                                    , /*, ''CLE_REFRN''',*/
                                                     'tf')
                         || ')');
          end if;

          if rec_entit.indic_modif_ocurn = 'O'
          then
            ajout_ligne (   'when matched then
              update set '
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'UPDAT'
                                                    ,'''VALR_MIGRE'''
                                                    , --''CLE_REFRN''',
                                                     't'
                                                    ,'tf'));
          end if;

          ajout_ligne (   'log errors into '
                       || rec_entit.nom_table_ereur);
          ajout_ligne ('reject limit unlimited');

          ajout_ligne (';');
          ajout_ligne ();

          ajout_ligne ('declare');
          ajout_ligne ('  vnu_count pls_integer;');
          ajout_ligne ('begin');
          ajout_ligne (   '  select count(1) into vnu_count from '
                       || rec_entit.nom_table_ereur
                       || ';');
          ajout_ligne ();
          ajout_ligne ('  if vnu_count > 0 then');
          ajout_ligne (   '    afw$migrt$pkg.defnr_ereur ('
                       || formt_chain (   'Merge sur '
                                       || rec_entit.nom)
                       || ');');
          ajout_ligne ('  end if;');
          ajout_ligne ('end;');
          ajout_ligne ();
        end if;

        if rec_entit.indic_suprm_ocurn = 'O'
        then
          ajout_ligne (   'delete '
                       || rec_entit.nom
                       || ' t
            where t.dnr_ref_aplic = afw$migrt$pkg.'
                       || obten_tabl_entit ('apexframework'
                                           ,'afw_11_aplic')
                       || '(' --var_aplic('
                       || formt_numrq (rec_afw_11_aplic.ref_aplic)
                       || ')
              and not exists (select null
                                from '
                       || rec_entit.nom_table_tempr
                       || ' tf
                               where '
                       || obten_ligne_atrib_entit (rec_entit.seqnc
                                                  ,'MERGE'
                                                  ,'''CLE_FONCT'''
                                                  ,'t'
                                                  ,'tf'
                                                  ,' and')
                       || ');');
          ajout_ligne ();
        end if;

        if gnu_nombr_seprt is not null
        then
          termn_bloc (   'Fin partie - '
                      || rec_entit.nom);
          debtr_bloc (   'Debut partie - '
                      || rec_entit.nom);
        end if;

        gbo_presn_don   := false;
      end if;

      --Storer la nouvelle seqnc
      afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                 ,gnu_index_selct);
      afw_07_clob_pkg.termn (gnu_index_selct);

      ajout_ligne_comnt (   'Fin - '
                         || rec_entit.nom);
      termn_bloc (   'Fin - '
                  || rec_entit.nom);

      --Section clob_update
      begin
        ajout_ligne ('declare'
                    ,gnu_index_updat);
        ajout_ligne ('  vnu_count pls_integer;'
                    ,gnu_index_updat);
        ajout_ligne ('begin'
                    ,gnu_index_updat);
        ajout_ligne (   '  select count(1) into vnu_count from '
                     || rec_entit.nom_table_ereur
                     || ';'
                    ,gnu_index_updat);
        ajout_ligne (null
                    ,gnu_index_updat);
        ajout_ligne ('  if vnu_count > 0 then'
                    ,gnu_index_updat);
        ajout_ligne (   '    afw$migrt$pkg.defnr_ereur ('
                     || formt_chain (   'Update sur '
                                     || rec_entit.nom)
                     || ');'
                    ,gnu_index_updat);
        ajout_ligne ('  end if;'
                    ,gnu_index_updat);
        ajout_ligne ('end;'
                    ,gnu_index_updat);
        ajout_ligne (null
                    ,gnu_index_updat);
        ajout_ligne ('null;'
                    ,gnu_index_updat);
        ajout_ligne ('end if;'
                    ,gnu_index_updat);
        ajout_ligne ('exception'
                    ,gnu_index_updat);
        ajout_ligne ('when others then'
                    ,gnu_index_updat);
        ajout_ligne (   'afw$migrt$pkg.defnr_ereur ('
                     || formt_chain (   'Update sur '
                                     || rec_entit.nom)
                     || ');'
                    ,gnu_index_updat);
        ajout_ligne ('end;'
                    ,gnu_index_updat);
        ajout_ligne ('/'
                    ,gnu_index_updat);
        ajout_ligne (''
                    ,gnu_index_updat);
      end;
    end loop;

    afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                               ,gnu_index_updat);
    afw_07_clob_pkg.termn (gnu_index_updat);

    ajout_ligne ('begin');
    ajout_ligne ('if afw$migrt$pkg.vnu_sql_code = 0 then');
    ajout_ligne (   'update afw_11_aplic
                       set ref_versn = '
                 || formt_fonct (rec_afw_11_aplic.ref_versn
                                ,obten_tabl_entit ('apexframework'
                                                  ,'afw_11_versn') --'var_versn'
                                ,'Update')
                 || ',
                           indic_aplic_authe = '
                 || formt_chain (rec_afw_11_aplic.indic_aplic_authe)
                 || ',
                           ref_aplic_authe = '
                 || formt_fonct (rec_afw_11_aplic.ref_aplic_authe
                                ,obten_tabl_entit ('apexframework'
                                                  ,'afw_11_aplic') --'var_aplic'
                                ,'Update')
                 || ',
                           ref_page_conxn = '
                 || formt_fonct (rec_afw_11_aplic.ref_page_conxn
                                ,obten_tabl_entit ('apexframework'
                                                  ,'afw_13_page') --'var_page'
                                ,'Update')
                 || ',
                           ref_page_acuei = '
                 || formt_fonct (rec_afw_11_aplic.ref_page_acuei
                                ,obten_tabl_entit ('apexframework'
                                                  ,'afw_13_page') --'var_page'
                                ,'Update')
                 || '
                     where seqnc = afw$migrt$pkg.'
                 || obten_tabl_entit ('apexframework'
                                     ,'afw_11_aplic')
                 || '(' --var_aplic('
                 || rec_afw_11_aplic.ref_aplic
                 || ');');
    ajout_ligne ('end if;');
    ajout_ligne ('exception');
    ajout_ligne ('when others then');
    ajout_ligne ('afw$migrt$pkg.defnr_ereur (''Update sur afw_11_aplic'');');
    ajout_ligne ('end;');
    ajout_ligne ('/');

    ajout_ligne ('begin');
    ajout_ligne ('  if afw$migrt$pkg.vnu_sql_code = 0 then');
    ajout_ligne (   '    dbms_output.put_line ('
                 || formt_chain ('...Mise a jour du referentiel APEX')
                 || ');');
    ajout_ligne (   '    afw_13_page_pkg.maj_table_a_partr_refrt_apex(afw$migrt$pkg.'
                 || obten_tabl_entit ('apexframework'
                                     ,'afw_11_aplic')
                 || '(' --var_aplic('
                 || formt_numrq (rec_afw_11_aplic.ref_aplic)
                 || '),''O'');');
    ajout_ligne ('  end if;');
    ajout_ligne ('end;');
    ajout_ligne ('/');
    ajout_ligne ();

    ajout_clob_fichr_compr (gnu_index_genrl
                           ,   'f'
                            || rec_afw_11_aplic.numr_aplic_cible
                            || '_meta.sql');

    afw_07_clob_pkg.termn (gnu_index_genrl);
  end genr_fichr_migrt_aplic;

  procedure genr_fichr_migrt_domn
  is
    cursor cur_entit
    is
        select seqnc
              ,lower (nom)                nom
              ,lower (nom_table_tempr)    nom_table_tempr
              ,lower (nom_table_ereur)    nom_table_ereur
              ,indic_creer_ocurn
              ,indic_modif_ocurn
              ,indic_suprm_ocurn
              ,indic_force_selct
              ,ref_versn
              ,longr_bloc
              ,indic_expor_tabl_index
              ,indic_suprm_don_prodt
              ,lower (ref_schem_prodt_code) schem
          from vd_afw_11_entit e
         where     ref_versn = gnu_versn_afw
               and (   niv_inclu_migrt in ('DOMN')
                    or     niv_inclu_migrt = 'CONTX'
                       and exists
                             (select 1
                                from vd_i_afw_11_atrib_entit ae
                               where     ae.nom = 'DNR_REF_DOMN'
                                     and ae.ref_entit = e.seqnc))
      order by ordre_exect;

    cursor cur_afw_12_domn
    is
      select a.seqnc
            ,a.code
            ,a.nom
            ,a.descr
            ,   a.seqnc
             || '_'
             || lower (a.code)
               nom_fichr
            ,procd_avant_conxn
            ,procd_apres_conxn
            ,procd_obten_infor_utils
        from vd_afw_12_domn a
       where a.seqnc = gnu_domn;

    vva_enonc_sql     varchar2 (32767);
    rec_afw_12_domn   cur_afw_12_domn%rowtype;

    cursor cur_afw_11_prodt
    is
      select seqnc_prodt seqnc
            ,code_prodt  code
        from vs_migrt_prodt_suplm
       where     seqnc_prodt != gnu_prodt
             and seqnc_domn = gnu_domn;

    cursor cur_entit_prodt (pnu_prodt in number)
    is
        select seqnc
              ,lower (nom)                nom
              ,lower (nom_table_tempr)    nom_table_tempr
              ,lower (nom_table_ereur)    nom_table_ereur
              ,indic_creer_ocurn
              ,indic_modif_ocurn
              ,indic_suprm_ocurn
              ,indic_force_selct
              ,ref_versn
              ,longr_bloc
              ,indic_expor_tabl_index
              ,indic_suprm_don_prodt
              ,lower (ref_schem_prodt_code) schem
          from vd_afw_11_entit e
         where     ref_versn = gnu_versn_afw
               and (   niv_inclu_migrt in ('GLOBL'
                                          ,'PRODT')
                    or     niv_inclu_migrt = 'CONTX'
                       and exists
                             (select 1
                                from vd_i_afw_11_atrib_entit ae
                               where     ae.nom = 'DNR_REF_PRODT'
                                     and ae.ref_entit = e.seqnc))
               and (e.nom not in ('AFW_11_ENTIT'
                                 ,'AFW_11_ATRIB_ENTIT'
                                 ,'AFW_11_PLUGN'))
      order by ordre_exect;

    cursor cur_entit_aplic
    is
        select seqnc
              ,lower (nom)                nom
              ,lower (nom_table_tempr)    nom_table_tempr
              ,lower (nom_table_ereur)    nom_table_ereur
              ,indic_creer_ocurn
              ,indic_modif_ocurn
              ,indic_suprm_ocurn
              ,indic_force_selct
              ,ref_versn
              ,longr_bloc
              ,indic_expor_tabl_index
              ,indic_suprm_don_prodt
              ,lower (ref_schem_prodt_code) schem
          from vd_afw_11_entit e
         where     ref_versn = gnu_versn_afw
               and (   niv_inclu_migrt in ('APLIC')
                    or     niv_inclu_migrt = 'CONTX'
                       and exists
                             (select 1
                                from vd_i_afw_11_atrib_entit ae
                               where     ae.nom = 'DNR_REF_APLIC'
                                     and ae.ref_entit = e.seqnc))
      order by ordre_exect;

    cursor cur_afw_11_aplic (pnu_prodt in number)
    is
      select a.seqnc
            ,a.code
            ,a.nom
            ,a.numr_aplic_apex numr_aplic_cible
            ,a.ref_versn
            ,a.indic_aplic_authe
            ,a.ref_aplic_authe
            ,a.ref_page_conxn
        from vd_afw_11_aplic a
       where a.ref_prodt = pnu_prodt;

    procedure alimn_seqnc_prodt (pnu_prodt_suplm   in number
                                ,pva_prodt_suplm   in varchar2)
    is
    begin
      gva_contx_courn   := 'PRODT';
      gnu_prodt_tempr   := gnu_prodt;
      gnu_prodt         := pnu_prodt_suplm;
      debtr_bloc ('Debut - Alimentation temporaire produit supplémentaire');
      ajout_ligne (' afw$migrt$pkg.vnu_seqnc_prodt_temp := afw$migrt$pkg.vnu_seqnc_prodt;');
      ajout_ligne (   ' afw$migrt$pkg.vnu_seqnc_prodt := afw_11_prodt_pkg.obten_prodt('''
                   || pva_prodt_suplm
                   || ''');');
      ajout_ligne ('  null;');
      termn_bloc ('Fin - Alimentation temporaire produit supplémentaire');
    end alimn_seqnc_prodt;

    procedure termn_seqnc_prodt
    is
    begin
      debtr_bloc ('Debut - Retour temporaire produit supplémentaire');
      ajout_ligne ('  afw$migrt$pkg.vnu_seqnc_prodt := afw$migrt$pkg.vnu_seqnc_prodt_temp;');
      ajout_ligne ('  null;');
      termn_bloc ('Fin - Retour temporaire produit supplémentaire');
      gva_contx_courn   := 'DOMN';
      gnu_prodt         := gnu_prodt_tempr;
    end termn_seqnc_prodt;

    procedure alimn_seqnc_aplic (pnu_aplic_suplm   in number
                                ,pva_aplic_suplm   in varchar2)
    is
    begin
      gnu_aplic   := pnu_aplic_suplm;
      debtr_bloc ('Debut - Alimentation temporaire application supplémentaire');
      ajout_ligne (   '  afw$migrt$pkg.'
                   || obten_tabl_entit ('apexframework'
                                       ,'afw_11_aplic')
                   || '(' --var_aplic('
                   || pnu_aplic_suplm
                   || ') := afw_11_aplic_pkg.obten_aplic('''
                   || pva_aplic_suplm
                   || ''');');
      ajout_ligne ('  null;');
      termn_bloc ('Fin - Alimentation temporaire application supplémentaire');
    end alimn_seqnc_aplic;
  begin
    --Mettre à jour le domaine et initialiser les valeurs si nous sommes en train de migrer un domaine
    open cur_afw_12_domn;

    fetch cur_afw_12_domn
      into rec_afw_12_domn;

    close cur_afw_12_domn;

    gnu_index_genrl         := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne ('set define off');
    ajout_ligne ('set serveroutput on');
    ajout_ligne ('set feedback off');
    ajout_ligne ();
    --    ajout_ligne (   'alter session set current_schema = '
    --                 || gva_schem
    --                 || ';');
    ajout_ligne ();

    ajout_ligne ('prompt ========================================');
    ajout_ligne (   'prompt Installation du domaine: '
                 || rec_afw_12_domn.code
                 || ' - '
                 || convert (rec_afw_12_domn.nom
                            ,'US7ASCII'));

    ajout_ligne ('prompt ========================================');
    ajout_ligne (   'prompt ...Prealimentation des produits dependants: '
                 || rec_afw_12_domn.code
                 || ' - '
                 || convert (rec_afw_12_domn.nom
                            ,'US7ASCII'));

    gbo_alimn_prodt_suplm   := true;

    for rec_afw_11_prodt in cur_afw_11_prodt
    loop
      if instr (   gva_prodt_charg_domn
                || ':'
               ,   rec_afw_11_prodt.seqnc
                || ':') = 0
      then
        ajout_ligne (   'prompt ......Produit: '
                     || rec_afw_11_prodt.code);
        --Ajouter le produit au produit chargé
        gva_prodt_charg_domn      :=
             gva_prodt_charg_domn
          || to_char (rec_afw_11_prodt.seqnc)
          || ':';

        alimn_seqnc_prodt (rec_afw_11_prodt.seqnc
                          ,rec_afw_11_prodt.code);

        for rec_entit in cur_entit_prodt (rec_afw_11_prodt.seqnc)
        loop
          valdt_entit (rec_entit.nom
                      ,rec_entit.nom_table_tempr
                      ,rec_entit.nom_table_ereur);
          --Définir tableaux de varray (mapping nom)
          alimn_tabl_entit (rec_entit.schem
                           ,rec_entit.nom
                           ,   'var_'
                            || formt_nom_entit (rec_entit.seqnc));
          debtr_bloc (   'Debut - Produit dependant '
                      || rec_afw_11_prodt.code
                      || ' - '
                      || rec_entit.nom);
          ajout_ligne_comnt (   'Debut - '
                             || rec_entit.nom);

          gnu_nombr_seprt         := rec_entit.longr_bloc;
          vva_enonc_sql           :=
            obten_sql_entit (rec_entit.seqnc
                            ,rec_entit.ref_versn);

          gnu_index_selct         := afw_07_clob_pkg.creer_nouv ();
          gnu_index_alimn_table   := afw_07_clob_pkg.creer_nouv ();
          gnu_index_clob          := afw_07_clob_pkg.creer_nouv ();

          if    rec_entit.indic_creer_ocurn = 'O'
             or rec_entit.indic_modif_ocurn = 'O'
             or rec_entit.indic_suprm_ocurn = 'O'
             or rec_entit.indic_force_selct = 'O'
          then
            trait_genrq (rec_entit.seqnc
                        ,rec_entit.nom
                        ,vva_enonc_sql);
          end if;

          afw_07_clob_pkg.termn (gnu_index_alimn_table);
          afw_07_clob_pkg.termn (gnu_index_clob);

          --Storer la nouvelle seqnc
          afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                     ,gnu_index_selct);
          afw_07_clob_pkg.termn (gnu_index_selct);

          ajout_ligne_comnt (   'Fin - '
                             || rec_entit.nom);
          termn_bloc (   'Fin - Produit dependant '
                      || rec_afw_11_prodt.code
                      || ' - '
                      || rec_entit.nom);
        end loop;

        gva_contx_courn   := 'APLIC';

        for rec_aplic in cur_afw_11_aplic (rec_afw_11_prodt.seqnc)
        loop
          alimn_seqnc_aplic (rec_aplic.seqnc
                            ,rec_aplic.code);

          for rec_entit in cur_entit_aplic
          loop
            valdt_entit (rec_entit.nom
                        ,rec_entit.nom_table_tempr
                        ,rec_entit.nom_table_ereur);
            --Définir tableaux de varray (mapping nom)
            alimn_tabl_entit (rec_entit.schem
                             ,rec_entit.nom
                             ,   'var_'
                              || formt_nom_entit (rec_entit.seqnc));
            debtr_bloc (   'Debut - Application dependante '
                        || rec_aplic.code
                        || ' - '
                        || rec_entit.nom);
            ajout_ligne_comnt (   'Debut - '
                               || rec_entit.nom);

            gnu_nombr_seprt         := rec_entit.longr_bloc;
            vva_enonc_sql           :=
              obten_sql_entit (rec_entit.seqnc
                              ,rec_entit.ref_versn);

            gnu_index_selct         := afw_07_clob_pkg.creer_nouv ();
            gnu_index_alimn_table   := afw_07_clob_pkg.creer_nouv ();
            gnu_index_clob          := afw_07_clob_pkg.creer_nouv ();

            if    rec_entit.indic_creer_ocurn = 'O'
               or rec_entit.indic_modif_ocurn = 'O'
               or rec_entit.indic_suprm_ocurn = 'O'
               or rec_entit.indic_force_selct = 'O'
            then
              trait_genrq (rec_entit.seqnc
                          ,rec_entit.nom
                          ,vva_enonc_sql);
            end if;

            afw_07_clob_pkg.termn (gnu_index_alimn_table);
            afw_07_clob_pkg.termn (gnu_index_clob);

            --Storer la nouvelle seqnc
            afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                       ,gnu_index_selct);
            afw_07_clob_pkg.termn (gnu_index_selct);

            ajout_ligne_comnt (   'Fin - '
                               || rec_entit.nom);
            termn_bloc (   'Fin - Application dependante '
                        || rec_aplic.code
                        || ' - '
                        || rec_entit.nom);
          end loop;
        end loop;

        termn_seqnc_prodt;
      end if;
    end loop;

    gbo_alimn_prodt_suplm   := false;

    ajout_ligne ();
    debtr_bloc (   'Debut - Initialisation - Domaine - '
                || rec_afw_12_domn.code);
    ajout_ligne (   '  afw$migrt$pkg.'
                 || obten_tabl_entit ('apexframework'
                                     ,'afw_12_domn')
                 || '(' --var_domn('
                 || formt_numrq (rec_afw_12_domn.seqnc)
                 || ') := afw_12_domn_pkg.modfc_domn (null,'
                 || formt_chain (rec_afw_12_domn.code)
                 || ','
                 || formt_chain (rec_afw_12_domn.nom)
                 || ','
                 || formt_numrq (rec_afw_12_domn.descr)
                 || ');');
    ajout_ligne ();
    termn_bloc (   'Fin - Initialisation - Domaine - '
                || rec_afw_12_domn.code);
    ajout_ligne ();

    --Ouvrir un clob pour les updates à faire.
    gnu_index_updat         := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne ('prompt ...Metadonnees des entites');

    for rec_entit in cur_entit
    loop
      valdt_entit (rec_entit.nom
                  ,rec_entit.nom_table_tempr
                  ,rec_entit.nom_table_ereur);
      --Définir tableaux de varray (mapping nom)
      alimn_tabl_entit (rec_entit.schem
                       ,rec_entit.nom
                       ,   'var_'
                        || formt_nom_entit (rec_entit.seqnc));

      --Section clob_update
      begin
        ajout_ligne ('begin'
                    ,gnu_index_updat);
        ajout_ligne ('if afw$migrt$pkg.vnu_sql_code = 0 then'
                    ,gnu_index_updat);
      end;

      ajout_ligne (   'prompt ......'
                   || substr (rec_entit.nom
                             ,  instr (rec_entit.nom
                                      ,'_'
                                      ,5)
                              + 1));

      ajout_ligne_comnt (   'Debut - '
                         || rec_entit.nom);
      debtr_bloc (   'Debut - '
                  || rec_entit.nom);

      ajout_ligne (   'delete from '
                   || rec_entit.nom_table_tempr
                   || ';');
      ajout_ligne ();

      gnu_nombr_seprt         := rec_entit.longr_bloc;
      vva_enonc_sql           :=
        obten_sql_entit (rec_entit.seqnc
                        ,rec_entit.ref_versn);


      gnu_index_selct         := afw_07_clob_pkg.creer_nouv ();
      gnu_index_alimn_table   := afw_07_clob_pkg.creer_nouv ();
      gnu_index_clob          := afw_07_clob_pkg.creer_nouv ();

      if    rec_entit.indic_creer_ocurn = 'O'
         or rec_entit.indic_modif_ocurn = 'O'
         or rec_entit.indic_suprm_ocurn = 'O'
         or rec_entit.indic_force_selct = 'O'
      then
        trait_genrq (rec_entit.seqnc
                    ,rec_entit.nom
                    ,vva_enonc_sql);
      end if;

      if rec_entit.indic_force_selct = 'N'
      then
        afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                   ,gnu_index_alimn_table);
      end if;

      afw_07_clob_pkg.termn (gnu_index_alimn_table);


      termn_bloc (   'Début Clob - '
                  || rec_entit.nom);
      afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                 ,gnu_index_clob);
      afw_07_clob_pkg.termn (gnu_index_clob);
      debtr_bloc (   'Fin Clob - '
                  || rec_entit.nom);

      if gbo_presn_don
      then
        if gnu_nombr_seprt is not null
        then
          termn_bloc (   'Fin partie - '
                      || rec_entit.nom);
          debtr_bloc (   'Debut partie - '
                      || rec_entit.nom);
        end if;

        --Ajouter nouvelle ligne, update celle présente
        if (   rec_entit.indic_creer_ocurn = 'O'
            or rec_entit.indic_modif_ocurn = 'O')
        then
          if rec_entit.indic_suprm_don_prodt = 'O'
          then
            ajout_ligne ();
            ajout_ligne (   'delete from '
                         || rec_entit.nom
                         || '
                            where dnr_ref_domn = afw$migrt$pkg.'
                         || obten_tabl_entit ('apexframework'
                                             ,'afw_12_domn')
                         || '(' --var_domn('
                         || formt_numrq (rec_afw_12_domn.seqnc)
                         || ');');
          end if;

          ajout_ligne ();
          ajout_ligne (   'merge into '
                       || rec_entit.nom
                       || ' t
                        using '
                       || rec_entit.nom_table_tempr
                       || ' tf
               on ('
                       || obten_ligne_atrib_entit (rec_entit.seqnc
                                                  ,'MERGE'
                                                  ,'''CLE_FONCT'''
                                                  ,'t'
                                                  ,'tf'
                                                  ,' and')
                       || ')');

          if rec_entit.indic_creer_ocurn = 'O'
          then
            ajout_ligne (   'when not matched then
              insert ('
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'INSER'
                                                    ,'''VALR_MIGRE'', ''CLE_FONCT'''
                                                    , /*, ''CLE_REFRN''',*/
                                                     't')
                         || ')
              values ('
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'INSER'
                                                    ,'''VALR_MIGRE'', ''CLE_FONCT'''
                                                    , /*, ''CLE_REFRN''',*/
                                                     'tf')
                         || ')');
          end if;

          if rec_entit.indic_modif_ocurn = 'O'
          then
            ajout_ligne (   'when matched then
              update set '
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'UPDAT'
                                                    ,'''VALR_MIGRE'''
                                                    , --''CLE_REFRN''',
                                                     't'
                                                    ,'tf'));
          end if;

          ajout_ligne (   'log errors into '
                       || rec_entit.nom_table_ereur);
          ajout_ligne ('reject limit unlimited');

          ajout_ligne (';');
          ajout_ligne ();

          ajout_ligne ('declare');
          ajout_ligne ('  vnu_count pls_integer;');
          ajout_ligne ('begin');
          ajout_ligne (   '  select count(1) into vnu_count from '
                       || rec_entit.nom_table_ereur
                       || ';');
          ajout_ligne ();
          ajout_ligne ('  if vnu_count > 0 then');
          ajout_ligne (   '    afw$migrt$pkg.defnr_ereur ('
                       || formt_chain (   'Merge sur '
                                       || rec_entit.nom)
                       || ');');
          ajout_ligne ('  end if;');
          ajout_ligne ('end;');
          ajout_ligne ();
        end if;

        if rec_entit.indic_suprm_ocurn = 'O'
        then
          ajout_ligne (   'delete '
                       || rec_entit.nom
                       || ' t
            where t.dnr_ref_domn = afw$migrt$pkg.'
                       || obten_tabl_entit ('apexframework'
                                           ,'afw_12_domn')
                       || '(' --var_domn('
                       || formt_numrq (rec_afw_12_domn.seqnc)
                       || ')
              and not exists (select null
                                from '
                       || rec_entit.nom_table_tempr
                       || ' tf
                               where '
                       || obten_ligne_atrib_entit (rec_entit.seqnc
                                                  ,'MERGE'
                                                  ,'''CLE_FONCT'''
                                                  ,'t'
                                                  ,'tf'
                                                  ,' and')
                       || ');');
          ajout_ligne ();
        end if;

        if gnu_nombr_seprt is not null
        then
          termn_bloc (   'Fin partie - '
                      || rec_entit.nom);
          debtr_bloc (   'Debut partie - '
                      || rec_entit.nom);
        end if;

        gbo_presn_don   := false;
      end if;

      --Storer la nouvelle seqnc
      afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                 ,gnu_index_selct);
      afw_07_clob_pkg.termn (gnu_index_selct);

      ajout_ligne_comnt (   'Fin - '
                         || rec_entit.nom);
      termn_bloc (   'Fin - '
                  || rec_entit.nom);

      --Section clob_update
      begin
        ajout_ligne ('declare'
                    ,gnu_index_updat);
        ajout_ligne ('  vnu_count pls_integer;'
                    ,gnu_index_updat);
        ajout_ligne ('begin'
                    ,gnu_index_updat);
        ajout_ligne (   '  select count(1) into vnu_count from '
                     || rec_entit.nom_table_ereur
                     || ';'
                    ,gnu_index_updat);
        ajout_ligne (null
                    ,gnu_index_updat);
        ajout_ligne ('  if vnu_count > 0 then'
                    ,gnu_index_updat);
        ajout_ligne (   '    afw$migrt$pkg.defnr_ereur ('
                     || formt_chain (   'Update sur '
                                     || rec_entit.nom)
                     || ');'
                    ,gnu_index_updat);
        ajout_ligne ('  end if;'
                    ,gnu_index_updat);
        ajout_ligne ('end;'
                    ,gnu_index_updat);
        ajout_ligne (null
                    ,gnu_index_updat);
        ajout_ligne ('null;'
                    ,gnu_index_updat);
        ajout_ligne ('end if;'
                    ,gnu_index_updat);
        ajout_ligne ('exception'
                    ,gnu_index_updat);
        ajout_ligne ('when others then'
                    ,gnu_index_updat);
        ajout_ligne (   'afw$migrt$pkg.defnr_ereur ('
                     || formt_chain (   'Update sur '
                                     || rec_entit.nom)
                     || ');'
                    ,gnu_index_updat);
        ajout_ligne ('end;'
                    ,gnu_index_updat);
        ajout_ligne ('/'
                    ,gnu_index_updat);
        ajout_ligne (''
                    ,gnu_index_updat);
      end;
    end loop;

    afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                               ,gnu_index_updat);
    afw_07_clob_pkg.termn (gnu_index_updat);

    ajout_ligne ('begin');
    ajout_ligne ('if afw$migrt$pkg.vnu_sql_code = 0 then');
    ajout_ligne (   'update afw_12_domn
                       set procd_apres_conxn = 
                 '
                 || formt_chain (rec_afw_12_domn.procd_apres_conxn)
                 || ', procd_avant_conxn =
                 '
                 || formt_chain (rec_afw_12_domn.procd_avant_conxn)
                 || ', procd_obten_infor_utils = 
                 '
                 || formt_chain (rec_afw_12_domn.procd_obten_infor_utils)
                 || '
                     where seqnc = afw$migrt$pkg.'
                 || obten_tabl_entit ('apexframework'
                                     ,'afw_12_domn')
                 || '('
                 || formt_numrq (rec_afw_12_domn.seqnc)
                 || ');');
    ajout_ligne ('end if;');
    ajout_ligne ('exception');
    ajout_ligne ('when others then');
    ajout_ligne ('  afw$migrt$pkg.defnr_ereur (''Update sur afw_12_domn'');');
    ajout_ligne ('end;');
    ajout_ligne ('/');
    ajout_ligne ();


    ajout_clob_fichr_compr (gnu_index_genrl
                           ,   'd'
                            || rec_afw_12_domn.nom_fichr
                            || '_meta.sql');

    afw_07_clob_pkg.termn (gnu_index_genrl);
  end genr_fichr_migrt_domn;

  procedure genr_fichr_migrt_schem
  is
    cursor cur_entit
    is
        select seqnc
              ,lower (nom)                nom
              ,lower (nom_table_tempr)    nom_table_tempr
              ,lower (nom_table_ereur)    nom_table_ereur
              ,indic_creer_ocurn
              ,indic_modif_ocurn
              ,indic_suprm_ocurn
              ,indic_force_selct
              ,ref_versn
              ,longr_bloc
              ,indic_expor_tabl_index
              ,indic_suprm_don_prodt
              ,lower (ref_schem_prodt_code) schem
              ,trim (where_claus_custm)   where_claus_custm
          from vd_afw_11_entit e
         where     niv_inclu_migrt = 'PERSN'
               and ref_schem_prodt = gnu_schem
      order by ordre_exect;

    cursor cur_schem
    is
        select sp.seqnc
              ,sp.code
              ,sp.nom
          from vd_afw_11_schem_prodt sp
         where     sp.seqnc = gnu_schem
               and sp.indic_deplm = 'O'
      order by sp.nom;

    rec_afw_11_schem   cur_schem%rowtype;

    vva_enonc_sql      varchar2 (32767);
  begin
    open cur_schem;

    fetch cur_schem
      into rec_afw_11_schem;

    close cur_schem;

    gnu_index_genrl   := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne ('set define off');
    ajout_ligne ('set serveroutput on');
    ajout_ligne ('set feedback off');
    ajout_ligne ();
    --    ajout_ligne (   'alter session set current_schema = '
    --                 || rec_afw_11_schem.code
    --                 || ';');
    ajout_ligne ();

    ajout_ligne ('prompt ========================================');
    ajout_ligne (   'prompt Installation du metaschema: '
                 || rec_afw_11_schem.code
                 || ' - '
                 || convert (rec_afw_11_schem.nom
                            ,'US7ASCII'));


    ajout_ligne ();
    debtr_bloc ('Debut - Initialisation');
    ajout_ligne (   '  afw$migrt$pkg.vva_code_prodt := '''
                 || afw_11_prodt_pkg.obten_code_prodt (gnu_prodt)
                 || ''';');
    termn_bloc ('Fin - Initialisation');
    ajout_ligne ();

    --Ouvrir un clob pour les updates à faire.
    gnu_index_updat   := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne ('prompt ...Metadonnees des entites');

    for rec_entit in cur_entit
    loop
      valdt_entit (rec_entit.nom
                  ,rec_entit.nom_table_tempr
                  ,rec_entit.nom_table_ereur);
      --Définir tableaux de varray (mapping nom)
      alimn_tabl_entit (rec_entit.schem
                       ,rec_entit.nom
                       ,   'var_'
                        || formt_nom_entit (rec_entit.seqnc));

      --Section clob_update
      begin
        ajout_ligne ('begin'
                    ,gnu_index_updat);
        ajout_ligne ('if afw$migrt$pkg.vnu_sql_code = 0 then'
                    ,gnu_index_updat);
      end;

      ajout_ligne (   'prompt ......'
                   || rec_entit.nom);

      ajout_ligne_comnt (   'Debut - '
                         || rec_entit.nom);
      debtr_bloc (   'Debut - '
                  || rec_entit.nom);

      ajout_ligne (   'delete from '
                   || rec_entit.schem
                   || '.'
                   || rec_entit.nom_table_tempr
                   || ';');
      ajout_ligne ();

      gnu_nombr_seprt         := rec_entit.longr_bloc;
      vva_enonc_sql           :=
        obten_sql_entit (rec_entit.seqnc
                        ,rec_entit.ref_versn);


      gnu_index_selct         := afw_07_clob_pkg.creer_nouv ();
      gnu_index_alimn_table   := afw_07_clob_pkg.creer_nouv ();
      gnu_index_clob          := afw_07_clob_pkg.creer_nouv ();

      if    rec_entit.indic_creer_ocurn = 'O'
         or rec_entit.indic_modif_ocurn = 'O'
         or rec_entit.indic_suprm_ocurn = 'O'
         or rec_entit.indic_force_selct = 'O'
      then
        trait_genrq (rec_entit.seqnc
                    ,rec_entit.nom
                    ,vva_enonc_sql);
      end if;

      if rec_entit.indic_force_selct = 'N'
      then
        afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                   ,gnu_index_alimn_table);
      end if;

      afw_07_clob_pkg.termn (gnu_index_alimn_table);


      termn_bloc (   'Début Clob - '
                  || rec_entit.nom);
      afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                 ,gnu_index_clob);
      afw_07_clob_pkg.termn (gnu_index_clob);
      debtr_bloc (   'Fin Clob - '
                  || rec_entit.nom);

      if gbo_presn_don
      then
        if gnu_nombr_seprt is not null
        then
          termn_bloc (   'Fin partie - '
                      || rec_entit.nom);
          debtr_bloc (   'Debut partie - '
                      || rec_entit.nom);
        end if;

        --Ajouter nouvelle ligne, update celle présente
        if (   rec_entit.indic_creer_ocurn = 'O'
            or rec_entit.indic_modif_ocurn = 'O')
        then
          if rec_entit.indic_suprm_don_prodt = 'O'
          then
            ajout_ligne ();
            ajout_ligne (   'delete from '
                         || rec_entit.schem
                         || '.'
                         || rec_entit.nom
                         || case
                              when rec_entit.where_claus_custm is not null
                              then
                                   ' where ('
                                || rec_entit.where_claus_custm
                                || ')'
                              else
                                null
                            end
                         || ';');
          end if;

          ajout_ligne ();
          ajout_ligne (   'merge into '
                       || rec_entit.schem
                       || '.'
                       || rec_entit.nom
                       || ' t
                        using '
                       || rec_entit.schem
                       || '.'
                       || rec_entit.nom_table_tempr
                       || ' tf
               on ('
                       || obten_ligne_atrib_entit (rec_entit.seqnc
                                                  ,'MERGE'
                                                  ,'''CLE_FONCT'''
                                                  ,'t'
                                                  ,'tf'
                                                  ,' and')
                       || ')');

          if rec_entit.indic_creer_ocurn = 'O'
          then
            ajout_ligne (   'when not matched then
              insert ('
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'INSER'
                                                    ,'''VALR_MIGRE'', ''CLE_FONCT'''
                                                    , /*, ''CLE_REFRN''',*/
                                                     't')
                         || ')
              values ('
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'INSER'
                                                    ,'''VALR_MIGRE'', ''CLE_FONCT'''
                                                    , /*, ''CLE_REFRN''',*/
                                                     'tf')
                         || ')');
          end if;

          if rec_entit.indic_modif_ocurn = 'O'
          then
            ajout_ligne (   'when matched then
              update set '
                         || obten_ligne_atrib_entit (rec_entit.seqnc
                                                    ,'UPDAT'
                                                    ,'''VALR_MIGRE'''
                                                    , --''CLE_REFRN''',
                                                     't'
                                                    ,'tf'));
          end if;

          ajout_ligne (   'log errors into '
                       || rec_entit.schem
                       || '.'
                       || rec_entit.nom_table_ereur);
          ajout_ligne ('reject limit unlimited');

          ajout_ligne (';');
          ajout_ligne ();

          ajout_ligne ('declare');
          ajout_ligne ('  vnu_count pls_integer;');
          ajout_ligne ('begin');
          ajout_ligne (   '  select count(1) into vnu_count from '
                       || rec_entit.schem
                       || '.'
                       || rec_entit.nom_table_ereur
                       || ';');
          ajout_ligne ();
          ajout_ligne ('  if vnu_count > 0 then');
          ajout_ligne (   '    afw$migrt$pkg.defnr_ereur ('
                       || formt_chain (   'Merge sur '
                                       || rec_entit.schem
                                       || '.'
                                       || rec_entit.nom)
                       || ');');
          ajout_ligne ('  end if;');
          ajout_ligne ('end;');
          ajout_ligne ();
        end if;

        if rec_entit.indic_suprm_ocurn = 'O'
        then
          ajout_ligne (   'delete '
                       || rec_entit.schem
                       || '.'
                       || rec_entit.nom
                       || ' t
            where '
                       || case
                            when rec_entit.where_claus_custm is not null
                            then
                                 '('
                              || rec_entit.where_claus_custm
                              || ') and '
                            else
                              null
                          end
                       || 'not exists (select null
                                from '
                       || rec_entit.nom_table_tempr
                       || ' tf
                               where '
                       || obten_ligne_atrib_entit (rec_entit.seqnc
                                                  ,'MERGE'
                                                  ,'''CLE_FONCT'''
                                                  ,'t'
                                                  ,'tf'
                                                  ,' and')
                       || ');');
          ajout_ligne ();
        end if;

        if gnu_nombr_seprt is not null
        then
          termn_bloc (   'Fin partie - '
                      || rec_entit.schem
                      || '.'
                      || rec_entit.nom);
          debtr_bloc (   'Debut partie - '
                      || rec_entit.schem
                      || '.'
                      || rec_entit.nom);
        end if;

        gbo_presn_don   := false;
      end if;

      --Storer la nouvelle seqnc
      afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                                 ,gnu_index_selct);
      afw_07_clob_pkg.termn (gnu_index_selct);

      ajout_ligne_comnt (   'Fin - '
                         || rec_entit.schem
                         || '.'
                         || rec_entit.nom);
      termn_bloc (   'Fin - '
                  || rec_entit.schem
                  || '.'
                  || rec_entit.nom);

      --Section clob_update
      begin
        ajout_ligne ('declare'
                    ,gnu_index_updat);
        ajout_ligne ('  vnu_count pls_integer;'
                    ,gnu_index_updat);
        ajout_ligne ('begin'
                    ,gnu_index_updat);
        ajout_ligne (   '  select count(1) into vnu_count from '
                     || rec_entit.schem
                     || '.'
                     || rec_entit.nom_table_ereur
                     || ';'
                    ,gnu_index_updat);
        ajout_ligne (null
                    ,gnu_index_updat);
        ajout_ligne ('  if vnu_count > 0 then'
                    ,gnu_index_updat);
        ajout_ligne (   '    afw$migrt$pkg.defnr_ereur ('
                     || formt_chain (   'Update sur '
                                     || rec_entit.schem
                                     || '.'
                                     || rec_entit.nom)
                     || ');'
                    ,gnu_index_updat);
        ajout_ligne ('  end if;'
                    ,gnu_index_updat);
        ajout_ligne ('end;'
                    ,gnu_index_updat);
        ajout_ligne (null
                    ,gnu_index_updat);
        ajout_ligne ('null;'
                    ,gnu_index_updat);
        ajout_ligne ('end if;'
                    ,gnu_index_updat);
        ajout_ligne ('exception'
                    ,gnu_index_updat);
        ajout_ligne ('when others then'
                    ,gnu_index_updat);
        ajout_ligne (   'afw$migrt$pkg.defnr_ereur ('
                     || formt_chain (   'Update sur '
                                     || rec_entit.schem
                                     || '.'
                                     || rec_entit.nom)
                     || ');'
                    ,gnu_index_updat);
        ajout_ligne ('end;'
                    ,gnu_index_updat);
        ajout_ligne ('/'
                    ,gnu_index_updat);
        ajout_ligne (''
                    ,gnu_index_updat);
      end;
    end loop;

    afw_07_clob_pkg.fusnr_clob (gnu_index_genrl
                               ,gnu_index_updat);
    afw_07_clob_pkg.termn (gnu_index_updat);

    ajout_ligne ();
    debtr_bloc ('Debut - Nettoyage');
    ajout_ligne ('  afw$migrt$pkg.vva_code_prodt := afw$migrt$pkg.vva_code_prodt_afw;');
    termn_bloc ('Fin - Nettoyage');
    ajout_ligne ();

    ajout_ligne ();
    --    ajout_ligne (   'alter session set current_schema = '
    --                 || gva_schem_afw
    --                 || ';');
    ajout_ligne ();

    ajout_clob_fichr_compr (gnu_index_genrl
                           ,   's'
                            || rec_afw_11_schem.seqnc
                            || '_meta.sql');

    afw_07_clob_pkg.termn (gnu_index_genrl);
  end genr_fichr_migrt_schem;

  procedure genr_fichr_grant_pre
  is
  begin
    gnu_index_genrl   := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne ();
    ajout_ligne ('grant create any table to apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('grant drop any table to apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('grant select any table to apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('grant insert any table to apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('grant update any table to apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('grant delete any table to apexframework;');
    ajout_ligne ();

    /*
    for i in gta_tabl_schem_custm.first () .. gta_tabl_schem_custm.last ()
    loop
      null;
    end loop;
    */

    ajout_clob_fichr_compr (gnu_index_genrl
                           ,kva_nom_fichr_insta_grant_pre);

    --kva_nom_fichr_insta_grant_post   constant varchar2 (30) default 'install_grant_post.sql';

    afw_07_clob_pkg.termn (gnu_index_genrl);
  end genr_fichr_grant_pre;

  procedure genr_fichr_grant_post
  is
  begin
    gnu_index_genrl   := afw_07_clob_pkg.creer_nouv ();

    ajout_ligne ();
    ajout_ligne ('revoke create any table from apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('revoke drop any table from apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('revoke select any table from apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('revoke insert any table from apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('revoke update any table from apexframework;');
    ajout_ligne ();

    ajout_ligne ();
    ajout_ligne ('revoke delete any table from apexframework;');
    ajout_ligne ();

    ajout_clob_fichr_compr (gnu_index_genrl
                           ,kva_nom_fichr_insta_grant_post);

    afw_07_clob_pkg.termn (gnu_index_genrl);
  end genr_fichr_grant_post;

  procedure telch_fichr_expor_metdn_afw (pva_contx         in varchar2
                                        ,pnu_seqnc_contx   in number
                                        ,pva_nom_fichr     in varchar2 default null
                                        ,pva_schem         in varchar2 default null
                                        ,pva_domn          in varchar2 default null)
  is
    vcl_final       clob;
    vva_nom_fichr   varchar2 (200);
    vva_schem       varchar2 (3000) default pva_schem;

    cursor cur_aplic_a_migr
    is
        select afw_11_aplic_pkg.obten_code_aplic (ea.ref_aplic) as code_aplic
              ,ea.ref_aplic
              ,ea.indic_maj_refrn
              ,ea.numr_aplic_cible
          from vd_afw_13_expor_aplic ea
         where ea.ref_sesn = afw_12_sesn_pkg.obten_sesn ()
      order by ea.ref_aplic_aplic_authe nulls first;

    cursor cur_domn_a_migr
    is
      select d.column_value seqnc
        from table (afw_07_util_pkg.strin_to_table_nu (pva_domn)) d;

    cursor cur_schem_a_migr
    is
        select sp.seqnc
              ,lower (sp.code) code
          from vd_afw_11_schem_prodt sp
         where     sp.indic_deplm = 'O'
               and sp.ref_versn = gnu_versn
               and sp.ref_versn != gnu_versn_afw
      --and 1 = 2
      order by sp.code;
  begin
    if vva_schem is null
    then
      vva_schem   := afw_11_aplic_pkg.obten_schem (afw_11_aplic_pkg.obten_aplic ('SAFP'));
    end if;

    --Définir les variables globales du pkg
    gva_contx         := pva_contx;
    gnu_prodt         := pnu_seqnc_contx;
    gva_domn          := pva_domn;
    gva_schem         := vva_schem;
    gnu_versn_afw     := afw_11_prodt_pkg.obten_versn_courn (afw_11_prodt_pkg.obten_prodt ('AFW'));
    gnu_versn         := afw_11_prodt_pkg.obten_versn_courn (pnu_seqnc_contx);
    gva_schem_afw     := vva_schem;

    --Générer le fichier meta
    genr_fichr_migrt_meta;

    --Générer le ficher des app
    genr_fichr_migrt_app;

    --Générer le fichier global
    genr_fichr_migrt_globl;

    --Générer le spec/body du package de migration
    genr_fichr_migrt_initl;

    --Générer les opérations fait sur le produit
    gva_contx_courn   := 'PRODT';
    genr_fichr_migrt_prodt;

    --Générer les opérations pour chaque des applications migrées
    gva_contx_courn   := 'APLIC';

    for rec_aplic_a_migr in cur_aplic_a_migr
    loop
      gnu_aplic   := rec_aplic_a_migr.ref_aplic;

      if rec_aplic_a_migr.indic_maj_refrn = 'O'
      then
        afw_13_page_pkg.maj_table_a_partr_refrt_apex (gnu_aplic);
      end if;

      genr_fichr_migrt_aplic;
    end loop;

    --Générer la portion Domaine
    if gva_contx = 'PRODT'
    then
      gva_contx_courn   := 'DOMN';

      for rec_domn_a_migr in cur_domn_a_migr
      loop
        gnu_domn   := rec_domn_a_migr.seqnc;
        genr_fichr_migrt_domn;
      end loop;
    end if;

    --Générer la portion custom
    if gva_contx = 'PRODT'
    then
      gva_contx_courn   := 'SCHEM';

      for rec_schem_a_migr in cur_schem_a_migr
      loop
        gnu_schem                          := rec_schem_a_migr.seqnc;
        gta_tabl_schem_custm (gnu_schem)   := rec_schem_a_migr.code;

        genr_fichr_migrt_schem;
      end loop;

      if gnu_schem is not null
      then
        genr_fichr_grant_pre;
        genr_fichr_grant_post;
      end if;
    end if;

    --Préparer le nom du fichier.
    if pva_nom_fichr is not null
    then
      vva_nom_fichr      :=
           pva_nom_fichr
        || '.zip';
    else
      vva_nom_fichr      :=
           'fichr_migrt_'
        || lower (afw_11_prodt_pkg.obten_code_prodt (gnu_prodt))
        || '.zip';
    end if;

    termn_fichr_compr;

    --telechargement le fichier de migration
    afw_11_prodt_pkg.telvs_fichr (pbl_fichr              => gbl_zip
                                 ,pva_nom_fichr          => vva_nom_fichr
                                 ,pva_contn_type         => null
                                 ,pbo_arret_engin_apex   => true);
  end telch_fichr_expor_metdn_afw;

  procedure debt_enonc_inser (pva_table_tempr   in varchar2
                             ,pva_schem_tempr   in varchar2)
  is
  begin
    gta_elemn_enonc_inser.delete ();
    gva_ligne_selct   := null;
    gva_ligne_updat   := null;
    gva_ligne_inser      :=
         'insert into '
      || pva_schem_tempr
      || '.'
      || lower (pva_table_tempr)
      || ' (';
  end debt_enonc_inser;

  procedure ajout_elemn_enonc_inser (pva_code_coln     in varchar2
                                    ,pva_valr_varch    in varchar2
                                    ,pnu_valr_numbr    in number
                                    ,pda_valr_date     in date
                                    ,pva_indic_selct   in varchar2
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_indic_updat   in varchar2
                                    ,pcl_valr_clob     in clob default null
                                    ,pva_schem_refrn   in varchar2 default null)
  is
    i   pls_integer;
  begin
    i                                           := gta_elemn_enonc_inser.count ();
    gta_elemn_enonc_inser (i).nom_coln          := pva_code_coln;
    gta_elemn_enonc_inser (i).valr_varch        := pva_valr_varch;
    gta_elemn_enonc_inser (i).valr_numbr        := pnu_valr_numbr;
    gta_elemn_enonc_inser (i).valr_date         := pda_valr_date;
    gta_elemn_enonc_inser (i).valr_clob         := pcl_valr_clob;
    gta_elemn_enonc_inser (i).indic_selct       := pva_indic_selct;
    gta_elemn_enonc_inser (i).nom_entit_refrn   := pva_entit_refrn;
    gta_elemn_enonc_inser (i).nom_schem_refrn   := pva_schem_refrn;
    gta_elemn_enonc_inser (i).indic_updat       := pva_indic_updat;
  end ajout_elemn_enonc_inser;

  procedure ajout_elemn_enonc_inser (pva_code_coln     in varchar2
                                    ,pva_valr          in varchar2
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,pva_valr
                            ,null
                            ,null
                            ,'N'
                            ,pva_entit_refrn
                            ,'N'
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_inser;

  procedure ajout_elemn_enonc_inser (pva_code_coln     in varchar2
                                    ,pnu_valr          in number
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,null
                            ,pnu_valr
                            ,null
                            ,'N'
                            ,pva_entit_refrn
                            ,'N'
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_inser;

  procedure ajout_elemn_enonc_inser (pva_code_coln     in varchar2
                                    ,pda_valr          in date
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,null
                            ,null
                            ,pda_valr
                            ,'N'
                            ,pva_entit_refrn
                            ,'N'
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_inser;

  procedure ajout_elemn_enonc_inser (pva_code_coln     in varchar2
                                    ,pcl_valr          in clob
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,null
                            ,null
                            ,null
                            ,'N'
                            ,pva_entit_refrn
                            ,'N'
                            ,pcl_valr
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_inser;

  procedure ajout_elemn_enonc_selct (pva_code_coln     in varchar2
                                    ,pva_valr          in varchar2
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,pva_valr
                            ,null
                            ,null
                            ,'O'
                            ,pva_entit_refrn
                            ,'N'
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_selct;

  procedure ajout_elemn_enonc_selct (pva_code_coln     in varchar2
                                    ,pnu_valr          in number
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,null
                            ,pnu_valr
                            ,null
                            ,'O'
                            ,pva_entit_refrn
                            ,'N'
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_selct;

  procedure ajout_elemn_enonc_selct (pva_code_coln     in varchar2
                                    ,pda_valr          in date
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,null
                            ,null
                            ,pda_valr
                            ,'O'
                            ,pva_entit_refrn
                            ,'N'
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_selct;

  procedure ajout_elemn_enonc_selct (pva_code_coln     in varchar2
                                    ,pcl_valr          in clob
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,null
                            ,null
                            ,null
                            ,'O'
                            ,pva_entit_refrn
                            ,'N'
                            ,pcl_valr
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_selct;

  procedure ajout_elemn_enonc_updat (pva_code_coln     in varchar2
                                    ,pva_valr          in varchar2
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,pva_valr
                            ,null
                            ,null
                            ,'N'
                            ,pva_entit_refrn
                            ,'O'
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_updat;

  procedure ajout_elemn_enonc_updat (pva_code_coln     in varchar2
                                    ,pnu_valr          in number
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,null
                            ,pnu_valr
                            ,null
                            ,'N'
                            ,pva_entit_refrn
                            ,'O'
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_updat;

  procedure ajout_elemn_enonc_updat (pva_code_coln     in varchar2
                                    ,pda_valr          in date
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,null
                            ,null
                            ,pda_valr
                            ,'N'
                            ,pva_entit_refrn
                            ,'O'
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_updat;

  procedure ajout_elemn_enonc_updat (pva_code_coln     in varchar2
                                    ,pcl_valr          in clob
                                    ,pva_entit_refrn   in varchar2
                                    ,pva_schem_refrn   in varchar2)
  is
  begin
    ajout_elemn_enonc_inser (pva_code_coln
                            ,null
                            ,null
                            ,null
                            ,'N'
                            ,pva_entit_refrn
                            ,'O'
                            ,pcl_valr
                            ,pva_schem_refrn   => pva_schem_refrn);
  end ajout_elemn_enonc_updat;

  procedure ajout_bloc_limt (pva_entit   in varchar2
                            ,pnu_index   in number)
  is
  begin
    termn_bloc (pva_entit
               ,pnu_index);
    debtr_bloc (pva_entit
               ,pnu_index);
  end ajout_bloc_limt;

  procedure termn_enonc_inser (pva_entit in varchar2)
  is
    vva_ligne_valr   varchar2 (32767);
  begin
    gva_ligne_inser   := formt_chain_enonc (gva_ligne_inser);

    vva_ligne_valr    := ') values (';

    for i in gta_elemn_enonc_inser.first .. gta_elemn_enonc_inser.last
    loop
      if     gta_elemn_enonc_inser (i).indic_selct = 'N'
         and gta_elemn_enonc_inser (i).indic_updat = 'N'
      then
        vva_ligne_valr      :=
             vva_ligne_valr
          || case
               when gta_elemn_enonc_inser (i).valr_varch is not null
               then
                 formt_chain (gta_elemn_enonc_inser (i).valr_varch)
               when gta_elemn_enonc_inser (i).valr_numbr is not null
               then
                 case
                   when gta_elemn_enonc_inser (i).nom_coln like 'dnr_ref_aplic'
                   then
                     formt_fonct (gta_elemn_enonc_inser (i).valr_numbr
                                 ,obten_tabl_entit ('apexframework'
                                                   ,'afw_11_aplic') --'var_aplic'
                                 ,'Insert')
                   when gta_elemn_enonc_inser (i).nom_coln like 'dnr_ref_domn'
                   then
                     formt_fonct (gta_elemn_enonc_inser (i).valr_numbr
                                 ,obten_tabl_entit ('apexframework'
                                                   ,'afw_12_domn') --'var_domn'
                                 ,'Insert')
                   when gta_elemn_enonc_inser (i).nom_coln like '%ref_prodt'
                   then
                     'afw$migrt$pkg.vnu_seqnc_prodt'
                   when gta_elemn_enonc_inser (i).nom_coln like 'ref_dv_%'
                   then
                     formt_detl_domn_valr (afw_14_domn_valr_pkg.obten_code_parnt (gta_elemn_enonc_inser (i).valr_numbr)
                                          ,afw_14_domn_valr_pkg.obten_code (gta_elemn_enonc_inser (i).valr_numbr)
                                          ,'afw$migrt$pkg.vva_code_prodt')
                   when gta_elemn_enonc_inser (i).nom_coln like 'ref_%'
                   then
                     formt_fonct (gta_elemn_enonc_inser (i).valr_numbr
                                 ,obten_tabl_entit (gta_elemn_enonc_inser (i).nom_schem_refrn
                                                   ,gta_elemn_enonc_inser (i).nom_entit_refrn) --'var_'
                                 --|| gta_elemn_enonc_inser (i).seqnc
                                 /*|| substr (gta_elemn_enonc_inser (i).nom_entit_refrn
                                           ,8)*/
                                 ,'Insert')
                   else
                     formt_numrq (gta_elemn_enonc_inser (i).valr_numbr)
                 end
               when gta_elemn_enonc_inser (i).valr_date is not null
               then
                 formt_date (gta_elemn_enonc_inser (i).valr_date)
               else
                 formt_chain (null)
             end
          || ', ';
        gbo_merge   := true;
      elsif gta_elemn_enonc_inser (i).indic_selct = 'O'
      then
        gva_ligne_selct      :=
             gva_ligne_selct
          || gta_elemn_enonc_inser (i).nom_coln
          || case
               when gta_elemn_enonc_inser (i).valr_varch is not null
               then
                    ' = '
                 || formt_chain (gta_elemn_enonc_inser (i).valr_varch)
               when gta_elemn_enonc_inser (i).valr_numbr is not null
               then
                 case
                   when gta_elemn_enonc_inser (i).nom_coln like 'dnr_ref_aplic'
                   then
                        ' = '
                     || formt_fonct (gta_elemn_enonc_inser (i).valr_numbr
                                    ,obten_tabl_entit ('apexframework'
                                                      ,'afw_11_aplic') --'var_aplic'
                                    ,'Insert')
                   when gta_elemn_enonc_inser (i).nom_coln like 'dnr_ref_domn'
                   then
                        ' = '
                     || formt_fonct (gta_elemn_enonc_inser (i).valr_numbr
                                    ,obten_tabl_entit ('apexframework'
                                                      ,'afw_12_domn') --'var_domn'
                                    ,'Insert')
                   when gta_elemn_enonc_inser (i).nom_coln like '%ref_prodt'
                   then
                     ' = afw$migrt$pkg.vnu_seqnc_prodt'
                   when gta_elemn_enonc_inser (i).nom_coln like 'ref_dv_%'
                   then
                        ' = '
                     || formt_detl_domn_valr (afw_14_domn_valr_pkg.obten_code_parnt (gta_elemn_enonc_inser (i).valr_numbr)
                                             ,afw_14_domn_valr_pkg.obten_code (gta_elemn_enonc_inser (i).valr_numbr)
                                             ,'afw$migrt$pkg.vva_code_prodt')
                   when gta_elemn_enonc_inser (i).nom_coln like 'ref_%'
                   then
                        ' = '
                     || formt_fonct (gta_elemn_enonc_inser (i).valr_numbr
                                    ,obten_tabl_entit (gta_elemn_enonc_inser (i).nom_schem_refrn
                                                      ,gta_elemn_enonc_inser (i).nom_entit_refrn) --  'var_'
                                    --|| gta_elemn_enonc_inser (i).seqnc
                                    /*|| substr (gta_elemn_enonc_inser (i).nom_entit_refrn
                                              ,8)*/
                                    ,'Select')
                   else
                        ' = '
                     || formt_numrq (gta_elemn_enonc_inser (i).valr_numbr)
                 end
               when gta_elemn_enonc_inser (i).valr_date is not null
               then
                    ' = '
                 || formt_date (gta_elemn_enonc_inser (i).valr_date)
               else
                    ' is '
                 || formt_chain (null)
             end
          || ' and ';
      elsif gta_elemn_enonc_inser (i).indic_updat = 'O'
      then
        gva_ligne_updat      :=
             gva_ligne_updat
          || gta_elemn_enonc_inser (i).nom_coln
          || case
               when gta_elemn_enonc_inser (i).valr_varch is not null
               then
                    ' = '
                 || formt_chain (gta_elemn_enonc_inser (i).valr_varch)
               when gta_elemn_enonc_inser (i).valr_numbr is not null
               then
                 case
                   when gta_elemn_enonc_inser (i).nom_coln like 'dnr_ref_aplic'
                   then
                        ' = '
                     || formt_fonct (gta_elemn_enonc_inser (i).valr_numbr
                                    ,obten_tabl_entit ('apexframework'
                                                      ,'afw_11_aplic') --'var_aplic'
                                    ,'Insert')
                   when gta_elemn_enonc_inser (i).nom_coln like 'dnr_ref_domn'
                   then
                        ' = '
                     || formt_fonct (gta_elemn_enonc_inser (i).valr_numbr
                                    ,obten_tabl_entit ('apexframework'
                                                      ,'afw_12_domn') --'var_domn'
                                    ,'Insert')
                   when gta_elemn_enonc_inser (i).nom_coln like '%ref_prodt'
                   then
                     ' = afw$migrt$pkg.vnu_seqnc_prodt'
                   when gta_elemn_enonc_inser (i).nom_coln like 'ref_dv_%'
                   then
                        ' = '
                     || formt_detl_domn_valr (afw_14_domn_valr_pkg.obten_code_parnt (gta_elemn_enonc_inser (i).valr_numbr)
                                             ,afw_14_domn_valr_pkg.obten_code (gta_elemn_enonc_inser (i).valr_numbr)
                                             ,'afw$migrt$pkg.vva_code_prodt')
                   when gta_elemn_enonc_inser (i).nom_coln like 'ref_%'
                   then
                        ' = '
                     || formt_fonct (gta_elemn_enonc_inser (i).valr_numbr
                                    ,obten_tabl_entit (gta_elemn_enonc_inser (i).nom_schem_refrn
                                                      ,gta_elemn_enonc_inser (i).nom_entit_refrn) --'var_'
                                    --|| substr (gta_elemn_enonc_inser (i).nom_entit_refrn
                                    --        ,8)
                                    ,'Update')
                   else
                        ' = '
                     || formt_numrq (gta_elemn_enonc_inser (i).valr_numbr)
                 end
               when gta_elemn_enonc_inser (i).valr_date is not null
               then
                    ' = '
                 || formt_date (gta_elemn_enonc_inser (i).valr_date)
               else
                    ' = '
                 || formt_chain (null)
             end
          || ', ';
      end if;
    end loop;

    gva_ligne_selct      :=
         formt_chain_enonc (gva_ligne_selct
                           ,' and')
      || ';';

    gva_ligne_updat      :=
      formt_chain_enonc (gva_ligne_updat
                        ,',');

    vva_ligne_valr      :=
         formt_chain_enonc (vva_ligne_valr)
      || ');';
    ajout_ligne (   gva_ligne_inser
                 || vva_ligne_valr
                ,gnu_index_alimn_table);

    if gnu_compt_ligne_bloc > gnu_nombr_seprt
    then
      ajout_bloc_limt (pva_entit
                      ,gnu_index_alimn_table);
    end if;
  end termn_enonc_inser;

  procedure trait_genrq (pnu_seqnc_entit   in number
                        ,pva_entit         in varchar2
                        ,vva_enonc_sql        varchar2)
  is
    vva_entit               number (10);
    vva_table_tempr         varchar2 (30);
    vva_nom_varbl_rowtp     varchar2 (30)
                              default    'vre_'
                                      || substr (pva_entit
                                                ,1
                                                ,26);
    vva_varbl_ref_cursor    varchar2 (30) default 'vcu_cursr';
    vva_nom_coln_subst      varchar2 (30) default null;

    cursor cur_atrib
    is
        select lower (nom)                 nom
              ,type_don
              ,compr_migrt
              ,lower (ref_entit_refrn_formt) refrn
              , (select lower (ref_schem_prodt_code)
                   from vd_afw_11_entit e
                  where e.seqnc = ae.ref_entit_refrn)
                 schem_refrn
          from vd_afw_11_atrib_entit ae
         where     ae.ref_entit = pnu_seqnc_entit
               and compr_migrt not in ('NON_MIGRE')
      order by nom;

    cursor cur_atrib_inser_selct
    is
        select lower (nom)                 nom
              ,type_don
              ,compr_migrt
              ,lower (ref_entit_refrn_formt) refrn
              , (select lower (ref_schem_prodt_code)
                   from vd_afw_11_entit e
                  where e.seqnc = ae.ref_entit_refrn)
                 schem_refrn
          from vd_afw_11_atrib_entit ae
         where     ae.ref_entit = pnu_seqnc_entit
               and compr_migrt not in ('NON_MIGRE'
                                      ,'CLE_REFRN')
               and type_don not in ('C'
                                   ,'B')
      order by nom;

    cursor cur_atrib_updat
    is
        select lower (nom)                 nom
              ,type_don
              ,compr_migrt
              ,lower (ref_entit_refrn_formt) refrn
              , (select lower (ref_schem_prodt_code)
                   from vd_afw_11_entit e
                  where e.seqnc = ae.ref_entit_refrn)
                 schem_refrn
          from vd_afw_11_atrib_entit ae
         where     ae.ref_entit = pnu_seqnc_entit
               and compr_migrt = 'CLE_REFRN'
               and type_don not in ('C'
                                   ,'B')
      order by nom;

    cursor cur_atrib_inser_clob
    is
        select lower (nom)                 nom
              ,type_don
              ,compr_migrt
              ,lower (ref_entit_refrn_formt) refrn
          from vd_afw_11_atrib_entit ae
         where     ae.ref_entit = pnu_seqnc_entit
               and compr_migrt = 'VALR_MIGRE'
               and type_don = 'C'
      order by nom;

    vva_enonc_a_exect       varchar2 (32767);
    vva_declr_varbl         varchar2 (32767);
    vva_varbl_cursr         varchar2 (32767);
    vva_varbl_conct_chain   varchar2 (32767);
    vva_inser_elemn         varchar2 (32767);
    vva_selct_elemn         varchar2 (32767);
    vva_updat_elemn         varchar2 (32767);
    vva_clob_elemn          varchar2 (32767);
    vva_schem               varchar2 (30);
    vva_indic_presn_seqnc   varchar2 (1) default null;

    procedure ajout_enonc_a_exect (pva_code in varchar2)
    is
    begin
      vva_enonc_a_exect      :=
           vva_enonc_a_exect
        || pva_code;
    end ajout_enonc_a_exect;
  begin
    select nom_table_tempr
          ,ref_schem_prodt_code
      into vva_table_tempr
          ,vva_schem
      from vd_afw_11_entit
     where seqnc = pnu_seqnc_entit;

    begin
      select 'O'
        into vva_indic_presn_seqnc
        from vd_afw_11_entit e
       where     e.seqnc = pnu_seqnc_entit
             and exists
                   (select 1
                      from vd_i_afw_11_atrib_entit ae
                     where     ae.ref_entit = e.seqnc
                           and ae.nom = 'SEQNC');
    exception
      when no_data_found
      then
        vva_indic_presn_seqnc   := null;
    end;

    --Initialiser variable chaine selon atrib
    begin
      for rec_atrib in cur_atrib
      loop
        vva_declr_varbl      :=
             vva_declr_varbl
          || substr (   'var_'
                     || rec_atrib.nom
                    ,1
                    ,30)
          || ' '
          || obten_type_atrib (rec_atrib.type_don
                              ,';');

        vva_varbl_cursr      :=
             vva_varbl_cursr
          || substr (   'var_'
                     || rec_atrib.nom
                    ,1
                    ,30)
          || ', ';

        if     vva_nom_coln_subst is null
           and rec_atrib.compr_migrt = 'CLE_SUBST'
           and vva_indic_presn_seqnc is null
        then
          vva_nom_coln_subst      :=
            substr (rec_atrib.nom
                   ,1
                   ,30);
        end if;
      end loop;

      if     instr (vva_declr_varbl
                   ,'var_seqnc') = 0
         and vva_nom_coln_subst is null
      then
        vva_declr_varbl      :=
             vva_declr_varbl
          || ' var_seqnc number;';
      end if;

      for rec_atrib_inser_selct in cur_atrib_inser_selct
      loop
        vva_varbl_conct_chain      :=
             vva_varbl_conct_chain
          || 'afw_11_migrt_pkg.gva_ligne_inser := afw_11_migrt_pkg.gva_ligne_inser || '''
          || rec_atrib_inser_selct.nom
          || ', '
          || ''';'
          || gva_crlf;

        vva_inser_elemn      :=
             vva_inser_elemn
          || 'afw_11_migrt_pkg.ajout_elemn_enonc_inser('''
          || substr (rec_atrib_inser_selct.nom
                    ,1
                    ,30)
          || ''', '
          || substr (   'var_'
                     || rec_atrib_inser_selct.nom
                    ,1
                    ,30)
          || ', '''
          || substr (rec_atrib_inser_selct.refrn
                    ,1
                    ,30)
          || ''', '''
          || substr (rec_atrib_inser_selct.schem_refrn
                    ,1
                    ,30)
          || ''');'
          || gva_crlf;

        if rec_atrib_inser_selct.compr_migrt = 'CLE_FONCT'
        then
          vva_selct_elemn      :=
               vva_selct_elemn
            || 'afw_11_migrt_pkg.ajout_elemn_enonc_selct('''
            || substr (rec_atrib_inser_selct.nom
                      ,1
                      ,30)
            || ''', '
            || substr (   'var_'
                       || rec_atrib_inser_selct.nom
                      ,1
                      ,30)
            || ', '''
            || substr (rec_atrib_inser_selct.refrn
                      ,1
                      ,30)
            || ''', '''
            || substr (rec_atrib_inser_selct.schem_refrn
                      ,1
                      ,30)
            || ''');'
            || gva_crlf;
        end if;
      end loop;

      for rec_atrib_updat in cur_atrib_updat
      loop
        vva_updat_elemn      :=
             vva_updat_elemn
          || 'afw_11_migrt_pkg.ajout_elemn_enonc_updat('''
          || substr (rec_atrib_updat.nom
                    ,1
                    ,30)
          || ''', '
          || substr (   'var_'
                     || rec_atrib_updat.nom
                    ,1
                    ,30)
          || ', '''
          || substr (rec_atrib_updat.refrn
                    ,1
                    ,30)
          || ''', '''
          || substr (rec_atrib_updat.schem_refrn
                    ,1
                    ,30)
          || ''');'
          || gva_crlf;
      end loop;

      for rec_atrib_inser_clob in cur_atrib_inser_clob
      loop
        vva_clob_elemn      :=
             vva_clob_elemn
          || 'afw_11_migrt_pkg.alimn_clob_segmn_clob(' --Nom colonne clob
          || substr (   'var_'
                     || rec_atrib_inser_clob.nom
                    ,1
                    ,30)
          || ', '''
          || vva_table_tempr -- Nom Entité
          || ''', '''
          || substr (rec_atrib_inser_clob.nom --Nom atrib
                    ,1
                    ,30)
          || ''', '
          || case
               when vva_nom_coln_subst is not null
               then
                    'var_'
                 || vva_nom_coln_subst
               else
                 'var_seqnc'
             end
          || ');'
          || gva_crlf;
      end loop;

      vva_varbl_cursr   := formt_chain_enonc (vva_varbl_cursr);
    end;

    ajout_enonc_a_exect (   '
    declare
      '
                         || vva_varbl_ref_cursor
                         || ' sys_refcursor;');

    ajout_enonc_a_exect (vva_declr_varbl);

    ajout_enonc_a_exect (   'begin
    
      open '
                         || vva_varbl_ref_cursor
                         || ' for '
                         || vva_enonc_sql
                         || ';
      fetch '
                         || vva_varbl_ref_cursor
                         || ' into ');

    ajout_enonc_a_exect (vva_varbl_cursr);

    ajout_enonc_a_exect (   ';
      
      while '
                         || vva_varbl_ref_cursor
                         || '%found loop
        afw_11_migrt_pkg.gbo_presn_don := true;
        afw_11_migrt_pkg.debt_enonc_inser('''
                         || vva_table_tempr
                         || ''','''
                         || vva_schem
                         || ''');
        '                 );

    ajout_enonc_a_exect (vva_varbl_conct_chain);
    ajout_enonc_a_exect (vva_inser_elemn);
    ajout_enonc_a_exect (vva_selct_elemn);
    ajout_enonc_a_exect (vva_updat_elemn);
    ajout_enonc_a_exect (vva_clob_elemn);

    ajout_enonc_a_exect (   '
        afw_11_migrt_pkg.termn_enonc_inser('''
                         || pva_entit
                         || ''');
        afw_11_migrt_pkg.alimn_clob_selct('
                         || pnu_seqnc_entit
                         || ', '
                         || case
                              when vva_nom_coln_subst is not null
                              then
                                   'var_'
                                || vva_nom_coln_subst
                              else
                                'var_seqnc'
                            end
                         || ');
        
        afw_11_migrt_pkg.alimn_clob_updat('
                         || pnu_seqnc_entit
                         || ', '
                         || case
                              when vva_nom_coln_subst is not null
                              then
                                   'var_'
                                || vva_nom_coln_subst
                              else
                                'var_seqnc'
                            end
                         || ');
        afw_11_migrt_pkg.incre_nombr_ligne;
        fetch '
                         || vva_varbl_ref_cursor
                         || ' into ');

    ajout_enonc_a_exect (vva_varbl_cursr);

    ajout_enonc_a_exect (   ';
      end loop;
      
      close '
                         || vva_varbl_ref_cursor
                         || ';
    end;'                 );


    --    ete ('vva_enonc_a_exect'
    --        ,null
    --        ,vva_enonc_a_exect);

    gva_nom_coln_cle_subst   := vva_nom_coln_subst;

    execute immediate (vva_enonc_a_exect);

    dbms_output.put_line (vva_enonc_a_exect);
  exception
    when others
    then
      ete ();
      afw_01_err_apex_pkg.lever_err_apex_code ('SAF.000043'
                                              ,upper (pva_entit)
                                              ,pva_code_prodt   => 'AFW');
  end trait_genrq;

  procedure alimn_clob_selct (pnu_seqnc_entit   in number
                             ,pnu_seqnc_dev     in number)
  is
    vva_nom_table          varchar2 (30);
    vva_nom_type_arr       varchar2 (30);
    vva_ligne              varchar2 (32767);
    vva_indic_tabl_index   varchar2 (1);
    vva_schem              varchar2 (30);
  begin
    select lower (nom)
          ,lower (substr (nom
                         ,8))
             type_arr
          ,indic_expor_tabl_index
          ,lower (ref_schem_prodt_code) schem
      into vva_nom_table
          ,vva_nom_type_arr
          ,vva_indic_tabl_index
          ,vva_schem
      from vd_afw_11_entit
     where seqnc = pnu_seqnc_entit;

    vva_ligne      :=
         'select '
      || nvl (gva_nom_coln_cle_subst, 'seqnc')
      || ' into '
      || formt_ref (pnu_seqnc_dev
                   ,   'var_'
                    || formt_nom_entit (pnu_seqnc_entit)) --|| formt_nom_entit (vva_nom_table))
      || ' from '
      || vva_schem
      || '.'
      || vva_nom_table
      || ' where ';

    if vva_indic_tabl_index = 'O'
    then
      vva_ligne      :=
           vva_ligne
        || gva_ligne_selct;
    else
      vva_ligne      :=
           vva_ligne
        || nvl (gva_nom_coln_cle_subst, 'seqnc')
        || ' = '
        || pnu_seqnc_dev
        || ';';
    end if;

    ajout_ligne (vva_ligne
                ,gnu_index_selct);

    if gnu_compt_ligne_bloc > gnu_nombr_seprt
    then
      ajout_bloc_limt (vva_nom_table
                      ,gnu_index_selct);
    end if;
  end alimn_clob_selct;

  procedure alimn_clob_updat (pnu_seqnc_entit   in number
                             ,pnu_seqnc_dev     in number)
  is
    vva_nom_table          varchar2 (30);
    vva_nom_type_arr       varchar2 (30);
    vva_nom_table_ereur    varchar2 (30);
    vva_ligne              varchar2 (32767);
    vva_indic_tabl_index   varchar2 (1);
  begin
    if not gbo_alimn_prodt_suplm
    then
      select lower (nom)
            ,lower (substr (nom
                           ,8))
               type_arr
            ,lower (nom_table_ereur)
            ,indic_expor_tabl_index
        into vva_nom_table
            ,vva_nom_type_arr
            ,vva_nom_table_ereur
            ,vva_indic_tabl_index
        from vd_i_afw_11_entit
       where seqnc = pnu_seqnc_entit;

      if     gva_ligne_updat is not null
         and (   gva_contx = 'PRODT'
              or     gva_contx = 'APLIC'
                 and gva_contx_courn = 'APLIC')
      then
        vva_ligne      :=
             'update '
          || vva_nom_table
          || ' set '
          || gva_ligne_updat
          || ' where ';

        if vva_indic_tabl_index = 'O'
        then
          vva_ligne      :=
               vva_ligne
            || gva_ligne_selct;
        else
          vva_ligne      :=
               vva_ligne
            || nvl (gva_nom_coln_cle_subst, 'seqnc')
            || ' = '
            || pnu_seqnc_dev
            || ';';
        end if;

        /*
              vva_ligne :=
                substr (vva_ligne,
                        1,
                        length (vva_ligne) - 1) ||
                ' log errors into ' ||
                vva_nom_table_ereur ||
                '(''Update'') reject limit unlimited;';*/

        ajout_ligne (vva_ligne
                    ,gnu_index_updat);

        if gnu_compt_ligne_bloc > gnu_nombr_seprt
        then
          ajout_bloc_limt (vva_nom_table
                          ,gnu_index_updat);
        end if;
      end if;
    end if;
  end alimn_clob_updat;

  procedure alimn_clob_segmn_clob (pcl_clob              in out nocopy clob
                                  ,pva_nom_table_tempr   in            varchar2
                                  ,pva_nom_atrib         in            varchar2
                                  ,pnu_seqnc_dev         in            number)
  is
    var_clob_segmn      afw_07_clob_pkg.typ_arr_segmn;
    var_clob_segmn_2k   afw_07_clob_pkg.typ_arr_segmn;
    vnu_longr           pls_integer;

    procedure ajout_ligne_index_clob (pva_varch in varchar2)
    is
    begin
      ajout_ligne (pva_varch
                  ,gnu_index_clob);
    end ajout_ligne_index_clob;

    function obten_cle_clob
      return varchar2
    is
    begin
      return    pva_nom_table_tempr
             || '.'
             || pva_nom_atrib
             || '.'
             || pnu_seqnc_dev;
    end obten_cle_clob;

    function obten_chain_cle_clob
      return varchar2
    is
    begin
      return    'afw$migrt$pkg.gar_clob('''
             || obten_cle_clob
             || ''')';
    end obten_chain_cle_clob;

    procedure creer_bloc_segmn
    is
    begin
      ajout_ligne_index_clob ('declare');
      ajout_ligne_index_clob ('  s varchar2(32000) default null;');
      ajout_ligne_index_clob ('begin');
    end creer_bloc_segmn;

    procedure fin_bloc_segmn
    is
    begin
      ajout_ligne_index_clob (   '  afw$migrt$pkg.ecrir_clob('''
                              || obten_cle_clob
                              || ''', s);');
      ajout_ligne_index_clob ('end;');
      ajout_ligne_index_clob ('/');
      ajout_ligne_index_clob ('');
    end fin_bloc_segmn;

    procedure debt_bloc
    is
    begin
      ajout_ligne_index_clob ('begin');
      ajout_ligne_index_clob (   '  afw$migrt$pkg.init_clob('''
                              || obten_cle_clob
                              || ''');');
      ajout_ligne_index_clob ('end;');
      ajout_ligne_index_clob ('/');
      ajout_ligne_index_clob ('');
    end debt_bloc;

    procedure fin_bloc
    is
    begin
      ajout_ligne_index_clob ('declare');
      ajout_ligne_index_clob (   '  vnu_seqnc_dev number default '
                              || pnu_seqnc_dev
                              || ';');
      ajout_ligne_index_clob ('begin');
      ajout_ligne_index_clob (   '  if '
                              || vnu_longr
                              || ' > 0 then');
      ajout_ligne_index_clob (   '  update '
                              || pva_nom_table_tempr
                              || ' set '
                              || pva_nom_atrib
                              || ' = '
                              || obten_chain_cle_clob
                              || ' where '
                              || nvl (gva_nom_coln_cle_subst, 'seqnc')
                              || ' = vnu_seqnc_dev;');
      ajout_ligne_index_clob ('  end if;');
      ajout_ligne_index_clob (   '  afw$migrt$pkg.termn_clob('''
                              || obten_cle_clob
                              || ''');');
      ajout_ligne_index_clob ('end;');
      ajout_ligne_index_clob ('/');
      ajout_ligne_index_clob ('');
    end fin_bloc;
  begin
    debt_bloc;

    --début segmentation clob dans table temporaire
    var_clob_segmn   := afw_07_clob_pkg.clob_vers_table_segmn (pcl_clob);
    vnu_longr        := nvl (dbms_lob.getlength (pcl_clob), 0);

    for i in 1 .. var_clob_segmn.count ()
    loop
      creer_bloc_segmn ();
      --Segmenter en bloc de 400 char (SQLPLUS DOIT ËTRE EN BAS DE 2500 caractères de largeur)
      var_clob_segmn_2k      :=
        afw_07_clob_pkg.clob_vers_table_segmn (var_clob_segmn (i)
                                              ,400);

      for j in 1 .. var_clob_segmn_2k.count ()
      loop
        ajout_ligne_index_clob (   '  s := s ||'''
                                || replace (replace (var_clob_segmn_2k (j)
                                                    ,''''
                                                    ,'''''')
                                           ,   chr (13)
                                            || chr (10)
                                           ,   '''||'
                                            || chr (13)
                                            || chr (10)
                                            || ' UNISTR(''\000D\000A'') ||''')
                                || ''';');
      end loop;

      fin_bloc_segmn ();
    end loop;

    fin_bloc;
  end alimn_clob_segmn_clob;

  procedure incre_nombr_ligne
  is
  begin
    if gnu_compt_ligne_bloc > gnu_nombr_seprt
    then
      gnu_compt_ligne_bloc   := 0;
    end if;

    gnu_compt_ligne_bloc   := gnu_compt_ligne_bloc + 1;
  end incre_nombr_ligne;
end afw_11_migrt_pkg;
/
