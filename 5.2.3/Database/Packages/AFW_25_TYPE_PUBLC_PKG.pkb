SET DEFINE OFF;
create or replace package body afw_25_type_publc_pkg
is
  procedure alimn_domn_type_publc (pnu_seqnc in number)
  is
    cseqnc   vd_i_afw_12_domn.seqnc%type;

    cursor c_domn
    is
      select seqnc
        from vd_i_afw_12_domn;
  begin
    open c_domn;

    loop
      fetch c_domn
        into cseqnc;

      exit when c_domn%notfound;

      if c_domn%found
      then
        afw_25_domn_type_publc_pkg.ajout_domn_type_publc (cseqnc
                                                         ,pnu_seqnc);
      end if;
    end loop;

    close c_domn;
  end alimn_domn_type_publc;
end afw_25_type_publc_pkg;
/
