SET DEFINE OFF;
create or replace package body afw_15_ftp_pkg
is
  --
  -- CHANGE HISTORY
  --
  -- BCHASE        08-AUG-2006
  --                         Added exception handlers
  --                         Added logic to verify and handle INTERFACE table instead of path
  --                         for localpath entries
  --
  --
  /* Display Output. Displays DBMS_OUTPUT in chunks so we don't bust the 255 limit by accident */

  gbl_fich          blob;
  gbo_ecrir_dirct   boolean default true;

  procedure print_output (p_message in varchar2)
  is
    c_process   constant varchar2 (100) := 'hum_ftp_UTILITIES.PRINT_OUTPUT';
  begin
    if afw_15_ftp_noyau_pkg.l_ftp_debug = 'Y'
    then
      null; --ete (p_message);  #je ne sais pas si cette procédure est importante ou non : Bastien Gibrat#
    end if;
  exception
    when others
    then
      null; -- Ignore errors... protect buffer overflow's etc.
  end print_output;


  procedure verify_server (errbuf                      out varchar2
                          ,retcode                     out number
                          ,p_hostname               in     varchar2
                          ,p_remotepath             in     varchar2
                          ,p_username               in     varchar2
                          ,p_password               in     varchar2
                          ,p_mainframe_connection   in     varchar2 default 'F')
  is
    c_process   constant varchar2 (100) := 'hum_ftp_UTILITIES.VERIFY_SERVER';
    lbok                 boolean;
    p_error_msg          varchar2 (32000);
    p_status             varchar2 (32000);
    p_mainframe_conn     boolean;
    p_remote_path        varchar2 (2000);
  --
  -- This applies to Oracle Applications Environments only
  --
  --      p_request_id                  NUMBER := fnd_global.conc_request_id;
  --
  begin
    /* CLEAR PASSWORD SO IT CANNOT BE SEEN VIA CONCURRENT REQ VIEWS */
    --
    -- Change the argument identifiers to match your concurrent mgr setup
    --
    -- This applies to Oracle Applications Environments only
    --
    --      UPDATE fnd_concurrent_requests
    --      SET argument4 = '*******'
    --,         argument3 = '*******'
    --,         argument_text =
    --             REPLACE ( REPLACE ( argument_text
    --,                                argument4
    --,                                '*******' )
    --,                      argument3
    --,                      '*******' )
    --      WHERE  request_id = p_request_id;
    --
    --      COMMIT;


    if p_mainframe_connection = 'F'
    then
      p_mainframe_conn   := false;
      p_remote_path      := p_remotepath;
    else
      p_mainframe_conn   := true;
      p_remote_path      := p_remotepath;
    end if;

    print_output (chr (10));

    if p_mainframe_conn
    then
      print_output (   'REMOTE FTP SERVER (mainframe) :: '
                    || p_hostname);
    else
      print_output (   'REMOTE FTP SERVER :: '
                    || p_hostname);
    end if;

    print_output (   'REMOTE PATH :: '
                  || p_remote_path);
    print_output (chr (10));
    --
    lbok      :=
      afw_15_ftp_noyau_pkg.verify_server (p_remotepath             => p_remote_path
                                         ,p_username               => p_username
                                         ,p_password               => p_password
                                         ,p_hostname               => p_hostname
                                         ,v_status                 => p_status
                                         ,v_error_message          => p_error_msg
                                         ,p_port                   => 21
                                         ,p_filetype               => 'ASCII'
                                         ,p_mainframe_connection   => p_mainframe_conn);

    if     lbok
       and nvl (p_status, 'SUCCESS') = 'SUCCESS'
    then
      print_output (chr (10));
      print_output (   'SERVER CONNECTION TO '
                    || p_hostname
                    || ' IS VALID.');
      errbuf    := null;
      retcode   := 0;
    else
      print_output (chr (10));
      print_output (   'ERROR :: SERVER CONNECTION TO '
                    || p_hostname
                    || ' IS NOT VALID. '
                    || chr (10)
                    || chr (10)
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
    end if;
  exception
    when others
    then
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: SERVER CONNECTION TO '
                    || p_hostname
                    || ' IS NOT VALID. '
                    || chr (10)
                    || chr (10)
                    || sqlcode
                    || ' - '
                    || sqlerrm);
      errbuf    := null;
      retcode   := 2;
  end verify_server;

  procedure get_remote_file (errbuf                   out varchar2
                            ,retcode                  out number
                            ,p_hostname            in     varchar2
                            ,p_localpath           in     varchar2
                            ,p_filename            in     varchar2
                            ,p_remotepath          in     varchar2
                            ,p_username            in     varchar2
                            ,p_password            in     varchar2
                            ,p_port                in     number default 21
                            ,p_filetype            in     varchar2 default 'ASCII'
                            ,p_mainframe           in     varchar2 default 'F'
                            ,p_mainframe_command   in     varchar2 default null)
  is
    c_process        constant varchar2 (100) := 'hum_ftp_UTILITIES.GET_REMOTE_FILE';
    p_status                  varchar2 (32000);
    p_error_msg               varchar2 (32000);
    p_elapsed_time            varchar2 (100);
    p_files                   varchar2 (4000);
    p_bytes_trans             number;
    p_trans_start             date;
    p_trans_end               date;
    lbok                      boolean;
    p_failed                  char (1) := 'N';
    p_mainframe_conn          boolean;
    p_remote_path             varchar2 (240);
    p_exists                  boolean;
    p_block_size              binary_integer;
    l_original_filename       varchar2 (4000);
    l_new_filename            varchar2 (4000);
    l_success                 varchar2 (32767);
    l_dba_directory           varchar2 (100);
    l_interface               varchar2 (100);
    err_dba_dir_not_defined   exception;
    err_dzero_byte_file       exception;
  --
  -- This applies to Oracle Applications Environments only
  --
  --      p_request_id                  NUMBER := fnd_global.conc_request_id;
  --
  begin
    /* CLEAR PASSWORD SO IT CANNOT BE SEEN VIA CONCURRENT REQ VIEWS */
    --
    -- Change the argument identifiers to match your concurrent mgr setup
    --
    -- This applies to Oracle Applications Environments only
    --
    --      UPDATE fnd_concurrent_requests
    --      SET argument4 = '*******'
    --,         argument3 = '*******'
    --,         argument_text =
    --             REPLACE ( REPLACE ( argument_text
    --,                                argument4
    --,                                '*******' )
    --,                      argument3
    --,                      '*******' )
    --      WHERE  request_id = p_request_id;
    --
    --      COMMIT;
    --
    -- l_interface is the name of the DBA_DIRECTORY that you wish to use for
    -- this operation. You must have READ/WRITE permissions to this dba_directory
    --
    l_interface   := upper (p_localpath);

    begin
      select rtrim (directory_path
                   ,'/')
        into l_dba_directory
        from all_directories
       where directory_name = l_interface;
    exception
      when no_data_found
      then
        l_dba_directory   := l_interface;
        raise err_dba_dir_not_defined;
    end;

    if p_mainframe = 'F'
    then
      p_mainframe_conn   := false;
      p_remote_path      := p_remotepath;
    else
      p_mainframe_conn   := true;
      p_remote_path      := p_remotepath;
    end if;

    if p_filetype not in ('ASCII'
                         ,'BINARY')
    then
      p_failed      := 'Y';
      p_error_msg   := 'INVALID FILETYPE DEFINED. MUST BE ASCII or BINARY.';
    end if;

    --
    if p_failed = 'N'
    then
      print_output (chr (10));

      if p_mainframe_conn
      then
        print_output (   'REMOTE FTP SERVER (mainframe) :: '
                      || p_hostname);
      else
        print_output (   'REMOTE FTP SERVER :: '
                      || p_hostname);
      end if;

      print_output (   'REMOTE PATH :: '
                    || p_remote_path);
      print_output (   'LOCAL PATH :: '
                    || l_dba_directory);

      print_output (chr (10));


      if p_mainframe_conn
      then
        print_output (   'SITE COMMAND :: '
                      || p_mainframe_command);
        print_output (   'FILENAME :: '
                      || replace (p_filename
                                 ,'#'
                                 ,' => '));
      else
        print_output (   'FILENAME :: '
                      || replace (p_filename
                                 ,'#'
                                 ,' => '));
      end if;

      print_output (   'TRANSFER MODE :: '
                    || p_filetype);
      print_output (chr (10));
      --
      -- Lets setup our output header columns
      --
      -- To process a file as a different name use the # symbol
      -- test.txt#test.txt20032801
      -- Would be used if you wanted to get the file test.txt but copy to local server as test.txt20032801
      print_output (   rpad ('FILENAME'
                            ,40)
                    || ' | '
                    || rpad ('STATUS'
                            ,15)
                    || ' | '
                    || rpad ('BYTES'
                            ,15)
                    || ' | '
                    || rpad ('START TIME'
                            ,25)
                    || ' | '
                    || rpad ('END TIME'
                            ,25)
                    || ' | '
                    || 'ERROR MESSAGE');
      print_output (chr (10));
      --
      p_files   := p_filename;

      if gbo_ecrir_dirct
      then
        afw_15_ftp_noyau_pkg.mode_fichr (false);
      end if;

      lbok      :=
        afw_15_ftp_noyau_pkg.get_blob (p_filename            => p_files
                                      ,p_blob                => gbl_fich
                                      ,p_remotepath          => p_remote_path
                                      ,p_username            => p_username
                                      ,p_password            => p_password
                                      ,p_hostname            => p_hostname
                                      ,v_status              => p_status
                                      ,v_error_message       => p_error_msg
                                      ,n_bytes_transmitted   => p_bytes_trans
                                      ,d_trans_start         => p_trans_start
                                      ,d_trans_end           => p_trans_end
                                      ,p_port                => p_port
                                      ,p_mainframe_ftp       => p_mainframe_conn
                                      ,p_mainframe_cmd       => p_mainframe_command);

      if gbo_ecrir_dirct
      then
        afw_15_ftp_noyau_pkg.mode_fichr (true);
      end if;

      if     lbok
         and nvl (p_status, 'SUCCESS') = 'SUCCESS'
      then
        if nvl (instr (p_filename
                      ,'#')
               ,0) = 0
        then
          l_new_filename   := p_filename;
        else
          l_new_filename      :=
            ltrim (rtrim (substr (p_filename
                                 ,  instr (p_filename
                                          ,'#')
                                  + 1)));
        end if;

        /* Getting filesize from local path which will show the bytes successfully written */
        if gbo_ecrir_dirct
        then
          utl_file.fgetattr (location      => l_interface
                            ,filename      => l_new_filename
                            ,fexists       => p_exists
                            ,file_length   => p_bytes_trans
                            ,block_size    => p_block_size);

          if p_exists -- If we don't see the file probably a permissions problem prevented the creation
          then
            if p_bytes_trans = 0
            then
              raise err_dzero_byte_file;
            end if;

            print_output (   rpad (replace (p_filename
                                           ,'#'
                                           ,' => ')
                                  ,40)
                          || ' | '
                          || rpad (p_status
                                  ,15)
                          || ' | '
                          || rpad (to_char (p_bytes_trans)
                                  ,15)
                          || ' | '
                          || rpad (to_char (p_trans_start
                                           ,'YYYY-MM-DD HH:MI:SS')
                                  ,25)
                          || ' | '
                          || rpad (to_char (p_trans_end
                                           ,'YYYY-MM-DD HH:MI:SS')
                                  ,25)
                          || ' | '
                          || p_error_msg);
          else
            p_status   := 'TRANSFER FAILED. FILE NOT CREATED.';
          end if;
        end if;

        if p_status <> 'SUCCESS'
        then
          p_failed   := 'Y';
        end if;
      else
        p_failed   := 'Y';
      end if;
    end if;

    if p_failed = 'N'
    then
      print_output (chr (10));
      print_output ('FTP PROCESS COMPLETED.');
      errbuf    := null;
      retcode   := 0;
    else
      print_output (chr (10));
      print_output (   'ERROR :: FTP PROCESS FAILED :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
    end if;
  exception
    when err_dzero_byte_file
    then
      l_success      :=
           'RETRIEVED FILE IS A ZERO-BYTE FILE OR DOES NOT EXIST ['
        || l_new_filename
        || ']';
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || l_success);
      errbuf    := null;
      retcode   := 2;
    when err_dba_dir_not_defined
    then
      l_success      :=
           'DBA DIRECTORY NOT DEFINED ['
        || l_dba_directory
        || ']';
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || l_success);
      errbuf    := null;
      retcode   := 2;
    when others
    then
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm
                    || ' :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
  end get_remote_file;

  function get_remote_file (p_filename     in varchar2
                           ,p_remotepath   in varchar2
                           ,p_hostname     in varchar2
                           ,p_username     in varchar2
                           ,p_password     in varchar2
                           ,p_port         in number default 21
                           ,p_filetype     in varchar2 default 'BINARY')
    return blob
  is
    vva_filtr           varchar2 (200);
    vnu_nombr_fichr     pls_integer;
    vva_reprt_physq     varchar2 (200);
    vnu_presn           pls_integer;
    vva_indic_a_charg   varchar2 (1);
    vnu_sucrs           number (10);

    /**/
    p_status            varchar2 (32000);
    p_error_msg         varchar2 (32000);
    p_elapsed_time      varchar2 (100);
    p_remote_path       varchar2 (2000) default p_remotepath;
    p_local_path        varchar2 (2000);
    p_files             varchar2 (4000) default p_filename;
    p_bytes_trans       number;
    p_trans_start       date;
    p_trans_end         date;
    lbok                boolean;
    lnfilescnt          number := 0;
    l_errbuf            varchar2 (2000);
    l_retcode           pls_integer := 0;
    p_failed            char (1) := 'N';
    p_database          varchar2 (10);
    p_directory         varchar2 (30) default 'DATA_PUMP_DIR';
  begin
    --afw_15_ftp_noyau_pkg.l_ftp_debug := 'Y';
    gbo_ecrir_dirct   := false;
    get_remote_file (errbuf         => l_errbuf
                    ,retcode        => l_retcode
                    ,p_hostname     => p_hostname
                    ,p_localpath    => p_directory
                    ,p_filename     => p_files
                    ,p_remotepath   => p_remote_path
                    ,p_username     => p_username
                    ,p_password     => p_password
                    ,p_port         => p_port
                    ,p_filetype     => 'BINARY');
    gbo_ecrir_dirct   := true;
    return gbl_fich;
  exception
    when others
    then
      gbo_ecrir_dirct   := true;
      raise;
  end get_remote_file;

  procedure put_remote_file (errbuf                   out varchar2
                            ,retcode                  out number
                            ,p_hostname            in     varchar2
                            ,p_localpath           in     varchar2
                            ,p_filename            in     varchar2
                            ,p_remotepath          in     varchar2
                            ,p_username            in     varchar2
                            ,p_password            in     varchar2
                            ,p_filetype            in     varchar2 default 'ASCII'
                            ,p_mainframe           in     varchar2 default 'F'
                            ,p_mainframe_command   in     varchar2 default null)
  is
    c_process        constant varchar2 (100) := 'hum_ftp_UTILITIES.PUT_REMOTE_FILE';
    p_status                  varchar2 (32000);
    p_error_msg               varchar2 (32000);
    p_elapsed_time            varchar2 (100);
    p_files                   varchar2 (4000);
    p_bytes_trans             number;
    p_trans_start             date;
    p_trans_end               date;
    lbok                      boolean;
    p_failed                  char (1) := 'N';
    p_mainframe_conn          boolean;
    p_remote_path             varchar2 (240);
    p_exists                  boolean;
    p_block_size              binary_integer;
    l_original_filename       varchar2 (4000);
    l_new_filename            varchar2 (4000);
    l_success                 varchar2 (32767);
    l_dba_directory           varchar2 (100);
    l_interface               varchar2 (100);
    err_dba_dir_not_defined   exception;
    err_dzero_byte_file       exception;
  --
  -- This applies to Oracle Applications Environments only
  --
  --      p_request_id                  NUMBER := fnd_global.conc_request_id;
  --
  begin
    /* CLEAR PASSWORD SO IT CANNOT BE SEEN VIA CONCURRENT REQ VIEWS */
    --
    -- Change the argument identifiers to match your concurrent mgr setup
    --
    -- This applies to Oracle Applications Environments only
    --
    --      UPDATE fnd_concurrent_requests
    --      SET argument4 = '*******'
    --,         argument3 = '*******'
    --,         argument_text =
    --             REPLACE ( REPLACE ( argument_text
    --,                                argument4
    --,                                '*******' )
    --,                      argument3
    --,                      '*******' )
    --      WHERE  request_id = p_request_id;
    --
    --      COMMIT;
    --
    -- l_interface is the name of the DBA_DIRECTORY that you wish to use for
    -- this operation. You must have READ/WRITE permissions to this dba_directory
    --
    l_interface   := upper (p_localpath);


    begin
      select rtrim (directory_path
                   ,'/')
        into l_dba_directory
        from all_directories
       where directory_name = l_interface;
    exception
      when no_data_found
      then
        l_dba_directory   := l_interface;
        raise err_dba_dir_not_defined;
    end;


    if p_mainframe = 'F'
    then
      p_mainframe_conn   := false;
      p_remote_path      := p_remotepath;
    else
      p_mainframe_conn   := true;
      p_remote_path      := p_remotepath;
    end if;


    if p_filetype not in ('ASCII'
                         ,'BINARY')
    then
      p_failed      := 'Y';
      p_error_msg   := 'INVALID FILETYPE DEFINED. MUST BE ASCII or BINARY.';
    end if;

    --
    if p_failed = 'N'
    then
      print_output (chr (10));

      if p_mainframe_conn
      then
        print_output (   'REMOTE FTP SERVER (mainframe) :: '
                      || p_hostname);
      else
        print_output (   'REMOTE FTP SERVER :: '
                      || p_hostname);
      end if;

      print_output (   'REMOTE PATH :: '
                    || p_remote_path);
      print_output (   'LOCAL PATH :: '
                    || l_dba_directory);

      print_output (chr (10));


      if p_mainframe_conn
      then
        print_output (   'SITE COMMAND :: '
                      || p_mainframe_command);
        print_output (   'FILENAME :: '
                      || replace (p_filename
                                 ,'#'
                                 ,' => '));
      else
        print_output (   'FILENAME :: '
                      || replace (p_filename
                                 ,'#'
                                 ,' => '));
      end if;

      print_output (   'TRANSFER MODE :: '
                    || p_filetype);
      print_output (chr (10));

      if nvl (instr (p_filename
                    ,'#')
             ,0) = 0
      then
        l_original_filename   := p_filename;
      else
        l_original_filename      :=
          ltrim (rtrim (substr (p_filename
                               ,1
                               ,  instr (p_filename
                                        ,'#')
                                - 1)));
      end if;

      /* Check to see if file exists before we even start */
      utl_file.fgetattr (location      => l_interface
                        ,filename      => l_original_filename
                        ,fexists       => p_exists
                        ,file_length   => p_bytes_trans
                        ,block_size    => p_block_size);

      --
      if not p_exists
      then
        p_failed   := 'Y';
        p_error_msg      :=
             l_dba_directory
          || '/'
          || l_original_filename
          || ' DOES NOT EXIST.';
      else
        if p_bytes_trans = 0
        then
          raise err_dzero_byte_file;
        end if;

        --
        -- Lets setup our output header columns
        --
        -- To process a file as a different name use the # symbol
        -- test.txt#test.txt20032801
        -- Would be used if you wanted to get the file test.txt but copy to local server as test.txt20032801
        print_output (   rpad ('FILENAME'
                              ,40)
                      || ' | '
                      || rpad ('STATUS'
                              ,15)
                      || ' | '
                      || rpad ('BYTES'
                              ,15)
                      || ' | '
                      || rpad ('START TIME'
                              ,25)
                      || ' | '
                      || rpad ('END TIME'
                              ,25)
                      || ' | '
                      || 'ERROR MESSAGE');
        print_output (chr (10));
        --
        p_files   := p_filename;
        lbok      :=
          afw_15_ftp_noyau_pkg.put (p_localpath           => l_interface
                                   ,p_filename            => p_files
                                   ,p_remotepath          => p_remote_path
                                   ,p_username            => p_username
                                   ,p_password            => p_password
                                   ,p_hostname            => p_hostname
                                   ,v_status              => p_status
                                   ,v_error_message       => p_error_msg
                                   ,n_bytes_transmitted   => p_bytes_trans
                                   ,d_trans_start         => p_trans_start
                                   ,d_trans_end           => p_trans_end
                                   ,p_port                => 21
                                   ,p_filetype            => p_filetype
                                   ,p_mainframe_ftp       => p_mainframe_conn
                                   ,p_mainframe_cmd       => p_mainframe_command);

        if     lbok
           and nvl (p_status, 'SUCCESS') = 'SUCCESS'
        then
          print_output (   rpad (replace (p_filename
                                         ,'#'
                                         ,' => ')
                                ,40)
                        || ' | '
                        || rpad (p_status
                                ,15)
                        || ' | '
                        || rpad (to_char (p_bytes_trans)
                                ,15)
                        || ' | '
                        || rpad (to_char (p_trans_start
                                         ,'YYYY-MM-DD HH:MI:SS')
                                ,25)
                        || ' | '
                        || rpad (to_char (p_trans_end
                                         ,'YYYY-MM-DD HH:MI:SS')
                                ,25)
                        || ' | '
                        || p_error_msg);

          if p_status <> 'SUCCESS'
          then
            p_failed   := 'Y';
          end if;
        else
          p_failed   := 'Y';
        end if;
      end if;
    end if;

    if p_failed = 'N'
    then
      print_output (chr (10));
      print_output ('FTP PROCESS COMPLETED.');
      errbuf    := null;
      retcode   := 0;
    else
      print_output (chr (10));
      print_output (   'ERROR :: FTP PROCESS FAILED :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
    end if;
  exception
    when err_dzero_byte_file
    then
      l_success      :=
           'LOCAL FILE IS A ZERO-BYTE FILE OR DOES NOT EXIST ['
        || l_original_filename
        || ']';
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || l_success);
      errbuf    := null;
      retcode   := 2;
    when err_dba_dir_not_defined
    then
      l_success      :=
           'DBA DIRECTORY NOT DEFINED ['
        || l_dba_directory
        || ']';
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || l_success);
      errbuf    := null;
      retcode   := 2;
    when others
    then
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm
                    || ' :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
  end put_remote_file;

  procedure remove_remote_file (errbuf            out varchar2
                               ,retcode           out number
                               ,p_hostname     in     varchar2
                               ,p_filename     in     varchar2
                               ,p_remotepath   in     varchar2
                               ,p_username     in     varchar2
                               ,p_password     in     varchar2
                               ,p_mainframe    in     varchar2 default 'F')
  is
    c_process   constant varchar2 (100) := 'hum_ftp_UTILITIES.REMOTE_REMOTE_FILE';
    p_status             varchar2 (32000);
    p_error_msg          varchar2 (32000);
    p_elapsed_time       varchar2 (100);
    p_files              varchar2 (4000);
    p_bytes_trans        number;
    p_localpath          char (1) := '.';
    p_trans_start        date;
    p_trans_end          date;
    lbok                 boolean;
    p_failed             char (1) := 'N';
    p_mainframe_conn     boolean;
    p_remote_path        varchar2 (240);
    p_exists             boolean;
    p_block_size         binary_integer;
  --
  -- This applies to Oracle Applications Environments only
  --
  --      p_request_id                  NUMBER := fnd_global.conc_request_id;
  --
  begin
    /* CLEAR PASSWORD SO IT CANNOT BE SEEN VIA CONCURRENT REQ VIEWS */
    --
    -- Change the argument identifiers to match your concurrent mgr setup
    --
    -- This applies to Oracle Applications Environments only
    --
    --      UPDATE fnd_concurrent_requests
    --      SET argument4 = '*******'
    --,         argument3 = '*******'
    --,         argument_text =
    --             REPLACE ( REPLACE ( argument_text
    --,                                argument4
    --,                                '*******' )
    --,                      argument3
    --,                      '*******' )
    --      WHERE  request_id = p_request_id;
    --
    --      COMMIT;


    if p_mainframe = 'F'
    then
      p_mainframe_conn   := false;
      p_remote_path      := p_remotepath;
    else
      p_mainframe_conn   := true;
      p_remote_path      := p_remotepath;
    end if;


    --
    if p_failed = 'N'
    then
      print_output (chr (10));

      if p_mainframe_conn
      then
        print_output (   'REMOTE FTP SERVER (mainframe) :: '
                      || p_hostname);
      else
        print_output (   'REMOTE FTP SERVER :: '
                      || p_hostname);
      end if;

      print_output (   'REMOTE PATH :: '
                    || p_remote_path);
      print_output (   'FILENAME :: '
                    || p_filename);
      print_output (chr (10));
      --
      -- Lets setup our output header columns
      --
      -- To process a file as a different name use the # symbol
      -- test.txt#test.txt20032801
      -- Would be used if you wanted to get the file test.txt but copy to local server as test.txt20032801
      print_output (   rpad ('FILENAME'
                            ,40)
                    || ' | '
                    || rpad ('STATUS'
                            ,15)
                    || ' | '
                    || rpad ('BYTES'
                            ,15)
                    || ' | '
                    || rpad ('START TIME'
                            ,25)
                    || ' | '
                    || rpad ('END TIME'
                            ,25)
                    || ' | '
                    || 'ERROR MESSAGE');
      print_output (chr (10));
      --
      p_files   := p_filename;
      lbok      :=
        afw_15_ftp_noyau_pkg.remove (p_localpath              => p_localpath
                                    ,p_filename               => p_files
                                    ,p_remotepath             => p_remote_path
                                    ,p_username               => p_username
                                    ,p_password               => p_password
                                    ,p_hostname               => p_hostname
                                    ,v_status                 => p_status
                                    ,v_error_message          => p_error_msg
                                    ,n_bytes_transmitted      => p_bytes_trans
                                    ,d_trans_start            => p_trans_start
                                    ,d_trans_end              => p_trans_end
                                    ,p_port                   => 21
                                    ,p_filetype               => 'ASCII'
                                    ,p_mainframe_connection   => p_mainframe_conn);

      if     lbok
         and nvl (p_status, 'SUCCESS') = 'SUCCESS'
      then
        print_output (   rpad (p_filename
                              ,40)
                      || ' | '
                      || rpad (p_status
                              ,15)
                      || ' | '
                      || rpad (to_char (p_bytes_trans)
                              ,15)
                      || ' | '
                      || rpad (to_char (p_trans_start
                                       ,'YYYY-MM-DD HH:MI:SS')
                              ,25)
                      || ' | '
                      || rpad (to_char (p_trans_end
                                       ,'YYYY-MM-DD HH:MI:SS')
                              ,25)
                      || ' | '
                      || p_error_msg);

        if p_status <> 'SUCCESS'
        then
          p_failed   := 'Y';
        end if;
      else
        p_failed   := 'Y';
      end if;
    end if;

    if p_failed = 'N'
    then
      print_output (chr (10));
      print_output ('FTP PROCESS COMPLETED.');
      errbuf    := null;
      retcode   := 0;
    else
      print_output (chr (10));
      print_output (   'ERROR :: FTP PROCESS FAILED :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
    end if;
  exception
    when others
    then
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm
                    || ' :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
  end remove_remote_file;

  procedure rename_remote_file (errbuf            out varchar2
                               ,retcode           out number
                               ,p_hostname     in     varchar2
                               ,p_filename     in     varchar2
                               ,p_remotepath   in     varchar2
                               ,p_username     in     varchar2
                               ,p_password     in     varchar2
                               ,p_mainframe    in     varchar2 default 'F')
  is
    c_process   constant varchar2 (100) := 'hum_ftp_UTILITIES.RENAME_REMOTE_FILE';
    p_status             varchar2 (32000);
    p_error_msg          varchar2 (32000);
    p_elapsed_time       varchar2 (100);
    p_files              varchar2 (4000);
    p_bytes_trans        number;
    p_localpath          char (1) := '.';
    p_trans_start        date;
    p_trans_end          date;
    lbok                 boolean;
    p_failed             char (1) := 'N';
    p_mainframe_conn     boolean;
    p_remote_path        varchar2 (240);
    p_exists             boolean;
    p_block_size         binary_integer;
  --
  -- This applies to Oracle Applications Environments only
  --
  --      p_request_id                  NUMBER := fnd_global.conc_request_id;
  --
  begin
    /* CLEAR PASSWORD SO IT CANNOT BE SEEN VIA CONCURRENT REQ VIEWS */
    --
    -- Change the argument identifiers to match your concurrent mgr setup
    --
    -- This applies to Oracle Applications Environments only
    --
    --      UPDATE fnd_concurrent_requests
    --      SET argument4 = '*******'
    --,         argument3 = '*******'
    --,         argument_text =
    --             REPLACE ( REPLACE ( argument_text
    --,                                argument4
    --,                                '*******' )
    --,                      argument3
    --,                      '*******' )
    --      WHERE  request_id = p_request_id;
    --
    --      COMMIT;



    if p_mainframe = 'F'
    then
      p_mainframe_conn   := false;
      p_remote_path      := p_remotepath;
    else
      p_mainframe_conn   := true;
      p_remote_path      := p_remotepath;
    end if;


    --
    if p_failed = 'N'
    then
      print_output (chr (10));

      if p_mainframe_conn
      then
        print_output (   'REMOTE FTP SERVER (mainframe) :: '
                      || p_hostname);
      else
        print_output (   'REMOTE FTP SERVER :: '
                      || p_hostname);
      end if;

      print_output (   'REMOTE PATH :: '
                    || p_remote_path);
      print_output (   'FILENAME :: '
                    || replace (p_filename
                               ,'#'
                               ,' => '));
      print_output (chr (10));
      --
      -- Lets setup our output header columns
      --
      -- To process a file as a different name use the # symbol
      -- test.txt#test.txt20032801
      -- Would be used if you wanted to get the file test.txt but copy to local server as test.txt20032801
      print_output (   rpad ('FILENAME'
                            ,40)
                    || ' | '
                    || rpad ('STATUS'
                            ,15)
                    || ' | '
                    || rpad ('BYTES'
                            ,15)
                    || ' | '
                    || rpad ('START TIME'
                            ,25)
                    || ' | '
                    || rpad ('END TIME'
                            ,25)
                    || ' | '
                    || 'ERROR MESSAGE');
      print_output (chr (10));
      --
      p_files   := p_filename;
      lbok      :=
        afw_15_ftp_noyau_pkg.rename (p_localpath              => p_localpath
                                    ,p_filename               => p_files
                                    ,p_remotepath             => p_remote_path
                                    ,p_username               => p_username
                                    ,p_password               => p_password
                                    ,p_hostname               => p_hostname
                                    ,v_status                 => p_status
                                    ,v_error_message          => p_error_msg
                                    ,n_bytes_transmitted      => p_bytes_trans
                                    ,d_trans_start            => p_trans_start
                                    ,d_trans_end              => p_trans_end
                                    ,p_port                   => 21
                                    ,p_filetype               => 'ASCII'
                                    ,p_mainframe_connection   => p_mainframe_conn);

      if     lbok
         and nvl (p_status, 'SUCCESS') = 'SUCCESS'
      then
        print_output (   rpad (replace (p_filename
                                       ,'#'
                                       ,' => ')
                              ,40)
                      || ' | '
                      || rpad (p_status
                              ,15)
                      || ' | '
                      || rpad (to_char (p_bytes_trans)
                              ,15)
                      || ' | '
                      || rpad (to_char (p_trans_start
                                       ,'YYYY-MM-DD HH:MI:SS')
                              ,25)
                      || ' | '
                      || rpad (to_char (p_trans_end
                                       ,'YYYY-MM-DD HH:MI:SS')
                              ,25)
                      || ' | '
                      || p_error_msg);

        if p_status <> 'SUCCESS'
        then
          p_failed   := 'Y';
        end if;
      else
        p_failed   := 'Y';
      end if;
    end if;

    if p_failed = 'N'
    then
      print_output (chr (10));
      print_output ('FTP PROCESS COMPLETED.');
      errbuf    := null;
      retcode   := 0;
    else
      print_output (chr (10));
      print_output (   'ERROR :: FTP PROCESS FAILED :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
    end if;
  exception
    when others
    then
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm
                    || ' :: '
                    || p_error_msg);

      errbuf    := null;
      retcode   := 2;
  end rename_remote_file;

  /* USE THIS PROCEDURE TO COLLECT A DIRECTORY LISTING */
  /* OF REMOTE SERVER TO A FILE ON THE LOCAL DATABASE SERVER */
  /* LOCAL DIRECTORY MUST BE WRITABLE BY UTL_FILE ROUTINES */
  --
  -- Only return filenames
  --

  procedure get_remote_dir_short (errbuf                 out varchar2
                                 ,retcode                out number
                                 ,p_hostname          in     varchar2
                                 ,p_localpath         in     varchar2
                                 ,p_filename_filter   in     varchar2 default null
                                 ,p_dir_filename      in     varchar2 default 'remotedir_list.txt'
                                 ,p_remotepath        in     varchar2
                                 ,p_username          in     varchar2
                                 ,p_password          in     varchar2
                                 ,p_mainframe         in     varchar2 default 'F')
  is
    c_process        constant varchar2 (100) := 'hum_ftp_UTILITIES.GET_REMOTE_DIR_SHORT';
    u_filehandle              utl_file.file_type;
    l_buffer                  varchar2 (32000);
    p_status                  varchar2 (32000);
    p_error_msg               varchar2 (32000);
    p_elapsed_time            varchar2 (100);
    p_files                   varchar2 (4000);
    p_bytes_trans             number;
    p_trans_start             date;
    p_trans_end               date;
    lbok                      boolean;
    p_failed                  char (1) := 'N';
    p_mainframe_conn          boolean;
    p_remote_path             varchar2 (240);
    p_exists                  boolean;
    p_block_size              binary_integer;
    l_filename_filter         varchar2 (1000);
    l_dir_filename            varchar2 (1000);
    l_success                 varchar2 (32767);
    l_dba_directory           varchar2 (100);
    l_interface               varchar2 (100);
    err_dba_dir_not_defined   exception;
    err_dzero_byte_file       exception;
  --
  -- This applies to Oracle Applications Environments only
  --
  --      p_request_id                  NUMBER := fnd_global.conc_request_id;
  --
  begin
    /* CLEAR PASSWORD SO IT CANNOT BE SEEN VIA CONCURRENT REQ VIEWS */
    --
    -- Change the argument identifiers to match your concurrent mgr setup
    --
    -- This applies to Oracle Applications Environments only
    --
    --      UPDATE fnd_concurrent_requests
    --      SET argument4 = '*******'
    --,         argument3 = '*******'
    --,         argument_text =
    --             REPLACE ( REPLACE ( argument_text
    --,                                argument4
    --,                                '*******' )
    --,                      argument3
    --,                      '*******' )
    --      WHERE  request_id = p_request_id;
    --
    --      COMMIT;
    --
    -- l_interface is the name of the DBA_DIRECTORY that you wish to use for
    -- this operation. You must have READ/WRITE permissions to this dba_directory
    --
    l_interface   := upper (p_localpath);


    begin
      select rtrim (directory_path
                   ,'/')
        into l_dba_directory
        from all_directories
       where directory_name = l_interface;
    exception
      when no_data_found
      then
        l_dba_directory   := l_interface;
        raise err_dba_dir_not_defined;
    end;



    if p_mainframe = 'F'
    then
      p_mainframe_conn   := false;
      p_remote_path      := p_remotepath;
    else
      p_mainframe_conn   := true;
      p_remote_path      := p_remotepath;
    end if;

    --
    if p_failed = 'N'
    then
      print_output (chr (10));

      if p_mainframe_conn
      then
        print_output (   'REMOTE FTP SERVER (mainframe) :: '
                      || p_hostname);
      else
        print_output (   'REMOTE FTP SERVER :: '
                      || p_hostname);
      end if;

      print_output (   'REMOTE PATH :: '
                    || p_remote_path);
      print_output (   'LOCAL PATH :: '
                    || l_dba_directory);

      print_output (chr (10));

      if ltrim (rtrim (p_dir_filename)) is null
      then
        l_dir_filename   := 'remotedir_list.txt';
      else
        l_dir_filename   := ltrim (rtrim (p_dir_filename));
      end if;

      if ltrim (rtrim (p_filename_filter)) is null
      then
        l_filename_filter   := '*';
      else
        l_filename_filter   := ltrim (rtrim (p_filename_filter));
      end if;

      print_output (   'DIRECTORY LISTING FILENAME :: '
                    || l_dir_filename);
      print_output (   'FILENAME FILTER :: '
                    || l_filename_filter);
      print_output ('TRANSFER MODE :: ASCII');
      print_output (chr (10));
      --
      -- Lets setup our output header columns
      --
      print_output (   rpad ('DIRECTORY LISTING FILE'
                            ,40)
                    || ' | '
                    || rpad ('STATUS'
                            ,15)
                    || ' | '
                    || rpad ('BYTES'
                            ,15)
                    || ' | '
                    || rpad ('START TIME'
                            ,25)
                    || ' | '
                    || rpad ('END TIME'
                            ,25)
                    || ' | '
                    || 'ERROR MESSAGE');
      print_output (chr (10));
      --
      lbok      :=
        afw_15_ftp_noyau_pkg.ls (p_localpath           => l_interface
                                ,p_filename_filter     => l_filename_filter
                                ,p_dir_filename        => l_dir_filename
                                ,p_remotepath          => p_remote_path
                                ,p_username            => p_username
                                ,p_password            => p_password
                                ,p_hostname            => p_hostname
                                ,v_status              => p_status
                                ,v_error_message       => p_error_msg
                                ,n_bytes_transmitted   => p_bytes_trans
                                ,d_trans_start         => p_trans_start
                                ,d_trans_end           => p_trans_end
                                ,p_port                => 21
                                ,p_filetype            => 'ASCII'
                                ,p_mainframe_ftp       => p_mainframe_conn);

      if     lbok
         and nvl (p_status, 'SUCCESS') = 'SUCCESS'
      then
        /* Getting filesize from local path which will show the bytes successfully written */
        utl_file.fgetattr (location      => l_interface
                          ,filename      => l_dir_filename
                          ,fexists       => p_exists
                          ,file_length   => p_bytes_trans
                          ,block_size    => p_block_size);

        if p_exists -- If we don't see the file probably a permissions problem prevented the creation
        then
          if p_bytes_trans = 0
          then
            raise err_dzero_byte_file;
          end if;

          print_output (   rpad (l_dir_filename
                                ,40)
                        || ' | '
                        || rpad (p_status
                                ,15)
                        || ' | '
                        || rpad (to_char (p_bytes_trans)
                                ,15)
                        || ' | '
                        || rpad (to_char (p_trans_start
                                         ,'YYYY-MM-DD HH:MI:SS')
                                ,25)
                        || ' | '
                        || rpad (to_char (p_trans_end
                                         ,'YYYY-MM-DD HH:MI:SS')
                                ,25)
                        || ' | '
                        || p_error_msg);
        else
          p_status   := 'TRANSFER FAILED. FILE NOT CREATED.';
        end if;

        if p_status <> 'SUCCESS'
        then
          p_failed   := 'Y';
        end if;
      else
        p_failed   := 'Y';
      end if;
    end if;

    if p_failed = 'N'
    then
      print_output (chr (10));
      print_output ('Directory Listing Details :: ');
      print_output (chr (10));
      --
      u_filehandle      :=
        utl_file.fopen (l_interface
                       ,l_dir_filename
                       ,'r'
                       ,32000);

      loop
        begin
          utl_file.get_line (u_filehandle
                            ,l_buffer);
          print_output (l_buffer);
        exception
          when no_data_found
          then
            exit;
        end;
      end loop;

      print_output (chr (10));
      print_output (chr (10));
      print_output ('FTP PROCESS COMPLETED.');
      errbuf    := null;
      retcode   := 0;
    else
      print_output (chr (10));
      print_output (   'ERROR :: FTP PROCESS FAILED :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
    end if;
  exception
    when err_dzero_byte_file
    then
      l_success      :=
           'RETRIEVED DIRECTORY FILE IS A ZERO-BYTE FILE OR DOES NOT EXIST ['
        || l_dir_filename
        || ']';
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || l_success);
      errbuf    := null;
      retcode   := 2;
    when err_dba_dir_not_defined
    then
      l_success      :=
           'DBA DIRECTORY NOT DEFINED ['
        || l_dba_directory
        || ']';
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || l_success);
      errbuf    := null;
      retcode   := 2;
    when others
    then
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm
                    || ' :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
  end get_remote_dir_short;

  /* USE THIS PROCEDURE TO COLLECT A DIRECTORY LISTING */
  /* OF REMOTE SERVER TO A FILE ON THE LOCAL DATABASE SERVER */
  /* LOCAL DIRECTORY MUST BE WRITABLE BY UTL_FILE ROUTINES */
  --
  -- Returns full detail (timestamps,permissions, filenames, filesizes,etc)
  --

  procedure get_remote_dir_long (errbuf                 out varchar2
                                ,retcode                out number
                                ,p_hostname          in     varchar2
                                ,p_localpath         in     varchar2
                                ,p_filename_filter   in     varchar2 default null
                                ,p_dir_filename      in     varchar2 default 'remotedir_list.txt'
                                ,p_remotepath        in     varchar2
                                ,p_username          in     varchar2
                                ,p_password          in     varchar2
                                ,p_port              in     number default 21
                                ,p_mainframe         in     varchar2 default 'F')
  is
    c_process        constant varchar2 (100) := 'hum_ftp_UTILITIES.GET_REMOTE_DIR_LONG';
    u_filehandle              utl_file.file_type;
    l_buffer                  varchar2 (32000);
    p_status                  varchar2 (32000);
    p_error_msg               varchar2 (32000);
    p_elapsed_time            varchar2 (100);
    p_files                   varchar2 (4000);
    p_bytes_trans             number;
    p_trans_start             date;
    p_trans_end               date;
    lbok                      boolean;
    p_failed                  char (1) := 'N';
    p_mainframe_conn          boolean;
    p_remote_path             varchar2 (240);
    p_exists                  boolean;
    p_block_size              binary_integer;
    l_filename_filter         varchar2 (1000);
    l_dir_filename            varchar2 (1000);
    l_success                 varchar2 (32767);
    l_dba_directory           varchar2 (100);
    l_interface               varchar2 (100);
    err_dba_dir_not_defined   exception;
    err_dzero_byte_file       exception;
  --
  -- This applies to Oracle Applications Environments only
  --
  --      p_request_id                  NUMBER := fnd_global.conc_request_id;
  --
  begin
    /* CLEAR PASSWORD SO IT CANNOT BE SEEN VIA CONCURRENT REQ VIEWS */
    --
    -- Change the argument identifiers to match your concurrent mgr setup
    --
    -- This applies to Oracle Applications Environments only
    --
    --      UPDATE fnd_concurrent_requests
    --      SET argument4 = '*******'
    --,         argument3 = '*******'
    --,         argument_text =
    --             REPLACE ( REPLACE ( argument_text
    --,                                argument4
    --,                                '*******' )
    --,                      argument3
    --,                      '*******' )
    --      WHERE  request_id = p_request_id;
    --
    --      COMMIT;
    --
    -- l_interface is the name of the DBA_DIRECTORY that you wish to use for
    -- this operation. You must have READ/WRITE permissions to this dba_directory
    --
    l_interface   := upper (p_localpath);


    begin
      select rtrim (directory_path
                   ,'/')
        into l_dba_directory
        from all_directories
       where directory_name = l_interface;
    exception
      when no_data_found
      then
        l_dba_directory   := l_interface;
        raise err_dba_dir_not_defined;
    end;


    if p_mainframe = 'F'
    then
      p_mainframe_conn   := false;
      p_remote_path      := p_remotepath;
    else
      p_mainframe_conn   := true;
      p_remote_path      := p_remotepath;
    end if;

    --
    if p_failed = 'N'
    then
      print_output (chr (10));

      if p_mainframe_conn
      then
        print_output (   'REMOTE FTP SERVER (mainframe) :: '
                      || p_hostname);
      else
        print_output (   'REMOTE FTP SERVER :: '
                      || p_hostname);
      end if;

      print_output (   'REMOTE PATH :: '
                    || p_remote_path);
      print_output (   'LOCAL PATH :: '
                    || l_dba_directory);

      print_output (chr (10));

      if ltrim (rtrim (p_dir_filename)) is null
      then
        l_dir_filename   := 'remotedir_list.txt';
      else
        l_dir_filename   := ltrim (rtrim (p_dir_filename));
      end if;

      if ltrim (rtrim (p_filename_filter)) is null
      then
        l_filename_filter   := '*';
      else
        l_filename_filter   := ltrim (rtrim (p_filename_filter));
      end if;

      print_output (   'DIRECTORY LISTING FILENAME :: '
                    || l_dir_filename);
      print_output (   'FILENAME FILTER :: '
                    || l_filename_filter);
      print_output ('TRANSFER MODE :: ASCII');
      print_output (chr (10));
      --
      -- Lets setup our output header columns
      --
      print_output (   rpad ('DIRECTORY LISTING FILE'
                            ,40)
                    || ' | '
                    || rpad ('STATUS'
                            ,15)
                    || ' | '
                    || rpad ('BYTES'
                            ,15)
                    || ' | '
                    || rpad ('START TIME'
                            ,25)
                    || ' | '
                    || rpad ('END TIME'
                            ,25)
                    || ' | '
                    || 'ERROR MESSAGE');
      print_output (chr (10));
      --
      lbok      :=
        afw_15_ftp_noyau_pkg.dir (p_localpath           => l_interface
                                 ,p_filename_filter     => l_filename_filter
                                 ,p_dir_filename        => l_dir_filename
                                 ,p_remotepath          => p_remote_path
                                 ,p_username            => p_username
                                 ,p_password            => p_password
                                 ,p_hostname            => p_hostname
                                 ,v_status              => p_status
                                 ,v_error_message       => p_error_msg
                                 ,n_bytes_transmitted   => p_bytes_trans
                                 ,d_trans_start         => p_trans_start
                                 ,d_trans_end           => p_trans_end
                                 ,p_port                => p_port
                                 ,p_filetype            => 'ASCII'
                                 ,p_mainframe_ftp       => p_mainframe_conn);

      if     lbok
         and nvl (p_status, 'SUCCESS') = 'SUCCESS'
      then
        /* Getting filesize from local path which will show the bytes successfully written */
        utl_file.fgetattr (location      => l_interface
                          ,filename      => l_dir_filename
                          ,fexists       => p_exists
                          ,file_length   => p_bytes_trans
                          ,block_size    => p_block_size);

        if p_exists -- If we don't see the file probably a permissions problem prevented the creation
        then
          if p_bytes_trans = 0
          then
            raise err_dzero_byte_file;
          end if;

          print_output (   rpad (l_dir_filename
                                ,40)
                        || ' | '
                        || rpad (p_status
                                ,15)
                        || ' | '
                        || rpad (to_char (p_bytes_trans)
                                ,15)
                        || ' | '
                        || rpad (to_char (p_trans_start
                                         ,'YYYY-MM-DD HH:MI:SS')
                                ,25)
                        || ' | '
                        || rpad (to_char (p_trans_end
                                         ,'YYYY-MM-DD HH:MI:SS')
                                ,25)
                        || ' | '
                        || p_error_msg);
        else
          p_status   := 'TRANSFER FAILED. FILE NOT CREATED.';
        end if;

        if p_status <> 'SUCCESS'
        then
          p_failed   := 'Y';
        end if;
      else
        p_failed   := 'Y';
      end if;
    end if;

    if p_failed = 'N'
    then
      print_output (chr (10));
      print_output ('Directory Listing Details :: ');
      print_output (chr (10));
      --
      u_filehandle      :=
        utl_file.fopen (l_interface
                       ,l_dir_filename
                       ,'r'
                       ,32000);

      loop
        begin
          utl_file.get_line (u_filehandle
                            ,l_buffer);
          print_output (l_buffer);
        exception
          when no_data_found
          then
            exit;
        end;
      end loop;

      print_output (chr (10));
      print_output (chr (10));
      print_output ('FTP PROCESS COMPLETED.');
      errbuf    := null;
      retcode   := 0;
    else
      print_output (chr (10));
      print_output (   'ERROR :: FTP PROCESS FAILED :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
    end if;
  exception
    when err_dzero_byte_file
    then
      l_success      :=
           'RETRIEVED DIRECTORY FILE IS A ZERO-BYTE FILE OR DOES NOT EXIST ['
        || l_dir_filename
        || ']';
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || l_success);
      errbuf    := null;
      retcode   := 2;
    when err_dba_dir_not_defined
    then
      l_success      :=
           'DBA DIRECTORY NOT DEFINED ['
        || l_dba_directory
        || ']';
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || l_success);
      errbuf    := null;
      retcode   := 2;
    when others
    then
      print_output (chr (10));
      print_output (   c_process
                    || ' :: ERROR :: FTP PROCESS FAILED :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm
                    || ' :: '
                    || p_error_msg);
      errbuf    := null;
      retcode   := 2;
  end get_remote_dir_long;

  /* Use this routine to return a failure code if not in production */
  /* This would be used as a first stage in a request set to ensure */
  /* a request set that includes the above FTP routines, that it    */
  /* it would not fire off if executed in a test instance.          */
  /*                                                                */
  /* It would require someone to skip the first step to make it the */
  /* request set run. However, in that event, they need to change   */
  /* the necessary parameters to control the correct user/password  */
  /* and server/path information                                    */
  /*                           */
  /* We have a custom package and table that we use to identify     */
  /* Production/QA/Test Instances. This data is used by shell       */
  /* scripts, PLSQL, etc. to alter behavior with respect to the     */
  /* Oracle environment. It ensures that we do not launch processes */
  /* in non-production environments, or if we wish them to launch   */
  /* how they launch (email addresses used, ftp servers used etc.)  */
  /* can be controlled. You could easily build something similar    */
  /*
     PROCEDURE is_not_prod (
        errbuf                     OUT      VARCHAR2
  ,     retcode                    OUT      NUMBER )
     IS
        c_process            CONSTANT VARCHAR2 ( 100 )
                                             := 'hum_ftp_UTILITIES.IS_NOT_PROD';
        l_step                        VARCHAR2 ( 1000 );
     BEGIN
        l_step := c_process || ' :: Executing HUM_MACHINE_INFO.IS_PROD ';

  --
  -- We built a table that has instances referenced in it with an instance type
  -- identifier to indicate usage. We then built a function that checked the type
  -- for current oracle instance... it returned a yes or no if it was identified
  -- as a production environment.
  --
  -- Although not included in this document set, it would be easy enough
  -- for someone to add back in.
  --
  --      IF hum_machine_info.is_prod ( p_database ) = 'Y'
  --      THEN
  --         l_step := c_process || ' :: PRODUCTION ENVIRONMENT DETECTED ';
  --         print_output ( l_step);
  --         errbuf := NULL;
  --         retcode := 0;
  --      ELSE
  --         l_step := c_process || ' :: NON-PRODUCTION ENVIRONMENT DETECTED ';
  --         print_output ( l_step);
  --         errbuf := NULL;
  --         retcode := 2;
  --      END IF;
     EXCEPTION
        WHEN OTHERS
        THEN
           print_output (    c_process
                                         || ' :: ERROR :: '
                                         || l_step
                                         || ' :: '
                                         || SQLCODE
                                         || ' - '
                                         || SQLERRM);
           errbuf := NULL;
           retcode := 2;
     END is_not_prod;
  */

  function list_dir_sql
    return typ_fichr_sql
    pipelined
  is
  begin
    if afw_15_ftp_noyau_pkg.t_fichr.count != 0
    then
      for i in afw_15_ftp_noyau_pkg.t_fichr.first () .. afw_15_ftp_noyau_pkg.t_fichr.last ()
      loop
        pipe row (afw_15_ftp_noyau_pkg.t_fichr (i));
      end loop;
    end if;
  end list_dir_sql;
end afw_15_ftp_pkg;
/
