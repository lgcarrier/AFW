SET DEFINE OFF;
create or replace package afw_15_ftp_noyau_pkg
  authid current_user
as
    /*
     *
     *  PL/SQL FTP Client
     *
*  Composite code built from a variety of sources and research
     *  Barry Chase (bsc7080mqc@myoracleportal.com)
     *  Original Version March 2002
     *  Last Update Sep 2006
     *
     *  Current Version 3.1.2
     *
     *
     *  OVERVIEW
     *  --------------------
     *  This package uses the standard packages UTL_FILE and UTL_TCP, along with LOBs to perform
     *  client-side FTP functionality as defined in the World Wide Web Consortium's RFC 959
     *  document - http://www.w3.org/Protocols/rfc959/
     *
     *  Works with PASV ftp connections only
     *
     *  The procedures and functions in this package allow single file transfer using
     *  standard TCP/IP connections.
     *
     *  LIMITATIONS
     *  --------------------
     *   Requires Oracle DB 9.2.x.x due to usage of UTL_FILE.READ_RAW and WRITE_RAW
     *
     *  USAGE
     *  --------------------
     *  Four primary functions are available for FTP - PUT, GET, RENAME, REMOVE
     *
     *  The PUT and GET functions are included for convenience to FTP one file at a time.
     *  REMOVE function deletes a file from a remote server.
     *  RENAME function renames a file on a remote server.
     *  LS and DIR functions provide remote directory listings
*  RMDIR and MKDIR functions provide directory creation/removal
*  VERIFY_SERVER function allows you to verify server up/down status as well as validate path
     *
     *  CREDITS
     *  --------------------
     *
     *  This package was developed through an initial 2 years of research. I have reviewed
     *  any number of partial and complete ftp solutions. None of them had everything that
     *  I desired. None of them worked exactly as hoped. Improvements have continued since then.
     *
     *  Good example is where the solution provided by Timothy Hall, which answered the question
     *  on how to read files from the filesystem into a LOB. His method worked, however there
     *  were some limitations, but an excellent beginning.
     *
     *  With this knowledge, I was able to implement binary support in the package where it had not
     *  previously been available.
     *
     *  Added MVS mainframe support as well, which was a limitation at first.
     *
     *  However, I still feel its important to give proper credit to those who have made their work public.
     *
     * --
     *  FTP_INTERFACE package created by Russ Johnson. rjohnson@braunconsult.com
     *   http://www.braunconsult.com
     *
     *  Much of the PL/SQL code in this package was based on Java code written by
     *  Bruce Blackshaw of Enterprise Distributed Technologies Ltd.  None of that code
     *  was copied, but the objects and methods greatly helped my understanding of the
     *  FTP Client process.
     *
     *  http://www.enterprisedt.com
     * --
     *
     * --
     *  Technical article wrriten by Dmitry Bouzolin. dbouzolin@yahoo.com
     *     http://www.quest-pipelines.com/newsletter-v3/0302_C.htm
     * --
     *
     * --
     *  FTP package created by Timothy Hall
     *  http://www.oracle-base.com/articles/9i/FTPFromPLSQL9i.php
     * --
     *
     * --
     *  FTP command reference
     *   http://cr.yp.to/ftp.html
     * --
     *
     * --
     *  Ask Tom - Oracle Forum
     *   http://asktom.oracle.com

     * --
     * Paul James donated support for LIST and NLIST commands
     * http://daemoncoder.blogspot.com/
     * http://technology.amis.nl/blog/1247/implementing-an-ftp-server-in-plsql
     *
     * --
     * --
     *  The W3C's RFC 959 that describes the FTP process.
     *  http://www.w3c.org
     * --
     *
     *
  */
  --
  --
  --
  -- Declarations
  --
  -- FTP_DEBUG flag
  --
  -- Use this flag to produce some additional
  -- dbms_output to analyze issues with the operations
  -- or enhance with additional features
  --
  --
  l_ftp_debug                 char (1) := 'N';
  --
  -- /* UTL_TCP Connection */
  u_data_con                  utl_tcp.connection;
  u_ctrl_con                  utl_tcp.connection;
  /* LOB  placeholders */
  --
  -- We use these to hold LOBs when working with
  -- the get_clob/get_blob and put_clob/put_blob and
  -- dir_clob and ls_clob
  --
  g_data_b                    blob;
  g_data_c                    clob;
  /*
   * Timeout
   *
  */
  --
  -- This controls the tcp connection itself.
  -- if it goes beyond this setting, then the connection
  -- will be terminated. You will get an error
  -- that says something to the effect that there
  -- was a TNS Network error
  --
  tx_timeout                  pls_integer := 240;
  -- 240 seconds := 4 minutes
  /*
   * Mainframe
  */
  --
  -- Right now this code supports mainframe (MVS systems)
  -- the presumption is that the server codes should be
  -- valid for other mainframe O/S setups. You may have
  -- test validate this for your environment
  --
  mainframe_connection        boolean := false;
  mainframe_cmd               varchar2 (32000);
  /*
   * System Type :: Get type using SYST command
  */
  --
  -- This is used within our code to control
  -- how remote directory listings are listed
  -- specifically regarding the headers above the
  -- directory listings.
  --
  -- It is conceivable that you could leverage
  -- the system type for other purposes.
  --
  v_system_type               varchar2 (1000);
  v_system_type_reply         varchar2 (1000);
  /*
   * Operation Mode
  *
  * LOB or FILE
  *
  * LOB means we will be inputing/outputing information as CLOB/BLOB
  * as opposed to FILE which is working with the local filesystem directly
  *
  */
  v_operation_mode            varchar2 (10) := 'FILE';
  /**
   * Exceptions
   *
   */
  ctrl_exception              exception;
  data_exception              exception;
  /**
   * Constants - FTP valid response codes
   *
* These are pretty much the standard return codes
* for FTP servers. If you find that your return codes
* are different, then you will need to alter these codes
* accordingly.
*
   */
  --
  -- These define successful return codes
  -- if we receive codes different from these
  -- then we assume something did not go right
  --
  connect_code       constant pls_integer := 220;
  user_code          constant pls_integer := 331;
  login_code         constant pls_integer := 230;
  pwd_code           constant pls_integer := 257;
  pasv_code          constant pls_integer := 227;
  cwd_code           constant pls_integer := 250;
  mkd_code           constant pls_integer := 257;
  rmd_code           constant pls_integer := 250;
  --
  tsfr_start_code1   constant pls_integer := 125;
  tsfr_start_code2   constant pls_integer := 150;
  tsfr_end_code      constant pls_integer := 226;
  tsfr_end_code_mf   constant pls_integer := 250;
  -- Had to add this code (tsfr_end_code_mf) because our mainframe success code was 250 and not 226 --
  quit_code          constant pls_integer := 221;
  syst_code          constant pls_integer := 215;
  type_code          constant pls_integer := 200;
  delete_code        constant pls_integer := 250;
  rnfr_code          constant pls_integer := 350;
  rnto_code          constant pls_integer := 250;
  site_code          constant pls_integer := 200;
  noop_code          constant pls_integer := 200;

  --

  /**
   * FTP File record datatype
   *
   * Elements:
   * localpath - local path is defined as the DBA Directories defined
   *             exception to this is when we are performing CLOB/BLOB
   *             operations instead of filesystem operations.
   * filename - filename and extension for the file to be received or sent
   * remotepath - full directory name in which the local file will be sent or the
   *            remote file exists.  Should be in UNIX format regardless of FTP server - '/one/two/three'
   * filetype - 'ASCII' or 'BINARY'
   * transfer_mode - 'PUT', 'GET', etc.
   * status - status of the transfer.  'ERROR' or 'SUCCESS'
   * error_message - meaningful (hopefully) error message explaining the reason for failure
   * bytes_transmitted - how many bytes were sent/received
   * trans_start - date/time the transmission started
   * trans_end - date/time the transmission ended
   *
   */
  type r_ftp_rec is record
  (
    localpath           varchar2 (255)
   ,filename            varchar2 (255)
   ,remotepath          varchar2 (255)
   ,filetype            varchar2 (20)
   ,transfer_mode       varchar2 (30)
   ,status              varchar2 (40)
   ,error_message       varchar2 (255)
   ,bytes_transmitted   number
   ,trans_start         date
   ,trans_end           date
  );

  /**
   * FTP File Table - used to store many files for transfer
   *
   */
  type t_ftp_rec is table of r_ftp_rec
    index by binary_integer;

  /*Bruno-Pierre Privé*/
  type typ_fichr is record
  (
    type_fichr   varchar2 (1)
   ,nom          varchar2 (255)
   ,tail         number
   ,date_modfc   date
  );

  type type_tab_fichr is table of typ_fichr
    index by pls_integer;

  t_fichr                     type_tab_fichr;

  procedure mode_fichr (pbo_ecrir_dirct in boolean);

  --
  -- CREATE_PASV
  --
  -- Create the passive host IP and port number to connect to
  --
  procedure create_pasv (p_pasv_cmd    in     varchar2
                        ,p_pasv_host      out varchar2
                        ,p_pasv_port      out number);

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
    return boolean;

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
    return boolean;

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
                          ,d_trans_end              out date);

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
    return boolean;

  --
  -- GET_LOCAL_BINARY_DATA
  --
  -- Load local binary file into BLOB
  --
  function get_local_binary_data (p_dir    in varchar2
                                 ,p_file   in varchar2)
    return blob;

  --
  -- GET_REMOTE_BINARY_DATA
  --
  -- Loads remote binary file into BLOB
  --
  function get_remote_binary_data (u_ctrl_connection in out utl_tcp.connection)
    return blob;

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
    return clob;

  --
  -- GET_REMOTE_LISTING_DATA
  --
  -- This is used for obtaining a remote directory listing
  -- and loading up into a CLOB
  --
  function get_remote_listing_data (u_ctrl_connection   in out utl_tcp.connection
                                   ,p_filename_filter   in     varchar2
                                   ,p_tsfr_mode         in     varchar2)
    return clob;

  --
  -- PUT_LOCAL_BINARY_DATA
  --
  -- This is used to write out a BLOB
  -- to the local filesystem after
  -- retrieving data from remote server
  --
  procedure put_local_binary_data (p_data   in blob
                                  ,p_dir    in varchar2
                                  ,p_file   in varchar2);

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
                                   ,p_data              in     blob);

  --
  -- PUT_REMOTE_ASCII_DATA
  --
  -- This is used for upload CLOB
  -- to remote server after retrieving
  -- when passed via parameter as a
  -- CLOB e.g. PUT_BLOB function in this package.
  --
  procedure put_remote_ascii_data (u_ctrl_connection   in out utl_tcp.connection
                                  ,p_data              in     clob);

  /**
   * Convenience function for single-file PUT
   *
   * Parameters:
   * localpath - local path is defined as the DBA Directories defined
   * p_filename - filename and extension for the file to be received or sent
   * p_remotepath - full directory name in which the local file will be sent or the
   *            remote file exists.  Should be in UNIX format regardless of FTP server - '/one/two/three'
   * p_username - username for FTP server
   * p_password - password for FTP server
   * p_hostname - FTP server IP address or host name Ex: 'ftp.oracle.com' or '127.0.0.1'
   * v_status - status of the transfer.  'ERROR' or 'SUCCESS'
   * v_error_message - meaningful (hopefully) error message explaining the reason for failure
   * n_bytes_transmitted - how many bytes were sent/received
   * d_trans_start - date/time the transmission started
   * d_trans_end - date/time the transmission ended
   * p_port - port number to connect to, default is 21
   * p_filetype - Default to ASCII but optionally can be BINARY
   * p_mainframe_ftp - Default FALSE. If target server is Mainframe MVS, must be TRUE.
  * p_mainframe_cmd - If Mainframe parm is TRUE, then this must have a value
  *                 For file transfers this would be the site command to define file layout
   */
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
    return boolean;

  /**
   * Convenience function for single-file GET
   *
   * Parameters:
   * localpath - local path is defined as the DBA Directories defined
   * p_filename - filename and extension for the file to be received or sent
   * p_remotepath - full directory name in which the local file will be sent or the
   *            remote file exists.  Should be in UNIX format regardless of FTP server - '/one/two/three'
   * p_username - username for FTP server
   * p_password - password for FTP server
   * p_hostname - FTP server IP address or host name Ex: 'ftp.oracle.com' or '127.0.0.1'
   * v_status - status of the transfer.  'ERROR' or 'SUCCESS'
   * v_error_message - meaningful (hopefully) error message explaining the reason for failure
   * n_bytes_transmitted - how many bytes were sent/received
   * d_trans_start - date/time the transmission started
   * d_trans_end - date/time the transmission ended
   * p_port - port number to connect to, default is 21
   * p_filetype - Default to ASCII but optionally can be BINARY
   * p_mainframe_ftp - Default FALSE. If target server is Mainframe MVS, must be TRUE.
  * p_mainframe_cmd - If Mainframe parm is TRUE, then this must have a value
  *                 For file transfers this would be the site command to define file layout
   */
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
    return boolean;

  /**
  * Convenience function for single-file DELETE
  *
  * Parameters:
  * p_localpath - Value will be NULL as it does not apply
  * p_filename - filename and extension for the file to be deleted on remote server
  * p_remotepath - full directory name in which the remote file exists.
 * Should be in UNIX format regardless of FTP server - '/one/two/three'
  * p_username - username for FTP server
  * p_password - password for FTP server
  * p_hostname - FTP server IP address or host name Ex: 'ftp.oracle.com' or '127.0.0.1'
  * v_status - status of the transfer.  'ERROR' or 'SUCCESS'
  * v_error_message - meaningful (hopefully) error message explaining the reason for failure
  * n_bytes_transmitted - how many bytes were sent/received
  * d_trans_start - date/time the transmission started
  * d_trans_end - date/time the transmission ended
  * p_port - port number to connect to, default is 21
  * p_filetype - Default to BINARY. Value is ignored during process.
  * p_mainframe_connection - Default FALSE. If target server is Mainframe MVS, must be TRUE.
  */
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
    return boolean;

  /**
   * Convenience function for single-file  RENAME
   *
   * Parameters:
   * p_localpath - Value will be NULL as it does not apply
   * p_filename - Concatenated value of filename.ext | new_filename.ext on remote server
   * p_remotepath - full directory name in which the remote file exists.
  * Should be in UNIX format regardless of FTP server - '/one/two/three'
   * p_username - username for FTP server
   * p_password - password for FTP server
   * p_hostname - FTP server IP address or host name Ex: 'ftp.oracle.com' or '127.0.0.1'
   * v_status - status of the transfer.  'ERROR' or 'SUCCESS'
   * v_error_message - meaningful (hopefully) error message explaining the reason for failure
   * n_bytes_transmitted - how many bytes were sent/received
   * d_trans_start - date/time the transmission started
   * d_trans_end - date/time the transmission ended
   * p_port - port number to connect to, default is 21
   * p_filetype - Default to BINARY. Value is ignored during process.
   * p_mainframe_connection - Default FALSE. If target server is Mainframe MVS, must be TRUE.
   */
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
    return boolean;

  /**
   * Convenience function for single-file  VERIFY_SERVER
   *
   * Parameters:
   * p_remotepath - full directory name you wish to verify along with server up/down status
   *              Should be in UNIX format regardless of FTP server - '/one/two/three'
   * p_username - username for FTP server
   * p_password - password for FTP server
   * p_hostname - FTP server IP address or host name Ex: 'ftp.oracle.com' or '127.0.0.1'
   * v_status - status of the transfer.  'ERROR' or 'SUCCESS'
   * v_error_message - meaningful (hopefully) error message explaining the reason for failure
   * p_port - port number to connect to, default is 21
   * p_filetype - Default to BINARY. Value is ignored during process.
   * p_mainframe_connection - Default FALSE. If target server is Mainframe MVS, must be TRUE.
   */
  function verify_server (p_remotepath             in     varchar2
                         ,p_username               in     varchar2
                         ,p_password               in     varchar2
                         ,p_hostname               in     varchar2
                         ,v_status                    out varchar2
                         ,v_error_message             out varchar2
                         ,p_port                   in     pls_integer default 21
                         ,p_filetype               in     varchar2 := 'BINARY'
                         ,p_mainframe_connection   in     boolean default false)
    return boolean;

  /**
  * Convenience function for DIR - Long listing providing all details
  *
  * Parameters:
   * localpath - local path is defined as the DBA Directories defined
  * p_filename_filter - Pass nothing for all files to be displayed, or filename. Wildcard * allowed.
  * p_dir_filename     - Filename of Directory listing retrieved from remote server
  * p_remotepath - full directory name to get a list of files from
  *            Should be in UNIX format regardless of FTP server - '/one/two/three'
  * p_username - username for FTP server
  * p_password - password for FTP server
  * p_hostname - FTP server IP address or host name Ex: 'ftp.oracle.com' or '127.0.0.1'
  * v_status - status of the transfer.  'ERROR' or 'SUCCESS'
  * v_error_message - meaningful (hopefully) error message explaining the reason for failure
  * n_bytes_transmitted - how many bytes were sent/received
  * d_trans_start - date/time the transmission started
  * d_trans_end - date/time the transmission ended
  * p_port - port number to connect to, default is 21
  * p_filetype - Default to ASCII but optionally can be BINARY
  * p_mainframe_ftp - Default FALSE. If target server is Mainframe MVS, must be TRUE.
  */
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
    return boolean;

    /**
* Convenience function for LS - Short listing only filenames
*
* Parameters:
 * localpath - local path is defined as the DBA Directories defined
* p_filename_filter - Pass nothing for all files to be displayed, or filename. Wildcard * allowed.
* p_dir_filename     - Filename of Directory listing retrieved from remote server
* p_remotepath - full directory name to get a list of files from
*            Should be in UNIX format regardless of FTP server - '/one/two/three'
* p_username - username for FTP server
* p_password - password for FTP server
* p_hostname - FTP server IP address or host name Ex: 'ftp.oracle.com' or '127.0.0.1'
* v_status - status of the transfer.  'ERROR' or 'SUCCESS'
* v_error_message - meaningful (hopefully) error message explaining the reason for failure
* n_bytes_transmitted - how many bytes were sent/received
* d_trans_start - date/time the transmission started
* d_trans_end - date/time the transmission ended
* p_port - port number to connect to, default is 21
* p_filetype - Default to ASCII but optionally can be BINARY
* p_mainframe_ftp - Default FALSE. If target server is Mainframe MVS, must be TRUE.
*/
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
    return boolean;

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
    return boolean;

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
    return boolean;

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
    return boolean;

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
    return boolean;

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
    return boolean;

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
    return boolean;

  /**
   * Convenience function for create new directory command  MKDIR_REMOTE
   *
   * Parameters:
   * p_remotepath - full directory name in which you wish to switch to before creating new directory.
   *              Should be in UNIX format regardless of FTP server - '/one/two/three'
  * p_target_dir - Directory name you wish to create
   * p_username - username for FTP server
   * p_password - password for FTP server
   * p_hostname - FTP server IP address or host name Ex: 'ftp.oracle.com' or '127.0.0.1'
   * v_status - status of the transfer.  'ERROR' or 'SUCCESS'
   * v_error_message - meaningful (hopefully) error message explaining the reason for failure
   * p_port - port number to connect to, default is 21
   * p_mainframe_connection - Default FALSE. If target server is Mainframe MVS, must be TRUE.
   */
  function mkdir_remote (p_remotepath             in     varchar2
                        ,p_target_dir             in     varchar2
                        ,p_username               in     varchar2
                        ,p_password               in     varchar2
                        ,p_hostname               in     varchar2
                        ,v_status                    out varchar2
                        ,v_error_message             out varchar2
                        ,p_port                   in     pls_integer default 21
                        ,p_mainframe_connection   in     boolean default false)
    return boolean;

  /**
   * Convenience function for remove directory command RMDIR_REMOTE
   *
   * Parameters:
   * p_remotepath - full directory name in which you wish to switch to before removing a directory.
   *              Should be in UNIX format regardless of FTP server - '/one/two/three'
  * p_target_dir - Directory name you wish to create
   * p_username - username for FTP server
   * p_password - password for FTP server
   * p_hostname - FTP server IP address or host name Ex: 'ftp.oracle.com' or '127.0.0.1'
   * v_status - status of the transfer.  'ERROR' or 'SUCCESS'
   * v_error_message - meaningful (hopefully) error message explaining the reason for failure
   * p_port - port number to connect to, default is 21
   * p_mainframe_connection - Default FALSE. If target server is Mainframe MVS, must be TRUE.
   */
  function rmdir_remote (p_remotepath             in     varchar2
                        ,p_target_dir             in     varchar2
                        ,p_username               in     varchar2
                        ,p_password               in     varchar2
                        ,p_hostname               in     varchar2
                        ,v_status                    out varchar2
                        ,v_error_message             out varchar2
                        ,p_port                   in     pls_integer default 21
                        ,p_mainframe_connection   in     boolean default false)
    return boolean;
end afw_15_ftp_noyau_pkg;
/
