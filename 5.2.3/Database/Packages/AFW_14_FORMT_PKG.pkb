SET DEFINE OFF;
create or replace package body afw_14_formt_pkg
as
  gva_seprt_decml   varchar2 (1) default ',';

  function formt_texte (pnu_valr in number)
    return varchar2
  is
    vnu_valr          number default pnu_valr;
    vnu_part_decm     number (38, 38);
    vnu_part_entir    number (38);
    vbo_negtf         boolean default false;

    vva_retr          varchar2 (600);
    vva_group         varchar2 (100);

    type typ_tab_unite is varray (19) of varchar2 (15);

    vta_tab_unite     typ_tab_unite
                        default typ_tab_unite ('mille'
                                              ,'million'
                                              ,'millard'
                                              ,'billion'
                                              ,'billiard'
                                              ,'trillion'
                                              ,'trilliard'
                                              ,'quadrillion'
                                              ,'quadrilliard'
                                              ,'quintillion'
                                              ,'quintilliard'
                                              ,'sextillion'
                                              ,'sextilliard'
                                              ,'septillion'
                                              ,'septilliard'
                                              ,'octillion'
                                              ,'octilliard'
                                              ,'nonillion'
                                              ,'nonilliard');

    type typ_tab_chifr is varray (16) of varchar2 (15);

    vta_tab_chifr     typ_tab_chifr
                        default typ_tab_chifr ('un'
                                              ,'deux'
                                              ,'trois'
                                              ,'quatre'
                                              ,'cinq'
                                              ,'six'
                                              ,'sept'
                                              ,'huit'
                                              ,'neuf'
                                              ,'dix'
                                              ,'onze'
                                              ,'douze'
                                              ,'treize'
                                              ,'quatorze'
                                              ,'quize'
                                              ,'seize');

    type typ_tab_dizn is varray (10) of varchar2 (20);

    vta_tab_dizn      typ_tab_dizn
                        default typ_tab_dizn ('dix'
                                             ,'vingt'
                                             ,'trente'
                                             ,'quarante'
                                             ,'cinquante'
                                             ,'soixante'
                                             ,'soixante-dix'
                                             ,'quatre-vingt'
                                             ,'quatre-vingt-dix');

    vnu_compt_unite   pls_integer default 0;
    vnu_valr_group    number;
    vnu_valr_dizn     number;
    vnu_valr_unite    number;
  begin
    if vnu_valr = 0
    then
      vva_retr   := 'zero';
    else
      if vnu_valr < 0
      then
        vbo_negtf   := true;
        vnu_valr    := -vnu_valr;
      end if;

      vnu_part_entir   := trunc (vnu_valr);
      vnu_part_decm    := vnu_valr - vnu_part_entir;

      while vnu_part_entir > 0
      loop
        vnu_valr_group      :=
          mod (vnu_part_entir
              ,1000);
        vnu_part_entir    := (vnu_part_entir - vnu_valr_group) / 1000;

        if vnu_valr_group > 0
        then
          -- Cas particulier pour "mille"
          if     vnu_compt_unite = 1
             and vnu_valr_group = 1
          then
            vva_group   := vta_tab_unite (vnu_compt_unite);
          else
            vva_group        := null;

            -- Mettre le nom de l'unité (ex: mille, million)
            if vnu_compt_unite > 0
            then
              vva_group   := vta_tab_unite (vnu_compt_unite);

              -- Il y aura un nombre devant, alors on met un espace
              if    vnu_valr_group > 1
                 or vnu_compt_unite > 1
              then
                vva_group      :=
                     ' '
                  || vva_group;

                -- Également mettre au pluriel si ce n'est pas 'mille'
                if     vnu_valr_group > 1
                   and vnu_compt_unite > 1
                then
                  vva_group      :=
                       vva_group
                    || 's';
                end if;
              end if;
            end if;

            --Traiter les dizaines et unités
            vnu_valr_unite      :=
              mod (vnu_valr_group
                  ,10);
            vnu_valr_group   := (vnu_valr_group - vnu_valr_unite) / 10;
            vnu_valr_dizn      :=
              mod (vnu_valr_group
                  ,10);
            vnu_valr_group   := (vnu_valr_group - vnu_valr_dizn) / 10;

            --Quelques particularités
            if     vnu_valr_dizn in (1
                                    ,7
                                    ,9)
               and vnu_valr_unite <= 6
            then
              vnu_valr_dizn    := vnu_valr_dizn - 1;
              vnu_valr_unite   := vnu_valr_unite + 10;
            end if;

            vva_group        :=
                 case
                   when     vnu_valr_dizn = 0
                        and vnu_valr_unite = 0
                   then
                     null
                   when vnu_valr_dizn = 0
                   then
                     vta_tab_chifr (vnu_valr_unite)
                   when     vnu_valr_unite in (1
                                              ,11)
                        and vnu_valr_dizn <> 8
                   then
                        vta_tab_dizn (vnu_valr_dizn)
                     || ' et '
                     || vta_tab_chifr (vnu_valr_unite)
                   when vnu_valr_unite = 0
                   then
                     vta_tab_dizn (vnu_valr_dizn)
                   else
                        vta_tab_dizn (vnu_valr_dizn)
                     || '-'
                     || vta_tab_chifr (vnu_valr_unite)
                 end
              || vva_group;

            -- Ajouter un 's' à 80 s'il termine le nombre
            if     vnu_compt_unite = 0
               and vnu_valr_dizn = 8
               and vnu_valr_unite = 0
            then
              vva_group      :=
                   vva_group
                || 's';
            end if;

            -- Inscrire les centaines
            if vnu_valr_group > 0
            then
              if    vnu_valr_dizn > 0
                 or vnu_valr_unite > 0
              then
                vva_group      :=
                     ' '
                  || vva_group;
              end if;

              vva_group      :=
                   case
                     when vnu_valr_group > 1
                     then
                          vta_tab_chifr (vnu_valr_group)
                       || ' '
                     else
                       null
                   end
                || 'cent'
                || case
                     when     vnu_valr_group > 1
                          and vnu_compt_unite = 0
                          and vnu_valr_dizn = 0
                          and vnu_valr_unite = 0
                     then
                       's'
                     else
                       null
                   end
                || vva_group;
            end if;
          end if;

          -- Ajouter le groupe au nom complet
          if vva_group is not null
          then
            if vva_retr is not null
            then
              vva_retr      :=
                   ' '
                || vva_retr;
            end if;

            vva_retr      :=
                 vva_group
              || vva_retr;
          end if;
        end if;

        vnu_compt_unite   := vnu_compt_unite + 1;
      end loop;

      if vbo_negtf
      then
        vva_retr      :=
             'moins '
          || vva_retr;
      end if;
    end if;

    return vva_retr;
  end;

  function to_char2 (pnu_valr    in number
                    ,pva_formt   in varchar2)
    return varchar2
  is
    vnu_valr         number default pnu_valr;
    vva_retr         varchar2 (600);
    vnu_part_decm    number (38, 38);
    vnu_part_entir   number (38);
    vbo_negtf        boolean default false;

    type typ_tab_demnt is varray (32) of varchar2 (5);

    type typ_tab_mesr is varray (32) of number (6, 5);

    vta_tab_demnt    typ_tab_demnt
                       default typ_tab_demnt ('1/32'
                                             ,'1/16'
                                             ,'3/32'
                                             ,'1/8'
                                             ,'5/32'
                                             ,'3/16'
                                             ,'7/32'
                                             ,'1/4'
                                             ,'9/32'
                                             ,'5/16'
                                             ,'11/32'
                                             ,'3/8'
                                             ,'13/32'
                                             ,'7/16'
                                             ,'15/32'
                                             ,'1/2'
                                             ,'17/32'
                                             ,'9/16'
                                             ,'19/32'
                                             ,'5/8'
                                             ,'21/32'
                                             ,'11/16'
                                             ,'23/32'
                                             ,'3/4'
                                             ,'25/32'
                                             ,'13/16'
                                             ,'27/32'
                                             ,'7/8'
                                             ,'29/32'
                                             ,'15/16'
                                             ,'31/32');

    vnu_indx_arond   pls_integer;
  begin
    if pnu_valr is null
    then
      vva_retr   := null;
    elsif upper (pva_formt) like 'IMPERIAL COURT%'
    then
      --Obtenir la partie décimale
      --obtenir la partie entière

      if vnu_valr < 0
      then
        vbo_negtf   := true;
        vnu_valr    := -vnu_valr;
      end if;

      vnu_part_entir   := trunc (vnu_valr);
      vnu_part_decm    := vnu_valr - vnu_part_entir;

      case upper (pva_formt)
        when 'IMPERIAL COURT/1'
        then
          vnu_indx_arond   := 0;
        when 'IMPERIAL COURT/2'
        then
          vnu_indx_arond   := trunc (vnu_part_decm * 2) * 16;
        when 'IMPERIAL COURT/4'
        then
          vnu_indx_arond   := trunc (vnu_part_decm * 4) * 8;
        when 'IMPERIAL COURT/8'
        then
          vnu_indx_arond   := trunc (vnu_part_decm * 8) * 4;
        when 'IMPERIAL COURT/16'
        then
          vnu_indx_arond   := trunc (vnu_part_decm * 16) * 2;
        else
          vnu_indx_arond   := trunc (vnu_part_decm * 32);
      end case;

      if vnu_indx_arond = 0
      then
        vva_retr   := null;
      else
        vva_retr   := vta_tab_demnt (vnu_indx_arond);
      end if;

      if vva_retr is not null
      then
        vva_retr      :=
             vnu_part_entir
          || '" '
          || vva_retr;
      else
        vva_retr      :=
             vnu_part_entir
          || '"';
      end if;
    elsif upper (pva_formt) like 'IMPERIAL LONG%'
    then
      if vnu_valr < 0
      then
        vbo_negtf   := true;
        vnu_valr    := -vnu_valr;
      end if;

      --trouver le nombre de pieds et rappeller pour les pouces
      vnu_part_entir   := trunc (vnu_valr / 12);

      vva_retr         :=
           vnu_part_entir
        || ''' '
        || to_char2 (vnu_valr - (vnu_part_entir * 12)
                    ,replace (upper (pva_formt)
                             ,'LONG'
                             ,'COURT'));
    elsif upper (pva_formt) like 'IMPERIAL VERGE%'
    then
      if vnu_valr < 0
      then
        vbo_negtf   := true;
        vnu_valr    := -vnu_valr;
      end if;

      --trouver le nombre de verges et rappeller pour les pieds
      vnu_part_entir   := trunc (vnu_valr / 36);

      vva_retr         :=
           vnu_part_entir
        || 'vg '
        || to_char2 (vnu_valr - (vnu_part_entir * 36)
                    ,replace (upper (pva_formt)
                             ,'VERGE'
                             ,'LONG'));
    elsif pva_formt = 'TEXTE'
    then
      vva_retr   := upper (formt_texte (pnu_valr));
    elsif pva_formt = 'texte'
    then
      vva_retr   := lower (formt_texte (pnu_valr));
    elsif pva_formt = 'Texte'
    then
      vva_retr      :=
           upper (substr (formt_texte (pnu_valr)
                         ,1
                         ,1))
        || lower (substr (formt_texte (pnu_valr)
                         ,2));
    elsif upper (pva_formt) = 'CENTS'
    then
      vva_retr      :=
        to_char (mod (trunc (pnu_valr * 100)
                     ,100)
                ,'FM00');
    elsif pva_formt is null
    then
      vva_retr   := to_char (pnu_valr);
    else
      vva_retr      :=
        to_char (pnu_valr
                ,pva_formt);
    end if;

    if vbo_negtf
    then
      return    '-'
             || vva_retr;
    else
      return vva_retr;
    end if;
  end to_char2;

  function to_number2 (pva_valr    in varchar2
                      ,pva_formt   in varchar2 default null)
    return number
  is
    nombr_inval       exception;

    vva_valr          varchar2 (100)
                        default replace (trim (pva_valr)
                                        ,'.'
                                        ,',');
    vnu_retr          number;
    var_mots          apex_application_global.vc_arr2;
    var_unite         afw_07_util_pkg.typ_table_nu_ibpls;
    vva_mot           varchar2 (20);
    vnu_nb_mots       number;
    vbo_tous_unite    boolean;
    vnu_dernr_unite   number;
    vnu_unite_atend   number;
    vbo_negtf         boolean default false;

    function valr_mot_unit (pva_mot     in varchar2
                           ,pnu_unite   in number)
      return number
    is
      vnu_pos_slash   number;
      vnu_retr        number;
    begin
      case pnu_unite
        when 4
        then -- verge
          return to_number (pva_mot) * 36;
        when 3
        then -- pied
          return to_number (pva_mot) * 12;
        when 2
        then -- pouce
          return to_number (pva_mot);
        when 1
        then -- fraction de pouce
          vnu_pos_slash      :=
            instr (pva_mot
                  ,'/');

          if vnu_pos_slash = 0
          then
            raise nombr_inval;
          end if;

          if to_number (substr (pva_mot
                               ,vnu_pos_slash + 1)) not in (2
                                                           ,4
                                                           ,8
                                                           ,16
                                                           ,32)
          then
            raise nombr_inval;
          end if;

          return   to_number (substr (pva_mot
                                     ,1
                                     ,vnu_pos_slash - 1))
                 / to_number (substr (pva_mot
                                     ,vnu_pos_slash + 1));
        else
          raise nombr_inval;
      end case;
    end;
  begin
    -- Supprimer les espaces doubles en trop
    while instr (vva_valr
                ,'  ') > 0
    loop
      vva_valr      :=
        replace (vva_valr
                ,'  '
                ,' ');
    end loop;

    if vva_valr is null
    then
      return null;
    elsif upper (pva_formt) like 'IMPERIAL %'
    then
      var_mots         :=
        afw_07_util_pkg.string_to_table (replace (vva_valr
                                                 ,' '
                                                 ,':'));
      vnu_nb_mots      := var_mots.count ();

      -- Lire l'unité des mots
      vbo_tous_unite   := true;

      for i in 1 .. vnu_nb_mots
      loop
        vva_mot        := var_mots (i);

        if vva_mot like '-%'
        then
          if i = 1
          then
            vva_mot      :=
              substr (vva_mot
                     ,2);
            vbo_negtf   := true;
          else
            raise nombr_inval;
          end if;
        end if;

        if vva_mot like '%/%'
        then
          var_unite (i)   := 1; -- Fraction
        elsif vva_mot like '%"'
        then
          var_unite (i)   := 2; -- Pouce
          vva_mot         :=
            substr (vva_mot
                   ,1
                   ,length (vva_mot) - 1);
        elsif vva_mot like '%'''''
        then
          var_unite (i)   := 2; -- Pouce
          vva_mot         :=
            substr (vva_mot
                   ,1
                   ,length (vva_mot) - 2);
        elsif vva_mot like '%'''
        then
          var_unite (i)   := 3; -- Pied
          vva_mot         :=
            substr (vva_mot
                   ,1
                   ,length (vva_mot) - 1);
        elsif lower (vva_mot) like '%vg'
        then
          var_unite (i)   := 4; -- Verge
          vva_mot         :=
            substr (vva_mot
                   ,1
                   ,length (vva_mot) - 2);
        else
          var_unite (i)    := 0; -- Aucun ou invalide
          vbo_tous_unite   := false;
        end if;

        var_mots (i)   := vva_mot;
      end loop;

      vnu_retr         := 0;

      if vbo_tous_unite
      then
        -- Accepter toutes les unités, pourvus qu'ils soient dans le bon ordre
        vnu_dernr_unite   := var_unite (1) + 1;

        for i in 1 .. vnu_nb_mots
        loop
          if var_unite (i) < vnu_dernr_unite
          then
            vnu_retr          :=
                vnu_retr
              + valr_mot_unit (var_mots (i)
                              ,var_unite (i));
            vnu_dernr_unite   := var_unite (i);
          else
            raise nombr_inval;
          end if;
        end loop;
      else
        if var_unite (vnu_nb_mots) = 1
        then -- Fraction
          vnu_unite_atend   := vnu_nb_mots;
        elsif upper (pva_formt) like 'IMPERIAL COURT%'
        then
          vnu_unite_atend   := 2; -- Pouce
        elsif upper (pva_formt) like 'IMPERIAL LONG%'
        then
          vnu_unite_atend   := 3; -- Pied
        elsif upper (pva_formt) like 'IMPERIAL VERGE%'
        then
          vnu_unite_atend   := 4; -- Verge
        else
          raise nombr_inval;
        end if;

        for i in 1 .. vnu_nb_mots
        loop
          if    var_unite (i) = 0
             or var_unite (i) = vnu_unite_atend
          then
            vnu_retr          :=
                vnu_retr
              + valr_mot_unit (var_mots (i)
                              ,vnu_unite_atend);
            vnu_unite_atend   := vnu_unite_atend - 1;
          else
            raise nombr_inval;
          end if;
        end loop;
      end if;

      if vbo_negtf
      then
        vnu_retr   := -vnu_retr;
      end if;
    elsif pva_formt is null
    then
      vnu_retr   := to_number (vva_valr);
    else
      vnu_retr      :=
        to_number (vva_valr
                  ,pva_formt);
    end if;

    return vnu_retr;
  exception
    when others
    then
      afw_01_err_apex_pkg.lever_err_apex_code ('SIE.000008'
                                              ,pva_valr
                                              ,pva_formt
                                              ,pva_code_prodt   => 'AFW');
  end to_number2;

  function obten_seqnc (pva_defnt_formt   in varchar2
                       ,pva_code_prodt    in varchar2 default afw_11_prodt_pkg.obten_code_prodt)
    return number
  is
    vnu_seqnc   number (10);
  begin
    select seqnc
      into vnu_seqnc
      from vd_afw_14_formt
     where     defnt = pva_defnt_formt
           and ref_prodt = afw_11_prodt_pkg.obten_prodt (pva_code_prodt);

    return vnu_seqnc;
  exception
    when no_data_found
    then
      return null;
  end obten_seqnc;
end afw_14_formt_pkg;
/
