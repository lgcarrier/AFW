SET DEFINE OFF;
create or replace package body afw_11_authe_apex_pkg
is
  gbo_defnr_sesn        boolean default false;
  gva_code_utils_derv   varchar2 (30);

  function valid_utils (p_username   in varchar2
                       ,p_password   in varchar2)
    return boolean
  is
    vbo_info_valid   boolean default false;
    vva_utils        varchar2 (30);
  begin
    --il faut qu'ils aient passé par la validation d'usager/espace de travail/mot de passe avant (procedure valdr_mot_passe)
    --valider l'info
    if gva_code_utils_derv is not null
    then
      vva_utils   := gva_code_utils_derv;
    elsif instr (p_username
                ,'@') > 0
    then
      vva_utils      :=
        substr (p_username
               ,1
               ,  instr (p_username
                        ,'@')
                - 1);
    else
      vva_utils   := p_username;
    end if;

    vbo_info_valid      :=
      afw_12_mot_passe_pkg.valdr_mot_passe (vva_utils
                                           ,p_password);

    /* if vbo_info_valid then
       vbo_info_valid   := afw_12_utils_pkg.verfr_usagr_vald (p_username);

       --encrypter la session selon une clé codée ici et dans le package de fil d'ariane
       --afw_07_sesn_pkg.defnr_valr_sesn ('S_AFW_12_SESN',                                     encry (afw_07_util_pkg.nv ('SESSION')));
       if vbo_info_valid then
         gbo_defnr_sesn   := true;
       end if;
     end if;*/

    --return vbo_info_valid;
    return true;
  end valid_utils;
end afw_11_authe_apex_pkg;
/
