SET DEFINE OFF;
create or replace package body afw_19_cle_pkg
as
  type typ_tab_cle is table of varchar2 (10)
    index by pls_integer;

  gta_cle              typ_tab_cle;
  kva_shift   constant varchar2 (5) default 'Shift';
  kva_alt     constant varchar2 (3) default 'Alt';
  kva_ctrl    constant varchar2 (4) default 'Ctrl';

  function obten_cle_formt (pnu_cle in number)
    return varchar2
  is
    vva_cle_formt   varchar2 (30);
    vnu_code        pls_integer;
  begin
    --If you want to use more than one modifiers (e.g. alt+ctrl+z) you should define them by an alphabetical order e.g. alt+ctrl+shift
    select    case indic_alt
                when 'O'
                then
                     kva_alt
                  || '+'
                else
                  null
              end
           || case indic_ctrl
                when 'O'
                then
                     kva_ctrl
                  || '+'
                else
                  null
              end
           || case indic_shift
                when 'O'
                then
                     kva_shift
                  || '+'
                else
                  null
              end
             modfr
          ,code_keydw
      into vva_cle_formt
          ,vnu_code
      from vd_afw_19_cle c
     where c.seqnc = pnu_cle;

    if vnu_code is null
    then
      return null;
    elsif vva_cle_formt is null
    then
      return initcap (gta_cle (vnu_code));
    else
      return    vva_cle_formt
             || initcap (gta_cle (vnu_code));
    end if;
  exception
    when no_data_found
    then
      return null;
  end obten_cle_formt;
begin
  -- Assigner les touches A à Z
  for i in ascii ('A') .. ascii ('Z')
  loop
    gta_cle (i)   := chr (i);
  end loop;

  -- Assigner les touches 0 à 9
  for i in ascii ('0') .. ascii ('9')
  loop
    gta_cle (i)   := chr (i);
  end loop;

  gta_cle (9)     := 'TAB';
  gta_cle (13)    := 'RETURN';
  gta_cle (33)    := 'PAGEUP';
  gta_cle (34)    := 'PAGEDOWN';
  gta_cle (35)    := 'END';
  gta_cle (36)    := 'HOME';
  gta_cle (37)    := 'LEFT';
  gta_cle (38)    := 'UP';
  gta_cle (39)    := 'RIGHT';
  gta_cle (40)    := 'DOWN';
  gta_cle (112)   := 'F1';
  gta_cle (113)   := 'F2';
  gta_cle (114)   := 'F3';
  gta_cle (115)   := 'F4';
  gta_cle (116)   := 'F5';
  gta_cle (117)   := 'F6';
  gta_cle (118)   := 'F7';
  gta_cle (119)   := 'F8';
  gta_cle (120)   := 'F9';
  gta_cle (121)   := 'F10';
  gta_cle (122)   := 'F11';
  gta_cle (123)   := 'F12';
  gta_cle (127)   := 'DEL';
end afw_19_cle_pkg;
/
