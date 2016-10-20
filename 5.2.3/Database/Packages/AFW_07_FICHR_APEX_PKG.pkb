SET DEFINE OFF;
create or replace package body afw_07_fichr_apex_pkg
as
  function inser_fichr (pva_nom_fichr   in apex_fichr.filename%type
                       ,pbl_fichr       in blob)
    return apex_fichr.id%type
  is
    vnu_id_fichr   apex_fichr.id%type;
  begin
    vnu_id_fichr   := wwv_flow_id.next_val;

    insert into apex_fichr (id
                           ,flow_id
                           ,name
                           ,mime_type
                           ,doc_size
                           ,dad_charset
                           ,content_type
                           ,blob_content
                           ,file_type
                           ,file_charset)
         values (vnu_id_fichr
                ,0
                ,   vnu_id_fichr
                 || '/'
                 || pva_nom_fichr
                ,'application/csv'
                ,dbms_lob.getlength (pbl_fichr)
                ,'UTF-8'
                ,'BLOB'
                ,pbl_fichr
                ,'CSV_DATA_IMPORT'
                ,'utf-8')
         return id
           into vnu_id_fichr;

    return vnu_id_fichr;
  end;

  function obten_id_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.id%type
  is
    vnu_id_fichr   apex_fichr.id%type;
  begin
    select af.id
      into vnu_id_fichr
      from apex_fichr af
     where af.name = pva_nom;

    return vnu_id_fichr;
  exception
    when others
    then
      return null;
  end obten_id_fichr;

  function obten_nom (pnu_id_fichr in apex_fichr.id%type)
    return apex_fichr.name%type
  is
    vva_nom_fichr   apex_fichr.filename%type;
  begin
    select af.name
      into vva_nom_fichr
      from apex_fichr af
     where af.id = pnu_id_fichr;

    return vva_nom_fichr;
  exception
    when others
    then
      return null;
  end obten_nom;

  function obten_nom_fichr (pnu_id_fichr in apex_fichr.id%type)
    return apex_fichr.filename%type
  is
    vva_nom_fichr   apex_fichr.filename%type;
  begin
    select af.filename
      into vva_nom_fichr
      from apex_fichr af
     where af.id = pnu_id_fichr;

    return vva_nom_fichr;
  exception
    when others
    then
      return null;
  end obten_nom_fichr;

  function obten_nom_fichr (pva_nom in apex_fichr.name%type)
    return apex_fichr.filename%type
  is
    vva_nom_fichr   apex_fichr.filename%type;
  begin
    select af.filename
      into vva_nom_fichr
      from apex_fichr af
     where af.name = pva_nom;

    return vva_nom_fichr;
  exception
    when others
    then
      return null;
  end obten_nom_fichr;

  function obten_mime_type_fichr (pnu_id_fichr in apex_fichr.id%type)
    return apex_fichr.mime_type%type
  is
    vva_mime_type_fichr   apex_fichr.mime_type%type;
  begin
    select af.mime_type
      into vva_mime_type_fichr
      from apex_fichr af
     where af.id = pnu_id_fichr;

    return vva_mime_type_fichr;
  exception
    when others
    then
      return null;
  end obten_mime_type_fichr;

  procedure suprm_fichr (pnu_id_fichr in apex_fichr.id%type)
  is
  begin
    delete apex_don_charg_dechr adcd
     where adcd.data_id = pnu_id_fichr;

    delete apex_fichr af
     where af.id = pnu_id_fichr;
  end suprm_fichr;
end afw_07_fichr_apex_pkg;
/
