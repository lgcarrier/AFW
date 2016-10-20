SET DEFINE OFF;
create or replace package body afw_16_vue_parmt_pkg
is
  gva_droit_acces         varchar2 (1);
  gva_droit_creat         varchar2 (1);
  gva_droit_modfc         varchar2 (1);
  gva_droit_suprs         varchar2 (1);
  gnu_membr_struc_admin   number (10);
  gva_struc_aplic         varchar2 (30);
  gva_code_type_struc     varchar2 (30);
  gva_code_utils          afw_12_utils.code_utils%type;

  procedure creer_lov_utils_struc_aplic_1 (pva_struc_aplic         in     varchar2
                                          ,pva_droit               in     varchar2
                                          ,pnu_membr_struc_admin   in     number default null
                                          ,pva_code_type_struc     in     varchar2 default null
                                          ,pva_code_utils             out varchar2)
  is
  begin
    if instr (upper (pva_droit)
             ,'ACCES') > 0
    then
      gva_droit_acces   := 'O';
    else
      gva_droit_acces   := 'N';
    end if;

    if instr (upper (pva_droit)
             ,'CREAT') > 0
    then
      gva_droit_creat   := 'O';
    else
      gva_droit_creat   := 'N';
    end if;

    if instr (upper (pva_droit)
             ,'MODFC') > 0
    then
      gva_droit_modfc   := 'O';
    else
      gva_droit_modfc   := 'N';
    end if;

    if instr (upper (pva_droit)
             ,'SUPRS') > 0
    then
      gva_droit_suprs   := 'O';
    else
      gva_droit_suprs   := 'N';
    end if;

    gnu_membr_struc_admin   := pnu_membr_struc_admin;
    gva_struc_aplic         := pva_struc_aplic;
    gva_code_type_struc     := pva_code_type_struc;
  end creer_lov_utils_struc_aplic_1;

  function obten_lov_utils_struc_aplic
    return arr_typ_utils
    pipelined
  is
    rec_utils   cur_utils%rowtype;
  begin
    open cur_utils (gva_struc_aplic
                   ,gnu_membr_struc_admin
                   ,gva_code_type_struc
                   ,gva_droit_acces
                   ,gva_droit_creat
                   ,gva_droit_modfc
                   ,gva_droit_suprs
                   ,gva_code_utils);

    fetch cur_utils
      into rec_utils;

    while cur_utils%found
    loop
      pipe row (rec_utils);

      fetch cur_utils
        into rec_utils;
    end loop;

    close cur_utils;

    return;
  end obten_lov_utils_struc_aplic;

  function obten_membr_struc_de_code (pva_code in varchar2)
    return number
  is
    vnu_ref_membr_struc   number (10);
  begin
    begin
      select seqnc
        into vnu_ref_membr_struc
        from vs_ix_lov_utils_struc_aplic_01
       where code_utils = pva_code;
    exception
      when no_data_found
      then
        return null;
    end;

    return vnu_ref_membr_struc;
  end obten_membr_struc_de_code;
end afw_16_vue_parmt_pkg;
/
