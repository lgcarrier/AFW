SET DEFINE OFF;
create or replace package body afw_25_formt_ir_pkg
is
  function obten_bals_formt (pva_porte   in varchar2
                            ,pva_gras    in varchar2
                            ,pva_coulr   in varchar2 default null)
    return varchar2
  is
    vva_bals   varchar2 (1000)
      default '<span style="font-weight:%gras%; portee:%porte%; display:none; color:%coulr%;" class="portee_%porte% font_weight_%gras% %font_coulr%"></span>';
  begin
    if afw_07_util_pkg.v ('REQUEST') = 'CSV'
    then
      return null;
    else
      vva_bals      :=
        replace (vva_bals
                ,'%gras%'
                ,case pva_gras when knu_propr_oui then 'bold' else 'normal' end);

      vva_bals      :=
        replace (vva_bals
                ,'%font_coulr%'
                ,case when pva_coulr is not null then 'font_color' else null end);

      vva_bals      :=
        replace (vva_bals
                ,'%coulr%'
                ,case when pva_coulr is not null then pva_coulr else null end);

      --pour le moment, ne gère que ligne
      vva_bals      :=
        replace (vva_bals
                ,'%porte%'
                ,case pva_porte when knu_porte_ligne then 'ligne' else 'coln' end);
    end if;

    return vva_bals;
  end obten_bals_formt;

  function digr_bals_formt (pva_bals in varchar2)
    return typ_formt
  is
    vva_bals            varchar2 (2000) default lower (pva_bals);
    vnu_i_deux_point    pls_integer;
    vnu_i_point_virgl   pls_integer;
    vva_propr           varchar2 (100);
    vva_valr            varchar2 (100);
    vre_retr            typ_formt;
  begin
    if vva_bals like '<span style="%"></span>'
    then
      vva_bals      :=
        substr (vva_bals
               ,14
               ,length (vva_bals) - 14 - 8);

      while vva_bals like '%:%;%'
      loop
        vnu_i_deux_point      :=
          instr (vva_bals
                ,':');
        vnu_i_point_virgl      :=
          instr (vva_bals
                ,';');
        vva_propr      :=
          substr (vva_bals
                 ,1
                 ,vnu_i_deux_point - 1);
        vva_valr      :=
          substr (vva_bals
                 ,vnu_i_deux_point + 1
                 ,vnu_i_point_virgl - vnu_i_deux_point - 1);

        --gérer la propriété
        case trim (vva_propr)
          when 'font-weight'
          then
            vre_retr.indic_gras   := vva_valr = 'bold';
          when 'portee'
          then
            vre_retr.indic_ligne   := vva_valr = 'ligne';
          else
            null;
        end case;

        vva_bals      :=
          substr (vva_bals
                 ,vnu_i_point_virgl + 1);
      end loop;
    end if;

    return vre_retr;
  end digr_bals_formt;
end afw_25_formt_ir_pkg;
/
