SET DEFINE OFF;
create or replace package afw_15_ftp_pkg
is
  /* THESE HAVE BEEN SETUP TO BE UTILIZED AS DIRECT CALLS VIA ORACLE APPLICATIONS */
  /* THEY RETURN FAILURE CODES APPROPRIATLY FOR USAGE IN REQUEST SETS AND PAGING ROUTINES */

  /* USE THIS PROCEDURE TO VERIFY THAT A SERVER AND PATH IS AVAILABLE */
  procedure verify_server (errbuf                      out varchar2
                          ,retcode                     out number
                          ,p_hostname               in     varchar2
                          ,p_remotepath             in     varchar2
                          ,p_username               in     varchar2
                          ,p_password               in     varchar2
                          ,p_mainframe_connection   in     varchar2 default 'F');

  /* USE THIS PROCEDURE TO COLLECT A REMOTE FILE TO THE DATABASE SERVER */
  /* LOCAL DIRECTORY MUST BE WRITABLE BY UTL_FILE ROUTINES */
  /* BINARY SUPPORTED */
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
                            ,p_mainframe_command   in     varchar2 default null);

  function get_remote_file (p_filename     in varchar2
                           ,p_remotepath   in varchar2
                           ,p_hostname     in varchar2
                           ,p_username     in varchar2
                           ,p_password     in varchar2
                           ,p_port         in number default 21
                           ,p_filetype     in varchar2 default 'BINARY')
    return blob;

  /* USE THIS PROCEDURE TO TRANSFER A LOCAL FILE TO A REMOTE SERVER LOCATION */
  /* BINARY SUPPORTED */
  /* IF BINARY, THEN LOCAL DIRECTORY MUST BE DEFINED AS DATABASE DIRECTORY */
  /* CONTACT DBA's TO VERIFY *?
  /* HINT : IT MIGHT BE A GOOD IDEA TO SETUP ALL XFER INTERFACE DIRECTORIES */
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
                            ,p_mainframe_command   in     varchar2 default null);

  /* USE THIS PROCEDURE TO REMOVE A FILE FROM A REMOTE SERVER LOCATION */
  procedure remove_remote_file (errbuf            out varchar2
                               ,retcode           out number
                               ,p_hostname     in     varchar2
                               ,p_filename     in     varchar2
                               ,p_remotepath   in     varchar2
                               ,p_username     in     varchar2
                               ,p_password     in     varchar2
                               ,p_mainframe    in     varchar2 default 'F');

  /* USE THIS PROCEDURE TO RENAME A FILE ON A REMOTE SERVER LOCATION */
  procedure rename_remote_file (errbuf            out varchar2
                               ,retcode           out number
                               ,p_hostname     in     varchar2
                               ,p_filename     in     varchar2
                               ,p_remotepath   in     varchar2
                               ,p_username     in     varchar2
                               ,p_password     in     varchar2
                               ,p_mainframe    in     varchar2 default 'F');

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
                                 ,p_mainframe         in     varchar2 default 'F');

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
                                ,p_mainframe         in     varchar2 default 'F');


  /* Use this routine to return a failure code if not in production */
  /* This would be used as a first stage in a request set to ensure */
  /* a request set that includes the above FTP routines, that it    */
  /* it would not fire off if executed in a test instance.          */
  /*                                                                */
  /* It would require someone to skip the first step to make it the */
  /* request set run. However, in that event, they need to change   */
  /* the necessary parameters to control the correct user/password  */
  /* and server/path information                                    */
  /*                 */
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
  ,     retcode                    OUT      NUMBER );

  */

  p_conn              utl_tcp.connection;
  v_parm_value        varchar2 (4000);
  lvbusgroupid        number;
  lbok                boolean;
  p_process_id        pls_integer;
  p_sub_process_id    pls_integer;
  p_from_name         varchar2 (100);
  p_to_name           varchar2 (4000);
  p_subject           varchar2 (150);
  p_message           varchar2 (32767);
  p_filename          varchar2 (1000);
  p_priority          char (1);
  p_path              varchar2 (1000);
  p_debug             char (1) := 'N';
  p_override          varchar2 (4000);
  --
  -- p_database is populated by grabbing the SID of the current database
  --
  p_database          varchar2 (100);
  --
  --   p_database                    VARCHAR2 ( 100 );
  --                                          := hum_time_tools.get_oracle_instance;
  p_database_string   varchar2 (100)
                        :=    ' - '
                           || p_database;

  type typ_fichr_sql is table of afw_15_ftp_noyau_pkg.typ_fichr;

  function list_dir_sql
    return typ_fichr_sql
    pipelined;
end afw_15_ftp_pkg;
/
