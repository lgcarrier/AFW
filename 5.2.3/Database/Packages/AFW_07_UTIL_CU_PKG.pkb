SET DEFINE OFF;
create or replace package body afw_07_util_cu_pkg
as
  function obten_sourc_shutl_selct (pva_selct   in varchar2
                                   ,pva_seprt   in varchar2 default ':')
    return varchar2
  is
    cur_ref_r   sys_refcursor;
    vva_ref_r   varchar2 (1000);
    vva_retrn   varchar2 (32767);
  begin
    open cur_ref_r for pva_selct;

    fetch cur_ref_r
      into vva_ref_r;

    while cur_ref_r%found
    loop
      vva_retrn      :=
           vva_retrn
        || vva_ref_r
        || pva_seprt;

      fetch cur_ref_r
        into vva_ref_r;
    end loop;

    close cur_ref_r;

    if vva_retrn is not null
    then
      vva_retrn      :=
        substr (vva_retrn
               ,1
               ,length (vva_retrn) - length (pva_seprt));
    end if;

    return vva_retrn;
  end obten_sourc_shutl_selct;

  function obten_sourc_shutl_selct (pre_selct   in sys_refcursor
                                   ,pva_seprt   in varchar2 default ':')
    return varchar2
  is
    vva_ref_r   varchar2 (1000);
    vva_retrn   varchar2 (32767);
  begin
    fetch pre_selct
      into vva_ref_r;

    while pre_selct%found
    loop
      vva_retrn      :=
           vva_retrn
        || vva_ref_r
        || pva_seprt;

      fetch pre_selct
        into vva_ref_r;
    end loop;

    close pre_selct;

    if vva_retrn is not null
    then
      vva_retrn      :=
        substr (vva_retrn
               ,1
               ,length (vva_retrn) - length (pva_seprt));
    end if;

    return vva_retrn;
  end obten_sourc_shutl_selct;
end afw_07_util_cu_pkg;
/
