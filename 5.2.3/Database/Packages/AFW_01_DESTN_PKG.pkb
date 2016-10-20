SET DEFINE OFF;
create or replace package body afw_01_destn_pkg
as
  procedure creer_destn (pnu_destn       in number
                        ,pva_nom_elemn   in varchar2
                        ,pnu_reslt_1     in number
                        ,pnu_reslt_2     in number
                        ,pnu_reslt_3     in number
                        ,pnu_reslt_4     in number
                        ,pnu_reslt_5     in number
                        ,pnu_reslt_6     in number)
  is
    vva_ident_acces         varchar2 (4000);
    vva_ident_acces_formt   varchar2 (4000);
  begin
    select    sa.code
           || '['
           || asa.nom_coln
           || ']'
          ,   sa.nom
           || '['
           || asa.nom_fonct
           || ']'
      into vva_ident_acces
          ,vva_ident_acces_formt
      from vd_afw_12_struc_aplic       sa
          ,vd_afw_12_atrib_struc_aplic asa
          ,vd_afw_01_destn             d
     where     d.seqnc = pnu_destn
           and asa.seqnc = d.ref_atrib_struc_aplic
           and sa.seqnc = asa.ref_struc_aplic;

    if pnu_reslt_2 is not null
    then
      select    sa.code
             || '['
             || asa.nom_coln
             || ']'
             || '.'
             || vva_ident_acces
        into vva_ident_acces
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_2
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;

      select    sa.nom
             || '['
             || asa.nom_fonct
             || ']'
             || '.'
             || vva_ident_acces_formt
        into vva_ident_acces_formt
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_2
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;
    end if;

    if pnu_reslt_3 is not null
    then
      select    sa.code
             || '['
             || asa.nom_coln
             || ']'
             || '.'
             || vva_ident_acces
        into vva_ident_acces
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_3
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;

      select    sa.nom
             || '['
             || asa.nom_fonct
             || ']'
             || '.'
             || vva_ident_acces_formt
        into vva_ident_acces_formt
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_3
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;
    end if;

    if pnu_reslt_4 is not null
    then
      select    sa.code
             || '['
             || asa.nom_coln
             || ']'
             || '.'
             || vva_ident_acces
        into vva_ident_acces
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_4
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;

      select    sa.nom
             || '['
             || asa.nom_fonct
             || ']'
             || '.'
             || vva_ident_acces_formt
        into vva_ident_acces_formt
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_4
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;
    end if;

    if pnu_reslt_5 is not null
    then
      select    sa.code
             || '['
             || asa.nom_coln
             || ']'
             || '.'
             || vva_ident_acces
        into vva_ident_acces
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_5
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;

      select    sa.nom
             || '['
             || asa.nom_fonct
             || ']'
             || '.'
             || vva_ident_acces_formt
        into vva_ident_acces_formt
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_5
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;
    end if;

    if pnu_reslt_6 is not null
    then
      select    sa.code
             || '['
             || asa.nom_coln
             || ']'
             || '.'
             || vva_ident_acces
        into vva_ident_acces
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_6
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;

      select    sa.nom
             || '['
             || asa.nom_fonct
             || ']'
             || '.'
             || vva_ident_acces_formt
        into vva_ident_acces_formt
        from vd_afw_12_atrib_struc_aplic asa
            ,vd_afw_12_struc_aplic       sa
       where     asa.seqnc = pnu_reslt_6
             and sa.seqnc = asa.ref_atrib_struc_aplic_seqnc_sa;
    end if;

    insert into vd_afw_01_reslt_destn (ref_destn
                                      ,nom
                                      ,ident_acces
                                      ,ident_acces_formt)
         values (pnu_destn
                ,pva_nom_elemn
                ,vva_ident_acces
                ,vva_ident_acces_formt);
  end;
end afw_01_destn_pkg;
/
