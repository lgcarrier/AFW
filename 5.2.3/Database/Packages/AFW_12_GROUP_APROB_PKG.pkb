SET DEFINE OFF;
create or replace package body afw_12_group_aprob_pkg
as
  function obten_group_stat (pnu_seqnc in number)
    return number
  is
    vnu_group_stat   number (10);
  begin
    select ref_group_stat
      into vnu_group_stat
      from vd_afw_12_group_aprob
     where seqnc = pnu_seqnc;

    return vnu_group_stat;
  end obten_group_stat;

  procedure lier_aprob (pnu_aprob         in number
                       ,pnu_group_aprob   in number
                       ,pnu_ref_domn      in number default null)
  is
  begin
    insert into vd_i_afw_12_lien_group_aprob (ref_group_aprob
                                             ,ref_aprob
                                             ,dnr_ref_domn)
         values (pnu_group_aprob
                ,pnu_aprob
                ,pnu_ref_domn);
  end lier_aprob;

  function duplq_group_aprob (pnu_group_aprob        in number
                             ,pnu_group_stat_destn   in number)
    return number
  is
    vre_group_aprob   vd_i_afw_12_group_aprob%rowtype;
    vnu_group_aprob   number (10);

    cursor cur_lien_group_aprob
    is
      select ref_aprob
        from vd_i_afw_12_lien_group_aprob
       where ref_group_aprob = pnu_group_aprob;

    vnu_aprob         number (10);
  begin
    if pnu_group_stat_destn is not null
    then
      -- Dupliquer le groupe
      select *
        into vre_group_aprob
        from vd_i_afw_12_group_aprob
       where seqnc = pnu_group_aprob;

      insert into vd_i_afw_12_group_aprob (code
                                          ,nom
                                          ,descr
                                          ,dnr_ref_domn
                                          ,ref_group_stat)
           values (vre_group_aprob.code
                  ,vre_group_aprob.nom
                  ,vre_group_aprob.descr
                  ,vre_group_aprob.dnr_ref_domn
                  ,pnu_group_stat_destn)
        returning seqnc
             into vnu_group_aprob;

      -- Dupliquer les approbateurs et lier au nouveau groupe
      for rec_lien in cur_lien_group_aprob
      loop
        vnu_aprob      :=
          afw_12_aprob_pkg.duplq_aprob (rec_lien.ref_aprob
                                       ,pnu_group_stat_destn);

        lier_aprob (vnu_aprob
                   ,vnu_group_aprob
                   ,vre_group_aprob.dnr_ref_domn);
      end loop;
    end if;

    return vnu_group_aprob;
  end duplq_group_aprob;

  procedure duplq_group_aprob (pnu_group_aprob        in number
                              ,pnu_group_stat_destn   in number)
  is
    vnu_group_aprob   number (10);
  begin
    vnu_group_aprob      :=
      duplq_group_aprob (pnu_group_aprob
                        ,pnu_group_stat_destn);
  end duplq_group_aprob;
end afw_12_group_aprob_pkg;
/
