SET DEFINE OFF;
create or replace package body afw_07_clob_pkg
as
  type typ_clob is record
  (
    cl_contn         clob
   ,va_tampn         varchar2 (32500 char) default null
   ,va_seprt_ligne   varchar2 (10) default chr (10)
  );

  type typ_arr_clob is table of typ_clob
    index by typ_index;

  gar_clob          typ_arr_clob;
  gnu_index_courn   typ_index default null;
  gva_seprt_ligne   varchar2 (10) default chr (10);

  procedure ecrir_tampn (pnu_index in typ_index)
  is
  begin
    if gar_clob (pnu_index).va_tampn is not null
    then
      dbms_lob.append (gar_clob (pnu_index).cl_contn
                      ,gar_clob (pnu_index).va_tampn);
      gar_clob (pnu_index).va_tampn   := null;
    end if;
  end ecrir_tampn;

  procedure ajout_tampn (pnu_index   in typ_index
                        ,pva_contn   in varchar2)
  is
    vnu_tail_tampn   number default nvl (length (gar_clob (pnu_index).va_tampn), 0);
    vva_contn        varchar2 (32767) default pva_contn;
  begin
    while nvl (length (vva_contn), 0) + vnu_tail_tampn > 20000
    loop
      gar_clob (pnu_index).va_tampn      :=
           gar_clob (pnu_index).va_tampn
        || substr (vva_contn
                  ,1
                  ,20000 - vnu_tail_tampn);
      ecrir_tampn (pnu_index);
      vva_contn        :=
        substr (vva_contn
               , (20000 - vnu_tail_tampn) + 1);
      vnu_tail_tampn   := 0;
    end loop;

    gar_clob (pnu_index).va_tampn      :=
         gar_clob (pnu_index).va_tampn
      || vva_contn;
  exception
    when others
    then
      raise;
  end ajout_tampn;

  procedure creer_nouv
  is
    vre_clob   typ_clob;
  begin
    gnu_index_courn              := nvl (gar_clob.last (), 0) + 1;
    gar_clob (gnu_index_courn)   := vre_clob;
    dbms_lob.createtemporary (gar_clob (gnu_index_courn).cl_contn
                             ,true);
  end creer_nouv;

  function creer_nouv
    return typ_index
  is
  begin
    creer_nouv ();
    return gnu_index_courn;
  end creer_nouv;

  procedure defnr_courn (pnu_index in typ_index)
  is
  begin
    if gar_clob.exists (pnu_index)
    then
      gnu_index_courn   := pnu_index;
    else
      gnu_index_courn   := null;
    end if;
  end defnr_courn;

  function tail (pnu_index in typ_index default null)
    return number
  is
    vnu_index   typ_index default nvl (pnu_index, gnu_index_courn);
  begin
    if     vnu_index is not null
       and gar_clob.exists (vnu_index)
    then
      return nvl (dbms_lob.getlength (gar_clob (vnu_index).cl_contn), 0) + nvl (length (gar_clob (vnu_index).va_tampn), 0);
    else
      return null;
    end if;
  end tail;

  procedure ajout (pva_contn   in varchar2
                  ,pnu_index   in typ_index default null)
  is
    vnu_index   typ_index default nvl (pnu_index, gnu_index_courn);
  begin
    if     vnu_index is not null
       and gar_clob.exists (vnu_index)
    then
      if pva_contn is not null
      then
        ajout_tampn (vnu_index
                    ,pva_contn);
      end if;
    end if;
  end ajout;

  procedure ajout_ligne (pva_ligne   in varchar2 default null
                        ,pnu_index   in typ_index default null)
  is
  begin
    ajout (   pva_ligne
           || gva_seprt_ligne
          ,pnu_index);
  end ajout_ligne;

  function obten (pnu_index in typ_index default null)
    return clob
  is
    vnu_index   typ_index default nvl (pnu_index, gnu_index_courn);
  begin
    if     vnu_index is not null
       and gar_clob.exists (vnu_index)
    then
      ecrir_tampn (vnu_index);
      return gar_clob (vnu_index).cl_contn;
    else
      return null;
    end if;
  end obten;

  procedure ajout_segmn (pse_segmn in typ_segmn)
  is
  begin
    gar_segmn_courn (nvl (gar_segmn_courn.count, 0) + 1)   := pse_segmn;
  end ajout_segmn;

  procedure table_segmn_vers_clob (pcl_clob    in out nocopy clob
                                  ,par_segmn   in            typ_arr_segmn)
  is
  begin
    dbms_lob.trim (pcl_clob
                  ,0);

    if par_segmn.first () is not null
    then
      for i in par_segmn.first () .. par_segmn.last ()
      loop
        if par_segmn (i) is not null
        then
          dbms_lob.writeappend (pcl_clob
                               ,length (par_segmn (i))
                               ,par_segmn (i));
        end if;
      end loop;
    end if;
  end table_segmn_vers_clob;

  function table_segmn_vers_clob (par_segmn in typ_arr_segmn)
    return clob
  is
    vcl_clob   clob;
  begin
    dbms_lob.createtemporary (vcl_clob
                             ,false);
    table_segmn_vers_clob (vcl_clob
                          ,par_segmn);
    return vcl_clob;
  end table_segmn_vers_clob;

  function table_segmn_vers_clob
    return clob
  is
  begin
    return table_segmn_vers_clob (gar_segmn_courn);
  end table_segmn_vers_clob;

  function clob_vers_table_segmn (pcl_clob          in clob
                                 ,pnu_longr_segmn   in number default 16000)
    return typ_arr_segmn
  is
    var_segmn         typ_arr_segmn;
    vnu_ofset         number default 0;
    vnu_tail          number;
    vnu_index_segmn   typ_index default 0;
    vnu_longr_segmn   number default case when nvl (pnu_longr_segmn, 0) <= 0 then 16000 else pnu_longr_segmn end;
  begin
    vnu_tail   := dbms_lob.getlength (pcl_clob);

    while vnu_ofset < vnu_tail
    loop
      vnu_index_segmn   := vnu_index_segmn + 1;
      var_segmn (vnu_index_segmn)      :=
        dbms_lob.substr (pcl_clob
                        ,vnu_longr_segmn
                        ,vnu_ofset + 1);

      vnu_ofset         := vnu_ofset + vnu_longr_segmn;
    end loop;

    return var_segmn;
  end clob_vers_table_segmn;

  procedure table_segmn_vers_blob (pbl_blob    in out nocopy blob
                                  ,par_segmn   in            typ_arr_segmn)
  is
  begin
    dbms_lob.trim (pbl_blob
                  ,0);

    if par_segmn.first () is not null
    then
      for i in par_segmn.first () .. par_segmn.last ()
      loop
        if par_segmn (i) is not null
        then
          dbms_lob.writeappend (pbl_blob
                               ,length (par_segmn (i))
                               ,par_segmn (i));
        end if;
      end loop;
    end if;
  end table_segmn_vers_blob;

  function table_segmn_vers_blob (par_segmn in typ_arr_segmn)
    return blob
  is
    vbl_blob   blob;
  begin
    dbms_lob.createtemporary (vbl_blob
                             ,false);
    table_segmn_vers_blob (vbl_blob
                          ,par_segmn);
    return vbl_blob;
  end table_segmn_vers_blob;

  function table_segmn_vers_blob
    return blob
  is
  begin
    return table_segmn_vers_blob (gar_segmn_courn);
  end table_segmn_vers_blob;

  function blob_vers_table_segmn (pbl_blob          in blob
                                 ,pnu_longr_segmn   in number default 160)
    return typ_arr_segmn
  is
    var_segmn         typ_arr_segmn;
    vnu_ofset         number default 0;
    vnu_tail          number;
    vnu_index_segmn   typ_index default 0;
    vnu_longr_segmn   number default case when nvl (pnu_longr_segmn, 0) <= 0 then 160 else pnu_longr_segmn end;
  begin
    vnu_tail   := dbms_lob.getlength (pbl_blob);

    while vnu_ofset < vnu_tail
    loop
      vnu_index_segmn   := vnu_index_segmn + 1;
      var_segmn (vnu_index_segmn)      :=
        dbms_lob.substr (pbl_blob
                        ,vnu_longr_segmn
                        ,vnu_ofset + 1);
      vnu_ofset         := vnu_ofset + vnu_longr_segmn;
    end loop;

    return var_segmn;
  end blob_vers_table_segmn;

  function sous_chain_blob (pbl_blob     in blob
                           ,pnu_amount   in integer
                           ,pnu_offset   in integer default 1)
    return blob
  is
    vbl_result   blob;
  begin
    --Est-ce le BLOB au complet ?
    if     pnu_offset = 1
       and pnu_amount >= dbms_lob.getlength (pbl_blob)
    then
      vbl_result   := pbl_blob;
    else
      --Traitement du BLOB;
      declare
        vbl_blob          blob;
        vnu_curnt_pos     integer := case when pnu_offset = 0 then 1 else pnu_offset end;
        vnu_remng_amont   integer := pnu_amount;
        vnu_work_amont    integer;
      begin
        dbms_lob.createtemporary (vbl_blob
                                 ,false
                                 ,dbms_lob.call);

        while vnu_remng_amont > 0
        loop
          vnu_work_amont    := case when vnu_remng_amont > 2000 then 2000 else vnu_remng_amont end;
          dbms_lob.append (vbl_blob
                          ,dbms_lob.substr (pbl_blob
                                           ,vnu_work_amont
                                           ,vnu_curnt_pos));
          vnu_remng_amont   := vnu_remng_amont - vnu_work_amont;
          vnu_curnt_pos     := vnu_curnt_pos + vnu_work_amont;
        end loop;

        vbl_result   := vbl_blob;
        dbms_lob.freetemporary (vbl_blob);
      exception
        when others
        then
          dbms_lob.freetemporary (vbl_blob);
          raise;
      end;
    end if;

    return vbl_result;
  end;

  function obten_table_segmn (pnu_index         in typ_index default null
                             ,pnu_longr_segmn   in number default 16000)
    return typ_arr_segmn
  is
    vnu_index   typ_index default nvl (pnu_index, gnu_index_courn);
    var_segmn   typ_arr_segmn;
  begin
    if     vnu_index is not null
       and gar_clob.exists (vnu_index)
    then
      ecrir_tampn (vnu_index);
      return clob_vers_table_segmn (gar_clob (vnu_index).cl_contn
                                   ,pnu_longr_segmn);
    end if;

    return var_segmn;
  end obten_table_segmn;

  procedure termn (pnu_index in typ_index default null)
  is
    vnu_index   typ_index default nvl (pnu_index, gnu_index_courn);
  begin
    if     vnu_index is not null
       and gar_clob.exists (vnu_index)
    then
      dbms_lob.freetemporary (gar_clob (vnu_index).cl_contn);
      gar_clob.delete (vnu_index);

      -- Si on termine le clob courant, le nouveau courant sera le dernier de la pile
      if vnu_index = gnu_index_courn
      then
        gnu_index_courn   := gar_clob.last ();
      end if;
    end if;
  end termn;

  procedure replc (pcl_clob          in out nocopy clob
                  ,pva_chain_rechr   in            varchar2
                  ,pva_chain_rempl   in            varchar2
                  ,pcl_clob_rempl    in            clob default null)
  is
  begin
    pcl_clob      :=
      replc (pcl_clob
            ,pva_chain_rechr
            ,pva_chain_rempl
            ,pcl_clob_rempl);
  end replc;

  function replc (pcl_clob          in clob
                 ,pva_chain_rechr   in varchar2
                 ,pva_chain_rempl   in varchar2
                 ,pcl_clob_rempl    in clob default null)
    return clob
  is
    vbo_ocurn_trouv   boolean;
    vnu_indic_courn   pls_integer;
    vnu_ocurn_ancn    pls_integer;
    vcl_clob_tempr    clob;
    vnu_long_clob     pls_integer;
    vva_nr            varchar2 (15);
  begin
    if pva_chain_rechr is null
    then
      return null;
    end if;

    vnu_long_clob     := dbms_lob.getlength (pcl_clob);
    vnu_indic_courn      :=
      dbms_lob.instr (pcl_clob
                     ,pva_chain_rechr
                     ,1
                     ,1);
    vbo_ocurn_trouv   := false;
    vnu_ocurn_ancn    := 1;

    while vnu_indic_courn > 0
    loop
      if not vbo_ocurn_trouv
      then
        dbms_lob.createtemporary (vcl_clob_tempr
                                 ,true);
        vbo_ocurn_trouv   := true;
      end if;

      --Copier seulement s'il y a des caractères entre l'ancienne occurence
      --et la nouvelle
      if vnu_indic_courn - vnu_ocurn_ancn != 0
      then
        dbms_lob.copy (vcl_clob_tempr
                      ,pcl_clob
                      ,vnu_indic_courn - vnu_ocurn_ancn
                      ,dbms_lob.getlength (vcl_clob_tempr) + 1
                      ,vnu_ocurn_ancn);
      end if;

      --substituer la valeur si **nr** (noreplace) n'est pas là avant le champ de remplacement
      if vnu_indic_courn > 7
      then
        vva_nr      :=
          dbms_lob.substr (pcl_clob
                          ,6
                          ,vnu_indic_courn - 6);
      end if;

      if vva_nr = '**nr**'
      then
        dbms_lob.writeappend (vcl_clob_tempr
                             ,length (pva_chain_rechr)
                             ,pva_chain_rechr);
      else
        if pva_chain_rempl is not null
        then
          dbms_lob.writeappend (vcl_clob_tempr
                               ,length (pva_chain_rempl)
                               ,pva_chain_rempl);
        elsif dbms_lob.getlength (pcl_clob_rempl) > 0
        then
          --remplacer par le clob à la place
          dbms_lob.copy (vcl_clob_tempr
                        ,pcl_clob_rempl
                        ,dbms_lob.getlength (pcl_clob_rempl)
                        ,dbms_lob.getlength (vcl_clob_tempr) + 1);
        end if;
      end if;

      if pva_chain_rechr is not null
      then
        vnu_ocurn_ancn   := vnu_indic_courn + length (pva_chain_rechr);
      else
        vnu_ocurn_ancn   := vnu_indic_courn + dbms_lob.getlength (pcl_clob_rempl);
      end if;

      --Déterminer la présence d'une autre occurence
      vnu_indic_courn      :=
        dbms_lob.instr (pcl_clob
                       ,pva_chain_rechr
                       ,vnu_ocurn_ancn
                       ,1);
    end loop;

    --Écrire la fin
    if vbo_ocurn_trouv
    then
      --Copier seulement s'il y a des caractères apres la derniere occurence
      if (vnu_long_clob + 1) - vnu_ocurn_ancn != 0
      then
        dbms_lob.copy (vcl_clob_tempr
                      ,pcl_clob
                      ,vnu_long_clob /*dbms_lob.getlength (pcl_clob)*/
                                    - vnu_ocurn_ancn + 1
                      ,dbms_lob.getlength (vcl_clob_tempr) + 1
                      ,vnu_ocurn_ancn);
      end if;
    end if;

    if vbo_ocurn_trouv
    then
      return vcl_clob_tempr;
    else
      return pcl_clob;
    end if;
  exception
    when others
    then
      ete ();
      return null;
  end replc;

  procedure obten_clob_lower (pcl_clob_sourc   in            clob
                             ,pcl_clob_destn   in out nocopy clob)
  is
    vnu_idx       pls_integer;
    vnu_max_idx   pls_integer;
    vva_lower     varchar2 (2048);
  begin
    vnu_max_idx   := dbms_lob.getlength (pcl_clob_sourc);
    vnu_idx       := 1;

    while vnu_idx < vnu_max_idx
    loop
      vva_lower      :=
        lower (dbms_lob.substr (pcl_clob_sourc
                               ,least (1024
                                      ,vnu_max_idx - vnu_idx)
                               ,vnu_idx));
      dbms_lob.writeappend (pcl_clob_destn
                           ,length (vva_lower)
                           ,vva_lower);
      vnu_idx      :=
        least (vnu_idx + 1024
              ,vnu_max_idx);
    end loop;
  end obten_clob_lower;

  function instr_lower (pcl_clob    in clob
                       ,pva_chain   in varchar)
    return varchar2
  is
    vnu_idx          pls_integer;
    vcl_clob_lower   clob;
  begin
    dbms_lob.createtemporary (vcl_clob_lower
                             ,true);
    obten_clob_lower (pcl_clob
                     ,vcl_clob_lower);
    vnu_idx      :=
      dbms_lob.instr (vcl_clob_lower
                     ,pva_chain
                     ,1);
    dbms_lob.freetemporary (vcl_clob_lower);
    return vnu_idx;
  end instr_lower;

  function count_instr_lower (pcl_clob    in out nocopy clob
                             ,pva_chain   in            varchar)
    return number
  is
    vcl_clob_lower   clob;
    vnu_idx          pls_integer;
    vnu_count        pls_integer default 0;
  begin
    dbms_lob.createtemporary (vcl_clob_lower
                             ,true);
    obten_clob_lower (pcl_clob
                     ,vcl_clob_lower);
    vnu_idx      :=
      dbms_lob.instr (vcl_clob_lower
                     ,lower (pva_chain)
                     ,1);

    while vnu_idx > 0
    loop
      vnu_count   := vnu_count + 1;
      dbms_output.put_line ('ajout');
      vnu_idx      :=
        dbms_lob.instr (vcl_clob_lower
                       ,lower (pva_chain)
                       ,vnu_idx + 1);
    end loop;

    dbms_lob.freetemporary (vcl_clob_lower);
    return vnu_count;
  end count_instr_lower;

  procedure instr_debut_fin (pcl_clob              in out nocopy clob
                            ,pva_debut             in            varchar2
                            ,pva_fin               in            varchar2
                            ,pnu_ofset_debut       in            pls_integer default 1
                            ,pnu_ocurn             in            pls_integer default 1
                            ,pva_carct_non_autor   in            varchar2 default null
                            ,pnu_debut                out        pls_integer
                            ,pnu_fin                  out        pls_integer
                            ,pva_chain_compl          out        varchar)
  is
    vnu_debut   pls_integer;
    vnu_fin     pls_integer;
    vva_mot     typ_mot_instr_debut_fin;
  begin
    if pnu_ocurn is null
    then
      raise exc_ocurn_null;
    end if;

    vnu_debut      :=
      dbms_lob.instr (pcl_clob
                     ,pva_debut
                     ,pnu_ofset_debut
                     ,pnu_ocurn);

    if vnu_debut = 0
    then
      pnu_debut   := 0;
      pnu_fin     := 0;
      return;
    else
      vnu_fin      :=
        dbms_lob.instr (pcl_clob
                       ,pva_fin
                       ,vnu_debut + 1
                       ,1);

      if vnu_fin = 0
      then
        pnu_debut   := 0;
        pnu_fin     := 0;
        return;
      else
        if vnu_fin - vnu_debut > 32767
        then
          raise exc_mot_trop_long;
        else
          vva_mot      :=
            dbms_lob.substr (pcl_clob
                            ,vnu_fin - vnu_debut + length (pva_fin)
                            ,vnu_debut);
        end if;

        if pva_carct_non_autor is not null
        then
          null;
        end if;

        pnu_debut         := vnu_debut;
        pnu_fin           := vnu_fin;
        pva_chain_compl   := vva_mot;
      end if;
    end if;
  end instr_debut_fin;

  procedure fusnr_clob (pnu_cible   in typ_index
                       ,pnu_sourc   in typ_index)
  is
  begin
    ecrir_tampn (pnu_cible);
    ecrir_tampn (pnu_sourc);
    dbms_lob.append (gar_clob (pnu_cible).cl_contn
                    ,gar_clob (pnu_sourc).cl_contn);
  end fusnr_clob;

  function convr_clob_vers_blob (pcl_clob    in clob
                                ,pva_chars   in varchar2 default dbms_lob.default_csid)
    return blob
  is
    vbl_blob           blob;
    vnu_amount         integer;
    vnu_dest_offset    integer default 1;
    vnu_src_offset     integer default 1;
    vnu_lang_context   integer := dbms_lob.default_lang_ctx;
    vnu_warning        integer;
  begin
    vnu_amount   := dbms_lob.getlength (pcl_clob);

    dbms_lob.createtemporary (vbl_blob
                             ,true);

    dbms_lob.converttoblob (dest_lob       => vbl_blob
                           ,src_clob       => pcl_clob
                           ,amount         => vnu_amount
                           ,dest_offset    => vnu_dest_offset
                           ,src_offset     => vnu_src_offset
                           ,blob_csid      => pva_chars
                           ,lang_context   => vnu_lang_context
                           ,warning        => vnu_warning);

    return vbl_blob;
  exception
    when others
    then
      ete ();
      dbms_lob.freetemporary (vbl_blob);
      raise;
  end convr_clob_vers_blob;

  function convr_blob_vers_clob (pbl_blob    in blob
                                ,pva_chars   in varchar2 default dbms_lob.default_csid)
    return clob
  is
    vcl_clob           clob;
    vnu_amount         integer;
    vnu_dest_offset    integer default 1;
    vnu_src_offset     integer default 1;
    vnu_lang_context   integer := dbms_lob.default_lang_ctx;
    vnu_warning        integer;
  begin
    vnu_amount   := dbms_lob.getlength (pbl_blob);

    dbms_lob.createtemporary (vcl_clob
                             ,true);

    dbms_lob.converttoclob (dest_lob       => vcl_clob
                           ,src_blob       => pbl_blob
                           ,amount         => vnu_amount
                           ,dest_offset    => vnu_dest_offset
                           ,src_offset     => vnu_src_offset
                           ,blob_csid      => pva_chars
                           ,lang_context   => vnu_lang_context
                           ,warning        => vnu_warning);

    return vcl_clob;
  exception
    when others
    then
      ete ();
      dbms_lob.freetemporary (vcl_clob);
      raise;
  end convr_blob_vers_clob;

  function decd_base64 (pcl_clob in clob)
    return blob
  is
    vbl_blob             blob;
    vbl_result           blob;
    vnu_offset           integer;
    vnu_buffer_size      binary_integer := 48;
    vva_buffer_varchar   varchar2 (48);
    vra_buffer_raw       raw (48);
  begin
    if pcl_clob is not null
    then
      dbms_lob.createtemporary (vbl_blob
                               ,true);
      vnu_offset   := 1;

      for i in 1 .. ceil (dbms_lob.getlength (pcl_clob) / vnu_buffer_size)
      loop
        dbms_lob.read (pcl_clob
                      ,vnu_buffer_size
                      ,vnu_offset
                      ,vva_buffer_varchar);
        vra_buffer_raw   := utl_raw.cast_to_raw (vva_buffer_varchar);
        vra_buffer_raw   := utl_encode.base64_decode (vra_buffer_raw);
        dbms_lob.writeappend (vbl_blob
                             ,utl_raw.length (vra_buffer_raw)
                             ,vra_buffer_raw);
        vnu_offset       := vnu_offset + vnu_buffer_size;
      end loop;

      vbl_result   := vbl_blob;
      dbms_lob.freetemporary (vbl_blob);
    end if;

    return vbl_result;
  end decd_base64;

  function encod_base64 (pbl_blob in blob)
    return clob
  is
    vcl_clob             clob;
    vcl_result           clob;
    vnu_offset           integer;
    vnu_chunk_size       binary_integer := (48 / 4) * 3;
    vva_buffer_varchar   varchar2 (48);
    vra_buffer_raw       raw (48);
  begin
    if pbl_blob is not null
    then
      dbms_lob.createtemporary (vcl_clob
                               ,true);
      vnu_offset   := 1;

      for i in 1 .. ceil (dbms_lob.getlength (pbl_blob) / vnu_chunk_size)
      loop
        dbms_lob.read (pbl_blob
                      ,vnu_chunk_size
                      ,vnu_offset
                      ,vra_buffer_raw);
        vra_buffer_raw       := utl_encode.base64_encode (vra_buffer_raw);
        vva_buffer_varchar   := utl_raw.cast_to_varchar2 (vra_buffer_raw);
        dbms_lob.writeappend (vcl_clob
                             ,length (vva_buffer_varchar)
                             ,vva_buffer_varchar);
        vnu_offset           := vnu_offset + vnu_chunk_size;
      end loop;

      vcl_result   := vcl_clob;
      dbms_lob.freetemporary (vcl_clob);
    end if;

    return vcl_result;
  end encod_base64;

  procedure defnr_seprt_ligne (pva_seprt_ligne in varchar2)
  is
  begin
    gva_seprt_ligne   := pva_seprt_ligne;
  end defnr_seprt_ligne;

  function extra_clob (pcl_clob    in out nocopy clob
                      ,pnu_debut   in            pls_integer
                      ,pnu_fin     in            pls_integer)
    return clob
  is
    vcl_tempr       clob;
    vva_ligne       varchar2 (32767);
    vnu_amount      pls_integer;
    vnu_idx_debut   pls_integer;
    vnu_idx_fin     pls_integer;
  begin
    vnu_idx_debut   := pnu_debut;
    vnu_idx_fin     := pnu_fin;

    vnu_amount      :=
      least (1024
            ,vnu_idx_fin - vnu_idx_debut);

    while vnu_amount > 0
    loop
      vva_ligne       :=
        dbms_lob.substr (lob_loc   => pcl_clob
                        ,amount    => vnu_amount
                        ,offset    => vnu_idx_debut);
      --dbms_lob.writeappend (vcl_tempr, length (vva_ligne), vva_ligne);
      vnu_amount      :=
        least (1024
              ,vnu_idx_fin - vnu_idx_debut);
      vnu_idx_debut   := vnu_idx_debut + vnu_amount;
    end loop;

    return vcl_tempr;
  end extra_clob;
end afw_07_clob_pkg;
/
