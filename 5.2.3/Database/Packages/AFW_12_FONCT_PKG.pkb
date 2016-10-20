SET DEFINE OFF;
create or replace package body afw_12_fonct_pkg
as
  function verif_activ_fonct_domn (pnu_struc_aplic in number)
    return boolean
  is
    vnu_domn    number (10) default afw_12_domn_pkg.obten_domn_sesn ();
    vnu_count   pls_integer;
  begin
    select count (1)
      into vnu_count
      from vd_i_afw_12_domn_fonct        df
          ,vd_i_afw_12_fonct_struc_aplic fsa
     where     df.ref_domn = vnu_domn
           and df.ref_fonct = fsa.ref_fonct
           and fsa.ref_struc_aplic = pnu_struc_aplic
           and df.indic_actif = 'O'
           and rownum = 1;

    return vnu_count = 1;
  end verif_activ_fonct_domn;

  function verif_activ_fonct_domn (pva_struc_aplic in varchar2)
    return boolean
  is
  begin
    return verif_activ_fonct_domn (afw_12_struc_aplic_pkg.obten_seqnc (pva_struc_aplic));
  end verif_activ_fonct_domn;

  function verfr_fonct_domn_exist (pnu_struc_aplic in number)
    return boolean
  is
    vnu_dummy   number (1);
    vnu_domn    number (10) default afw_12_domn_pkg.obten_domn_sesn ();
  begin
    select 1
      into vnu_dummy
      from vd_i_afw_12_domn_fonct        df
          ,vd_i_afw_12_fonct_struc_aplic fsa
     where     df.ref_domn = vnu_domn
           and df.ref_fonct = fsa.ref_fonct
           and fsa.ref_struc_aplic = pnu_struc_aplic
           and rownum = 1;

    return true;
  exception
    when no_data_found
    then
      return false;
  end verfr_fonct_domn_exist;

  function verfr_fonct_domn_exist (pva_struc_aplic in varchar2)
    return boolean
  is
  begin
    return verfr_fonct_domn_exist (afw_12_struc_aplic_pkg.obten_seqnc (pva_struc_aplic));
  end verfr_fonct_domn_exist;

  procedure ajout_opert_domn (pnu_opert_domn   in number
                             ,pnu_domn_cible   in number)
  is
  begin
    insert into vd_afw_12_gr_ut_opert_opt_dom (ref_group_utils
                                              ,ref_opert
                                              ,ref_opert_optio
                                              ,ref_domn)
      select ref_group_utils
            ,ref_opert
            ,ref_opert_optio
            ,pnu_domn_cible
        from vd_afw_12_gr_ut_opert_opt_dom
       where seqnc = pnu_opert_domn;
  end ajout_opert_domn;

  procedure ajout_fonct_domn (pnu_domn_fonct   in number
                             ,pnu_domn_cible   in number)
  is
  begin
    insert into vd_afw_12_domn_fonct (ref_fonct
                                     ,indic_actif
                                     ,ref_domn)
      select ref_fonct
            ,indic_actif
            ,pnu_domn_cible
        from vd_afw_12_domn_fonct
       where seqnc = pnu_domn_fonct;
  end ajout_fonct_domn;

  function obten_liste_fonct (pnu_page in vd_i_afw_13_page.seqnc%type)
    return varchar2
  is
    vva_liste   varchar2 (4000);

    cursor cur_fonct (pnu_page in vd_i_afw_13_page.seqnc%type)
    is
      select f.nom
        from vd_afw_12_fonct f
       where exists
               (select null
                  from vd_afw_12_fonct_struc_aplic fsa
                      ,vd_afw_13_page              p
                 where     p.seqnc = pnu_page
                       and fsa.ref_struc_aplic = p.ref_struc_aplic
                       and fsa.ref_fonct = f.seqnc);
  begin
    for rec_fonct in cur_fonct (pnu_page)
    loop
      vva_liste      :=
           vva_liste
        || ', '
        || rec_fonct.nom;
    end loop;

    return ltrim (vva_liste
                 ,', ');
  end obten_liste_fonct;
end afw_12_fonct_pkg;
/
