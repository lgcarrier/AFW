SET DEFINE OFF;
create or replace package body afw_25_domn_type_publc_pkg
is
  procedure ajout_domn_type_publc (pnu_domn   in number
                                  ,pnu_type   in number)
  is
  begin
    insert into vd_i_afw_25_domn_type_publc (ref_domn
                                            ,ref_type_publc)
         values (pnu_domn
                ,pnu_type);
  end ajout_domn_type_publc;

  procedure maj_domn_type_publc
  is
    cursor cur_domn
    is
      select seqnc
        from vd_i_afw_12_domn;

    cursor cur_type_publc
    is
      select seqnc
        from vd_i_afw_25_type_publc;
  begin
    for rec_domn in cur_domn
    loop
      for rec_type in cur_type_publc
      loop
        afw_25_domn_type_publc_pkg.ajout_domn_type_publc (rec_domn.seqnc
                                                         ,rec_type.seqnc);
      end loop;
    end loop;
  end maj_domn_type_publc;

  procedure creat_domn_type_publc (pnu_domn_type_publc   in number
                                  ,pnu_domn_cible        in number)
  is
  begin
    insert into vd_afw_25_domn_type_publc (ref_domn
                                          ,ref_type_publc
                                          ,ref_publc)
      select pnu_domn_cible
            ,ref_type_publc
            ,ref_publc
        from vd_afw_25_domn_type_publc
       where seqnc = pnu_domn_type_publc;
  end creat_domn_type_publc;
end afw_25_domn_type_publc_pkg;
/
