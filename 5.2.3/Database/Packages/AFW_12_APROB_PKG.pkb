SET DEFINE OFF;
create or replace package body afw_12_aprob_pkg
as
  function obten_group_stat (pnu_seqnc in number)
    return number
  is
    vnu_group_stat   number (10);
  begin
    select ref_group_stat
      into vnu_group_stat
      from vd_afw_12_aprob
     where seqnc = pnu_seqnc;

    return vnu_group_stat;
  end obten_group_stat;

  function duplq_aprob (pnu_aprob              in number
                       ,pnu_group_stat_destn   in number)
    return number
  is
    vre_aprob   vd_i_afw_12_aprob%rowtype;
    vnu_aprob   number (10);
  begin
    if pnu_group_stat_destn is not null
    then
      select *
        into vre_aprob
        from vd_i_afw_12_aprob
       where seqnc = pnu_aprob;

      -- V¿fier si approbateur existe d¿
      begin
        select a.seqnc
          into vnu_aprob
          from vd_i_afw_12_aprob a
         where     a.ref_group_stat = pnu_group_stat_destn
               and (   (    a.ref_utils = vre_aprob.ref_utils
                        and vre_aprob.ref_utils is not null)
                    or (    a.ref_group_utils = vre_aprob.ref_group_utils
                        and vre_aprob.ref_group_utils is not null));
      exception
        -- On peut dupliquer
        when no_data_found
        then
          insert into vd_i_afw_12_aprob (ref_group_stat
                                        ,ref_utils
                                        ,ref_group_utils
                                        ,dnr_ref_domn)
               values (pnu_group_stat_destn
                      ,vre_aprob.ref_utils
                      ,vre_aprob.ref_group_utils
                      ,vre_aprob.dnr_ref_domn)
            returning seqnc
                 into vnu_aprob;
      end;
    end if;

    return vnu_aprob;
  end duplq_aprob;

  procedure duplq_aprob (pnu_aprob              in number
                        ,pnu_group_stat_destn   in number)
  is
    vnu_aprob   number (10);
  begin
    vnu_aprob      :=
      duplq_aprob (pnu_aprob
                  ,pnu_group_stat_destn);
  end duplq_aprob;

  function duplq_role_aprob (pnu_role_aprob         in number
                            ,pnu_group_stat_destn   in number)
    return number
  is
    vre_role_aprob   vd_i_afw_12_role_aprob%rowtype;
    vnu_role_aprob   number (10);

    cursor cur_lien_role_aprob
    is
      select ref_aprob
            ,dnr_ref_domn
        from vd_i_afw_12_lien_role_aprob
       where ref_role_aprob = pnu_role_aprob;

    vnu_aprob        number (10);
  begin
    if pnu_group_stat_destn is not null
    then
      select *
        into vre_role_aprob
        from vd_i_afw_12_role_aprob
       where seqnc = pnu_role_aprob;

      -- Vérifier si role approbateur existe déjà
      begin
        select ra.seqnc
          into vnu_role_aprob
          from vd_i_afw_12_role_aprob ra
         where     ra.ref_group_stat = pnu_group_stat_destn
               and ra.code = vre_role_aprob.code;
      exception
        -- On peut dupliquer
        when no_data_found
        then
          insert into vd_i_afw_12_role_aprob (code
                                             ,nom
                                             ,ref_group_stat
                                             ,dnr_ref_domn)
               values (vre_role_aprob.code
                      ,vre_role_aprob.nom
                      ,pnu_group_stat_destn
                      ,vre_role_aprob.dnr_ref_domn)
            returning seqnc
                 into vnu_role_aprob;

          -- Lier les approbateurs
          for rec_lien in cur_lien_role_aprob
          loop
            vnu_aprob      :=
              afw_12_aprob_pkg.duplq_aprob (rec_lien.ref_aprob
                                           ,pnu_group_stat_destn);

            insert into vd_i_afw_12_lien_role_aprob (ref_role_aprob
                                                    ,ref_aprob
                                                    ,dnr_ref_domn)
                 values (vnu_role_aprob
                        ,vnu_aprob
                        ,rec_lien.dnr_ref_domn);
          end loop;
      end;
    end if;

    return vnu_role_aprob;
  end duplq_role_aprob;

  procedure duplq_role_aprob (pnu_role_aprob         in number
                             ,pnu_group_stat_destn   in number)
  is
    vnu_role_aprob   number (10);
  begin
    vnu_role_aprob      :=
      duplq_role_aprob (pnu_role_aprob
                       ,pnu_group_stat_destn);
  end duplq_role_aprob;

  procedure creer_insta_role_aprob (pnu_role_aprob          in number
                                   ,pnu_insta_procs_aprob   in number
                                   ,pnu_aprob               in number)
  is
  begin
    insert into vd_i_afw_12_ipa_role (ref_insta_procs_aprob
                                     ,ref_role_aprob
                                     ,ref_aprob
                                     ,dnr_ref_domn)
         values (pnu_insta_procs_aprob
                ,pnu_role_aprob
                ,pnu_aprob
                ,afw_12_domn_pkg.obten_domn_sesn);
  end creer_insta_role_aprob;

  procedure defnr_aprob_role (pnu_role_aprob   in number
                             ,pva_aprob        in varchar2)
  is
    var_aprob   apex_application_global.vc_arr2 := afw_07_util_pkg.string_to_table (pva_aprob);
  begin
    delete from vd_i_afw_12_lien_role_aprob
          where ref_role_aprob = pnu_role_aprob;

    for i in 1 .. var_aprob.count ()
    loop
      insert into vd_i_afw_12_lien_role_aprob (ref_role_aprob
                                              ,ref_aprob
                                              ,dnr_ref_domn)
           values (pnu_role_aprob
                  ,var_aprob (i)
                  ,afw_12_domn_pkg.obten_domn_sesn);
    end loop;
  end defnr_aprob_role;
end afw_12_aprob_pkg;
/
