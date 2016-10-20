SET DEFINE OFF;
create or replace package afw_07_xml_pkg
is
  subtype docmn_xml is dbms_xmldom.domdocument;

  subtype noeud_xml is dbms_xmldom.domnode;

  function creer_xml (pcl_contn_xml in clob)
    return xmltype;

  function creer_xml (pbl_contn_xml   in blob
                     ,pva_chars       in varchar2 default dbms_lob.default_csid)
    return xmltype;

  function obten_valr_carct (pxm_xml     in xmltype
                            ,pva_xpath   in varchar2)
    return varchar2;

  function obten_valr_numrq (pxm_xml     in xmltype
                            ,pva_xpath   in varchar2)
    return number;

  function creer_docmn_xml
    return docmn_xml;

  function ajout_noeud_racn (pdo_docmn_xml in docmn_xml)
    return noeud_xml;

  function ajout_elemn_enfan (pdo_docmn_xml         in docmn_xml
                             ,pno_noeud_xml         in noeud_xml
                             ,pva_nom_noeud_enfan   in varchar2)
    return noeud_xml;

  procedure ajout_text_enfan (pdo_docmn_xml    in docmn_xml
                             ,pno_noeud_xml    in noeud_xml
                             ,pva_text_enfan   in varchar2);

  function conv_docmn_xml_vers_xmltype (pdo_docmn_xml in docmn_xml)
    return xmltype;

  function conv_xmltype_vers_docmn_xml (pxm_xml in xmltype)
    return docmn_xml;

  function obten_contn_xml (pdo_docmn_xml in docmn_xml)
    return clob;

  procedure libr_docmn_xml (pdo_docmn_xml in docmn_xml);
end afw_07_xml_pkg;
/
