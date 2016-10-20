SET DEFINE OFF;
create or replace package afw_07_util_compr_zip_pkg
is
  /*

  Purpose:      Package handles zipping and unzipping of files

  Remarks:      by Anton Scheffer, see http://forums.oracle.com/forums/thread.jspa?messageID=9289744#9289744

                for unzipping, see http://technology.amis.nl/blog/8090/parsing-a-microsoft-word-docx-and-unzip-zipfiles-with-plsql
                for zipping, see http://forums.oracle.com/forums/thread.jspa?threadID=1115748&tstart=0

  Who     Date        Description
  ------  ----------  --------------------------------
  MBR     09.01.2011  Created
  AFW     08.08-2012  Adaptation et intégration à AFW

  */

  type typ_rec_fichr is record
  (
    nom     varchar2 (1000)
   ,reprt   varchar2 (1000)
   ,contn   blob
  );

  type typ_tab_fichr is table of typ_rec_fichr
    index by pls_integer;

  type typ_list_nom_fichr is table of varchar2 (2048);

  function extra_fichr (pbl_fichr_compr_zip   in blob
                       ,pva_encod             in varchar2 default null
                       ,pbo_extra_contn       in boolean default true)
    return typ_tab_fichr;

  procedure ajout_fichr (pbl_fichr_compr   in out blob
                        ,pva_nom_fichr     in     varchar2
                        ,pbl_fichr         in     blob);

  procedure clotr_fichr (pbl_fichr_compr   in out blob
                        ,pva_comnt         in     varchar2 default null);

  function obten_liste_nom_fichr (pbl_fichr_compr   in blob
                                 ,pva_encod         in varchar2 := null)
    return typ_list_nom_fichr;

  function obten_fichr (pbl_fichr_compr   in blob
                       ,pva_nom_fichr     in varchar2
                       ,pva_encod         in varchar2 := null)
    return blob;
end afw_07_util_compr_zip_pkg;
/
