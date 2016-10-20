SET DEFINE OFF;
create or replace package body afw_16_lov_pkg
as
  function obten_valr_rechr
    return varchar2
    deterministic
  is
  begin
    return gva_valr_rechr;
  end;

  function obten_afich_par_valr (pva_lov     in varchar2
                                ,pva_valr    in varchar2
                                ,pva_seprt   in varchar2 default ':')
    return varchar2
  is
    var_liste        apex_application_global.vc_arr2;
    vin_index        pls_integer;
    vva_selct        varchar2 (32000);
    vnu_pos          number;
    vva_nom          varchar2 (1000);
    vva_valr         varchar2 (1000);
    --Valeurs pour gérer le retour multiple
    vva_valr_initl   varchar2 (2000) default pva_valr;
    vnu_postn        pls_integer;
    vva_valr_subst   varchar2 (200);
    vva_valr_retr    varchar2 (2000);
  begin
    if instr (pva_valr
             ,pva_seprt) > 0
    then
      vnu_postn      :=
        instr (vva_valr_initl
              ,pva_seprt);

      while vnu_postn > 0
      loop
        vva_valr_subst      :=
          substr (vva_valr_initl
                 ,1
                 ,vnu_postn - 1);
        vva_valr_initl      :=
          substr (vva_valr_initl
                 ,vnu_postn + 1);
        vnu_postn      :=
          instr (vva_valr_initl
                ,pva_seprt);
        vva_valr_retr      :=
             vva_valr_retr
          || ', '
          || obten_afich_par_valr (pva_lov
                                  ,vva_valr_subst);
      end loop;

      vva_valr_retr      :=
           vva_valr_retr
        || ', '
        || obten_afich_par_valr (pva_lov
                                ,vva_valr_initl);

      return substr (vva_valr_retr
                    ,3);
    else
      if pva_lov is null
      then
        -- Pas de LOV
        return null;
      elsif pva_lov like '.%.'
      then
        begin
          select lov_disp_value
            into vva_nom
            from apex_valr_lov
           where     lov_id = substr (pva_lov
                                     ,2
                                     ,length (pva_lov) - 2)
                 and lov_return_value = pva_valr
                 and rownum = 1;

          return vva_nom;
        exception
          when no_data_found
          then
            return null;
        end;
      elsif    pva_lov like 'STATIC:%'
            or pva_lov like 'STATIC1:%'
            or pva_lov like 'STATIC2:%'
      then
        -- LOV statique
        var_liste      :=
          afw_07_util_pkg.string_to_table (substr (pva_lov
                                                  ,9)
                                          ,',');
        vin_index   := 1;

        while var_liste.exists (vin_index)
        loop
          vnu_pos      :=
            instr (var_liste (vin_index)
                  ,';');

          if vnu_pos > 0
          then
            vva_nom      :=
              substr (var_liste (vin_index)
                     ,1
                     ,vnu_pos - 1);
            vva_valr      :=
              substr (var_liste (vin_index)
                     ,vnu_pos + 1);
          else
            vva_nom    := var_liste (vin_index);
            vva_valr   := var_liste (vin_index);
          end if;

          if vva_valr = pva_valr
          then
            return vva_nom;
          end if;

          vin_index   := vin_index + 1;
        end loop;

        return null;
      else
        -- LOV dynamique de type select
        declare
          vva_exect   varchar2 (4000);
          vnu_cursr   number;
          var_info    afw_07_sql_pkg.typ_arr_infor_coln;
          vva_owner   varchar2 (30) default afw_11_aplic_pkg.obten_schem ();
          vva_lov     varchar2 (32767);
        begin
          vva_lov      :=
            replace (pva_lov
                    ,'#owner#'
                    ,vva_owner);
          vva_lov      :=
            replace (vva_lov
                    ,'#OWNER#'
                    ,vva_owner);

          if trim (lower (pva_lov)) not like 'select%'
          then
            -- Considérer que c'est un bloc PL/SQL retournant un select
            vva_exect      :=
                 'declare '
              || 'function x return varchar2 is '
              || 'begin '
              || vva_lov
              || ' return null;'
              || 'end; '
              || 'begin '
              || 'afw_16_lov_pkg.gva_selct := x(); '
              || 'end;';

            begin
              execute immediate vva_exect;

              vva_selct   := afw_16_lov_pkg.gva_selct;
            exception
              when others
              then
                vva_selct   := null;
            end;
          else
            vva_selct   := vva_lov;
          end if;

          if vva_selct is not null
          then
            gva_valr_rechr   := pva_valr;

            vva_exect        :=
                 'select d '
              || 'from ('
              || vva_selct
              || ') '
              || 'where r = afw_16_lov_pkg.obten_valr_rechr() and rownum = 1';

            vnu_cursr        :=
              afw_07_sql_pkg.ouvri_selct (null
                                         ,null
                                         ,vva_exect
                                         ,var_info
                                         ,null);

            if afw_07_sql_pkg.lire_ligne_selct (vnu_cursr
                                               ,var_info)
            then
              afw_07_sql_pkg.fermr_selct (vnu_cursr);

              case var_info (1).va_type_valr
                when 'VARCH'
                then
                  null; --Rien de plus
                when 'NUMBR'
                then
                  var_info (1).va_valr_varch   := var_info (1).nu_valr_numbr;
                when 'DATE'
                then
                  var_info (1).va_valr_varch      :=
                    to_char (var_info (1).da_valr_date
                            ,'YYYY-MM-DD');
                else
                  var_info (1).va_valr_varch   := '#####';
              end case;

              return var_info (1).va_valr_varch;
            else
              afw_07_sql_pkg.fermr_selct (vnu_cursr);
              return null;
            end if;
          else
            -- vva_selct is null
            return null;
          end if;
        end;
      end if;
    end if;
  end;

  function obten_lov_item (pnu_seqnc_item in number)
    return varchar2
  is
  begin
    return afw_16_lov_noyau_pkg.obten_lov_item (pnu_seqnc_item);
  end;
end afw_16_lov_pkg;
/
