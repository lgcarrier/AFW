SET DEFINE OFF;
create or replace package body afw_12_tutrl_pkg
as
  /******************************************************************************
     NAME:       AFW_12_TUTRL_PKG
     PURPOSE:

     REVISIONS:
     Ver        Date        Author           Description
     ---------  ----------  ---------------  ------------------------------------
     1.0        2014-10-20      sylvain.michaud       1. Created this package body.
  ******************************************************************************/

  function exist_cedl (pnu_page    in vd_afw_13_page.seqnc%type
                      ,pnu_utils   in vd_afw_12_utils.seqnc%type)
    return boolean
  is
    vnu_exist   number;
    vbo_exist   boolean default false;
  begin
    select count (*)
      into vnu_exist
      from vd_i_afw_12_tutrl tut
           join vd_i_afw_13_etape_tutrl tut2
             on     tut.ref_tutrl = tut2.ref_tutrl
                and tut.ref_etape_tutrl = tut2.seqnc
     where     tut.ref_utils = pnu_utils
           and tut2.ref_page = pnu_page;

    if vnu_exist > 0
    then
      vbo_exist   := true;
    end if;

    return vbo_exist;
  end;

  function obten_cedl_tutrl (pnu_page    in vd_afw_13_page.seqnc%type
                            ,pnu_utils   in vd_afw_12_utils.seqnc%type)
    return gty_parmt_tutrl
  is
    vnu_seqnc         vd_afw_12_tutrl.seqnc%type;
    vnu_tutrl         vd_afw_13_tutrl.seqnc%type;
    vre_parmt_tutrl   gty_parmt_tutrl;
  begin
    begin
        select tut.seqnc
              ,tut.ref_tutrl
              ,tut.ref_etape_tutrl
              ,tut.ref_utils
          into vre_parmt_tutrl.seqnc
              ,vre_parmt_tutrl.ref_tutrl
              ,vre_parmt_tutrl.ref_etape_tutrl
              ,vre_parmt_tutrl.ref_utils
          from vd_i_afw_12_tutrl tut
               join vd_i_afw_13_etape_tutrl et
                 on     tut.ref_etape_tutrl = et.seqnc
                    and tut.ref_tutrl = et.ref_tutrl
         where     tut.ref_utils = pnu_utils
               and et.ref_page = pnu_page
               and rownum = 1
      order by tut.date_creat desc;
    exception
      when no_data_found
      then
        null;
    end;

    if vre_parmt_tutrl.ref_tutrl is not null
    then
      delete from vd_i_afw_12_tutrl
            where seqnc = vre_parmt_tutrl.seqnc;
    end if;

    return vre_parmt_tutrl;
  end obten_cedl_tutrl;

  procedure defnr_cedl (pnu_tutrl               in vd_afw_13_tutrl.seqnc%type
                       ,pnu_ordre_etape_tutrl   in vd_afw_13_etape_tutrl.ordre_presn%type
                       ,pnu_utils               in vd_afw_12_utils.seqnc%type)
  is
    vnu_tutrl_suivn         number;
    vnu_etape_tutrl_suivn   number;
  begin
    select ref_tutrl_suivn
          ,ref_etape_tutrl_suivn
      into vnu_tutrl_suivn
          ,vnu_etape_tutrl_suivn
      from vd_afw_13_etape_tutrl et
     where     et.ref_tutrl = pnu_tutrl
           and et.ordre_presn = pnu_ordre_etape_tutrl;

    if     vnu_tutrl_suivn is not null
       and vnu_etape_tutrl_suivn is not null
    then
      ajout (vnu_tutrl_suivn
            ,vnu_etape_tutrl_suivn
            ,pnu_utils);
    end if;
  exception
    when no_data_found
    then
      null;
    when dup_val_on_index --Tutoriel deja cedule
    then
      null;
    when others
    then
      ete ();
      raise;
  end defnr_cedl;

  procedure suprm_cedl_tutrl (pnu_tutrl   in vd_afw_13_tutrl.seqnc%type
                             ,pnu_utils   in vd_afw_12_utils.seqnc%type)
  is
  begin
    delete from vd_afw_12_tutrl
          where     ref_tutrl = pnu_tutrl
                and ref_utils = pnu_utils;
  end suprm_cedl_tutrl;

  procedure ajout (pnu_tutrl         in vd_afw_13_tutrl.seqnc%type
                  ,pnu_etape_tutrl   in vd_afw_13_etape_tutrl.seqnc%type
                  ,pnu_utils         in vd_afw_12_utils.seqnc%type)
  is
  begin
    insert into vd_afw_12_tutrl (ref_tutrl
                                ,ref_etape_tutrl
                                ,ref_utils)
         values (pnu_tutrl
                ,pnu_etape_tutrl
                ,pnu_utils);
  end ajout;
end afw_12_tutrl_pkg;
/
