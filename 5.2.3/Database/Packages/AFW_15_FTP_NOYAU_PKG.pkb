SET DEFINE OFF;
create or replace package body afw_15_ftp_noyau_pkg
as
  /*
     * VERSION HISTORY
     *  --------------------
     *  1.0     11/19/2002    Unit-tested single and multiple transfers between disparate hosts.
     *  1.0     01/18/2003    Began testing code as proof of concept under 8i.
     *                        As delivered the code did not work correctly for our 8i environment
     *  1.1     03/03/2003    Left package on the shelf to gather dust for awhile.
     *                        Modified login code. Kept failing for some reason.
     *                        Removed multiple file support. Couldn't seem to make it work right.
     *                        Added time_out setting which terminates session if it exceeds 4 minutes
     *                        Added functionality for remove and rename, and sending different filename
     *
     *                          -- To process a file as a different name use the # symbol
     *                          -- test.txt#test.txt20032801
     *                          -- Would be used if you wanted to send the file test.txt
     *                             but copy to remote server as test.txt20032801
     *
     *  2.0      03/01/2004  Upgraded script to support Oracle 9.2.x.x features
     *                       Requires that DBA_DIRECTORIES be utilitized
     *                       meaning that instead of passing local path
     *                       as a path, you must use your defined DBA_DIRECTORY
     *                       values e.g. INTF0047_TABLES is defined as /xfer/INTF0047
     *
     *                        Added binary support
     *                        Added MVS mainframe support
     *
     *  2.1.0    14-AUG-2006 QUOTE SITE command for mainframe was not working. Corrected same.
     *                       Additionally, expanded QUOTE SITE command to permit multiple
     *                       commands to be submitted separated by a | delimiter.
     *
     *                       Added dir and ls functionality
     *
     *  3.0.0    30-AUG-2006 Added some debugging code. Streamlined logic in FTP_FILES_STAGE procedure
     *
     *  3.1.0    15-SEP-2006 Added CLOB / BLOB support and Server Type identification
     *                       Added RMDIR and MKDIR commands for remote server access
     *
     *  3.1.1    22-SEP-2006 Fixed handling of ASCII transfers where carriage return was being captured
     *
     *  3.1.2    22-SEP-2006 Changed logic for current remote path logic on non-mainframe connections
     *                       where we picked up path using PWD command and then performed a CWD
     *                       we had to change because the humad\* accounts with backwards slash
     *                       throws the routine off. LTRIM RTRIM was changed to substr and instr
     *                 commands.
  */
  type tstringtable is table of varchar2 (2000);

  type tserverreply is record
  (
    rpt       char
   ,code      varchar2 (3)
   ,message   varchar2 (256)
  );

  type tserverreplya is table of tserverreply;

  type tconnectinfo is record
  (
    ip     varchar2 (22)
   ,port   pls_integer
  );

  vbo_ecrir_dirct   boolean default true;

  procedure mode_fichr (pbo_ecrir_dirct in boolean)
  is
  begin
    vbo_ecrir_dirct   := pbo_ecrir_dirct;
  end mode_fichr;

  --
  -- WRITECOMMAND
  --
  -- Sends instruction to remote server
  --
  function writecommand (a_conn      in utl_tcp.connection
                        ,a_command   in varchar2)
    return tserverreplya
  is
    v_conn               utl_tcp.connection;
    v_str                varchar2 (500);
    v_bytes_written      number;
    v_reply              tserverreplya;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.WRITECOMMAND';
  begin
    v_reply   := tserverreplya ();
    v_conn    := a_conn;

    if a_command is not null
    then
      v_bytes_written      :=
        utl_tcp.write_line (v_conn
                           ,a_command);
    end if;

    v_conn    := a_conn;

    while 1 = 1
    loop
      v_str      :=
        utl_tcp.get_line (v_conn
                         ,true);
      v_reply.extend;
      v_reply (v_reply.count).code      :=
        substr (v_str
               ,1
               ,3);
      v_reply (v_reply.count).rpt      :=
        substr (v_str
               ,4
               ,1);
      v_reply (v_reply.count).message      :=
        substr (v_str
               ,5);

      if v_reply (v_reply.count).rpt = ' '
      then
        exit;
      end if;
    end loop;

    if substr (v_reply (v_reply.count).code
              ,1
              ,1) = '5'
    then
      raise_application_error (-20000
                              ,   'WriteCommand: '
                               || v_str
                              ,true);
    end if;

    return v_reply;
  end;

  --
  -- LOGIN
  --
  -- Opens connection with remote server
  --
  function login (a_site_in     in varchar2
                 ,a_port_in     in varchar2
                 ,a_user_name   in varchar2
                 ,a_user_pass   in varchar2)
    return utl_tcp.connection
  is
    v_conn               utl_tcp.connection;
    v_reply              tserverreplya;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.LOGIN';
  begin
    v_conn      :=
      utl_tcp.open_connection (remote_host   => a_site_in
                              ,remote_port   => a_port_in
                              ,tx_timeout    => tx_timeout);
    v_reply      :=
      writecommand (v_conn
                   ,null);

    if v_reply (v_reply.count).code <> '220'
    then
      utl_tcp.close_all_connections;
      raise_application_error (-20001
                              ,   'Login: '
                               || v_reply (v_reply.count).code
                               || ' '
                               || v_reply (v_reply.count).message
                              ,true);
      return v_conn;
    end if;

    v_reply      :=
      writecommand (v_conn
                   ,   'USER '
                    || a_user_name);

    if substr (v_reply (v_reply.count).code
              ,1
              ,1) = '5'
    then
      utl_tcp.close_all_connections;
      raise_application_error (-20000
                              ,   'Login: '
                               || v_reply (v_reply.count).code
                               || ' '
                               || v_reply (v_reply.count).message
                              ,true);
      return v_conn;
    end if;

    if v_reply (v_reply.count).code <> '331'
    then
      utl_tcp.close_all_connections;
      raise_application_error (-20001
                              ,   'Login: '
                               || v_reply (v_reply.count).code
                               || ' '
                               || v_reply (v_reply.count).message
                              ,true);
      return v_conn;
    end if;

    v_reply      :=
      writecommand (v_conn
                   ,   'PASS '
                    || a_user_pass);

    if substr (v_reply (v_reply.count).code
              ,1
              ,1) = '5'
    then
      utl_tcp.close_all_connections;
      raise_application_error (-20000
                              ,   'Login: '
                               || v_reply (v_reply.count).code
                               || ' '
                               || v_reply (v_reply.count).message
                              ,true);
      return v_conn;
    end if;

    if v_reply (v_reply.count).code <> '230'
    then
      utl_tcp.close_all_connections;
      raise_application_error (-20001
                              ,   'Login: '
                               || v_reply (v_reply.count).code
                               || ' '
                               || v_reply (v_reply.count).message
                              ,true);
      return v_conn;
    end if;

    return v_conn;
  end;

  --
  -- PRINT_OUTPUT
  --
  -- This prints information to DBMS_OUTPUT, but avoids the buffer limit of 255 per
  -- line of DBMS_OUTPUT.
  --
  procedure print_output (p_message in varchar2)
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.PRINT_OUTPUT';
  begin
    --
    -- Optional method
    --
    -- Then you can also remove all of the references to the debug flag on the FTP_INTERFACE
    -- package, since you can control same via the global debug flag on the CS_PRINT_UTILITY
    -- package.
    --
    --
    --      IF NVL(cs_print_utility.g_debug_flag, 'N') = 'Y' THEN
    --         cs_print_utility.print_output(p_message =>      p_message
    --                                     , p_size =>         1000);
    --      END IF;
    --
    -- If we use the above method, we can get rid of the remainder
    --
    dbms_output.put_line (substr (p_message
                                 ,1
                                 ,250));

    --
    if length (p_message) > 250
    then
      dbms_output.put_line (substr (p_message
                                   ,251
                                   ,250));
    end if;

    --
    if length (p_message) > 501
    then
      dbms_output.put_line (substr (p_message
                                   ,501
                                   ,250));
    end if;

    --
    if length (p_message) > 751
    then
      dbms_output.put_line (substr (p_message
                                   ,751
                                   ,250));
    end if;
  --
  exception
    when others
    then
      null; -- Ignore errors... protect buffer overflow's etc.
  end print_output;

  --
  -- CREATE_PASV
  --
  -- Create the passive host IP and port number to connect to
  --
  procedure create_pasv (p_pasv_cmd    in     varchar2
                        ,p_pasv_host      out varchar2
                        ,p_pasv_port      out number)
  is
    v_pasv_cmd           varchar2 (30) := p_pasv_cmd;
    --Host and port to connect to for data transfer
    n_port_dec           number;
    n_port_add           number;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.CREATE_PASV';
  begin
    p_pasv_host      :=
      replace (substr (v_pasv_cmd
                      ,1
                      ,  instr (v_pasv_cmd
                               ,','
                               ,1
                               ,4)
                       - 1)
              ,','
              ,'.');
    n_port_dec      :=
      to_number (substr (v_pasv_cmd
                        ,  instr (v_pasv_cmd
                                 ,','
                                 ,1
                                 ,4)
                         + 1
                        , (  instr (v_pasv_cmd
                                   ,','
                                   ,1
                                   ,5)
                           - (  instr (v_pasv_cmd
                                      ,','
                                      ,1
                                      ,4)
                              + 1))));
    n_port_add      :=
      to_number (substr (v_pasv_cmd
                        ,  instr (v_pasv_cmd
                                 ,','
                                 ,1
                                 ,5)
                         + 1
                        ,  length (v_pasv_cmd)
                         - instr (v_pasv_cmd
                                 ,','
                                 ,1
                                 ,5)));
    p_pasv_port   := (n_port_dec * 256) + n_port_add;
  --       print_output (   'p_pasv_host= '
  --                             || p_pasv_host);
  --       print_output (   'n_port_dec= '
  --                             || n_port_dec);
  --       print_output (   'n_port_add= '
  --                             || n_port_add);
  --       print_output (   'p_pasv_port= '
  --                             || p_pasv_port);
  exception
    when others
    then
      --print_output(SQLERRM);
      raise;
  end create_pasv;

  --
  -- VALIDATE_REPLY
  --
  -- Read a single or multi-line reply from the FTP server and VALIDATE
  -- it against the code passed in p_code.
  --
  -- Return TRUE if reply code matches p_code, FALSE if it doesn't or error
  -- occurs
  --
  -- Send full server response back to calling procedure
  --
  function validate_reply (p_ctrl_con   in out utl_tcp.connection
                          ,p_code       in     pls_integer
                          ,p_reply         out varchar2)
    return boolean
  is
    n_code               varchar2 (3) := p_code;
    n_byte_count         pls_integer;
    v_msg                varchar2 (1000);
    n_line_count         pls_integer := 0;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.VALIDATE_REPLY';
  begin
    loop
      v_msg          := utl_tcp.get_line (p_ctrl_con);
      n_line_count   := n_line_count + 1;

      if n_line_count = 1
      then
        p_reply   := v_msg;
      else
        p_reply      :=
             p_reply
          || substr (v_msg
                    ,4);
      end if;

      exit when instr (v_msg
                      ,'-'
                      ,1
                      ,1) <> 4;
    end loop;

    --       print_output('n_code := ' || n_code);
    --       print_output('p_reply := ' || TO_NUMBER (SUBSTR (p_reply
    --  ,                           1
    --  ,                           3)));
    if to_number (substr (p_reply
                         ,1
                         ,3)) = n_code
    then
      return true;
    else
      return false;
    end if;
  exception
    when others
    then
      p_reply   := sqlerrm;
      return false;
  end validate_reply;

  --
  -- VALIDATE_REPLY
  --
  -- Read a single or multi-line reply from the FTP server and VALIDATE
  -- it against the code passed in p_code.
  --
  -- Return TRUE if reply code matches p_code1 or p_code2, FALSE if it doesn't or error
  -- occurs
  --
  -- Send full server response back to calling procedure
  --
  function validate_reply (p_ctrl_con   in out utl_tcp.connection
                          ,p_code1      in     pls_integer
                          ,p_code2      in     pls_integer
                          ,p_reply         out varchar2)
    return boolean
  is
    v_code1              varchar2 (3) := to_char (p_code1);
    v_code2              varchar2 (3) := to_char (p_code2);
    v_msg                varchar2 (1000);
    n_line_count         pls_integer := 0;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.VALIDATE_REPLY';
  begin
    loop
      v_msg          := utl_tcp.get_line (p_ctrl_con);
      n_line_count   := n_line_count + 1;

      if n_line_count = 1
      then
        p_reply   := v_msg;
      else
        p_reply      :=
             p_reply
          || substr (v_msg
                    ,4);
      end if;

      exit when instr (v_msg
                      ,'-'
                      ,1
                      ,1) <> 4;
    end loop;

    if to_number (substr (p_reply
                         ,1
                         ,3)) in (v_code1
                                 ,v_code2)
    then
      return true;
    else
      return false;
    end if;
  exception
    when others
    then
      p_reply   := sqlerrm;
      return false;
  end validate_reply;

  --
  -- TRANSFER_DATA
  --
  -- Handles actual data transfer.  Responds with status, error message, and
  -- transfer statistics.
  --
  -- Potential errors could be with connection or file i/o
  --
  procedure transfer_data (u_ctrl_connection     in out utl_tcp.connection
                          ,p_localpath           in     varchar2
                          ,p_filename            in     varchar2
                          ,p_filetype            in     varchar2
                          ,p_pasv_host           in     varchar2
                          ,p_pasv_port           in     pls_integer
                          ,p_transfer_mode       in     varchar2
                          ,v_status                 out varchar2
                          ,v_error_message          out varchar2
                          ,n_bytes_transmitted      out number
                          ,d_trans_start            out date
                          ,d_trans_end              out date)
  is
    l_amount               pls_integer;
    u_filehandle           utl_file.file_type;
    v_tsfr_mode            varchar2 (30) := p_transfer_mode;
    v_mode                 varchar2 (1);
    v_tsfr_cmd             varchar2 (10);
    v_buffer               varchar2 (32767);
    v_buffer_header1       varchar2 (32767);
    v_buffer_header2       varchar2 (32767);
    v_localpath            varchar2 (255) := p_localpath;
    v_filename             varchar2 (255) := p_filename;
    v_filenamefr           varchar2 (255) := p_filename;
    v_filenameto           varchar2 (255) := p_filename;
    v_host                 varchar2 (20) := p_pasv_host;
    n_port                 pls_integer := p_pasv_port;
    n_bytes                number;
    l_longdir_line_cnt     pls_integer := 0;
    l_header_displayed     pls_integer := 0;
    v_msg                  varchar2 (1000);
    v_reply                varchar2 (1000);
    v_err_status           varchar2 (20) := 'ERROR';
    v_database_directory   varchar2 (100);
    p_data_clob            clob;
    p_data_blob            blob;
    l_step                 varchar2 (1000);
    l_filename_search      varchar2 (1000);
    c_process     constant varchar2 (100) := 'hum_ftp_interface.TRANSFER_DATA';
  begin
    /** Initialize some of our OUT variables **/
    v_status              := 'SUCCESS';
    v_error_message       := ' ';
    n_bytes_transmitted   := 0;
    --
    l_step                := 'PARSING FILENAME';

    if nvl (instr (v_filename
                  ,'#')
           ,0) = 0
    then
      v_filenamefr   := v_filename;
      v_filenameto   := v_filename;
    else
      v_filenamefr      :=
        ltrim (rtrim (substr (v_filename
                             ,1
                             ,  instr (v_filename
                                      ,'#')
                              - 1)));
      v_filenameto      :=
        ltrim (rtrim (substr (v_filename
                             ,  instr (v_filename
                                      ,'#')
                              + 1)));
    end if;

    l_step                := 'SELECTING TRANSFER MODE';

    if upper (v_tsfr_mode) = 'PUT'
    then
      v_mode       := 'r';
      v_tsfr_cmd   := 'STOR';
    elsif upper (v_tsfr_mode) = 'GET'
    then
      v_mode       := 'w';
      v_tsfr_cmd   := 'RETR';
    elsif upper (v_tsfr_mode) = 'LIST'
    then
      v_mode       := 'w';
      v_tsfr_cmd   := 'LIST';
    elsif upper (v_tsfr_mode) = 'NLST'
    then
      v_mode       := 'w';
      v_tsfr_cmd   := 'NLST';
    elsif upper (v_tsfr_mode) = 'DELE'
    then
      v_mode       := 'd';
      v_tsfr_cmd   := 'DELE';
    elsif upper (v_tsfr_mode) = 'RNFR'
    then
      v_mode       := 'm';
      v_tsfr_cmd   := 'RNFR';
    end if;

    l_step                := 'OPEN CONNECTION WITH SERVER';
    /** Open data connection on Passive host and port **/
    u_data_con            :=
      utl_tcp.open_connection (remote_host   => v_host
                              ,remote_port   => n_port
                              ,tx_timeout    => tx_timeout);
    l_step                := 'SOME FILE OPERATIONS';

    /* FILE STUFF */

    if upper (v_tsfr_mode) = 'PUT'
    then
      if    (    v_operation_mode = 'LOB'
             and v_localpath = 'CLOB')
         or (    p_filetype = 'ASCII'
             and v_operation_mode = 'LOB')
      then
        p_data_clob   := g_data_c;
      elsif p_filetype = 'BINARY'
      then
        if     v_operation_mode = 'LOB'
           and v_localpath = 'BLOB'
        then
          p_data_blob   := g_data_b;
        else
          /* Read file into LOB for transferring */
          p_data_blob      :=
            get_local_binary_data (p_dir    => v_localpath
                                  ,p_file   => v_filenamefr);
          g_data_b   := p_data_blob;
        end if;
      elsif     v_operation_mode = 'FILE'
            and p_filetype = 'ASCII'
      then
        /** Open the local file to read and transfer data **/
        u_filehandle      :=
          utl_file.fopen (v_localpath
                         ,v_filenamefr
                         ,v_mode
                         ,32000);
      end if;
    elsif upper (v_tsfr_mode) in ('GET'
                                 ,'LIST'
                                 ,'NLST')
    then
      if    (    v_operation_mode = 'LOB'
             and v_localpath = 'CLOB')
         or (    p_filetype = 'ASCII'
             and v_operation_mode = 'LOB')
      then
        p_data_clob   := g_data_c;
      elsif     v_operation_mode = 'LOB'
            and v_localpath = 'BLOB'
      then
        p_data_blob   := g_data_b;
      else
        if     upper (v_tsfr_cmd) in ('LIST'
                                     ,'NLST')
           and v_operation_mode = 'FILE'
        then
          /** Open the local file to read and transfer data using from name which is our directory listing file **/
          u_filehandle      :=
            utl_file.fopen (v_localpath
                           ,v_filenamefr
                           ,v_mode
                           ,32000);
        elsif     v_operation_mode = 'FILE'
              and upper (v_tsfr_mode) = 'GET'
        then
          /** Open the local file to read and transfer data **/
          u_filehandle      :=
            utl_file.fopen (v_localpath
                           ,v_filenameto
                           ,v_mode
                           ,32000);
        end if;
      end if;
    end if;

    --
    -- v_tsfr_cmd is used for determining remote actions
    if upper (v_tsfr_cmd) = 'DELE'
    then
      l_step   := 'DELETE COMMAND';

      /** Send the DELE command to tell the server we're going to delete a file **/
      if mainframe_connection
      then
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_connection
                             ,   'DELE '
                              || ''''
                              || v_filenamefr
                              || '''');
      else
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_connection
                             ,   'DELE '
                              || v_filenamefr);
      end if;
    elsif upper (v_tsfr_cmd) = 'RNFR'
    then
      l_step   := 'RENAME A FILE';

      /** Send the RNFR command to tell the server we're going to rename a file **/
      if mainframe_connection
      then
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'RNFR '
                              || ''''
                              || v_filenamefr
                              || '''');

        --
        if validate_reply (u_ctrl_con
                          ,rnfr_code
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      else
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'RNFR '
                              || v_filenamefr);

        --
        if validate_reply (u_ctrl_con
                          ,rnfr_code
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      end if;

      --
      /** Send the RNTO command to tell the server we're going to rename a file to this name**/
      if mainframe_connection
      then
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'RNTO '
                              || ''''
                              || v_filenameto
                              || '''');
      else
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'RNTO '
                              || v_filenameto);
      end if;
    elsif upper (v_tsfr_cmd) = 'RETR'
    then
      l_step   := 'RETREIVE A FILE';

      /** Send the command to tell the server we're going to download a file **/
      if mainframe_connection
      then
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'RETR '
                              || ''''
                              || v_filenamefr
                              || '''');

        --
        if validate_reply (u_ctrl_con
                          ,tsfr_start_code1
                          ,tsfr_start_code2
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      else
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'RETR '
                              || v_filenamefr);

        --
        if validate_reply (u_ctrl_con
                          ,tsfr_start_code1
                          ,tsfr_start_code2
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      end if;
    elsif upper (v_tsfr_cmd) = 'LIST'
    then
      l_step   := 'LIST DIR CONTENTS - FULL LISTING';

      /** Send the command to tell the server we're going to list dir contents **/
      if mainframe_connection
      then
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,'LIST');


        if validate_reply (u_ctrl_con
                          ,tsfr_start_code1
                          ,tsfr_start_code2
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      else
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,'LIST');


        if validate_reply (u_ctrl_con
                          ,tsfr_start_code1
                          ,tsfr_start_code2
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      end if;
    elsif upper (v_tsfr_cmd) = 'NLST'
    then
      l_step   := 'LIST DIRECTORY CONTENTS - FILENAME ONLY';

      /** Send the command to tell the server we're going to list dir contents **/
      if mainframe_connection
      then
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,'NLST');

        --
        if validate_reply (u_ctrl_con
                          ,tsfr_start_code1
                          ,tsfr_start_code2
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      else
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,'NLST');

        --
        if validate_reply (u_ctrl_con
                          ,tsfr_start_code1
                          ,tsfr_start_code2
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      end if;
    else
      l_step   := 'UPLOAD FILE';

      -- Defaults to STOR (PUT) case
      /** Send the command to tell the server we're going to upload a file **/
      if mainframe_connection
      then
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'STOR '
                              || ''''
                              || v_filenameto
                              || '''');

        --
        if validate_reply (u_ctrl_con
                          ,tsfr_start_code1
                          ,tsfr_start_code2
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      else
        n_bytes      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'STOR '
                              || v_filenameto);

        --
        if validate_reply (u_ctrl_con
                          ,tsfr_start_code1
                          ,tsfr_start_code2
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      end if;
    end if;

    --
    d_trans_start         := sysdate;

    --
    if nvl (upper (l_ftp_debug), 'N') = 'Y'
    then
      --
      -- For our purposes in this release
      -- we really only needed just the one debug
      -- output entry.
      --
      -- FILETYPE              ASCII vs. BINARY
      -- OPERATION_MODE        FILE vs. LOB
      -- LOCALPATH          EITHER DBA_DIRECTORY OR LOB TYPE
      -- TSFR_MODE          PUT,GET,etc
      -- SYSTEM_TYPE        SERVER TYPE e.g. UNIX,NETWARE,WINDOWS,MVS
      -- SYSTEM_TYPE_REPLY     FULL REPLY TO SYST COMMAND
      --
      -- These values should be beneficial to most debugging
      -- efforts. You can leverage the l_ftp_debug elsewhere
      -- as needed
      --
      print_output (   'FTP_DEBUG :: INFO :: '
                    || p_filetype
                    || ' :: '
                    || v_operation_mode
                    || ' :: '
                    || v_localpath
                    || ' :: '
                    || upper (v_tsfr_mode)
                    || ' :: '
                    || v_system_type
                    || ' :: '
                    || v_system_type_reply);
    end if;

    if upper (v_tsfr_mode) = 'PUT'
    then
      l_step   := 'UPLOADING DATA';

      if    (    p_filetype = 'BINARY'
             and v_operation_mode = 'FILE')
         or (    p_filetype = 'BINARY'
             and v_operation_mode = 'LOB')
      then
        p_data_blob           := g_data_b;
        put_remote_binary_data (u_data_con
                               ,p_data_blob);
        n_bytes_transmitted   := dbms_lob.getlength (p_data_blob);
        --
        -- Populate Global Spec variable so that we can handle the binary put operation
        --
        g_data_b              := p_data_blob;
      elsif    (    v_localpath = 'CLOB'
                and v_operation_mode = 'LOB')
            or (    p_filetype = 'ASCII'
                and v_operation_mode = 'LOB')
      then
        p_data_clob           := g_data_c;
        put_remote_ascii_data (u_data_con
                              ,p_data_clob);
        n_bytes_transmitted   := dbms_lob.getlength (p_data_clob);
      else
        -- Read from file
        -- and it must be a flat ascii file
        --
        loop
          begin
            utl_file.get_line (u_filehandle
                              ,v_buffer);
          exception
            when no_data_found
            then
              exit;
          end;

          --
          /* Trim off Carriage return */
          n_bytes               :=
            utl_tcp.write_line (u_data_con
                               ,rtrim (v_buffer
                                      ,chr (13)));
          n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
        end loop;
      end if;
    elsif upper (v_tsfr_mode) = 'GET'
    then
      l_step   := 'GETTING DATA';

      if     p_filetype = 'BINARY'
         and v_operation_mode = 'FILE'
      then
        p_data_blob           := get_remote_binary_data (u_data_con);
        n_bytes_transmitted   := dbms_lob.getlength (p_data_blob);
        put_local_binary_data (p_data   => p_data_blob
                              ,p_dir    => v_localpath
                              ,p_file   => v_filenameto);
      elsif    (    v_localpath = 'CLOB'
                and v_operation_mode = 'LOB')
            or (    p_filetype = 'ASCII'
                and v_operation_mode = 'LOB')
      then
        p_data_clob           := get_remote_ascii_data (u_data_con);
        n_bytes_transmitted   := dbms_lob.getlength (p_data_clob);
        g_data_c              := p_data_clob;
      elsif     p_filetype = 'BINARY'
            and v_operation_mode = 'LOB'
      then
        p_data_blob           := get_remote_binary_data (u_data_con);
        n_bytes_transmitted   := dbms_lob.getlength (p_data_blob);
        g_data_b              := p_data_blob;
      else
        if mainframe_connection
        then
          loop
            begin
              v_buffer      :=
                utl_tcp.get_line (u_data_con
                                 ,true);

              --
              /** Sometimes the TCP/IP buffer sends null data **/
              /** we only want to receive the actual data **/
              if v_buffer is not null
              then
                utl_file.put_line (u_filehandle
                                  ,v_buffer);
                n_bytes               := length (v_buffer);
                n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
              end if;
            --
            exception
              when utl_tcp.end_of_input
              then
                exit;
            end;
          --
          end loop;
        else
          begin
            loop
              v_buffer      :=
                utl_tcp.get_line (u_data_con
                                 ,true);

              /** Sometimes the TCP/IP buffer sends null data **/
              /** we only want to receive the actual data **/
              if v_buffer is not null
              then
                utl_file.put_line (u_filehandle
                                  ,v_buffer);
                n_bytes               := length (v_buffer);
                n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
              end if;
            end loop;
          exception
            when utl_tcp.end_of_input
            then
              null;
          end;
        end if; -- end of IF mainframe connection
      end if; -- end of IF filetype is BINARY
    elsif upper (v_tsfr_mode) in ('LIST'
                                 ,'NLST')
    then
      l_step               := 'GETTING DIRECTORY LISTING';
      /*

      Long Output Format

      The output from ls -l summarizes all the most important information about the file on one line.
      If the specified pathname is a directory, ls displays information on every file in that directory
      (one file per line). It precedes this list with a status line that indicates the total number of
      file system blocks (512 byte units) occupied by the files in that directory. Here is a sample of
      the output along with an explanation.

      -rw-rw-rw- 1 root   dir 104 Dec 25 19:32 file

      The first character identifies the file type:

      -    Regular file
      b    Block special file
      c    Character special file
      d    Directory
      l    Symbolic link
      n    Network file
      p    FIFO
      s    Socket

      The next nine characters are in three groups of three; they describe the permissions on the file.
      The first group of three describes owner permissions; the second describes group permissions;
      the third describes other (or world) permissions. Because Windows systems do not support group
      and other permissions, these are copies of the owner's permissions. Characters that may appear are:

      r    Permission to read file
      w    Permission to write to file
      x    Permission to execute file
      a    Archive bit is on (file has not been backed up)
      c    Compressed file
      s    System file
      h    Hidden file
      t    Temporary file

      On Windows systems, most of the permissions shown are artificial, with no real meaning. The w bit
      is set according to the ReadOnly attribute, and the rx bits are always set on.

      You can change some permissions with the chmod command.

      After the permissions comes the number of links to the file. Since Windows Me does not support links,
      this value is always 1.

      Next comes the name of the owner of the file or directory. On Windows Me and under
      Windows NT/2000/XP/2003 on file systems that don't support Windows NT/2000/XP/2003 security,
      the owner name cannot be determined and the owner ID number is displayed instead. Since Windows Me
      does not support the concept of ownership, the owner ID number is always user ID zero. Under
      Windows NT/2000/XP/2003 the name of the owner of a file is displayed if the file's SIDs can be
      obtained and if these SIDs have an associated name in the SAM database. If the file has a SID
      associated with it, but the name of the SID cannot be determined, then the value of the SID is
      displayed. (This can happen when the current user is not in the domain that was used when the
      file was created.) If the file does not have a SID (for example, if it is on a non-NTFS file system),
      or if the file security information cannot be accessed because the file is locked by another process,
      then the user name appears as <unavail>.

      Then comes the name of the group that owns the file or directory. On Windows systems, the same
      rules are followed for the group name as for the owner name.

      Following this is the size of the file, expressed in bytes.

      After this comes a date and time. For a file, this is the time that the file was last changed;
      for a directory, it is the time that the directory was created. The -c and -u options can change
      which time value is used. If the date is more than six months old or if the date is in the future,
      the year is shown instead of the time.

      The last item on the line is the name of the file or directory.

      --
      For LIST command we want to determine what the system type is
      because it will determine our format for the headers when running
      the LIST (DIR) command.
      --
      Permission Lnk Owner    Group         Bytes Mon Dy Time  Name
      drwxrwxr-x 221 oaphrb   pay           12288 May 02 12:59 appltop
      --
      Although on Unix system, the header row is not presented, we would like to  provide it here
      so that it remains consistent with how the mainframe response is received which does
      in fact include a header row.
      --
      Problem is that different systems display data differently to put it simple. We will be
      supporting the following : Netware, VMS, Unix, and Windows. If you have others, you
      will need to modify the code accordingly to support it. To identify the system ,
      ftp to the server manually and type sys and press enter. It will respond back with
      the server type.

      Then do a dir command and capture how the headers are displayed. Code for it.
      --
      --
      Connecting to a Netware O/S (Novell)
      --
        Permission Owner                           Bytes Mon Dy  Year Name
      - [RWCEAFMS] JSB2493S                       483566 May 26  2004 Rearch.EXE
      --
      Connect to MVS O/S (mainframe)
      --
      Volume Unit    Referred Ext Used Recfm Lrecl BlkSz Dsorg Dsname
      PRM515 3390   2006/08/25  1   15  FB     100 27900  PS  ET.TALX.COIDUDN.FILE
      --
      --
      Connect to Windows O/S
      --
      Permission Lnk Owner    Group           Bytes Mon Dy Time  Name
      ---------- --- -----    -----           ----- --- -- ----  ----
      dr-xr-xr-x   1 owner    group               0 Feb  1 17:32 bussys
      --
      --
      */
      l_longdir_line_cnt   := 0;

      if    (    v_localpath = 'CLOB'
             and v_operation_mode = 'LOB')
         or (    p_filetype = 'ASCII'
             and v_operation_mode = 'LOB')
      then
        p_data_clob           :=
          get_remote_listing_data (u_data_con
                                  ,v_filenameto
                                  ,v_tsfr_mode);
        n_bytes_transmitted   := dbms_lob.getlength (p_data_clob);
        g_data_c              := p_data_clob;
      else
        if mainframe_connection
        then
          loop
            begin
              v_buffer      :=
                utl_tcp.get_line (u_data_con
                                 ,true);

              --

              --
              /** Sometimes the TCP/IP buffer sends null data **/
              /** we only want to receive the actual data **/
              if v_buffer is not null
              then
                l_longdir_line_cnt   := l_longdir_line_cnt + 1;

                --
                -- Capture the first line. On our system
                -- it is the column headers
                --
                if l_longdir_line_cnt = 1
                then
                  v_buffer_header1   := v_buffer;
                end if;

                --
                -- DISPLAY HEADER ROW WHEN v_SYSTEM_TYPE IS NOT NULL
                --
                case
                  when     l_longdir_line_cnt = 1
                       and upper (v_tsfr_mode) = 'LIST'
                       and v_system_type = 'MVS'
                  then
                    v_buffer_header1      := v_buffer_header1;
                    n_bytes               := length (v_buffer_header1);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                    v_buffer_header2      := '------ ----    -------- --- ---- ----- ----- ----- ----- ------';
                    n_bytes               := length (v_buffer_header2);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                  when     l_header_displayed = 0
                       and upper (v_tsfr_mode) = 'LIST'
                       and v_system_type <> 'MVS'
                  then
                    --
                    -- We didn't recognize the system type so display a message
                    -- that we won't be displaying the header row
                    --
                    v_buffer_header1      :=
                      ltrim (rtrim (   'System Reply => '
                                    || v_system_type_reply));
                    n_bytes               := length (v_buffer_header1);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                    v_buffer_header2      := '************************************************************************************************';
                    n_bytes               := length (v_buffer_header2);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                  else
                    null;
                end case;

                --
                -- We stored the filename filter in v_filenameto
                --
                if v_filenameto = '*'
                then
                  if     l_header_displayed = 0
                     and upper (v_tsfr_mode) = 'LIST'
                     and 'PLACEHOLDER ONLY. ALWAYS INCLUDES HEADER BY DEFAULT' is null
                  then
                    l_header_displayed   := 1;
                    utl_file.put_line (u_filehandle
                                      ,v_buffer_header1);
                    utl_file.put_line (u_filehandle
                                      ,v_buffer_header2);
                  end if;

                  utl_file.put_line (u_filehandle
                                    ,v_buffer);
                  n_bytes               := length (v_buffer);
                  n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                else
                  --
                  -- Here we are building our search string
                  -- by replacing wildcard * with %
                  -- and then encapsulating the resulting string
                  -- with % on each end. We also make sure we don't
                  -- have %% on the tail and lead of the search string
                  --
                  l_filename_search      :=
                       '%'
                    || rtrim (ltrim (   '%'
                                     || replace (v_filenameto
                                                ,'*'
                                                ,'%')
                                     || '%'
                                    ,'%')
                             ,'%')
                    || '%';

                  if v_buffer like l_filename_search
                  then
                    if     l_header_displayed = 0
                       and upper (v_tsfr_mode) = 'LIST'
                    then
                      l_header_displayed   := 1;
                      utl_file.put_line (u_filehandle
                                        ,v_buffer_header1);
                      utl_file.put_line (u_filehandle
                                        ,v_buffer_header2);
                    end if;

                    utl_file.put_line (u_filehandle
                                      ,v_buffer);
                    n_bytes               := length (v_buffer);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                  end if;
                end if;
              end if;
            --
            exception
              when utl_tcp.end_of_input
              then
                exit;
            end;
          --
          end loop;
        else -- Not mainframe
          begin
            loop
              v_buffer      :=
                utl_tcp.get_line (u_data_con
                                 ,true);

              --
              /** Sometimes the TCP/IP buffer sends null data **/
              /** we only want to receive the actual data **/
              if v_buffer is not null
              then
                l_longdir_line_cnt   := l_longdir_line_cnt + 1;

                --
                -- DISPLAY HEADER ROW WHEN v_SYSTEM_TYPE IS NOT NULL
                --
                case
                  when     upper (v_tsfr_mode) = 'LIST'
                       and v_system_type = 'UNIX'
                  then
                    v_buffer_header1      := 'Permission Lnk Owner    Group         Bytes Mon Dy Time  Name';
                    n_bytes               := length (v_buffer_header1);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                    v_buffer_header2      := '---------- --- -----    -----         ----- --- -- ----  ----';
                    n_bytes               := length (v_buffer_header2);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                  when     upper (v_tsfr_mode) = 'LIST'
                       and v_system_type = 'NETWARE'
                  then
                    v_buffer_header1      := 'Permission   Owner                           Bytes Mon Dy DStmp Name';
                    n_bytes               := length (v_buffer_header1);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                    v_buffer_header2      := '------------ --------                        ----- --- -- ----- ----';
                    n_bytes               := length (v_buffer_header2);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                  when     upper (v_tsfr_mode) = 'LIST'
                       and v_system_type = 'WINDOWS'
                  then
                    v_buffer_header1      := 'Permission Lnk Owner    Group           Bytes Mon Dy DStmp Name';
                    n_bytes               := length (v_buffer_header1);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                    v_buffer_header2      := '---------- --- -----    -----           ----- --- -- ----- ----';
                    n_bytes               := length (v_buffer_header2);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                  else
                    --
                    -- We didn't recognize the system type so display a message
                    -- that we won't be displaying the header row
                    --
                    v_buffer_header1      :=
                      ltrim (rtrim (   'System Reply => '
                                    || v_system_type_reply));
                    n_bytes               := length (v_buffer_header1);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                    v_buffer_header2      := '************************************************************************************************';
                    n_bytes               := length (v_buffer_header2);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                end case;

                --
                -- We stored the filename filter in v_filenameto
                --
                if v_filenameto = '*'
                then
                  if     l_header_displayed = 0
                     and upper (v_tsfr_mode) = 'LIST'
                  then
                    t_fichr.delete ();

                    l_header_displayed   := 1;
                    utl_file.put_line (u_filehandle
                                      ,v_buffer_header1);
                    utl_file.put_line (u_filehandle
                                      ,v_buffer_header2);
                  end if;

                  utl_file.put_line (u_filehandle
                                    ,v_buffer);

                  while instr (v_buffer
                              ,'  ') > 0
                  loop
                    v_buffer      :=
                      replace (v_buffer
                              ,'  '
                              ,' ');
                  end loop;

                  t_fichr (t_fichr.count).nom      :=
                    substr (v_buffer
                           ,  instr (v_buffer
                                    ,' '
                                    ,1
                                    ,8)
                            + 1);
                  --t_fichr(t_fichr.last).tail := to_number(substr(v_buffer, instr(v_buffer, ' ', -1, 5),instr(v_buffer, ' ', -1, 4)-instr(v_buffer, ' ', -1, 5)));
                  t_fichr (t_fichr.last).type_fichr      :=
                    case substr (v_buffer
                                ,1
                                ,1)
                      when '-' then 'F'
                      else 'D'
                    end;
                  n_bytes               := length (v_buffer);
                  n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                else
                  l_filename_search      :=
                       '%'
                    || rtrim (ltrim (   '%'
                                     || replace (v_filenameto
                                                ,'*'
                                                ,'%')
                                     || '%'
                                    ,'%')
                             ,'%')
                    || '%';

                  if v_buffer like l_filename_search
                  then
                    if     l_header_displayed = 0
                       and upper (v_tsfr_mode) = 'LIST'
                    then
                      l_header_displayed   := 1;
                      utl_file.put_line (u_filehandle
                                        ,v_buffer_header1);
                      utl_file.put_line (u_filehandle
                                        ,v_buffer_header2);
                    end if;

                    utl_file.put_line (u_filehandle
                                      ,v_buffer);
                    n_bytes               := length (v_buffer);
                    n_bytes_transmitted   := n_bytes_transmitted + n_bytes;
                  end if;
                end if;
              end if;
            end loop;
          exception
            when utl_tcp.end_of_input
            then
              null;
          end;
        end if; -- end of IF mainframe connection
      end if; -- end of LOB vs FILE
    end if;

    --
    d_trans_end           := sysdate;
    l_step                := 'CLOSING FILE IF OPEN';

    --
    /** Close the file **/
    --
    -- We don't have to do this when in LOB mode because we
    -- are not working with the filesystem
    --
    if     v_mode in ('r'
                     ,'w'
                     ,'l'
                     ,'n')
       and v_operation_mode = 'FILE'
    then
      utl_file.fclose (u_filehandle);
    end if;

    l_step                := 'CLOSING DATA CONNECTION';
    --
    /** Close the Data Connection **/
    utl_tcp.close_connection (u_data_con);
    --
    --
    l_step                := 'VERIFY TRANSFER SUCCESS';

    --
    /** Verify the transfer succeeded **/
    if v_mode in ('r'
                 ,'w'
                 ,'l'
                 ,'n')
    then
      if mainframe_connection
      then
        if validate_reply (u_ctrl_connection
                          ,tsfr_end_code_mf
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      else
        if validate_reply (u_ctrl_connection
                          ,tsfr_end_code
                          ,v_reply) = false
        then
          raise ctrl_exception;
        end if;
      end if;
    elsif v_mode = 'd'
    then
      if validate_reply (u_ctrl_con
                        ,delete_code
                        ,v_reply) = false
      then
        raise ctrl_exception;
      end if;
    elsif v_mode = 'm'
    then
      if validate_reply (u_ctrl_con
                        ,rnto_code
                        ,v_reply) = false
      then
        raise ctrl_exception;
      end if;
    end if;
  exception
    when ctrl_exception
    then
      v_status   := v_err_status;
      v_error_message      :=
           c_process
        || ' :: '
        || v_reply
        || '. :: '
        || l_step;

      --
      if     utl_file.is_open (u_filehandle)
         and v_operation_mode = 'FILE'
      then
        utl_file.fclose (u_filehandle);
      end if;

      --
      utl_tcp.close_connection (u_data_con);
    when utl_file.invalid_path
    then
      v_status   := v_err_status;
      v_error_message      :=
           c_process
        || ' :: '
        || 'Directory '
        || v_localpath
        || ' is not available to UTL_FILE.  Check the init.ora file for valid UTL_FILE directories'
        || '. :: '
        || l_step;
      utl_tcp.close_connection (u_data_con);
    when utl_file.invalid_operation
    then
      v_status   := v_err_status;

      --
      if upper (v_tsfr_mode) = 'PUT'
      then
        v_error_message      :=
             c_process
          || ' :: '
          || 'The file '
          || v_filenamefr
          || ' in the directory '
          || v_localpath
          || ' could not be opened for reading'
          || '. :: '
          || l_step;
      elsif upper (v_tsfr_mode) = 'GET'
      then
        v_error_message      :=
             c_process
          || ' :: '
          || 'The file '
          || v_filenamefr
          || ' in the directory '
          || v_localpath
          || ' could not be opened for writing'
          || '. :: '
          || l_step;
      elsif upper (v_tsfr_mode) = 'LIST'
      then
        v_error_message      :=
             'The file '
          || v_filenamefr
          || ' in the directory '
          || v_localpath
          || ' could not be opened for writing, or some other problem occurred with dir cmd'
          || '. :: '
          || l_step;
      elsif upper (v_tsfr_mode) = 'NLIST'
      then
        v_error_message      :=
             c_process
          || ' :: '
          || 'The file '
          || v_filenamefr
          || ' in the directory '
          || v_localpath
          || ' could not be opened for writing, or some other problem occurred with dir cmd'
          || '. :: '
          || l_step;
      elsif upper (v_tsfr_mode) = 'DELE'
      then
        v_error_message      :=
             c_process
          || ' :: '
          || 'The file '
          || v_filenamefr
          || ' in the directory '
          || v_localpath
          || ' could not be deleted'
          || '. :: '
          || l_step;
      elsif upper (v_tsfr_mode) = 'RNFR'
      then
        v_error_message      :=
             c_process
          || ' :: '
          || 'The file '
          || v_filenamefr
          || ' in the directory '
          || v_localpath
          || ' could not be renamed'
          || '. :: '
          || l_step;
      end if;

      --
      if     utl_file.is_open (u_filehandle)
         and v_operation_mode = 'FILE'
      then
        utl_file.fclose (u_filehandle);
      end if;

      --
      utl_tcp.close_connection (u_data_con);
    when utl_file.read_error
    then
      v_status   := v_err_status;
      v_error_message      :=
           c_process
        || ' :: '
        || 'The system encountered an error while trying to read '
        || v_filenamefr
        || ' in the directory '
        || v_localpath
        || '. :: '
        || l_step;

      --
      if     utl_file.is_open (u_filehandle)
         and v_operation_mode = 'FILE'
      then
        utl_file.fclose (u_filehandle);
      end if;

      --
      utl_tcp.close_connection (u_data_con);
    when utl_file.write_error
    then
      v_status   := v_err_status;
      v_error_message      :=
           c_process
        || ' :: '
        || 'The system encountered an error while trying to write to '
        || v_filenamefr
        || ' in the directory '
        || v_localpath
        || '. :: '
        || l_step;

      --
      if     utl_file.is_open (u_filehandle)
         and v_operation_mode = 'FILE'
      then
        utl_file.fclose (u_filehandle);
      end if;

      --
      utl_tcp.close_connection (u_data_con);
    when utl_file.internal_error
    then
      v_status   := v_err_status;
      v_error_message      :=
           c_process
        || ' :: '
        || 'The UTL_FILE package encountered an unexpected internal system error'
        || '. :: '
        || l_step;

      --
      if     utl_file.is_open (u_filehandle)
         and v_operation_mode = 'FILE'
      then
        utl_file.fclose (u_filehandle);
      end if;

      --
      utl_tcp.close_connection (u_data_con);
    when others
    then
      v_status   := v_err_status;
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm
        || '. :: '
        || l_step;

      --
      if     utl_file.is_open (u_filehandle)
         and v_operation_mode = 'FILE'
      then
        utl_file.fclose (u_filehandle);
      end if;

      --
      utl_tcp.close_connection (u_data_con);
  end transfer_data;

  --
  --
  -- FTP_FILES_STAGE
  --
  -- Handles connection to remote server and initial remote server commands
  --
  --
  --    * Function to handle FTP of files.
  --    * Returns TRUE if no batch-level errors occur.
  --    * Returns FALSE if a batch-level error occurs.
  --    *
  --    * Parameters:
  --    *
  --    * p_error_msg - error message for batch level errors
  --    * p_files - FTP_INTERFACE.t_ftp_rec table type.  Accepts
  --    *           list of files to be transferred
  --    *           returns the table updated with transfer status, error message,
  --    *           bytes_transmitted, transmission start date/time and transmission end
  --    *           date/time
  --    * p_username - username for FTP server
  --    * p_password - password for FTP server
  --    * p_hostname - hostname or IP address of server Ex: 'ftp.oracle.com' or '127.0.0.1'
  --    * p_port - port number to connect on.  FTP is usually on 21, but this may be overridden
  --    *          if the server is configured differently.
  --
  function ftp_files_stage (p_error_msg      out varchar2
                           ,p_files       in out t_ftp_rec
                           ,p_username    in     varchar2
                           ,p_password    in     varchar2
                           ,p_hostname    in     varchar2
                           ,p_port        in     pls_integer default 21)
    return boolean
  is
    c_process     constant varchar2 (100) := 'hum_ftp_interface.FTP_FILES_STAGE';
    v_username             varchar2 (30) := p_username;
    v_password             varchar2 (30) := p_password;
    v_hostname             varchar2 (30) := p_hostname;
    n_port                 pls_integer := p_port;
    v_remotepath           varchar2 (2000);
    n_byte_count           pls_integer;
    n_first_index          number;
    v_msg                  varchar2 (1000);
    v_reply                varchar2 (1000);
    v_pasv_host            varchar2 (20);
    l_filetype             varchar2 (10);
    n_pasv_port            number;
    v_buffer               varchar2 (1000);
    u_ctrl_connection      utl_tcp.connection;
    v_mainframe_cmd_temp   varchar2 (2000);
    l_step                 varchar2 (1000);
    lncnt                  pls_integer := 0;
    ln_array               afw_07_util_chain_pkg.atoms_tabtype;
    ln_empty_array         afw_07_util_chain_pkg.atoms_tabtype;
    invalid_transfer       exception;
  begin
    p_error_msg         := 'FTP Successful';
    --Assume the overall transfer will succeed
    /** Attempt to connect to the host machine **/
    l_step              := 'LOGIN TO HOST MACHINE';
    u_ctrl_con          :=
      login (a_site_in     => p_hostname
            ,a_port_in     => p_port
            ,a_user_name   => v_username
            ,a_user_pass   => v_password);
    --
    u_ctrl_connection   := u_ctrl_con;

    --
    /** We should be logged in, time to transfer all files **/
    for i in p_files.first .. p_files.last
    loop
      l_step   := 'LOOP THROUGH FILES';

      if p_files.exists (i)
      then
        --
        -- For LIST command we want to determine what the system type is
        -- because it will determine our format for the headers when running
        -- the LIST (DIR) command.
        --
        -- Permission Lnk Owner    Group         Bytes Mon Dy Time  Name
        -- drwxrwxr-x 221 oaphrb   pay           12288 May 02 12:59 appltop
        --
        -- Although on Unix system, the header row is not presented, we would like to  provide it here
        -- so that it remains consistent with how the mainframe response is received which does
        -- in fact include a header row.
        --
        -- Problem is that different systems display data differently to put it simple. We will be
        -- supporting the following : Netware, VMS, Unix, and Windows. If you have others, you
        -- will need to modify the code accordingly to support it. To identify the system ,
        -- ftp to the server manually and type sys and press enter. It will respond back with
        -- the server type.
        --
        -- Then do a dir command and capture how the headers are displayed. Code for it.
        --
        --
        -- Connecting to a Netware O/S (Novell)
        --
        --   Permission Owner                           Bytes Mon Dy  Year Name
        -- - [RWCEAFMS] JSB2493S                       483566 May 26  2004 Rearch.EXE
        --
        -- Connect to MVS O/S (mainframe)
        --
        -- Volume Unit    Referred Ext Used Recfm Lrecl BlkSz Dsorg Dsname
        -- PRM515 3390   2006/08/25  1   15  FB     100 27900  PS  ET.TALX.COIDUDN.FILE
        --
        --
        -- Connect to Windows O/S
        --
        -- Permission Lnk Owner    Group           Bytes Mon Dy Time  Name
        -- ---------- --- -----    -----           ----- --- -- ----  ----
        -- dr-xr-xr-x   1 owner    group               0 Feb  1 17:32 bussys
        --
        --

        --
        -- Special Note. If so desired, we could do other things by leveraging
        -- the server type reply. For now, we are just impacting the LIST (dir)
        -- command
        --
        begin
          l_step   := 'PERFORMING SYST COMMAND';
          --
          /** Change to the remotepath directory **/
          n_byte_count      :=
            utl_tcp.write_line (u_ctrl_con
                               ,'SYST');

          if validate_reply (u_ctrl_con
                            ,syst_code
                            ,v_reply) = false
          then
            --                      print_output ( 'user_code= ' || user_code );
            --                      print_output ( 'v_reply= ' || v_reply );
            raise ctrl_exception;
          end if;

          case
            when upper (v_reply) like '%NETWARE%'
            then
              v_system_type         := 'NETWARE';
              v_system_type_reply   := v_reply;
            when upper (v_reply) like '%MVS%'
            then
              v_system_type         := 'MVS';
              v_system_type_reply   := v_reply;
            when upper (v_reply) like '%UNIX%'
            then
              v_system_type         := 'UNIX';
              v_system_type_reply   := v_reply;
            when upper (v_reply) like '%WINDOWS%'
            then
              v_system_type         := 'WINDOWS';
              v_system_type_reply   := v_reply;
            else
              v_system_type         := 'INFO :: Header columns not supported yet. Contact IT Support.';
              v_system_type_reply   := v_reply;
          end case;
        exception
          when others
          then
            -- If this SYST command fails we don't want to fail the ftp
            -- we just won't show headers on the output file for directory listings
            v_system_type         := null;
            v_system_type_reply   := v_reply;
        end;

        v_remotepath   := p_files (i).remotepath;

        --
        -- If no path was provided we assume stay in current path
        -- let us get path and so we can perform CWD command
        --
        --
        if (   v_remotepath is null
            or v_remotepath = '.')
        then
          /** Check PWD command **/
          n_byte_count      :=
            utl_tcp.write_line (u_ctrl_con
                               ,'PWD');

          if validate_reply (u_ctrl_con
                            ,pwd_code
                            ,v_reply) = false
          then
            print_output (   'user_code= '
                          || user_code);
            print_output (   'v_reply= '
                          || v_reply);
            raise ctrl_exception;
          else
            if nvl (upper (l_ftp_debug), 'N') = 'Y'
            then
              print_output (   'PWD REPLY IS => '
                            || v_reply);
            end if;

            --
            -- Typical reply would like this :
            --
            -- 257 "/activitytracker" is current directory.
            --
            -- If your server response code does not have quotes around the
            -- path, then you will need to alter this logic here appropriately
            --
            -- So far, all of our servers seem to work this way, so I am assuming
            -- its a FTP standard
            --
            v_remotepath      :=
              substr (v_reply
                     ,  instr (v_reply
                              ,'"'
                              ,1)
                      + 1
                     ,  instr (substr (v_reply
                                      ,  instr (v_reply
                                               ,'"'
                                               ,1)
                                       + 1)
                              ,'"'
                              ,1)
                      - 1);

            --
            -- Get rid of leading quote and trailing quote that is picked up from the mainframe
            --
            if mainframe_connection
            then
              v_remotepath      :=
                ltrim (rtrim (v_remotepath
                             ,'''')
                      ,'''');
            end if;

            if v_remotepath is null
            then
              raise ctrl_exception;
            end if;
          end if;
        end if;

        if nvl (upper (l_ftp_debug), 'N') = 'Y'
        then
          --                      print_output ( 'user_code= ' || user_code );
          --                      print_output ( 'v_reply= ' || v_reply );
          print_output (   'PATH IS => '
                        || v_remotepath);
        end if;

        begin
          --
          l_step      :=
               'PERFORMING CWD COMMAND FOR '
            || v_remotepath;

          --
          if mainframe_connection
          then
            --
            -- Mainframe does not use unix path syntax.
            -- We will convert / (fwd slash) to a . (period)
            -- and also trim leading fwd slash
            --
            -- If already periods, then this really won't do anything
            --
            v_remotepath      :=
              ltrim (v_remotepath
                    ,'/');
            v_remotepath      :=
              replace (v_remotepath
                      ,'/'
                      ,'.');

            if nvl (upper (l_ftp_debug), 'N') = 'Y'
            then
              --                      print_output ( 'user_code= ' || user_code );
              --                      print_output ( 'v_reply= ' || v_reply );
              print_output (   'MF REMOTEPATH IS => '
                            || v_remotepath);
            end if;

            --
            /** Change to the remotepath directory **/
            n_byte_count      :=
              utl_tcp.write_line (u_ctrl_con
                                 ,   'CWD '
                                  || ''''
                                  || v_remotepath
                                  || '''');
          else
            /** Change to the remotepath directory **/
            n_byte_count      :=
              utl_tcp.write_line (u_ctrl_con
                                 ,   'CWD '
                                  || v_remotepath);
          end if;

          if validate_reply (u_ctrl_con
                            ,cwd_code
                            ,v_reply) = false
          then
            --                      print_output ( 'user_code= ' || user_code );
            --                      print_output ( 'v_reply= ' || v_reply );
            raise ctrl_exception;
          end if;

          --
          --
          /** Switch to IMAGE mode **/
          -- In certain cases we want to switch to ASCII mode
          -- otherwise we always default to BINARY because it works fine
          -- everything. We handle the 'feature' of binary that adds carriage
          -- return to flat text files by trimming it off before sending it over
          --
          if upper (p_files (i).localpath) = 'CLOB'
          then
            n_byte_count      :=
              utl_tcp.write_line (u_ctrl_con
                                 ,'TYPE A');

            --
            if validate_reply (u_ctrl_con
                              ,type_code
                              ,v_reply) = false
            then
              raise ctrl_exception;
            end if;

            l_filetype   := 'ASCII';
          elsif upper (p_files (i).transfer_mode) in ('LIST'
                                                     ,'NLST')
          then
            n_byte_count      :=
              utl_tcp.write_line (u_ctrl_con
                                 ,'TYPE A');

            --
            if validate_reply (u_ctrl_con
                              ,type_code
                              ,v_reply) = false
            then
              raise ctrl_exception;
            end if;

            l_filetype   := 'ASCII';
          elsif mainframe_connection
          then
            n_byte_count      :=
              utl_tcp.write_line (u_ctrl_con
                                 ,'TYPE A');

            --
            if validate_reply (u_ctrl_con
                              ,type_code
                              ,v_reply) = false
            then
              raise ctrl_exception;
            end if;

            l_filetype   := 'ASCII';
          elsif upper (p_files (i).filetype) = 'ASCII'
          then
            --
            -- BINARY MODE WORKS FINE FOR GENERAL PURPOSES
            -- HOWEVER WE WILL SAY FILETYPE OF ASCII SO
            -- CARRIAGE RETURNS ARE TRIMMED AND FILE
            -- IS WRITTEN OUT CORRECTLY
            --
            n_byte_count      :=
              utl_tcp.write_line (u_ctrl_con
                                 ,'TYPE I');

            --
            if validate_reply (u_ctrl_con
                              ,type_code
                              ,v_reply) = false
            then
              raise ctrl_exception;
            end if;

            l_filetype   := 'ASCII';
          elsif upper (p_files (i).filetype) = 'BINARY'
          then
            n_byte_count      :=
              utl_tcp.write_line (u_ctrl_con
                                 ,'TYPE I');

            --
            if validate_reply (u_ctrl_con
                              ,type_code
                              ,v_reply) = false
            then
              raise ctrl_exception;
            end if;

            l_filetype   := 'BINARY';
          else
            --
            -- We will default to BINARY MODE
            --
            n_byte_count      :=
              utl_tcp.write_line (u_ctrl_con
                                 ,'TYPE I');

            --
            if validate_reply (u_ctrl_con
                              ,type_code
                              ,v_reply) = false
            then
              raise ctrl_exception;
            end if;

            l_filetype   := 'BINARY';
          end if;

          --
          -- We can provide a list of SITE commands by separating with | symbols
          -- This permits us to allocate space as well as submit additional commands
          -- like handling special characters
          --
          -- e.g. quote site recfm=fb lrecl=512 cyl pri=30 sec=30|quote site sbdataconn=(ibm-1047,iso8859-1)
          --
          -- quote site recfm=fb lrecl=512 cyl pri=30 sec=30         => allocate space
          -- quote site sbdataconn=(ibm-1047,iso8859-1)              => handle special characters
          --
          -- Technically, any valid FTP command could be sent here that has
          -- a success return code of 200. We just enforce it for Mainframe to
          -- make sure that it is not forgotten
          --
          -- Some other commands that have a success code of 200
          --
          -- TYPE, MODE
          --
          /** Submit QUOTE SITE commands **/
          if     mainframe_connection
             and mainframe_cmd is not null
          then
            afw_07_util_chain_pkg.std_delimiters   := '|';
            ln_array                               := ln_empty_array;
            afw_07_util_chain_pkg.parse_string (string_in          => mainframe_cmd
                                               ,atomics_list_out   => ln_array
                                               ,num_atomics_out    => lncnt);

            for i_idx in 1 .. lncnt
            loop
              if ln_array (i_idx) <> '|'
              then
                v_mainframe_cmd_temp      :=
                  ltrim (rtrim (replace (lower (ln_array (i_idx))
                                        ,'quote'
                                        ,'')));
                print_output (   'Executing Site Command :: '
                              || v_mainframe_cmd_temp);
                n_byte_count      :=
                  utl_tcp.write_line (u_ctrl_con
                                     ,v_mainframe_cmd_temp);

                if validate_reply (u_ctrl_con
                                  ,site_code
                                  ,v_reply) = false
                then
                  raise ctrl_exception;
                end if;
              end if;
            end loop;
          else
            --
            -- We don't require SITE Commands for non-mainframe transfers
            -- However, if it was desired, it wouldn't take much to alter
            -- this package so that additional server commands could be
            -- sent for non-mainframe ftp processes as well
            --
            -- For now we will just put a place holder here which performs
            -- a NOOP check against the remote server.
            --
            -- If your FTP server does not recognize NOOP you can comment
            -- this out. Most likely it does. In my environment the server
            -- return code is 200 when successful.
            --
            n_byte_count      :=
              utl_tcp.write_line (u_ctrl_con
                                 ,'NOOP');

            if validate_reply (u_ctrl_con
                              ,noop_code
                              ,v_reply) = false
            then
              raise ctrl_exception;
            end if;
          end if;

          /** Get a Passive connection to use for data transfer **/
          n_byte_count      :=
            utl_tcp.write_line (u_ctrl_con
                               ,'PASV');

          if validate_reply (u_ctrl_con
                            ,pasv_code
                            ,v_reply) = false
          then
            raise ctrl_exception;
          end if;

          create_pasv (substr (v_reply
                              ,  instr (v_reply
                                       ,'('
                                       ,1
                                       ,1)
                               + 1
                              ,  instr (v_reply
                                       ,')'
                                       ,1
                                       ,1)
                               - instr (v_reply
                                       ,'('
                                       ,1
                                       ,1)
                               - 1)
                      ,v_pasv_host
                      ,n_pasv_port);

          --

          /** Transfer Data **/
          if upper (p_files (i).transfer_mode) = 'PUT'
          then
            transfer_data (u_ctrl_con
                          ,p_files (i).localpath
                          ,p_files (i).filename
                          ,l_filetype
                          ,v_pasv_host
                          ,n_pasv_port
                          ,p_files (i).transfer_mode
                          ,p_files (i).status
                          ,p_files (i).error_message
                          ,p_files (i).bytes_transmitted
                          ,p_files (i).trans_start
                          ,p_files (i).trans_end);
          elsif upper (p_files (i).transfer_mode) = 'GET'
          then
            transfer_data (u_ctrl_con
                          ,p_files (i).localpath
                          ,p_files (i).filename
                          ,l_filetype
                          ,v_pasv_host
                          ,n_pasv_port
                          ,p_files (i).transfer_mode
                          ,p_files (i).status
                          ,p_files (i).error_message
                          ,p_files (i).bytes_transmitted
                          ,p_files (i).trans_start
                          ,p_files (i).trans_end);
          elsif upper (p_files (i).transfer_mode) = 'LIST'
          then
            transfer_data (u_ctrl_con
                          ,p_files (i).localpath
                          ,p_files (i).filename
                          ,l_filetype
                          ,v_pasv_host
                          ,n_pasv_port
                          ,p_files (i).transfer_mode
                          ,p_files (i).status
                          ,p_files (i).error_message
                          ,p_files (i).bytes_transmitted
                          ,p_files (i).trans_start
                          ,p_files (i).trans_end);
          elsif upper (p_files (i).transfer_mode) = 'NLST'
          then
            transfer_data (u_ctrl_con
                          ,p_files (i).localpath
                          ,p_files (i).filename
                          ,l_filetype
                          ,v_pasv_host
                          ,n_pasv_port
                          ,p_files (i).transfer_mode
                          ,p_files (i).status
                          ,p_files (i).error_message
                          ,p_files (i).bytes_transmitted
                          ,p_files (i).trans_start
                          ,p_files (i).trans_end);
          elsif upper (p_files (i).transfer_mode) = 'DELE'
          then
            transfer_data (u_ctrl_con
                          ,p_files (i).localpath
                          ,p_files (i).filename
                          ,l_filetype
                          ,v_pasv_host
                          ,n_pasv_port
                          ,p_files (i).transfer_mode
                          ,p_files (i).status
                          ,p_files (i).error_message
                          ,p_files (i).bytes_transmitted
                          ,p_files (i).trans_start
                          ,p_files (i).trans_end);
          elsif upper (p_files (i).transfer_mode) = 'RNFR'
          then
            transfer_data (u_ctrl_con
                          ,p_files (i).localpath
                          ,p_files (i).filename
                          ,l_filetype
                          ,v_pasv_host
                          ,n_pasv_port
                          ,p_files (i).transfer_mode
                          ,p_files (i).status
                          ,p_files (i).error_message
                          ,p_files (i).bytes_transmitted
                          ,p_files (i).trans_start
                          ,p_files (i).trans_end);
          else
            raise invalid_transfer; -- Raise an exception here
          end if;
        exception
          when ctrl_exception
          then
            p_files (i).status   := 'ERROR';
            p_files (i).error_message      :=
                 c_process
              || ' :: '
              || v_reply
              || ' :: '
              || l_step;
          when invalid_transfer
          then
            p_files (i).status   := 'ERROR';
            p_files (i).error_message      :=
                 'Invalid transfer method.  Use PUT/GET/REMOVE/RENAME/LS/DIR Only.'
              || ' :: '
              || l_step;
        end;
      end if;
    end loop;

    /** Send QUIT command **/
    n_byte_count        :=
      utl_tcp.write_line (u_ctrl_con
                         ,'QUIT');
    /** Don't need to VALIDATE QUIT, just close the connection **/
    utl_tcp.close_connection (u_ctrl_con);
    return true;
  exception
    when ctrl_exception
    then
      p_error_msg      :=
           c_process
        || ' :: '
        || v_reply
        || ' :: '
        || l_step;
      utl_tcp.close_all_connections;
      return false;
    when others
    then
      p_error_msg      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm
        || ' :: '
        || l_step;
      utl_tcp.close_all_connections;
      return false;
  end ftp_files_stage;

  --
  -- GET_LOCAL_BINARY_DATA
  --
  -- Load local binary file into BLOB
  --
  function get_local_binary_data (p_dir    in varchar2
                                 ,p_file   in varchar2)
    return blob
  is
    l_bfile              bfile;
    l_data               blob;
    l_dbdir              varchar2 (100) := p_dir;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.GET_LOCAL_BINARY_DATA';
  begin
    dbms_lob.createtemporary (lob_loc   => l_data
                             ,cache     => true
                             ,dur       => dbms_lob.call);
    --
    l_bfile      :=
      bfilename (l_dbdir
                ,p_file);
    --
    dbms_lob.fileopen (l_bfile
                      ,dbms_lob.file_readonly);
    --
    dbms_lob.loadfromfile (l_data
                          ,l_bfile
                          ,dbms_lob.getlength (l_bfile));
    --
    dbms_lob.fileclose (l_bfile);
    --
    return l_data;
  --
  exception
    when others
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during GET_LOCAL_BINARY_DATA :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm);
      dbms_lob.fileclose (l_bfile);
      raise;
  end get_local_binary_data;

  --
  -- GET_REMOTE_BINARY_DATA
  --
  -- Loads remote binary file into BLOB
  --
  function get_remote_binary_data (u_ctrl_connection in out utl_tcp.connection)
    return blob
  is
    l_amount             pls_integer;
    l_buffer             raw (32767);
    l_data               blob;
    l_conn               utl_tcp.connection := u_ctrl_connection;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.GET_REMOTE_BINARY_DATA';
  begin
    dbms_lob.createtemporary (lob_loc   => l_data
                             ,cache     => true
                             ,dur       => dbms_lob.call);

    begin
      loop
        l_amount      :=
          utl_tcp.read_raw (l_conn
                           ,l_buffer
                           ,32767);
        dbms_lob.writeappend (l_data
                             ,l_amount
                             ,l_buffer);
      end loop;
    exception
      when utl_tcp.end_of_input
      then
        null;
      when others
      then
        null;
    end;

    return l_data;
  exception
    when others
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during GET_REMOTE_BINARY_DATA :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm);
      raise;
  end get_remote_binary_data;

  --
  -- GET_REMOTE_ASCII_DATA
  --
  -- Loads remote ascii file into CLOB
  --
  -- Note, we do not have a GET_LOCAL_ASCII_DATA because that code
  -- is found within the TRANSFER_DATA routine itself using UTL_FILE.GET_LINE
  -- operations
  --
  function get_remote_ascii_data (u_ctrl_connection in out utl_tcp.connection)
    return clob
  is
    l_amount             pls_integer;
    l_buffer             varchar2 (32767);
    l_data               clob;
    l_conn               utl_tcp.connection := u_ctrl_connection;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.GET_REMOTE_ASCII_DATA';
  begin
    dbms_lob.createtemporary (lob_loc   => l_data
                             ,cache     => true
                             ,dur       => dbms_lob.call);

    begin
      loop
        --
        -- Don't forget you are planning to retrieve an ASCII file
        -- via the CLOB method, and you are planning to include the
        -- output in a message body of an email which is a formatted
        -- email message (html) or in a webpage, then don't forget to
        -- use <PRE> </PRE> tags around your content. Otherwise it
        -- will look like one big piece of text. HTML doesn't recognize
        -- the carriage return correctly otherwise.
        --
        l_buffer      :=
          utl_tcp.get_line (l_conn
                           ,true);

        /** Sometimes the TCP/IP buffer sends null data **/
        /** we only want to receive the actual data **/
        if l_buffer is not null
        then
          --
          -- We append a crlf to the end of each line
          -- so that the content from is maintained
          -- as we grab one line at a time from the remote server
          --
          l_buffer      :=
               l_buffer
            || utl_tcp.crlf;
          l_amount   := length (l_buffer);
          dbms_lob.writeappend (l_data
                               ,l_amount
                               ,l_buffer);
        end if;
      end loop;
    exception
      when utl_tcp.end_of_input
      then
        null;
    end;

    return l_data;
  exception
    when others
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during GET_REMOTE_ASCII_DATA :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm);
      raise;
  end get_remote_ascii_data;

  --
  -- GET_REMOTE_LISTING_DATA
  --
  -- This is used for obtaining a remote directory listing
  -- and loading up into a CLOB
  --
  function get_remote_listing_data (u_ctrl_connection   in out utl_tcp.connection
                                   ,p_filename_filter   in     varchar2
                                   ,p_tsfr_mode         in     varchar2)
    return clob
  is
    l_data               clob;
    l_conn               utl_tcp.connection := u_ctrl_connection;
    l_amount             pls_integer;
    v_buffer             varchar2 (32767);
    v_buffer_header1     varchar2 (32767);
    v_buffer_header2     varchar2 (32767);
    l_header_displayed   pls_integer := 0;
    l_longdir_line_cnt   pls_integer := 0;
    l_filename_search    varchar2 (1000);
    c_process   constant varchar2 (100) := 'hum_ftp_interface.GET_REMOTE_LISTING_DATA';
  begin
    dbms_lob.createtemporary (lob_loc   => l_data
                             ,cache     => true
                             ,dur       => dbms_lob.call);

    --
    -- Don't forget you are planning to retrieve an ASCII file
    -- via the CLOB method, and you are planning to include the
    -- output in a message body of an email which is a formatted
    -- email message (html) or in a webpage, then don't forget to
    -- use <PRE> </PRE> tags around your content. Otherwise it
    -- will look like one big piece of text. HTML doesn't recognize
    -- the carriage return correctly otherwise.
    --
    if mainframe_connection
    then
      loop
        begin
          v_buffer      :=
            utl_tcp.get_line (l_conn
                             ,true);

          --

          --
          /** Sometimes the TCP/IP buffer sends null data **/
          /** we only want to receive the actual data **/
          if v_buffer is not null
          then
            l_longdir_line_cnt   := l_longdir_line_cnt + 1;

            --
            -- Capture the first line. On our system
            -- it is the column headers
            --
            if l_longdir_line_cnt = 1
            then
              v_buffer_header1   := v_buffer;
            end if;

            --
            -- DISPLAY HEADER ROW WHEN v_SYSTEM_TYPE IS NOT NULL
            --
            case
              when     l_longdir_line_cnt = 1
                   and upper (p_tsfr_mode) = 'LIST'
                   and v_system_type = 'MVS'
              then
                v_buffer_header1      :=
                     v_buffer_header1
                  || utl_tcp.crlf;
                v_buffer_header2   := '------ ----    -------- --- ---- ----- ----- ----- ----- ------';
                v_buffer_header2      :=
                     v_buffer_header2
                  || utl_tcp.crlf;
              when     l_longdir_line_cnt = 1
                   and upper (p_tsfr_mode) = 'LIST'
                   and v_system_type <> 'MVS'
              then
                --
                -- We didn't recognize the system type so display a message
                -- that we won't be displaying the header row
                --
                v_buffer_header1      :=
                  ltrim (rtrim (   'System Reply => '
                                || v_system_type_reply));
                v_buffer_header1      :=
                     v_buffer_header1
                  || utl_tcp.crlf;
                v_buffer_header2   := '************************************************************************************************';
                v_buffer_header2      :=
                     v_buffer_header2
                  || utl_tcp.crlf;
              else
                null;
            end case;

            --
            -- We stored the filename filter in v_filenameto
            --
            if p_filename_filter = '*'
            then
              if     l_header_displayed = 0
                 and upper (p_tsfr_mode) = 'LIST'
                 and 'PLACEHOLDER ONLY. ALWAYS INCLUDES HEADER BY DEFAULT' is null
              then
                l_header_displayed   := 1;
                l_amount             := length (v_buffer_header1);
                dbms_lob.writeappend (l_data
                                     ,l_amount
                                     ,v_buffer_header1);
                l_amount             := length (v_buffer_header2);
                dbms_lob.writeappend (l_data
                                     ,l_amount
                                     ,v_buffer_header2);
              end if;

              --
              -- We append a crlf to the end of each line
              -- so that the content from is maintained
              -- as we grab one line at a time from the remote server
              --
              v_buffer      :=
                   v_buffer
                || utl_tcp.crlf;
              l_amount   := length (v_buffer);
              dbms_lob.writeappend (l_data
                                   ,l_amount
                                   ,v_buffer);
            else
              --
              -- Here we are building our search string
              -- by replacing wildcard * with %
              -- and then encapsulating the resulting string
              -- with % on each end. We also make sure we don't
              -- have %% on the tail and lead of the search string
              --
              l_filename_search      :=
                   '%'
                || rtrim (ltrim (   '%'
                                 || replace (p_filename_filter
                                            ,'*'
                                            ,'%')
                                 || '%'
                                ,'%')
                         ,'%')
                || '%';

              if v_buffer like l_filename_search
              then
                if     l_header_displayed = 0
                   and upper (p_tsfr_mode) = 'LIST'
                then
                  l_header_displayed   := 1;
                  l_amount             := length (v_buffer_header1);
                  dbms_lob.writeappend (l_data
                                       ,l_amount
                                       ,v_buffer_header1);
                  l_amount             := length (v_buffer_header2);
                  dbms_lob.writeappend (l_data
                                       ,l_amount
                                       ,v_buffer_header2);
                end if;

                v_buffer      :=
                     v_buffer
                  || utl_tcp.crlf;
                l_amount   := length (v_buffer);
                dbms_lob.writeappend (l_data
                                     ,l_amount
                                     ,v_buffer);
              end if;
            end if;
          end if;
        --
        exception
          when utl_tcp.end_of_input
          then
            exit;
        end;
      --
      end loop;
    else
      begin
        loop
          v_buffer      :=
            utl_tcp.get_line (l_conn
                             ,true);

          --
          /** Sometimes the TCP/IP buffer sends null data **/
          /** we only want to receive the actual data **/
          if v_buffer is not null
          then
            l_longdir_line_cnt   := l_longdir_line_cnt + 1;

            --
            -- DISPLAY HEADER ROW WHEN v_SYSTEM_TYPE IS NOT NULL
            --
            case
              when     upper (p_tsfr_mode) = 'LIST'
                   and l_longdir_line_cnt = 1
                   and v_system_type = 'UNIX'
              then
                v_buffer_header1   := 'Permission Lnk Owner    Group         Bytes Mon Dy Time  Name';
                v_buffer_header1      :=
                     v_buffer_header1
                  || utl_tcp.crlf;
                v_buffer_header2   := '---------- --- -----    -----         ----- --- -- ----  ----';
                v_buffer_header2      :=
                     v_buffer_header2
                  || utl_tcp.crlf;
              when     upper (p_tsfr_mode) = 'LIST'
                   and l_longdir_line_cnt = 1
                   and v_system_type = 'NETWARE'
              then
                v_buffer_header1   := 'Permission   Owner                           Bytes Mon Dy DStmp Name';
                v_buffer_header1      :=
                     v_buffer_header1
                  || utl_tcp.crlf;
                v_buffer_header2   := '------------ --------                        ----- --- -- ----- ----';
                v_buffer_header2      :=
                     v_buffer_header2
                  || utl_tcp.crlf;
              when     upper (p_tsfr_mode) = 'LIST'
                   and l_longdir_line_cnt = 1
                   and v_system_type = 'WINDOWS'
              then
                v_buffer_header1   := 'Permission Lnk Owner    Group           Bytes Mon Dy DStmp Name';
                v_buffer_header1      :=
                     v_buffer_header1
                  || utl_tcp.crlf;
                v_buffer_header2   := '---------- --- -----    -----           ----- --- -- ----- ----';
                v_buffer_header2      :=
                     v_buffer_header2
                  || utl_tcp.crlf;
              else
                --
                -- We didn't recognize the system type so display a message
                -- that we won't be displaying the header row
                --
                v_buffer_header1      :=
                  ltrim (rtrim (   'System Reply => '
                                || v_system_type_reply));
                v_buffer_header1      :=
                     v_buffer_header1
                  || utl_tcp.crlf;
                v_buffer_header2   := '************************************************************************************************';
                v_buffer_header2      :=
                     v_buffer_header2
                  || utl_tcp.crlf;
            end case;

            --
            -- We stored the filename filter in v_filenameto
            --
            if p_filename_filter = '*'
            then
              if     l_header_displayed = 0
                 and upper (p_tsfr_mode) = 'LIST'
              then
                l_header_displayed   := 1;
                l_amount             := length (v_buffer_header1);
                dbms_lob.writeappend (l_data
                                     ,l_amount
                                     ,v_buffer_header1);
                l_amount             := length (v_buffer_header2);
                dbms_lob.writeappend (l_data
                                     ,l_amount
                                     ,v_buffer_header2);
              end if;

              v_buffer      :=
                   v_buffer
                || utl_tcp.crlf;
              l_amount   := length (v_buffer);
              dbms_lob.writeappend (l_data
                                   ,l_amount
                                   ,v_buffer);
            else
              l_filename_search      :=
                   '%'
                || rtrim (ltrim (   '%'
                                 || replace (p_filename_filter
                                            ,'*'
                                            ,'%')
                                 || '%'
                                ,'%')
                         ,'%')
                || '%';

              if v_buffer like l_filename_search
              then
                if     l_header_displayed = 0
                   and upper (p_tsfr_mode) = 'LIST'
                then
                  l_header_displayed   := 1;
                  l_amount             := length (v_buffer_header1);
                  dbms_lob.writeappend (l_data
                                       ,l_amount
                                       ,v_buffer_header1);
                  l_amount             := length (v_buffer_header2);
                  dbms_lob.writeappend (l_data
                                       ,l_amount
                                       ,v_buffer_header2);
                end if;

                v_buffer      :=
                     v_buffer
                  || utl_tcp.crlf;
                l_amount   := length (v_buffer);
                dbms_lob.writeappend (l_data
                                     ,l_amount
                                     ,v_buffer);
              end if;
            end if;
          end if;
        end loop;
      exception
        when utl_tcp.end_of_input
        then
          null;
      end;
    end if; -- end of IF mainframe connection

    return l_data;
  exception
    when others
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during GET_REMOTE_LISTING_DATA :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm);
      raise;
  end get_remote_listing_data;

  --
  -- PUT_LOCAL_BINARY_DATA
  --
  -- This is used to write out a BLOB
  -- to the local filesystem after
  -- retrieving data from remote server
  --
  procedure put_local_binary_data (p_data   in blob
                                  ,p_dir    in varchar2
                                  ,p_file   in varchar2)
  is
    l_out_file           utl_file.file_type;
    l_buffer             raw (32767);
    l_amount             binary_integer := 32767;
    l_pos                integer := 1;
    l_blob_len           integer;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.PUT_LOCAL_BINARY_DATA';
  begin
    l_blob_len   := dbms_lob.getlength (p_data);
    l_out_file      :=
      utl_file.fopen (p_dir
                     ,p_file
                     ,'w'
                     ,32767);

    while l_pos < l_blob_len
    loop
      dbms_lob.read (p_data
                    ,l_amount
                    ,l_pos
                    ,l_buffer);

      if l_buffer is not null
      then
        utl_file.put_raw (l_out_file
                         ,l_buffer
                         ,true);
      end if;

      l_pos   := l_pos + l_amount;
    end loop;

    utl_file.fclose (l_out_file);
  exception
    when utl_file.invalid_path
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during PUT_LOCAL_BINARY_DATA :: '
                    || 'Directory '
                    || p_dir
                    || ' is not available to UTL_FILE.  Check the init.ora file for valid UTL_FILE directories.');
      raise;
    when utl_file.invalid_operation
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during PUT_LOCAL_BINARY_DATA :: '
                    || 'The file '
                    || p_file
                    || ' in the directory '
                    || p_dir
                    || ' could not be accessed.');

      if utl_file.is_open (l_out_file)
      then
        utl_file.fclose (l_out_file);
      end if;

      raise;
    when utl_file.read_error
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during PUT_LOCAL_BINARY_DATA :: '
                    || 'The system encountered an error while trying to read '
                    || p_file
                    || ' in the directory '
                    || p_dir);

      if utl_file.is_open (l_out_file)
      then
        utl_file.fclose (l_out_file);
      end if;

      raise;
    when utl_file.write_error
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during PUT_LOCAL_BINARY_DATA :: '
                    || 'The system encountered an error while trying to write to '
                    || p_file
                    || ' in the directory '
                    || p_dir);

      if utl_file.is_open (l_out_file)
      then
        utl_file.fclose (l_out_file);
      end if;

      raise;
    when utl_file.internal_error
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during PUT_LOCAL_BINARY_DATA :: '
                    || 'The UTL_FILE package encountered an unexpected internal system error.');

      if utl_file.is_open (l_out_file)
      then
        utl_file.fclose (l_out_file);
      end if;

      raise;
    when others
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during PUT_LOCAL_BINARY_DATA :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm);

      if utl_file.is_open (l_out_file)
      then
        utl_file.fclose (l_out_file);
      end if;

      raise;
  end put_local_binary_data;

  --
  -- PUT_REMOTE_BINARY_DATA
  --
  -- This is used for upload BLOB
  -- to remote server after retrieving
  -- from local filesystem or passed
  -- via parameter as a BLOB e.g. PUT_BLOB function
  -- in this package.
  --
  procedure put_remote_binary_data (u_ctrl_connection   in out utl_tcp.connection
                                   ,p_data              in     blob)
  is
    l_result             pls_integer;
    l_buffer             raw (32767);
    l_amount             binary_integer := 32767;
    l_pos                integer := 1;
    l_blob_len           integer;
    l_conn               utl_tcp.connection := u_ctrl_connection;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.PUT_REMOTE_BINARY_DATA';
  begin
    l_blob_len   := dbms_lob.getlength (p_data);

    while l_pos < l_blob_len
    loop
      dbms_lob.read (p_data
                    ,l_amount
                    ,l_pos
                    ,l_buffer);
      l_result      :=
        utl_tcp.write_raw (l_conn
                          ,l_buffer
                          ,l_amount);
      utl_tcp.flush (l_conn);
      l_pos   := l_pos + l_amount;
    end loop;
  exception
    when others
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during PUT_REMOTE_BINARY_DATA :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm);
      raise;
  end put_remote_binary_data;

  --
  -- PUT_REMOTE_ASCII_DATA
  --
  -- This is used for upload CLOB
  -- to remote server after retrieving
  -- when passed via parameter as a
  -- CLOB e.g. PUT_BLOB function in this package.
  --
  procedure put_remote_ascii_data (u_ctrl_connection   in out utl_tcp.connection
                                  ,p_data              in     clob)
  is
    -- --------------------------------------------------------------------------
    l_result             pls_integer;
    l_buffer             varchar2 (32767);
    l_amount             binary_integer := 32767;
    l_pos                integer := 1;
    l_clob_len           integer;
    l_conn               utl_tcp.connection := u_ctrl_connection;
    c_process   constant varchar2 (100) := 'hum_ftp_interface.PUT_REMOTE_ASCII_DATA';
  begin
    l_clob_len   := dbms_lob.getlength (p_data);

    while l_pos < l_clob_len
    loop
      dbms_lob.read (p_data
                    ,l_amount
                    ,l_pos
                    ,l_buffer);
      l_result      :=
        utl_tcp.write_line (l_conn
                           ,l_buffer);
      utl_tcp.flush (l_conn);
      l_pos   := l_pos + l_amount;
    end loop;
  exception
    when others
    then
      print_output (   c_process
                    || ' :: '
                    || 'Error during PUT_REMOTE_ASCII_DATA :: '
                    || sqlcode
                    || ' - '
                    || sqlerrm);
      raise;
  end put_remote_ascii_data;

  /*****************************************************************************
  **  Convenience function for single-file PUT
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function put (p_localpath           in     varchar2
               ,p_filename            in     varchar2
               ,p_remotepath          in     varchar2
               ,p_username            in     varchar2
               ,p_password            in     varchar2
               ,p_hostname            in     varchar2
               ,v_status                 out varchar2
               ,v_error_message          out varchar2
               ,n_bytes_transmitted      out number
               ,d_trans_start            out date
               ,d_trans_end              out date
               ,p_port                in     pls_integer default 21
               ,p_filetype            in     varchar2 := 'ASCII'
               ,p_mainframe_ftp       in     boolean default false
               ,p_mainframe_cmd       in     varchar2 default null)
    return boolean
  is
    c_process        constant varchar2 (100) := 'hum_ftp_interface.PUT';
    t_files                   t_ftp_rec;
    v_username                varchar2 (30) := p_username;
    v_password                varchar2 (50) := p_password;
    v_hostname                varchar2 (100) := p_hostname;
    n_port                    pls_integer := p_port;
    v_err_msg                 varchar2 (1000);
    b_ftp                     boolean;
    err_mf_cmd_missing        exception;
    err_mf_cmd_mf_ftp_false   exception;
  -- MF cmd present but identified as not a MF ftp job
  begin
    v_operation_mode            := 'FILE';

    if     p_mainframe_ftp
       and p_mainframe_cmd is null
    then
      raise err_mf_cmd_missing;
    elsif     p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      mainframe_connection   := true;
      mainframe_cmd          := p_mainframe_cmd;
    elsif     not p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      raise err_mf_cmd_mf_ftp_false;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

    t_files (1).localpath       := p_localpath;
    t_files (1).filename        := p_filename;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := p_filetype;
    t_files (1).transfer_mode   := 'PUT';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    if b_ftp = false
    then
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when err_mf_cmd_missing
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Missing Mainframe Command Parameter. i.e. SITE command';
      return false;
    when err_mf_cmd_mf_ftp_false
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Mainframe Command Parameter present, but not a Mainframe FTP.';
      return false;
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end put;

  /*****************************************************************************
  **  Convenience function for single-file GET
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function get (p_localpath           in     varchar2
               ,p_filename            in     varchar2
               ,p_remotepath          in     varchar2
               ,p_username            in     varchar2
               ,p_password            in     varchar2
               ,p_hostname            in     varchar2
               ,v_status                 out varchar2
               ,v_error_message          out varchar2
               ,n_bytes_transmitted      out number
               ,d_trans_start            out date
               ,d_trans_end              out date
               ,p_port                in     pls_integer default 21
               ,p_filetype            in     varchar2 := 'ASCII'
               ,p_mainframe_ftp       in     boolean default false
               ,p_mainframe_cmd       in     varchar2 default null)
    return boolean
  is
    c_process        constant varchar2 (100) := 'hum_ftp_interface.GET';
    t_files                   t_ftp_rec;
    v_username                varchar2 (30) := p_username;
    v_password                varchar2 (50) := p_password;
    v_hostname                varchar2 (100) := p_hostname;
    n_port                    pls_integer := p_port;
    v_err_msg                 varchar2 (1000);
    b_ftp                     boolean;
    err_mf_cmd_missing        exception;
    err_mf_cmd_mf_ftp_false   exception;
  -- MF cmd present but identified as not a MF ftp job
  begin
    v_operation_mode            := 'FILE';

    if     p_mainframe_ftp
       and p_mainframe_cmd is null
    then
      raise err_mf_cmd_missing;
    elsif     p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      mainframe_connection   := true;
      mainframe_cmd          := p_mainframe_cmd;
    elsif     not p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      raise err_mf_cmd_mf_ftp_false;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

    t_files (1).localpath       := p_localpath;
    t_files (1).filename        := p_filename;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := p_filetype;
    t_files (1).transfer_mode   := 'GET';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    if b_ftp = false
    then
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when err_mf_cmd_missing
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Missing Mainframe Command Parameter. i.e. SITE command';
      return false;
    when err_mf_cmd_mf_ftp_false
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Mainframe Command Parameter present, but not a Mainframe FTP.';
      return false;
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end get;

  /*****************************************************************************
  **  Convenience function for single-file DELETE
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function remove (p_localpath              in     varchar2
                  ,p_filename               in     varchar2
                  ,p_remotepath             in     varchar2
                  ,p_username               in     varchar2
                  ,p_password               in     varchar2
                  ,p_hostname               in     varchar2
                  ,v_status                    out varchar2
                  ,v_error_message             out varchar2
                  ,n_bytes_transmitted         out number
                  ,d_trans_start               out date
                  ,d_trans_end                 out date
                  ,p_port                   in     pls_integer default 21
                  ,p_filetype               in     varchar2 := 'BINARY'
                  ,p_mainframe_connection   in     boolean default false)
    return boolean
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.REMOVE';
    t_files              t_ftp_rec;
    v_username           varchar2 (30) := p_username;
    v_password           varchar2 (50) := p_password;
    v_hostname           varchar2 (100) := p_hostname;
    n_port               pls_integer := p_port;
    v_err_msg            varchar2 (1000);
    b_ftp                boolean;
  begin
    v_operation_mode            := 'FILE';

    if p_mainframe_connection
    then
      mainframe_connection   := true;
      mainframe_cmd          := null;
    end if;

    t_files (1).localpath       := p_localpath;
    t_files (1).filename        := p_filename;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := p_filetype;
    t_files (1).transfer_mode   := 'DELE';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    if b_ftp = false
    then
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end remove;

  /*****************************************************************************
  **  Convenience function for single-file RENAME
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function rename (p_localpath              in     varchar2
                  ,p_filename               in     varchar2
                  ,p_remotepath             in     varchar2
                  ,p_username               in     varchar2
                  ,p_password               in     varchar2
                  ,p_hostname               in     varchar2
                  ,v_status                    out varchar2
                  ,v_error_message             out varchar2
                  ,n_bytes_transmitted         out number
                  ,d_trans_start               out date
                  ,d_trans_end                 out date
                  ,p_port                   in     pls_integer default 21
                  ,p_filetype               in     varchar2 := 'BINARY'
                  ,p_mainframe_connection   in     boolean default false)
    return boolean
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.RENAME';
    t_files              t_ftp_rec;
    v_username           varchar2 (30) := p_username;
    v_password           varchar2 (50) := p_password;
    v_hostname           varchar2 (100) := p_hostname;
    n_port               pls_integer := p_port;
    v_err_msg            varchar2 (1000);
    b_ftp                boolean;
  begin
    v_operation_mode            := 'FILE';

    if p_mainframe_connection
    then
      mainframe_connection   := true;
      mainframe_cmd          := null;
    end if;

    t_files (1).localpath       := p_localpath;
    t_files (1).filename        := p_filename;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := p_filetype;
    t_files (1).transfer_mode   := 'RNFR';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    if b_ftp = false
    then
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end rename;

  /*****************************************************************************
  **  This is used to verify that a server is up or down or even existent
  **  for that matter
  **
  *****************************************************************************/
  function verify_server (p_remotepath             in     varchar2
                         ,p_username               in     varchar2
                         ,p_password               in     varchar2
                         ,p_hostname               in     varchar2
                         ,v_status                    out varchar2
                         ,v_error_message             out varchar2
                         ,p_port                   in     pls_integer default 21
                         ,p_filetype               in     varchar2 := 'BINARY'
                         ,p_mainframe_connection   in     boolean default false)
    return boolean
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.VERIFY_SERVER';
    v_username           varchar2 (30) := p_username;
    v_password           varchar2 (30) := p_password;
    v_hostname           varchar2 (30) := p_hostname;
    v_remotepath         varchar2 (255) := p_remotepath;
    n_port               pls_integer := p_port;
    u_ctrl_connection    utl_tcp.connection;
    n_byte_count         pls_integer;
    n_first_index        number;
    v_msg                varchar2 (1000);
    v_reply              varchar2 (1000);
    v_pasv_host          varchar2 (20);
    n_pasv_port          number;
    l_step               varchar2 (1000);
  begin
    if p_mainframe_connection
    then
      mainframe_connection   := true;
      mainframe_cmd          := null;
    end if;

    --
    v_status            := 'SUCCESS';
    v_error_message     := 'Server connection is valid.';
    --Assume the overall transfer will succeed
    /** Attempt to connect to the host machine **/
    u_ctrl_con          :=
      login (a_site_in     => p_hostname
            ,a_port_in     => p_port
            ,a_user_name   => v_username
            ,a_user_pass   => v_password);
    --
    u_ctrl_connection   := u_ctrl_con;

    --
    /** We should be logged in, time to verify remote path **/
    --
    if    v_remotepath is null
       or v_remotepath = '.'
    then
      --
      -- Looks like no path is being declared. So let us stay where we are
      -- No CWD command required.
      --
      l_step   := 'REMOTE PATH IS NULL OR CURRENT PATH';
      null;
    elsif     v_remotepath is not null
          and v_remotepath <> '.'
    then
      l_step      :=
           'PERFORMING CWD COMMAND FOR '
        || v_remotepath;

      --
      --
      if mainframe_connection
      then
        --
        -- Mainframe does not use unix path syntax.
        -- We will convert / (fwd slash) to a . (period)
        -- and also trim leading fwd slash
        --
        -- If already periods, then this really won't do anything
        --
        v_remotepath      :=
          ltrim (v_remotepath
                ,'/');
        v_remotepath      :=
          replace (v_remotepath
                  ,'/'
                  ,'.');
        --
        /** Change to the remotepath directory **/
        n_byte_count      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'CWD '
                              || ''''
                              || v_remotepath
                              || '''');
      else
        /** Change to the remotepath directory **/
        n_byte_count      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'CWD '
                              || v_remotepath);
      end if;

      --
      if validate_reply (u_ctrl_con
                        ,cwd_code
                        ,v_reply) = false
      then
        --                      print_output ( 'user_code= ' || user_code );
        --                      print_output ( 'v_reply= ' || v_reply );
        raise ctrl_exception;
      end if;
    end if;

    --
    --
    l_step              := 'SEND PASV COMMAND';
    --
    --
    /** Get a Passive connection to use for data transfer **/
    n_byte_count        :=
      utl_tcp.write_line (u_ctrl_connection
                         ,'PASV');

    --
    if validate_reply (u_ctrl_connection
                      ,pasv_code
                      ,v_reply) = false
    then
      raise ctrl_exception;
    end if;

    l_step              := 'CREATE PASV COMMAND';
    --
    create_pasv (substr (v_reply
                        ,  instr (v_reply
                                 ,'('
                                 ,1
                                 ,1)
                         + 1
                        ,  instr (v_reply
                                 ,')'
                                 ,1
                                 ,1)
                         - instr (v_reply
                                 ,'('
                                 ,1
                                 ,1)
                         - 1)
                ,v_pasv_host
                ,n_pasv_port);
    --
    l_step              := 'SEND QUIT COMMAND';
    /** Send QUIT command **/
    n_byte_count        :=
      utl_tcp.write_line (u_ctrl_connection
                         ,'QUIT');
    /** Don't need to VALIDATE QUIT, just close the connection **/
    l_step              := 'CLOSING CONNECTION';
    utl_tcp.close_connection (u_ctrl_connection);
    return true;
  exception
    when ctrl_exception
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || v_reply
        || ' :: '
        || l_step;
      utl_tcp.close_all_connections;
      return false;
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm
        || ' :: '
        || l_step;
      utl_tcp.close_all_connections;
      return false;
  end verify_server;

  /*****************************************************************************
  **  Convenience function for dir to local filename
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function dir (p_localpath           in     varchar2
               ,p_filename_filter     in     varchar2 default null
               ,p_dir_filename        in     varchar2 default 'remotedir_list.txt'
               ,p_remotepath          in     varchar2
               ,p_username            in     varchar2
               ,p_password            in     varchar2
               ,p_hostname            in     varchar2
               ,v_status                 out varchar2
               ,v_error_message          out varchar2
               ,n_bytes_transmitted      out number
               ,d_trans_start            out date
               ,d_trans_end              out date
               ,p_port                in     pls_integer default 21
               ,p_filetype            in     varchar2 := 'ASCII'
               ,p_mainframe_ftp       in     boolean default false)
    return boolean
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.DIR';
    t_files              t_ftp_rec;
    v_username           varchar2 (30) := p_username;
    v_password           varchar2 (50) := p_password;
    v_hostname           varchar2 (100) := p_hostname;
    n_port               pls_integer := p_port;
    v_err_msg            varchar2 (1000);
    b_ftp                boolean;
    l_filename_filter    varchar2 (1000);
    l_dir_filename       varchar2 (1000);
    l_step               varchar2 (1000);
  begin
    v_operation_mode            := 'FILE';

    if p_mainframe_ftp
    then
      mainframe_connection   := true;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

    --
    if ltrim (rtrim (p_dir_filename)) is null
    then
      l_dir_filename   := 'remotedir_list.txt';
    else
      l_dir_filename   := ltrim (rtrim (p_dir_filename));
    end if;

    --
    if ltrim (rtrim (p_filename_filter)) is null
    then
      l_filename_filter   := '*';
    else
      l_filename_filter   := ltrim (rtrim (p_filename_filter));
    end if;

    --
    if nvl (upper (l_ftp_debug), 'N') = 'Y'
    then
      begin
        l_step   := 'REMOVE, IF EXISTING, PREVIOUS REMOTE FILE LISTING';
        utl_file.fremove (location   => p_localpath
                         ,filename   => l_dir_filename);
      exception
        when utl_file.invalid_path
        then
          l_step   := 'UTL_FILE.INVALID_PATH';
        when utl_file.read_error
        then
          l_step   := 'UTL_FILE.READ_ERROR';
        when utl_file.write_error
        then
          l_step   := 'UTL_FILE.WRITE_ERROR';
        when utl_file.invalid_mode
        then
          l_step   := 'UTL_FILE.INVALID_MODE';
        when utl_file.invalid_filehandle
        then
          l_step   := 'UTL_FILE.INVALID_FILEHANDLE';
        when utl_file.invalid_operation
        then
          l_step   := 'UTL_FILE.INVALID_OPERATION';
        when utl_file.internal_error
        then
          l_step   := 'UTL_FILE.INTERNAL_ERROR';
        when utl_file.invalid_maxlinesize
        then
          l_step   := 'UTL_FILE.INVALID_MAXLINESIZE';
        when value_error
        then
          l_step   := 'UTL_FILE.VALUE_ERROR';
        when others
        then
          l_step      :=
               sqlcode
            || ' - '
            || sqlerrm;
      end;

      print_output (   'FTP_DEBUG :: INFO :: '
                    || l_step);
    end if;

    --
    t_files (1).localpath       := p_localpath;
    t_files (1).filename        :=
         l_dir_filename
      || '#'
      || l_filename_filter;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := p_filetype;
    t_files (1).transfer_mode   := 'LIST';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    --
    if b_ftp = false
    then
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end dir;

  /*****************************************************************************
  **  Convenience function for dir to local filename
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function ls (p_localpath           in     varchar2
              ,p_filename_filter     in     varchar2 default null
              ,p_dir_filename        in     varchar2 default 'remotedir_list.txt'
              ,p_remotepath          in     varchar2
              ,p_username            in     varchar2
              ,p_password            in     varchar2
              ,p_hostname            in     varchar2
              ,v_status                 out varchar2
              ,v_error_message          out varchar2
              ,n_bytes_transmitted      out number
              ,d_trans_start            out date
              ,d_trans_end              out date
              ,p_port                in     pls_integer default 21
              ,p_filetype            in     varchar2 := 'ASCII'
              ,p_mainframe_ftp       in     boolean default false)
    return boolean
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.LS';
    t_files              t_ftp_rec;
    v_username           varchar2 (30) := p_username;
    v_password           varchar2 (50) := p_password;
    v_hostname           varchar2 (100) := p_hostname;
    n_port               pls_integer := p_port;
    v_err_msg            varchar2 (1000);
    b_ftp                boolean;
    l_filename_filter    varchar2 (1000);
    l_dir_filename       varchar2 (1000);
    l_step               varchar2 (1000);
  begin
    v_operation_mode            := 'FILE';

    if p_mainframe_ftp
    then
      mainframe_connection   := true;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

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

    --
    if nvl (upper (l_ftp_debug), 'N') = 'Y'
    then
      begin
        l_step   := 'REMOVE, IF EXISTING, PREVIOUS REMOTE FILE LISTING';
        utl_file.fremove (location   => p_localpath
                         ,filename   => l_dir_filename);
      exception
        when utl_file.invalid_path
        then
          l_step   := 'UTL_FILE.INVALID_PATH';
        when utl_file.read_error
        then
          l_step   := 'UTL_FILE.READ_ERROR';
        when utl_file.write_error
        then
          l_step   := 'UTL_FILE.WRITE_ERROR';
        when utl_file.invalid_mode
        then
          l_step   := 'UTL_FILE.INVALID_MODE';
        when utl_file.invalid_filehandle
        then
          l_step   := 'UTL_FILE.INVALID_FILEHANDLE';
        when utl_file.invalid_operation
        then
          l_step   := 'UTL_FILE.INVALID_OPERATION';
        when utl_file.internal_error
        then
          l_step   := 'UTL_FILE.INTERNAL_ERROR';
        when utl_file.invalid_maxlinesize
        then
          l_step   := 'UTL_FILE.INVALID_MAXLINESIZE';
        when value_error
        then
          l_step   := 'UTL_FILE.VALUE_ERROR';
        when others
        then
          l_step      :=
               sqlcode
            || ' - '
            || sqlerrm;
      end;

      print_output (   'FTP_DEBUG :: INFO :: '
                    || l_step);
    end if;

    --
    t_files (1).localpath       := p_localpath;
    t_files (1).filename        :=
         l_dir_filename
      || '#'
      || l_filename_filter;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := p_filetype;
    t_files (1).transfer_mode   := 'NLST';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    if b_ftp = false
    then
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end ls;

  --
  -- These are for future development
  --

  /*****************************************************************************
  **  Convenience function for single-file PUT
  **  Pass CLOB for data to transfer.
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function put_clob (p_filename            in     varchar2
                    ,p_clob                in     clob
                    ,p_remotepath          in     varchar2
                    ,p_username            in     varchar2
                    ,p_password            in     varchar2
                    ,p_hostname            in     varchar2
                    ,v_status                 out varchar2
                    ,v_error_message          out varchar2
                    ,n_bytes_transmitted      out number
                    ,d_trans_start            out date
                    ,d_trans_end              out date
                    ,p_port                in     pls_integer default 21
                    ,p_mainframe_ftp       in     boolean default false
                    ,p_mainframe_cmd       in     varchar2 default null)
    return boolean
  is
    c_process        constant varchar2 (100) := 'hum_ftp_interface.PUT_CLOB';
    t_files                   t_ftp_rec;
    v_username                varchar2 (30) := p_username;
    v_password                varchar2 (50) := p_password;
    v_hostname                varchar2 (100) := p_hostname;
    n_port                    pls_integer := p_port;
    v_err_msg                 varchar2 (1000);
    b_ftp                     boolean;
    err_mf_cmd_missing        exception;
    err_mf_cmd_mf_ftp_false   exception;
  -- MF cmd present but identified as not a MF ftp job
  begin
    --
    -- Set our operation mode to LOB since we will uploading a
    -- LOB that was passed as a parameter
    --
    v_operation_mode            := 'LOB';
    --
    -- Store our LOB parm into our global spec variable
    -- We did this to minimize modification to the existing
    -- code to ensure backwards compatibility
    --
    g_data_c                    := p_clob;

    if     p_mainframe_ftp
       and p_mainframe_cmd is null
    then
      raise err_mf_cmd_missing;
    elsif     p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      mainframe_connection   := true;
      mainframe_cmd          := p_mainframe_cmd;
    elsif     not p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      raise err_mf_cmd_mf_ftp_false;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

    --
    -- We have defined our LOB type
    -- in our localpath variable since
    -- we will not be writing out to the filesystem
    -- this value is used within the process
    -- as a flag indicator along with
    -- operation_mode and filetype to determine
    -- how request should be handled
    --
    t_files (1).localpath       := 'CLOB';
    t_files (1).filename        := p_filename;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := 'ASCII';
    t_files (1).transfer_mode   := 'PUT';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    if b_ftp = false
    then
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when err_mf_cmd_missing
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Missing Mainframe Command Parameter. i.e. SITE command';
      return false;
    when err_mf_cmd_mf_ftp_false
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Mainframe Command Parameter present, but not a Mainframe FTP.';
      return false;
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end put_clob;

  /*****************************************************************************
  **  Convenience function for single-file GET
  **  Pass CLOB for data to transfer.
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function get_clob (p_filename            in     varchar2
                    ,p_clob                   out clob
                    ,p_remotepath          in     varchar2
                    ,p_username            in     varchar2
                    ,p_password            in     varchar2
                    ,p_hostname            in     varchar2
                    ,v_status                 out varchar2
                    ,v_error_message          out varchar2
                    ,n_bytes_transmitted      out number
                    ,d_trans_start            out date
                    ,d_trans_end              out date
                    ,p_port                in     pls_integer default 21
                    ,p_mainframe_ftp       in     boolean default false
                    ,p_mainframe_cmd       in     varchar2 default null)
    return boolean
  is
    c_process        constant varchar2 (100) := 'hum_ftp_interface.GET_CLOB';
    t_files                   t_ftp_rec;
    v_username                varchar2 (30) := p_username;
    v_password                varchar2 (50) := p_password;
    v_hostname                varchar2 (100) := p_hostname;
    n_port                    pls_integer := p_port;
    v_err_msg                 varchar2 (1000);
    b_ftp                     boolean;
    err_mf_cmd_missing        exception;
    err_mf_cmd_mf_ftp_false   exception;
  -- MF cmd present but identified as not a MF ftp job
  begin
    --
    -- Set our operation mode to LOB since we will uploading a
    -- LOB that was passed as a parameter
    --
    v_operation_mode            := 'LOB';

    if     p_mainframe_ftp
       and p_mainframe_cmd is null
    then
      raise err_mf_cmd_missing;
    elsif     p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      mainframe_connection   := true;
      mainframe_cmd          := p_mainframe_cmd;
    elsif     not p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      raise err_mf_cmd_mf_ftp_false;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

    --
    -- We have defined our LOB type
    -- in our localpath variable since
    -- we will not be writing out to the filesystem
    -- this value is used within the process
    -- as a flag indicator along with
    -- operation_mode and filetype to determine
    -- how request should be handled
    --
    t_files (1).localpath       := 'CLOB';
    t_files (1).filename        := p_filename;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := 'ASCII';
    t_files (1).transfer_mode   := 'GET';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    --
    -- Store our LOB parm into our global spec variable
    -- We did this to minimize modification to the existing
    -- code to ensure backwards compatibility. We then
    -- pass this LOB value back to the calling process
    -- as an out parameter
    --
    if b_ftp = false
    then
      p_clob            := g_data_c;
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      p_clob                := g_data_c;
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when err_mf_cmd_missing
    then
      p_clob     := g_data_c;
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Missing Mainframe Command Parameter. i.e. SITE command';
      return false;
    when err_mf_cmd_mf_ftp_false
    then
      p_clob     := g_data_c;
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Mainframe Command Parameter present, but not a Mainframe FTP.';
      return false;
    when others
    then
      p_clob     := g_data_c;
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end get_clob;

  /*****************************************************************************
  **  Convenience function for single-file PUT
  **  Pass BLOB for data to transfer.
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function put_blob (p_filename            in     varchar2
                    ,p_blob                in     blob
                    ,p_remotepath          in     varchar2
                    ,p_username            in     varchar2
                    ,p_password            in     varchar2
                    ,p_hostname            in     varchar2
                    ,v_status                 out varchar2
                    ,v_error_message          out varchar2
                    ,n_bytes_transmitted      out number
                    ,d_trans_start            out date
                    ,d_trans_end              out date
                    ,p_port                in     pls_integer default 21
                    ,p_mainframe_ftp       in     boolean default false
                    ,p_mainframe_cmd       in     varchar2 default null)
    return boolean
  is
    c_process        constant varchar2 (100) := 'hum_ftp_interface.PUT_BLOB';
    t_files                   t_ftp_rec;
    v_username                varchar2 (30) := p_username;
    v_password                varchar2 (50) := p_password;
    v_hostname                varchar2 (100) := p_hostname;
    n_port                    pls_integer := p_port;
    v_err_msg                 varchar2 (1000);
    b_ftp                     boolean;
    err_mf_cmd_missing        exception;
    err_mf_cmd_mf_ftp_false   exception;
  -- MF cmd present but identified as not a MF ftp job
  begin
    --
    -- Set our operation mode to LOB since we will uploading a
    -- LOB that was passed as a parameter
    --
    v_operation_mode            := 'LOB';
    --
    -- Store our LOB parm into our global spec variable
    -- We did this to minimize modification to the existing
    -- code to ensure backwards compatibility
    --
    g_data_b                    := p_blob;

    if     p_mainframe_ftp
       and p_mainframe_cmd is null
    then
      raise err_mf_cmd_missing;
    elsif     p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      mainframe_connection   := true;
      mainframe_cmd          := p_mainframe_cmd;
    elsif     not p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      raise err_mf_cmd_mf_ftp_false;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

    --
    -- We have defined our LOB type
    -- in our localpath variable since
    -- we will not be writing out to the filesystem
    -- this value is used within the process
    -- as a flag indicator along with
    -- operation_mode and filetype to determine
    -- how request should be handled
    --
    t_files (1).localpath       := 'BLOB';
    t_files (1).filename        := p_filename;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := 'BINARY';
    t_files (1).transfer_mode   := 'PUT';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    if b_ftp = false
    then
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when err_mf_cmd_missing
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Missing Mainframe Command Parameter. i.e. SITE command';
      return false;
    when err_mf_cmd_mf_ftp_false
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Mainframe Command Parameter present, but not a Mainframe FTP.';
      return false;
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end put_blob;

  /*****************************************************************************
  **  Convenience function for single-file GET
  **  Pass BLOB for data to transfer.
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function get_blob (p_filename            in     varchar2
                    ,p_blob                   out blob
                    ,p_remotepath          in     varchar2
                    ,p_username            in     varchar2
                    ,p_password            in     varchar2
                    ,p_hostname            in     varchar2
                    ,v_status                 out varchar2
                    ,v_error_message          out varchar2
                    ,n_bytes_transmitted      out number
                    ,d_trans_start            out date
                    ,d_trans_end              out date
                    ,p_port                in     pls_integer default 21
                    ,p_mainframe_ftp       in     boolean default false
                    ,p_mainframe_cmd       in     varchar2 default null)
    return boolean
  is
    c_process        constant varchar2 (100) := 'hum_ftp_interface.GET_BLOB';
    t_files                   t_ftp_rec;
    v_username                varchar2 (30) := p_username;
    v_password                varchar2 (50) := p_password;
    v_hostname                varchar2 (100) := p_hostname;
    n_port                    pls_integer := p_port;
    v_err_msg                 varchar2 (1000);
    b_ftp                     boolean;
    err_mf_cmd_missing        exception;
    err_mf_cmd_mf_ftp_false   exception;
  -- MF cmd present but identified as not a MF ftp job
  begin
    --
    -- Set our operation mode to LOB since we will uploading a
    -- LOB that was passed as a parameter
    --
    v_operation_mode            := 'LOB';

    if     p_mainframe_ftp
       and p_mainframe_cmd is null
    then
      raise err_mf_cmd_missing;
    elsif     p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      mainframe_connection   := true;
      mainframe_cmd          := p_mainframe_cmd;
    elsif     not p_mainframe_ftp
          and p_mainframe_cmd is not null
    then
      raise err_mf_cmd_mf_ftp_false;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

    --
    -- We have defined our LOB type
    -- in our localpath variable since
    -- we will not be writing out to the filesystem
    -- this value is used within the process
    -- as a flag indicator along with
    -- operation_mode and filetype to determine
    -- how request should be handled
    --
    t_files (1).localpath       := 'BLOB';
    t_files (1).filename        := p_filename;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := 'BINARY';
    t_files (1).transfer_mode   := 'GET';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    --
    -- Store our LOB parm into our global spec variable
    -- We did this to minimize modification to the existing
    -- code to ensure backwards compatibility. We then
    -- pass this LOB value back to the calling process
    -- as an out parameter
    --
    if b_ftp = false
    then
      p_blob            := g_data_b;
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      p_blob                := g_data_b;
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when err_mf_cmd_missing
    then
      p_blob     := g_data_b;
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Missing Mainframe Command Parameter. i.e. SITE command';
      return false;
    when err_mf_cmd_mf_ftp_false
    then
      p_blob     := g_data_b;
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || 'Mainframe Command Parameter present, but not a Mainframe FTP.';
      return false;
    when others
    then
      p_blob     := g_data_b;
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end get_blob;

  /*****************************************************************************
**  Convenience function for dir to local filename
**  Formats file information for ftp_files_stage function and calls it.
**
*****************************************************************************/
  function dir_clob (p_filename_filter     in     varchar2 default null
                    ,p_clob                   out clob
                    ,p_remotepath          in     varchar2
                    ,p_username            in     varchar2
                    ,p_password            in     varchar2
                    ,p_hostname            in     varchar2
                    ,v_status                 out varchar2
                    ,v_error_message          out varchar2
                    ,n_bytes_transmitted      out number
                    ,d_trans_start            out date
                    ,d_trans_end              out date
                    ,p_port                in     pls_integer default 21
                    ,p_mainframe_ftp       in     boolean default false)
    return boolean
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.DIR_CLOB';
    t_files              t_ftp_rec;
    v_username           varchar2 (30) := p_username;
    v_password           varchar2 (50) := p_password;
    v_hostname           varchar2 (100) := p_hostname;
    n_port               pls_integer := p_port;
    v_err_msg            varchar2 (1000);
    b_ftp                boolean;
    l_filename_filter    varchar2 (1000);
    l_dir_filename       varchar2 (1000);
  begin
    --
    -- Set our operation mode to LOB since we will uploading a
    -- LOB that was passed as a parameter
    --
    v_operation_mode            := 'LOB';

    if p_mainframe_ftp
    then
      mainframe_connection   := true;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

    --
    l_dir_filename              := 'remotedir_list.txt';

    --
    if ltrim (rtrim (p_filename_filter)) is null
    then
      l_filename_filter   := '*';
    else
      l_filename_filter   := ltrim (rtrim (p_filename_filter));
    end if;

    --
    -- We have defined our LOB type
    -- in our localpath variable since
    -- we will not be writing out to the filesystem
    -- this value is used within the process
    -- as a flag indicator along with
    -- operation_mode and filetype to determine
    -- how request should be handled
    --
    t_files (1).localpath       := 'CLOB';
    t_files (1).filename        :=
         l_dir_filename
      || '#'
      || l_filename_filter;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := 'ASCII';
    t_files (1).transfer_mode   := 'LIST';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    --
    -- Store our LOB parm into our global spec variable
    -- We did this to minimize modification to the existing
    -- code to ensure backwards compatibility. We then
    -- pass this LOB value back to the calling process
    -- as an out parameter
    --
    if b_ftp = false
    then
      p_clob            := g_data_c;
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      p_clob                := g_data_c;
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when others
    then
      p_clob     := g_data_c;
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end dir_clob;

  /*****************************************************************************
  **  Convenience function for dir to local filename
  **  Formats file information for ftp_files_stage function and calls it.
  **
  *****************************************************************************/
  function ls_clob (p_filename_filter     in     varchar2 default null
                   ,p_clob                   out clob
                   ,p_remotepath          in     varchar2
                   ,p_username            in     varchar2
                   ,p_password            in     varchar2
                   ,p_hostname            in     varchar2
                   ,v_status                 out varchar2
                   ,v_error_message          out varchar2
                   ,n_bytes_transmitted      out number
                   ,d_trans_start            out date
                   ,d_trans_end              out date
                   ,p_port                in     pls_integer default 21
                   ,p_filetype            in     varchar2 := 'ASCII'
                   ,p_mainframe_ftp       in     boolean default false)
    return boolean
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.LS_CLOB';
    t_files              t_ftp_rec;
    v_username           varchar2 (30) := p_username;
    v_password           varchar2 (50) := p_password;
    v_hostname           varchar2 (100) := p_hostname;
    n_port               pls_integer := p_port;
    v_err_msg            varchar2 (1000);
    b_ftp                boolean;
    l_filename_filter    varchar2 (1000);
    l_dir_filename       varchar2 (1000);
  begin
    --
    -- Set our operation mode to LOB since we will uploading a
    -- LOB that was passed as a parameter
    --
    v_operation_mode            := 'LOB';

    if p_mainframe_ftp
    then
      mainframe_connection   := true;
    elsif not p_mainframe_ftp
    then
      mainframe_connection   := false;
      mainframe_cmd          := null;
    end if;

    l_dir_filename              := 'remotedir_list.txt';

    if ltrim (rtrim (p_filename_filter)) is null
    then
      l_filename_filter   := '*';
    else
      l_filename_filter   := ltrim (rtrim (p_filename_filter));
    end if;

    --
    -- We have defined our LOB type
    -- in our localpath variable since
    -- we will not be writing out to the filesystem
    -- this value is used within the process
    -- as a flag indicator along with
    -- operation_mode and filetype to determine
    -- how request should be handled
    --
    t_files (1).localpath       := 'CLOB';
    t_files (1).filename        :=
         l_dir_filename
      || '#'
      || l_filename_filter;
    t_files (1).remotepath      := p_remotepath;
    t_files (1).filetype        := 'ASCII';
    t_files (1).transfer_mode   := 'NLST';
    b_ftp                       :=
      ftp_files_stage (v_err_msg
                      ,t_files
                      ,v_username
                      ,v_password
                      ,v_hostname
                      ,n_port);

    --
    -- Store our LOB parm into our global spec variable
    -- We did this to minimize modification to the existing
    -- code to ensure backwards compatibility. We then
    -- pass this LOB value back to the calling process
    -- as an out parameter
    --
    if b_ftp = false
    then
      p_clob            := g_data_c;
      v_status          := 'ERROR';
      v_error_message   := v_err_msg;
      return false;
    elsif b_ftp = true
    then
      p_clob                := g_data_c;
      v_status              := t_files (1).status;
      v_error_message       := t_files (1).error_message;
      n_bytes_transmitted   := t_files (1).bytes_transmitted;
      d_trans_start         := t_files (1).trans_start;
      d_trans_end           := t_files (1).trans_end;
      return true;
    end if;
  exception
    when others
    then
      p_clob     := g_data_c;
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm;
      return false;
  end ls_clob;

  /*****************************************************************************
  **  This is used to create a directory on a remote server
  **
  *****************************************************************************/
  function mkdir_remote (p_remotepath             in     varchar2
                        ,p_target_dir             in     varchar2
                        ,p_username               in     varchar2
                        ,p_password               in     varchar2
                        ,p_hostname               in     varchar2
                        ,v_status                    out varchar2
                        ,v_error_message             out varchar2
                        ,p_port                   in     pls_integer default 21
                        ,p_mainframe_connection   in     boolean default false)
    return boolean
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.MKDIR_REMOTE';
    v_username           varchar2 (30) := p_username;
    v_password           varchar2 (30) := p_password;
    v_hostname           varchar2 (30) := p_hostname;
    v_remotepath         varchar2 (255) := p_remotepath;
    n_port               pls_integer := p_port;
    u_ctrl_connection    utl_tcp.connection;
    n_byte_count         pls_integer;
    n_first_index        number;
    v_msg                varchar2 (1000);
    v_reply              varchar2 (1000);
    v_pasv_host          varchar2 (20);
    n_pasv_port          number;
    l_step               varchar2 (1000);
  begin
    if p_mainframe_connection
    then
      mainframe_connection   := true;
      mainframe_cmd          := null;
    end if;

    --
    v_status            := 'SUCCESS';
    v_error_message     := 'Server connection is valid.';
    --Assume the overall transfer will succeed
    /** Attempt to connect to the host machine **/
    u_ctrl_con          :=
      login (a_site_in     => p_hostname
            ,a_port_in     => p_port
            ,a_user_name   => v_username
            ,a_user_pass   => v_password);
    --
    u_ctrl_connection   := u_ctrl_con;

    --
    /** We should be logged in, time to verify remote path **/
    --
    if    v_remotepath is null
       or v_remotepath = '.'
    then
      --
      -- Looks like no path is being declared. So let us stay where we are
      -- No CWD command required.
      --
      l_step   := 'REMOTE PATH IS NULL OR CURRENT PATH';
      null;
    elsif     v_remotepath is not null
          and v_remotepath <> '.'
    then
      l_step      :=
           'PERFORMING CWD COMMAND FOR '
        || v_remotepath;

      --
      --
      if mainframe_connection
      then
        --
        -- Mainframe does not use unix path syntax.
        -- We will convert / (fwd slash) to a . (period)
        -- and also trim leading fwd slash
        --
        -- If already periods, then this really won't do anything
        --
        v_remotepath      :=
          ltrim (v_remotepath
                ,'/');
        v_remotepath      :=
          replace (v_remotepath
                  ,'/'
                  ,'.');
        --
        /** Change to the remotepath directory **/
        n_byte_count      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'CWD '
                              || ''''
                              || v_remotepath
                              || '''');
      else
        /** Change to the remotepath directory **/
        n_byte_count      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'CWD '
                              || v_remotepath);
      end if;

      --
      if validate_reply (u_ctrl_con
                        ,cwd_code
                        ,v_reply) = false
      then
        --                      print_output ( 'user_code= ' || user_code );
        --                      print_output ( 'v_reply= ' || v_reply );
        raise ctrl_exception;
      end if;
    end if;

    --
    if    v_remotepath is null
       or v_remotepath = '.'
    then
      l_step      :=
           'PERFORMING MKD COMMAND FOR '
        || p_target_dir
        || ' in current path';
    else
      l_step      :=
           'PERFORMING MKD COMMAND FOR '
        || p_target_dir
        || ' in '
        || v_remotepath;
    end if;

    --
    -- No separate command set for mainframe because we don't need quotes around the
    -- target directory to be created.
    --
    n_byte_count        :=
      utl_tcp.write_line (u_ctrl_con
                         ,   'MKD '
                          || p_target_dir);

    --
    if validate_reply (u_ctrl_con
                      ,mkd_code
                      ,v_reply) = false
    then
      --                      print_output ( 'user_code= ' || user_code );
      --                      print_output ( 'v_reply= ' || v_reply );
      raise ctrl_exception;
    end if;

    --
    l_step              := 'SEND PASV COMMAND';
    --
    --
    /** Get a Passive connection to use for data transfer **/
    n_byte_count        :=
      utl_tcp.write_line (u_ctrl_connection
                         ,'PASV');

    --
    if validate_reply (u_ctrl_connection
                      ,pasv_code
                      ,v_reply) = false
    then
      raise ctrl_exception;
    end if;

    l_step              := 'CREATE PASV COMMAND';
    --
    create_pasv (substr (v_reply
                        ,  instr (v_reply
                                 ,'('
                                 ,1
                                 ,1)
                         + 1
                        ,  instr (v_reply
                                 ,')'
                                 ,1
                                 ,1)
                         - instr (v_reply
                                 ,'('
                                 ,1
                                 ,1)
                         - 1)
                ,v_pasv_host
                ,n_pasv_port);
    --

    --
    l_step              := 'SEND QUIT COMMAND';
    /** Send QUIT command **/
    n_byte_count        :=
      utl_tcp.write_line (u_ctrl_connection
                         ,'QUIT');
    /** Don't need to VALIDATE QUIT, just close the connection **/
    l_step              := 'CLOSING CONNECTION';
    utl_tcp.close_connection (u_ctrl_connection);
    return true;
  exception
    when ctrl_exception
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || v_reply
        || ' :: '
        || l_step;
      utl_tcp.close_all_connections;
      return false;
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm
        || ' :: '
        || l_step;
      utl_tcp.close_all_connections;
      return false;
  end mkdir_remote;

  /*****************************************************************************
  **  This is used to remove a directory on a remote server
  **
  *****************************************************************************/
  function rmdir_remote (p_remotepath             in     varchar2
                        ,p_target_dir             in     varchar2
                        ,p_username               in     varchar2
                        ,p_password               in     varchar2
                        ,p_hostname               in     varchar2
                        ,v_status                    out varchar2
                        ,v_error_message             out varchar2
                        ,p_port                   in     pls_integer default 21
                        ,p_mainframe_connection   in     boolean default false)
    return boolean
  is
    c_process   constant varchar2 (100) := 'hum_ftp_interface.RMDIR_REMOTE';
    v_username           varchar2 (30) := p_username;
    v_password           varchar2 (30) := p_password;
    v_hostname           varchar2 (30) := p_hostname;
    v_remotepath         varchar2 (255) := p_remotepath;
    n_port               pls_integer := p_port;
    u_ctrl_connection    utl_tcp.connection;
    n_byte_count         pls_integer;
    n_first_index        number;
    v_msg                varchar2 (1000);
    v_reply              varchar2 (1000);
    v_pasv_host          varchar2 (20);
    n_pasv_port          number;
    l_step               varchar2 (1000);
  begin
    if p_mainframe_connection
    then
      mainframe_connection   := true;
      mainframe_cmd          := null;
    end if;

    --
    v_status            := 'SUCCESS';
    v_error_message     := 'Server connection is valid.';
    --Assume the overall transfer will succeed
    /** Attempt to connect to the host machine **/
    u_ctrl_con          :=
      login (a_site_in     => p_hostname
            ,a_port_in     => p_port
            ,a_user_name   => v_username
            ,a_user_pass   => v_password);
    --
    u_ctrl_connection   := u_ctrl_con;

    --
    /** We should be logged in, time to verify remote path **/
    --
    if    v_remotepath is null
       or v_remotepath = '.'
    then
      --
      -- Looks like no path is being declared. So let us stay where we are
      -- No CWD command required.
      --
      l_step   := 'REMOTE PATH IS NULL OR CURRENT PATH';
      null;
    elsif     v_remotepath is not null
          and v_remotepath <> '.'
    then
      l_step      :=
           'PERFORMING CWD COMMAND FOR '
        || v_remotepath;

      --
      --
      if mainframe_connection
      then
        --
        -- Mainframe does not use unix path syntax.
        -- We will convert / (fwd slash) to a . (period)
        -- and also trim leading fwd slash
        --
        -- If already periods, then this really won't do anything
        --
        v_remotepath      :=
          ltrim (v_remotepath
                ,'/');
        v_remotepath      :=
          replace (v_remotepath
                  ,'/'
                  ,'.');
        --
        /** Change to the remotepath directory **/
        n_byte_count      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'CWD '
                              || ''''
                              || v_remotepath
                              || '''');
      else
        /** Change to the remotepath directory **/
        n_byte_count      :=
          utl_tcp.write_line (u_ctrl_con
                             ,   'CWD '
                              || v_remotepath);
      end if;

      --
      if validate_reply (u_ctrl_con
                        ,cwd_code
                        ,v_reply) = false
      then
        --                      print_output ( 'user_code= ' || user_code );
        --                      print_output ( 'v_reply= ' || v_reply );
        raise ctrl_exception;
      end if;
    end if;

    --
    if    v_remotepath is null
       or v_remotepath = '.'
    then
      l_step      :=
           'PERFORMING RMD COMMAND FOR '
        || p_target_dir
        || ' in current path';
    else
      l_step      :=
           'PERFORMING RMD COMMAND FOR '
        || p_target_dir
        || ' in '
        || v_remotepath;
    end if;

    --
    -- No separate command set for mainframe because we don't need quotes around the
    -- target directory to be created.
    --
    n_byte_count        :=
      utl_tcp.write_line (u_ctrl_con
                         ,   'RMD '
                          || p_target_dir);

    --
    if validate_reply (u_ctrl_con
                      ,rmd_code
                      ,v_reply) = false
    then
      --                      print_output ( 'user_code= ' || user_code );
      --                      print_output ( 'v_reply= ' || v_reply );
      raise ctrl_exception;
    end if;

    --
    l_step              := 'SEND PASV COMMAND';
    --
    --
    /** Get a Passive connection to use for data transfer **/
    n_byte_count        :=
      utl_tcp.write_line (u_ctrl_connection
                         ,'PASV');

    --
    if validate_reply (u_ctrl_connection
                      ,pasv_code
                      ,v_reply) = false
    then
      raise ctrl_exception;
    end if;

    l_step              := 'CREATE PASV COMMAND';
    --
    create_pasv (substr (v_reply
                        ,  instr (v_reply
                                 ,'('
                                 ,1
                                 ,1)
                         + 1
                        ,  instr (v_reply
                                 ,')'
                                 ,1
                                 ,1)
                         - instr (v_reply
                                 ,'('
                                 ,1
                                 ,1)
                         - 1)
                ,v_pasv_host
                ,n_pasv_port);
    --
    l_step              := 'SEND QUIT COMMAND';
    /** Send QUIT command **/
    n_byte_count        :=
      utl_tcp.write_line (u_ctrl_connection
                         ,'QUIT');
    /** Don't need to VALIDATE QUIT, just close the connection **/
    l_step              := 'CLOSING CONNECTION';
    utl_tcp.close_connection (u_ctrl_connection);
    return true;
  exception
    when ctrl_exception
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || v_reply
        || ' :: '
        || l_step;
      utl_tcp.close_all_connections;
      return false;
    when others
    then
      v_status   := 'ERROR';
      v_error_message      :=
           c_process
        || ' :: '
        || sqlcode
        || ' - '
        || sqlerrm
        || ' :: '
        || l_step;
      utl_tcp.close_all_connections;
      return false;
  end rmdir_remote;
end afw_15_ftp_noyau_pkg;
/
