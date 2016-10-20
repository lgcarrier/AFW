SET DEFINE OFF;
create or replace package body afw_07_xml_pkg
is
  function creer_xml (pcl_contn_xml in clob)
    return xmltype
  is
  begin
    return xmltype.createxml (pcl_contn_xml);
  end creer_xml;

  function creer_xml (pbl_contn_xml   in blob
                     ,pva_chars       in varchar2 default dbms_lob.default_csid)
    return xmltype
  is
  begin
    return creer_xml (afw_07_clob_pkg.convr_blob_vers_clob (pbl_blob    => pbl_contn_xml
                                                           ,pva_chars   => pva_chars));
  end creer_xml;

  function valdr_noeud_exist (pxm_xml     in xmltype
                             ,pva_xpath   in varchar2)
    return boolean
  is
    vbo_noeud_exist   boolean default false;
  begin
    if pxm_xml.existsnode (pva_xpath) = 1
    then
      vbo_noeud_exist   := true;
    end if;

    return vbo_noeud_exist;
  end valdr_noeud_exist;

  function obten_valr_carct (pxm_xml     in xmltype
                            ,pva_xpath   in varchar2)
    return varchar2
  is
  begin
    if valdr_noeud_exist (pxm_xml
                         ,pva_xpath)
    then
      return afw_07_util_pkg.multi_replc (pxm_xml.extract (pva_xpath).getstringval ()
                                         ,'&quot;&quot;'
                                         ,null
                                         ,'&apos;'
                                         ,'''');
    else
      return null;
    end if;
  end obten_valr_carct;

  function obten_valr_numrq (pxm_xml     in xmltype
                            ,pva_xpath   in varchar2)
    return number
  is
  begin
    if valdr_noeud_exist (pxm_xml
                         ,pva_xpath)
    then
      return pxm_xml.extract (pva_xpath).getnumberval ();
    else
      return null;
    end if;
  end obten_valr_numrq;

  function creer_docmn_xml
    return docmn_xml
  as
  begin
    return dbms_xmldom.newdomdocument;
  end creer_docmn_xml;

  function ajout_noeud_racn (pdo_docmn_xml in docmn_xml)
    return noeud_xml
  as
  begin
    return dbms_xmldom.makenode (pdo_docmn_xml);
  end ajout_noeud_racn;

  function ajout_elemn_enfan (pdo_docmn_xml         in docmn_xml
                             ,pno_noeud_xml         in noeud_xml
                             ,pva_nom_noeud_enfan   in varchar2)
    return noeud_xml
  as
  begin
    return dbms_xmldom.appendchild (pno_noeud_xml
                                   ,dbms_xmldom.makenode (dbms_xmldom.createelement (pdo_docmn_xml
                                                                                    ,pva_nom_noeud_enfan)));
  end ajout_elemn_enfan;

  procedure ajout_text_enfan (pdo_docmn_xml    in docmn_xml
                             ,pno_noeud_xml    in noeud_xml
                             ,pva_text_enfan   in varchar2)
  as
    vno_noeud_xml   noeud_xml;
  begin
    vno_noeud_xml      :=
      dbms_xmldom.appendchild (pno_noeud_xml
                              ,dbms_xmldom.makenode (dbms_xmldom.createtextnode (pdo_docmn_xml
                                                                                ,pva_text_enfan)));
  end ajout_text_enfan;

  function conv_docmn_xml_vers_xmltype (pdo_docmn_xml in docmn_xml)
    return xmltype
  as
  begin
    return dbms_xmldom.getxmltype (pdo_docmn_xml);
  end conv_docmn_xml_vers_xmltype;

  function conv_xmltype_vers_docmn_xml (pxm_xml in xmltype)
    return docmn_xml
  as
  begin
    return dbms_xmldom.newdomdocument (pxm_xml);
  end conv_xmltype_vers_docmn_xml;

  function obten_contn_xml (pdo_docmn_xml in docmn_xml)
    return clob
  as
    vcl_contn_xml   clob;
  begin
    dbms_lob.createtemporary (vcl_contn_xml
                             ,false);
    dbms_xmldom.writetoclob (pdo_docmn_xml
                            ,vcl_contn_xml);
    vcl_contn_xml      :=
      rtrim (vcl_contn_xml
            ,chr (10));
    vcl_contn_xml      :=
      rtrim (vcl_contn_xml
            ,chr (13));
    return vcl_contn_xml;
  end obten_contn_xml;

  procedure libr_docmn_xml (pdo_docmn_xml in docmn_xml)
  as
  begin
    dbms_xmldom.freedocument (pdo_docmn_xml);
  end libr_docmn_xml;
end afw_07_xml_pkg;
/
