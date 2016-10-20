SET DEFINE OFF;
create or replace package body afw_12_utils_avatr_pkg
is
  function exist_logo_tail_large (pnu_utils   in vd_i_afw_12_utils_avatr.ref_utils%type
                                 ,pnu_domn    in vd_i_afw_12_utils_avatr.ref_domn%type)
    return boolean
  is
    vbo_exist        boolean default false;
    vnu_tail_fichr   number;
  begin
    select dbms_lob.getlength (logo_tail_large)
      into vnu_tail_fichr
      from vd_i_afw_12_utils_avatr
     where     ref_utils = pnu_utils
           and ref_domn = pnu_domn;

    if vnu_tail_fichr > 0
    then
      vbo_exist   := true;
    end if;

    return vbo_exist;
  exception
    when no_data_found
    then
      return false;
  end exist_logo_tail_large;

  function exist_logo_tail_moyn (pnu_utils   in vd_i_afw_12_utils_avatr.ref_utils%type
                                ,pnu_domn    in vd_i_afw_12_utils_avatr.ref_domn%type)
    return boolean
  is
    vbo_exist        boolean default false;
    vnu_tail_fichr   number;
  begin
    select dbms_lob.getlength (logo_tail_moyn)
      into vnu_tail_fichr
      from vd_i_afw_12_utils_avatr
     where     ref_utils = pnu_utils
           and ref_domn = pnu_domn;

    if vnu_tail_fichr > 0
    then
      vbo_exist   := true;
    end if;

    return vbo_exist;
  exception
    when no_data_found
    then
      return false;
  end exist_logo_tail_moyn;

  function exist_logo_tail_pet (pnu_utils   in vd_i_afw_12_utils_avatr.ref_utils%type
                               ,pnu_domn    in vd_i_afw_12_utils_avatr.ref_domn%type)
    return boolean
  is
    vbo_exist        boolean default false;
    vnu_tail_fichr   number;
  begin
    select dbms_lob.getlength (logo_tail_pet)
      into vnu_tail_fichr
      from vd_i_afw_12_utils_avatr
     where     ref_utils = pnu_utils
           and ref_domn = pnu_domn;

    if vnu_tail_fichr > 0
    then
      vbo_exist   := true;
    end if;

    return vbo_exist;
  exception
    when no_data_found
    then
      return false;
  end exist_logo_tail_pet;

  function valdr_sesn (pnu_utils   in vd_i_afw_12_utils_avatr.ref_utils%type
                      ,pnu_sesn    in vd_i_afw_12_sesn.id_sesn%type)
    return boolean
  is
    vnu_exist   number;
  begin
    -- Verifier si la session existe
    select 1
      into vnu_exist
      from vd_i_afw_12_sesn
     where id_sesn = pnu_sesn;

    --  and app_user = afw_12_utils_pkg.obten_code_utils (pnu_utils);

    return true;
  exception
    when no_data_found
    then
      return false;
  end valdr_sesn;

  procedure downl_logo_tail_large (pnu_utils    in vd_i_afw_12_utils_avatr.ref_utils%type
                                  ,pnu_domn     in vd_i_afw_12_utils_avatr.ref_domn%type
                                  ,pnu_sesn     in vd_i_afw_12_sesn.id_sesn%type
                                  ,pbl_inline   in boolean default true)
  is
    cursor cur_utils_avatr (pnu_utils   in vd_i_afw_12_utils_avatr.ref_utils%type
                           ,pnu_domn    in vd_i_afw_12_utils_avatr.ref_domn%type)
    is
      select *
        from vd_i_afw_12_utils_avatr
       where     ref_utils = pnu_utils
             and ref_domn = pnu_domn;

    rec_utils_avatr   cur_utils_avatr%rowtype;
  begin
    -- if apex_custom_auth.is_session_valid
    --then
    --validate_session;
    if valdr_sesn (pnu_utils
                  ,pnu_sesn)
    then
      open cur_utils_avatr (pnu_utils
                           ,pnu_domn);

      fetch cur_utils_avatr
        into rec_utils_avatr;

      close cur_utils_avatr;

      wwv_flow_file_mgr.download_file (p_file_content      => rec_utils_avatr.logo_tail_large
                                      ,p_file_name         => 'avatar_utils'
                                      ,p_mime_type         => 'image/jpeg'
                                      ,p_file_charset      => null
                                      ,p_last_updated_on   => nvl (rec_utils_avatr.date_modfc, rec_utils_avatr.date_creat)
                                      ,p_etag              =>   to_char (rec_utils_avatr.seqnc)
                                                             || to_char (nvl (rec_utils_avatr.date_modfc, rec_utils_avatr.date_creat)
                                                                        ,'JHH24MISS')
                                      ,p_is_attachment     => not pbl_inline);
    end if;
  end downl_logo_tail_large;
end afw_12_utils_avatr_pkg;
/
