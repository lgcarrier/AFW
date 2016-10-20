SET DEFINE OFF;
create or replace package body afw_18_itf_pkg
is
  procedure desct_forml_tablr
  is
  begin
    htp.p ('
<script type="text/javascript">
<!--

  var champ_input = document.getElementsByTagName("input");
  var champ       = null;

  for (var i = 0; i < champ_input.length; i++)
  {
    champ = champ_input[i];

    if (champ.id.match(/^[f][0-9]{2}_[0-9]{4}$/))
    {
        champ.readOnly = true;
        champ.className = "sax_desct";
    }
  }

  var champ_input = document.getElementsByTagName("select");
  var champ       = null;

  for (var i = 0; i < champ_input.length; i++)
  {
    champ = champ_input[i];

    if (champ.id.match(/^[f][0-9]{2}_[0-9]{4}$/))
    {
        champ.disabled = true;
        champ.className = "sax_desct";
    }
  }

  var champ_input = document.getElementsByTagName("textarea");
  var champ       = null;

  for (var i = 0; i < champ_input.length; i++)
  {
    champ = champ_input[i];

    if (champ.id.match(/^[f][0-9]{2}_[0-9]{4}$/))
    {
        champ.readOnly = true;
        champ.className = "sax_desct";
    }
  }

// -->
</script>
'    );
  end desct_forml_tablr;

  procedure defnr_ligne_titre (pva_code_titre   in varchar2
                              ,pva_type_champ   in varchar2 default 'hidden')
  is
  begin
    afw_07_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.actio_dynmq.gestn_tablr_form.convr_ligne_titre ("'
                                            || replace (pva_type_champ
                                                       ,'"'
                                                       ,'\"')
                                            || '", "'
                                            || replace (pva_code_titre
                                                       ,'"'
                                                       ,'\"')
                                            || '");');
  end;

  procedure cachr_champ (pva_code         in varchar2
                        ,pnu_declg        in number
                        ,pva_type_champ   in varchar2 default 'hidden')
  is
  begin
    afw_07_util_pkg.ajout_code_javsc_charg (   'afw.afw_21.actio_dynmq.gestn_tablr_form.defnr_indic ("'
                                            || replace (pva_type_champ
                                                       ,'"'
                                                       ,'\"')
                                            || '", "'
                                            || replace (pva_code
                                                       ,'"'
                                                       ,'\"')
                                            || '", '
                                            || pnu_declg
                                            || ', true, false);');
  end;
end afw_18_itf_pkg;
/
