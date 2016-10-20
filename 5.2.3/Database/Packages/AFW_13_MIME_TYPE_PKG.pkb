SET DEFINE OFF;
create or replace package body afw_13_mime_type_pkg
as
  function obten_icon (pnu_mime_type           in number
                      ,pva_indic_chemn_compl   in varchar2 default 'O')
    return varchar2
  is
    vva_icon   varchar2 (100);
  begin
    select case
             when pva_indic_chemn_compl = 'O'
             then
                  '/res/afw/'
               || nom_icon
             else
               nom_icon
           end
      into vva_icon
      from vd_i_afw_13_mime_type  mt
          ,vd_i_afw_13_type_fichr tf
     where     tf.seqnc = mt.ref_type_fichr
           and mt.seqnc = pnu_mime_type;

    return vva_icon;
  exception
    when no_data_found
    then
      return null;
  end obten_icon;

  function obten_seqnc (pva_nom_fichr in varchar2)
    return number
  is
    vnu_seqnc   number (10);
    vva_ext     varchar2 (10);
  begin
    if instr (pva_nom_fichr
             ,'.') > 1
    then
      vva_ext      :=
        substr (pva_nom_fichr
               ,instr (pva_nom_fichr
                      ,'.'
                      ,-1));
    end if;

    select seqnc
      into vnu_seqnc
      from (select seqnc
                  ,rank () over (order by ordre_choix) rg
              from vd_i_afw_13_mime_type mt
             where mt.ext = vva_ext)
     where rg = 1;

    return vnu_seqnc;
  exception
    when    no_data_found
         or too_many_rows
    then
      return null;
  end obten_seqnc;

  function obten_seqnc (pva_mime_type   in varchar2
                       ,pva_nom_fichr   in varchar2)
    return number
  is
    vnu_seqnc   number (10);
    vva_ext     varchar2 (10);
  begin
    if instr (pva_nom_fichr
             ,'.') > 1
    then
      vva_ext      :=
        substr (pva_nom_fichr
               ,instr (pva_nom_fichr
                      ,'.'
                      ,-1));
    end if;

    select seqnc
      into vnu_seqnc
      from (select seqnc
                  ,rank () over (order by ordre_choix) rg
              from vd_i_afw_13_mime_type mt
             where     mt.mime_type = pva_mime_type
                   and (   mt.ext = vva_ext
                        or vva_ext is null))
     where rg = 1;

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return null;
  end obten_seqnc;

  function obten_type_fichr (pnu_mime_type in number)
    return number
  is
    vnu_type_fichr   number (10);
  begin
    select ref_type_fichr
      into vnu_type_fichr
      from vd_i_afw_13_mime_type
     where seqnc = pnu_mime_type;

    return vnu_type_fichr;
  end obten_type_fichr;

  function obten_mime_type (pva_exten in vd_i_afw_13_mime_type.ext%type)
    return vd_i_afw_13_mime_type.mime_type%type
  is
    vva_mime_type   vd_i_afw_13_mime_type.mime_type%type;
  begin
    select mt.mime_type
      into vva_mime_type
      from vd_i_afw_13_mime_type mt
     where     mt.ext = lower (pva_exten)
           and mt.ordre_choix = 1;

    return vva_mime_type;
  exception
    when no_data_found
    then
      return 'application/octet-stream';
  end obten_mime_type;

  function obten_exten_nom_fichr (pva_nom_fichr in varchar2)
    return vd_i_afw_13_mime_type.ext%type
  is
  begin
    return substr (pva_nom_fichr
                  ,instr (pva_nom_fichr
                         ,'.'
                         ,-1));
  end obten_exten_nom_fichr;
end afw_13_mime_type_pkg;
/
