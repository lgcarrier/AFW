SET DEFINE OFF;
create or replace package body afw_20_modl_pkg
as
  function obten_indic (pva_valr in varchar2)
    return varchar2
  is
    vva_indic   varchar2 (1);
  begin
    select decode (pva_valr,  'YES', 'O',  'NO', 'N')
      into vva_indic
      from dual;

    return vva_indic;
  end obten_indic;

  function detrm_fonct (pva_nom_packg    in varchar2
                       ,pva_nom_objet    in varchar2
                       ,pnu_numr_surch   in number)
    return boolean
  is
    vnu_void   number (1);
  begin
    select count (1)
      into vnu_void
      from dual
     where exists
             (select 1
                from dba_arguments
               where     object_name = pva_nom_objet
                     and package_name = pva_nom_packg
                     and (       overload = pnu_numr_surch
                             and pnu_numr_surch is not null
                          or pnu_numr_surch is null)
                     and position = 0
                     and argument_name is null);

    return vnu_void = 1;
  end detrm_fonct;

  function detrm_fonct_numbr (pva_nom_packg    in varchar2
                             ,pva_nom_objet    in varchar2
                             ,pnu_numr_surch   in number)
    return number
  is
  begin
    if detrm_fonct (pva_nom_packg
                   ,pva_nom_objet
                   ,pnu_numr_surch)
    then
      return afw_14_domn_valr_pkg.obten_seqnc ('TYPE_MODL'
                                              ,'FONCT');
    else
      return afw_14_domn_valr_pkg.obten_seqnc ('TYPE_MODL'
                                              ,'PROCD');
    end if;
  end detrm_fonct_numbr;

  function detrm_type_don (pva_type_don in varchar2)
    return number
  is
    vnu_dv_type_don   number (10);
  begin
    case pva_type_don
      when 'VARCHAR2'
      then
        vnu_dv_type_don      :=
          afw_14_domn_valr_pkg.obten_seqnc ('TYPE_DON'
                                           ,'VARCH');
      when 'DATE'
      then
        vnu_dv_type_don      :=
          afw_14_domn_valr_pkg.obten_seqnc ('TYPE_DON'
                                           ,'DATE');
      when 'NUMBER'
      then
        vnu_dv_type_don      :=
          afw_14_domn_valr_pkg.obten_seqnc ('TYPE_DON'
                                           ,'NUMBR');
      when 'CLOB'
      then
        vnu_dv_type_don      :=
          afw_14_domn_valr_pkg.obten_seqnc ('TYPE_DON'
                                           ,'CLOB');
      when 'BOOLEAN'
      then
        vnu_dv_type_don      :=
          afw_14_domn_valr_pkg.obten_seqnc ('TYPE_DON'
                                           ,'BOLN');
      else
        vnu_dv_type_don      :=
          afw_14_domn_valr_pkg.obten_seqnc ('TYPE_DON'
                                           ,'AUTRE');
    end case;

    return vnu_dv_type_don;
  end detrm_type_don;

  function long_to_vc2 (pva_objet_id   in varchar2
                       ,pnu_subpr_id   in number
                       ,pnu_seqnc      in number)
    return varchar2
  is
    vva_deft_value   varchar2 (200);
  begin
    select default_value
      into vva_deft_value
      from dba_arguments
     where     object_id = pva_objet_id
           and subprogram_id = pnu_subpr_id
           and sequence = pnu_seqnc
           and position != 0;

    return vva_deft_value;
  end long_to_vc2;

  --CONAL : revoir le fonctionnement après la refonte
  procedure maj_modls_refrn (pnu_versn_prodt in number)
  is
    /*
      Différent type : VUE, PACKG, PROCD, FUNCT
    */
    vva_schem   varchar2 (30);
  begin
    vva_schem   := afw_11_aplic_pkg.obten_schem (afw_11_aplic_pkg.obten_aplic_sesn);

    --Supprimer les modules de packages
    delete from vd_i_afw_20_modl dest
          where     not exists
                      (select 1
                         from (select object_name
                                     ,procedure_name
                                     ,overload
                                 from dba_procedures procd
                                where procd.owner = vva_schem) sourc
                        where     sourc.object_name = (select nom_organ
                                                         from vd_i_afw_20_modl m
                                                        where m.seqnc = dest.ref_modl)
                              and sourc.procedure_name = dest.nom_organ
                              and sourc.overload = dest.numr_surch)
                and (    dest.ref_versn = pnu_versn_prodt
                     and pnu_versn_prodt is not null)
                and ref_modl is not null;

    --Supprimer les modules procd/function/pkg qui n'existent pas
    delete from vd_i_afw_20_modl dest
          where     not exists
                      (select 1
                         from (select object_name
                                 from dba_procedures procd
                                where procd.owner = vva_schem) sourc
                        where sourc.object_name = dest.nom_organ)
                and (    dest.ref_versn = pnu_versn_prodt
                     and pnu_versn_prodt is not null)
                and ref_modl is null;

    --Creer les procedures.
    merge into vd_i_afw_20_modl dest
         using (select object_name                                           nom
                      ,overload                                              surch
                      ,aggregate                                             agreg
                      ,pipelined                                             pipln
                      ,deterministic                                         detrm
                      ,case authid when 'CURRENT_USER' then 'O' else 'N' end authid
                  from dba_procedures
                 where     owner = vva_schem
                       and object_type = 'PROCEDURE') sourc
            on (sourc.nom = dest.nom_organ)
    when matched
    then
      update set dest.numr_surch                 = to_number (sourc.surch)
                ,dest.indic_agreg                = obten_indic (sourc.agreg)
                ,dest.indic_pipln                = obten_indic (sourc.pipln)
                ,dest.indic_detrm                = obten_indic (sourc.detrm)
                ,dest.indic_authid_curnt_utils   = sourc.authid
    when not matched
    then
      insert     (ref_dv_type_modl
                 ,ref_versn
                 ,nom_organ
                 ,versn_bd_aplic
                 ,numr_surch
                 ,indic_agreg
                 ,indic_pipln
                 ,indic_detrm
                 ,indic_authid_curnt_utils)
          values (afw_14_domn_valr_pkg.obten_seqnc ('TYPE_MODL'
                                                   ,'PROCD')
                 ,pnu_versn_prodt
                 ,sourc.nom
                 ,'11g'
                 ,to_number (sourc.surch)
                 ,obten_indic (sourc.agreg)
                 ,obten_indic (sourc.pipln)
                 ,obten_indic (sourc.detrm)
                 ,sourc.authid);

    --Creer les functions.
    merge into vd_i_afw_20_modl dest
         using (select object_name                                           nom
                      ,overload                                              surch
                      ,aggregate                                             agreg
                      ,pipelined                                             pipln
                      ,deterministic                                         detrm
                      ,case authid when 'CURRENT_USER' then 'O' else 'N' end authid
                  from dba_procedures
                 where     owner = vva_schem
                       and object_type = 'FUNCTION') sourc
            on (sourc.nom = dest.nom_organ)
    when matched
    then
      update set dest.numr_surch                 = to_number (sourc.surch)
                ,dest.indic_agreg                = obten_indic (sourc.agreg)
                ,dest.indic_pipln                = obten_indic (sourc.pipln)
                ,dest.indic_detrm                = obten_indic (sourc.detrm)
                ,dest.indic_authid_curnt_utils   = sourc.authid
    when not matched
    then
      insert     (ref_dv_type_modl
                 ,ref_versn
                 ,nom_organ
                 ,versn_bd_aplic
                 ,numr_surch
                 ,indic_agreg
                 ,indic_pipln
                 ,indic_detrm
                 ,indic_authid_curnt_utils)
          values (afw_14_domn_valr_pkg.obten_seqnc ('TYPE_MODL'
                                                   ,'FONCT')
                 ,pnu_versn_prodt
                 ,sourc.nom
                 ,'11g'
                 ,to_number (sourc.surch)
                 ,obten_indic (sourc.agreg)
                 ,obten_indic (sourc.pipln)
                 ,obten_indic (sourc.detrm)
                 ,sourc.authid);

    --Creer les packages.
    merge into vd_i_afw_20_modl dest
         using (select object_name                                           nom
                      ,overload                                              surch
                      ,aggregate                                             agreg
                      ,pipelined                                             pipln
                      ,deterministic                                         detrm
                      ,case authid when 'CURRENT_USER' then 'O' else 'N' end authid
                  from dba_procedures
                 where     owner = vva_schem
                       and object_type = 'PACKAGE'
                       and procedure_name is null) sourc
            on (sourc.nom = dest.nom_organ)
    when matched
    then
      update set dest.numr_surch                 = to_number (sourc.surch)
                ,dest.indic_agreg                = obten_indic (sourc.agreg)
                ,dest.indic_pipln                = obten_indic (sourc.pipln)
                ,dest.indic_detrm                = obten_indic (sourc.detrm)
                ,dest.indic_authid_curnt_utils   = sourc.authid
    when not matched
    then
      insert     (ref_dv_type_modl
                 ,ref_versn
                 ,nom_organ
                 ,versn_bd_aplic
                 ,numr_surch
                 ,indic_agreg
                 ,indic_pipln
                 ,indic_detrm
                 ,indic_authid_curnt_utils)
          values (afw_14_domn_valr_pkg.obten_seqnc ('TYPE_MODL'
                                                   ,'PACKG')
                 ,pnu_versn_prodt
                 ,sourc.nom
                 ,'11g'
                 ,to_number (sourc.surch)
                 ,obten_indic (sourc.agreg)
                 ,obten_indic (sourc.pipln)
                 ,obten_indic (sourc.detrm)
                 ,sourc.authid);

    --Creer les procedures/fonctions des packages.
    merge into vd_afw_20_modl dest
         using (select proc.object_name                                           nom
                      ,proc.procedure_name                                        nom_procd
                      ,proc.overload                                              surch
                      ,proc.aggregate                                             agreg
                      ,proc.pipelined                                             pipln
                      ,proc.deterministic                                         detrm
                      ,detrm_fonct_numbr (proc.object_name
                                         ,proc.procedure_name
                                         ,proc.overload)
                         type
                      ,case proc.authid when 'CURRENT_USER' then 'O' else 'N' end authid
                      ,modl.seqnc                                                 seqnc_modl
                  from dba_procedures   proc
                      ,vd_i_afw_20_modl modl
                 where     proc.owner = vva_schem
                       and proc.object_type = 'PACKAGE'
                       and proc.object_name = modl.nom_organ
                       and proc.procedure_name is not null
                       and modl.ref_versn = pnu_versn_prodt
                       and pnu_versn_prodt is not null) sourc
            on (    sourc.nom_procd = dest.nom_organ
                and sourc.nom = dest.ref_modl_formt
                and sourc.surch = dest.numr_surch)
    when matched
    then
      update set dest.indic_agreg                = obten_indic (sourc.agreg)
                ,dest.indic_pipln                = obten_indic (sourc.pipln)
                ,dest.indic_detrm                = obten_indic (sourc.detrm)
                ,dest.indic_authid_curnt_utils   = sourc.authid
    when not matched
    then
      insert     (ref_dv_type_modl
                 ,ref_versn
                 ,nom_organ
                 ,ref_modl
                 ,versn_bd_aplic
                 ,numr_surch
                 ,indic_agreg
                 ,indic_pipln
                 ,indic_detrm
                 ,indic_authid_curnt_utils)
          values (sourc.type
                 ,pnu_versn_prodt
                 ,sourc.nom_procd
                 ,sourc.seqnc_modl
                 ,'11g'
                 ,to_number (sourc.surch)
                 ,obten_indic (sourc.agreg)
                 ,obten_indic (sourc.pipln)
                 ,obten_indic (sourc.detrm)
                 ,sourc.authid);

    --Merger les arguments des packages
    merge into vd_i_afw_20_modl_parmt dest
         using (select arg.argument_name                                 nom
                      ,arg.position                                      postn
                      ,detrm_type_don (arg.pls_type)                     type_don
                      ,case arg.defaulted when 'Y' then 'N' else 'O' end indic_publc
                      ,long_to_vc2 (arg.object_id
                                   ,arg.subprogram_id
                                   ,arg.sequence)
                         deft
                      ,arg.in_out                                        sens
                      ,modl.seqnc                                        seqnc_modl
                  from dba_arguments  arg
                      ,vd_afw_20_modl modl
                 where     arg.owner = vva_schem
                       and arg.object_name = modl.nom_organ
                       and (       arg.package_name = modl.ref_modl_formt
                               and modl.ref_modl is not null
                            or modl.ref_modl is null)
                       and (       arg.overload = modl.numr_surch
                               and modl.numr_surch is not null
                            or modl.numr_surch is null)
                       and arg.position != 0
                       and arg.argument_name is not null
                       and modl.ref_versn = pnu_versn_prodt
                       and pnu_versn_prodt is not null) sourc
            on (    sourc.nom = dest.nom_organ
                and sourc.seqnc_modl = dest.ref_modl)
    when matched
    then
      update set dest.ref_dv_type_don   = sourc.type_don
                ,dest.postn             = sourc.postn
                ,dest.valr_deft         = sourc.deft
                ,dest.sens              = sourc.sens
                ,dest.indic_publc       = sourc.indic_publc
                ,dest.indic_retr        = 'N'
    when not matched
    then
      insert     (ref_dv_type_don
                 ,ref_modl
                 ,nom_organ
                 ,postn
                 ,valr_deft
                 ,sens
                 ,indic_publc
                 ,indic_retr)
          values (sourc.type_don
                 ,sourc.seqnc_modl
                 ,sourc.nom
                 ,sourc.postn
                 ,sourc.deft
                 ,sourc.sens
                 ,sourc.indic_publc
                 ,'N');

    --Merger les variables de retour des packages

    merge into vd_i_afw_20_modl_parmt dest
         using (select arg.argument_name                                 nom
                      ,arg.position                                      postn
                      ,detrm_type_don (arg.pls_type)                     type_don
                      ,case arg.defaulted when 'Y' then 'N' else 'O' end indic_publc
                      ,long_to_vc2 (arg.object_id
                                   ,arg.subprogram_id
                                   ,arg.sequence)
                         deft
                      ,arg.in_out                                        sens
                      ,modl.seqnc                                        seqnc_modl
                  from dba_arguments  arg
                      ,vd_afw_20_modl modl
                 where     arg.owner = vva_schem
                       and arg.object_name = modl.nom_organ
                       and (       arg.package_name = modl.ref_modl_formt
                               and modl.ref_modl is not null
                            or modl.ref_modl is null)
                       and (       arg.overload = modl.numr_surch
                               and modl.numr_surch is not null
                            or modl.numr_surch is null)
                       and arg.position = 0
                       and arg.argument_name is null
                       and modl.ref_versn = pnu_versn_prodt
                       and pnu_versn_prodt is not null) sourc
            on (    'Variable de retour' = dest.nom_organ
                and sourc.seqnc_modl = dest.ref_modl)
    when matched
    then
      update set dest.ref_dv_type_don   = sourc.type_don
                ,dest.postn             = sourc.postn
                ,dest.valr_deft         = sourc.deft
                ,dest.sens              = sourc.sens
                ,dest.indic_publc       = sourc.indic_publc
                ,dest.indic_retr        = 'O'
    when not matched
    then
      insert     (ref_dv_type_don
                 ,ref_modl
                 ,nom_organ
                 ,postn
                 ,valr_deft
                 ,sens
                 ,indic_publc
                 ,indic_retr)
          values (sourc.type_don
                 ,sourc.seqnc_modl
                 ,'Variable de retour'
                 ,sourc.postn
                 ,sourc.deft
                 ,sourc.sens
                 ,sourc.indic_publc
                 ,'O');
  end maj_modls_refrn;

  function obten_modl_formt (pnu_seqnc in number)
    return varchar2
  is
    vva_nom    varchar2 (61);
    vnu_modl   number (10);
  begin
    select nom_organ
          ,ref_modl
      into vva_nom
          ,vnu_modl
      from vd_afw_20_modl
     where seqnc = pnu_seqnc;

    /*if vnu_modl is not null then
      select nom_organ || '.' || vva_nom
        into vva_nom
        from vd_afw_20_modl
       where seqnc = vnu_modl;
    end if;*/

    return vva_nom;
  end obten_modl_formt;

  function obten_propr_sous_modl_formt (pnu_seqnc in number)
    return varchar2
  is
    vva_nom    varchar2 (61);
    vnu_modl   number (10);
  begin
    select nom_organ
          ,ref_modl
      into vva_nom
          ,vnu_modl
      from vd_afw_20_modl
     where seqnc = (select d.ref_seqnc_struc_aplic
                      from vd_i_afw_20_docmn       d
                          ,vd_i_afw_12_struc_aplic sa
                     where     sa.seqnc = d.ref_struc_aplic
                           and d.seqnc = pnu_seqnc);

    if vnu_modl is not null
    then
      select nom_organ
        into vva_nom
        from vd_afw_20_modl
       where seqnc = vnu_modl;
    end if;

    return vva_nom;
  end obten_propr_sous_modl_formt;

  function obten_modl_parmt_formt (pnu_seqnc in number)
    return varchar2
  is
    vva_nom    varchar2 (61);
    vnu_modl   number (10);
  begin
    select nom_organ
          ,ref_modl
      into vva_nom
          ,vnu_modl
      from vd_afw_20_modl_parmt
     where seqnc = pnu_seqnc;

    /*if vnu_modl is not null then
      select nom_organ || '.' || vva_nom
        into vva_nom
        from vd_afw_20_modl
       where seqnc = vnu_modl;
    end if;*/

    return vva_nom;
  end obten_modl_parmt_formt;
end afw_20_modl_pkg;
/
