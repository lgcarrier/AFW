SET DEFINE OFF;
create or replace package body afw_07_util_compr_zip_pkg
is
  function raw2num (pra_value in raw)
    return number
  is
  begin -- note: FFFFFFFF => -1
    return utl_raw.cast_to_binary_integer (pra_value
                                          ,utl_raw.little_endian);
  end raw2num;


  function raw2varchar2 (pra_raw     in raw
                        ,pva_encod   in varchar2)
    return varchar2
  is
  begin
    return nvl (utl_i18n.raw_to_char (pra_raw
                                     ,pva_encod)
               ,utl_i18n.raw_to_char (pra_raw
                                     ,utl_i18n.map_charset (pva_encod
                                                           ,utl_i18n.generic_context
                                                           ,utl_i18n.iana_to_oracle)));
  end raw2varchar2;


  function little_endian (pnu_big     in number
                         ,pnu_bytes   in pls_integer := 4)
    return raw
  is
  begin
    return utl_raw.substr (utl_raw.cast_from_binary_integer (pnu_big
                                                            ,utl_raw.little_endian)
                          ,1
                          ,pnu_bytes);
  end little_endian;

  procedure ajout_fichr (pbl_fichr_compr   in out blob
                        ,pva_nom_fichr     in     varchar2
                        ,pbl_fichr         in     blob)
  is
    vda_date_actue    date;
    vbl_fichr_compr   blob;
    vnu_long          integer;
  begin
    vda_date_actue    := sysdate;
    vbl_fichr_compr   := utl_compress.lz_compress (pbl_fichr);
    vnu_long          := dbms_lob.getlength (vbl_fichr_compr);

    if pbl_fichr_compr is null
    then
      dbms_lob.createtemporary (pbl_fichr_compr
                               ,true);
    end if;

    dbms_lob.append (pbl_fichr_compr
                    ,utl_raw.concat (hextoraw ('504B0304') -- Local file header signature
                                    ,hextoraw ('1400') -- version 2.0
                                    ,hextoraw ('0000') -- no General purpose bits
                                    ,hextoraw ('0800') -- deflate
                                    ,little_endian (    to_number (to_char (vda_date_actue
                                                                           ,'ss'))
                                                      / 2
                                                    +   to_number (to_char (vda_date_actue
                                                                           ,'mi'))
                                                      * 32
                                                    +   to_number (to_char (vda_date_actue
                                                                           ,'hh24'))
                                                      * 2048
                                                   ,2) -- File last modification time
                                    ,little_endian (  to_number (to_char (vda_date_actue
                                                                         ,'dd'))
                                                    +   to_number (to_char (vda_date_actue
                                                                           ,'mm'))
                                                      * 32
                                                    +   (  to_number (to_char (vda_date_actue
                                                                              ,'yyyy'))
                                                         - 1980)
                                                      * 512
                                                   ,2) -- File last modification date
                                    ,dbms_lob.substr (vbl_fichr_compr
                                                     ,4
                                                     ,vnu_long - 7) -- CRC-32
                                    ,little_endian (vnu_long - 18) -- compressed size
                                    ,little_endian (dbms_lob.getlength (pbl_fichr)) -- uncompressed size
                                    ,little_endian (length (pva_nom_fichr)
                                                   ,2) -- File name length
                                    ,hextoraw ('0000') -- Extra field length
                                    ,utl_raw.cast_to_raw (pva_nom_fichr) -- File name
                                                                        ));
    dbms_lob.copy (pbl_fichr_compr
                  ,vbl_fichr_compr
                  ,vnu_long - 18
                  ,dbms_lob.getlength (pbl_fichr_compr) + 1
                  ,11); -- compressed content
    dbms_lob.freetemporary (vbl_fichr_compr);
  end ajout_fichr;

  procedure clotr_fichr (pbl_fichr_compr   in out blob
                        ,pva_comnt         in     varchar2 default null)
  is
    vnu_decmp             pls_integer := 0;
    vnu_offs              integer;
    vnu_offs_dir_header   integer;
    vnu_offs_end_header   integer;
    vra_comnt             raw (32767) := utl_raw.cast_to_raw (pva_comnt);
  begin
    vnu_offs_dir_header   := dbms_lob.getlength (pbl_fichr_compr);
    vnu_offs              :=
      dbms_lob.instr (pbl_fichr_compr
                     ,hextoraw ('504B0304')
                     ,1);

    while vnu_offs > 0
    loop
      vnu_decmp   := vnu_decmp + 1;
      dbms_lob.append (pbl_fichr_compr
                      ,utl_raw.concat (hextoraw ('504B0102') -- Central directory file header signature
                                      ,hextoraw ('1400') -- version 2.0
                                      ,dbms_lob.substr (pbl_fichr_compr
                                                       ,26
                                                       ,vnu_offs + 4)
                                      ,hextoraw ('0000') -- File comment length
                                      ,hextoraw ('0000') -- Disk number where file starts
                                      ,hextoraw ('0100') -- Internal file attributes
                                      ,hextoraw ('2000B681') -- External file attributes
                                      ,little_endian (vnu_offs - 1) -- Relative offset of local file header
                                      ,dbms_lob.substr (pbl_fichr_compr
                                                       ,utl_raw.cast_to_binary_integer (dbms_lob.substr (pbl_fichr_compr
                                                                                                        ,2
                                                                                                        ,vnu_offs + 26)
                                                                                       ,utl_raw.little_endian)
                                                       ,vnu_offs + 30) -- File name
                                                                      ));
      vnu_offs      :=
        dbms_lob.instr (pbl_fichr_compr
                       ,hextoraw ('504B0304')
                       ,vnu_offs + 32);
    end loop;

    vnu_offs_end_header   := dbms_lob.getlength (pbl_fichr_compr);
    dbms_lob.append (pbl_fichr_compr
                    ,utl_raw.concat (hextoraw ('504B0506') -- End of central directory signature
                                    ,hextoraw ('0000') -- Number of this disk
                                    ,hextoraw ('0000') -- Disk where central directory starts
                                    ,little_endian (vnu_decmp
                                                   ,2) -- Number of central directory records on this disk
                                    ,little_endian (vnu_decmp
                                                   ,2) -- Total number of central directory records
                                    ,little_endian (vnu_offs_end_header - vnu_offs_dir_header) -- Size of central directory
                                    ,little_endian (vnu_offs_dir_header) -- Relative offset of local file header
                                    ,little_endian (nvl (utl_raw.length (vra_comnt), 0)
                                                   ,2) -- ZIP file comment length
                                    ,vra_comnt));
  end clotr_fichr;

  function obten_liste_nom_fichr (pbl_fichr_compr   in blob
                                 ,pva_encod         in varchar2 := null)
    return typ_list_nom_fichr
  is
    vnu_ind      integer;
    vnu_hd_ind   integer;
    vta_rv       typ_list_nom_fichr;
  begin
    vnu_ind   := dbms_lob.getlength (pbl_fichr_compr) - 21;

    loop
      exit when    dbms_lob.substr (pbl_fichr_compr
                                   ,4
                                   ,vnu_ind) = hextoraw ('504B0506')
                or vnu_ind < 1;
      vnu_ind   := vnu_ind - 1;
    end loop;

    --
    if vnu_ind <= 0
    then
      return null;
    end if;

    --
    vnu_hd_ind      :=
        raw2num (dbms_lob.substr (pbl_fichr_compr
                                 ,4
                                 ,vnu_ind + 16))
      + 1;
    vta_rv    := typ_list_nom_fichr ();
    vta_rv.extend (raw2num (dbms_lob.substr (pbl_fichr_compr
                                            ,2
                                            ,vnu_ind + 10)));

    for i in 1 ..
             raw2num (dbms_lob.substr (pbl_fichr_compr
                                      ,2
                                      ,vnu_ind + 8))
    loop
      vta_rv (i)      :=
        raw2varchar2 (dbms_lob.substr (pbl_fichr_compr
                                      ,raw2num (dbms_lob.substr (pbl_fichr_compr
                                                                ,2
                                                                ,vnu_hd_ind + 28))
                                      ,vnu_hd_ind + 46)
                     ,pva_encod);
      vnu_hd_ind      :=
          vnu_hd_ind
        + 46
        + raw2num (dbms_lob.substr (pbl_fichr_compr
                                   ,2
                                   ,vnu_hd_ind + 28))
        + raw2num (dbms_lob.substr (pbl_fichr_compr
                                   ,2
                                   ,vnu_hd_ind + 30))
        + raw2num (dbms_lob.substr (pbl_fichr_compr
                                   ,2
                                   ,vnu_hd_ind + 32));
    end loop;

    return vta_rv;
  end obten_liste_nom_fichr;

  function obten_fichr (pbl_fichr_compr   in blob
                       ,pva_nom_fichr     in varchar2
                       ,pva_encod         in varchar2 := null)
    return blob
  is
    vbl_tmp      blob;
    vnu_ind      integer;
    vnu_hd_ind   integer;
    vnu_fl_ind   integer;
  begin
    vnu_ind   := dbms_lob.getlength (pbl_fichr_compr) - 21;

    loop
      exit when    dbms_lob.substr (pbl_fichr_compr
                                   ,4
                                   ,vnu_ind) = hextoraw ('504B0506')
                or vnu_ind < 1;
      vnu_ind   := vnu_ind - 1;
    end loop;

    --
    if vnu_ind <= 0
    then
      return null;
    end if;

    --
    vnu_hd_ind      :=
        raw2num (dbms_lob.substr (pbl_fichr_compr
                                 ,4
                                 ,vnu_ind + 16))
      + 1;

    for i in 1 ..
             raw2num (dbms_lob.substr (pbl_fichr_compr
                                      ,2
                                      ,vnu_ind + 8))
    loop
      if pva_nom_fichr = raw2varchar2 (dbms_lob.substr (pbl_fichr_compr
                                                       ,raw2num (dbms_lob.substr (pbl_fichr_compr
                                                                                 ,2
                                                                                 ,vnu_hd_ind + 28))
                                                       ,vnu_hd_ind + 46)
                                      ,pva_encod)
      then
        if dbms_lob.substr (pbl_fichr_compr
                           ,2
                           ,vnu_hd_ind + 10) = hextoraw ('0800') -- deflate
        then
          vnu_fl_ind      :=
            raw2num (dbms_lob.substr (pbl_fichr_compr
                                     ,4
                                     ,vnu_hd_ind + 42));
          vbl_tmp   := hextoraw ('1F8B0800000000000003'); -- gzip header
          dbms_lob.copy (vbl_tmp
                        ,pbl_fichr_compr
                        ,raw2num (dbms_lob.substr (pbl_fichr_compr
                                                  ,4
                                                  ,vnu_fl_ind + 19))
                        ,11
                        ,  vnu_fl_ind
                         + 31
                         + raw2num (dbms_lob.substr (pbl_fichr_compr
                                                    ,2
                                                    ,vnu_fl_ind + 27))
                         + raw2num (dbms_lob.substr (pbl_fichr_compr
                                                    ,2
                                                    ,vnu_fl_ind + 29)));
          dbms_lob.append (vbl_tmp
                          ,dbms_lob.substr (pbl_fichr_compr
                                           ,4
                                           ,vnu_fl_ind + 15));
          dbms_lob.append (vbl_tmp
                          ,dbms_lob.substr (pbl_fichr_compr
                                           ,4
                                           ,vnu_fl_ind + 23));
          return utl_compress.lz_uncompress (vbl_tmp);
        end if;

        if dbms_lob.substr (pbl_fichr_compr
                           ,2
                           ,vnu_hd_ind + 10) = hextoraw ('0000')
        -- The file is stored (no compression)
        then
          vnu_fl_ind      :=
            raw2num (dbms_lob.substr (pbl_fichr_compr
                                     ,4
                                     ,vnu_hd_ind + 42));

          dbms_lob.createtemporary (vbl_tmp
                                   ,cache   => true);

          dbms_lob.copy (dest_lob      => vbl_tmp
                        ,src_lob       => pbl_fichr_compr
                        ,amount        => raw2num (dbms_lob.substr (pbl_fichr_compr
                                                                   ,4
                                                                   ,vnu_fl_ind + 19))
                        ,dest_offset   => 1
                        ,src_offset    =>   vnu_fl_ind
                                          + 31
                                          + raw2num (dbms_lob.substr (pbl_fichr_compr
                                                                     ,2
                                                                     ,vnu_fl_ind + 27))
                                          + raw2num (dbms_lob.substr (pbl_fichr_compr
                                                                     ,2
                                                                     ,vnu_fl_ind + 29)));

          return vbl_tmp;
        end if;
      end if;

      vnu_hd_ind      :=
          vnu_hd_ind
        + 46
        + raw2num (dbms_lob.substr (pbl_fichr_compr
                                   ,2
                                   ,vnu_hd_ind + 28))
        + raw2num (dbms_lob.substr (pbl_fichr_compr
                                   ,2
                                   ,vnu_hd_ind + 30))
        + raw2num (dbms_lob.substr (pbl_fichr_compr
                                   ,2
                                   ,vnu_hd_ind + 32));
    end loop;

    return null;
  end obten_fichr;

  function extra_fichr (pbl_fichr_compr_zip   in blob
                       ,pva_encod             in varchar2 default null
                       ,pbo_extra_contn       in boolean default true)
    return typ_tab_fichr
  is
    vta_list_fichr       typ_tab_fichr;
    vta_list_nom_fichr   typ_list_nom_fichr;
  begin
    vta_list_nom_fichr      :=
      obten_liste_nom_fichr (pbl_fichr_compr_zip
                            ,pva_encod);

    for i in vta_list_nom_fichr.first () .. vta_list_nom_fichr.last
    loop
      vta_list_fichr (i).nom   := vta_list_nom_fichr (i);

      if vta_list_fichr (i).nom like '/%'
      then
        vta_list_fichr (i).nom      :=
          substr (vta_list_fichr (i).nom
                 ,2);
      end if;

      if instr (vta_list_fichr (i).nom
               ,'/') > 0
      then
        vta_list_fichr (i).reprt      :=
          substr (vta_list_fichr (i).nom
                 ,1
                 ,  instr (vta_list_fichr (i).nom
                          ,'/'
                          ,-1)
                  - 1);
        vta_list_fichr (i).nom      :=
          substr (vta_list_fichr (i).nom
                 ,  instr (vta_list_fichr (i).nom
                          ,'/'
                          ,-1)
                  + 1);
      end if;

      if pbo_extra_contn
      then
        vta_list_fichr (i).contn      :=
          obten_fichr (pbl_fichr_compr_zip
                      ,vta_list_nom_fichr (i)
                      ,pva_encod);
      end if;
    end loop;

    return vta_list_fichr;
  end extra_fichr;
end afw_07_util_compr_zip_pkg;
/
