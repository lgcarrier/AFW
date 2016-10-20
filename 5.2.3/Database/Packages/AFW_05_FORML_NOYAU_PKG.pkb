SET DEFINE OFF;
create or replace package body afw_05_forml_noyau_pkg
as
  gva_code_exect   varchar2 (32767);

  procedure trim_code
  is
  begin
    gva_code_exect      :=
      replace (gva_code_exect
              ,chr (13)
              ,chr (32));
    gva_code_exect      :=
      replace (gva_code_exect
              ,chr (10)
              ,chr (32));
  end trim_code;

  function resdr_condt_simple_booln (pva_forml in varchar2)
    return boolean
  is
  begin
    gva_code_exect      :=
      replace ('begin
                               if %pva_forml% then
                                 afw_05_forml_noyau_pkg.gva_varbl_varch := ''O'';
                               else
                                   afw_05_forml_noyau_pkg.gva_varbl_varch := ''N'';
                               end if;
                               end;'
              ,'%pva_forml%'
              ,pva_forml);

    trim_code;

    gva_code_exect   := aa.do_substitutions (gva_code_exect);

    execute immediate gva_code_exect;

    if gva_varbl_varch = 'O'
    then
      return true;
    else
      return false;
    end if;
  exception
    when others
    then
      afw_03_journ_pkg.ecrir_journ (   'Erreur dans l''exécution de la formule: '
                                    || gva_code_exect);
      afw_07_util_pkg.ajout_info_debug (   'Formule invalide :'
                                        || pva_forml);
      raise;
  end resdr_condt_simple_booln;
end afw_05_forml_noyau_pkg;
/
