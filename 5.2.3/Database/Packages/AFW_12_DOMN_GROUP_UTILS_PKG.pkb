SET DEFINE OFF;
create or replace package body afw_12_domn_group_utils_pkg
as
  procedure maj_ocurn_group_expos (pnu_domn in number)
  is
  begin
    merge into vd_i_afw_12_g_u_opert_opt_dom cible
         using (  select o.seqnc                                                 ref_opert
                        ,gu.seqnc                                                ref_group
                        ,min (oo.seqnc) keep (dense_rank first order by prepn asc) ref_optio
                        ,pnu_domn                                                ref_domn
                    from vd_i_afw_13_opert     o
                        ,vd_i_afw_13_opert_optio oo
                        ,vd_i_afw_12_group_utils gu
                   where     gu.indic_acces_globl = 'O'
                         and o.seqnc = oo.ref_opert
                group by o.seqnc
                        ,gu.seqnc) source
            on (    cible.ref_group_utils = source.ref_group
                and cible.ref_opert = source.ref_opert
                and cible.ref_domn = source.ref_domn)
    when not matched
    then
      insert     (ref_group_utils
                 ,ref_opert
                 ,ref_opert_optio
                 ,ref_domn)
          values (source.ref_group
                 ,source.ref_opert
                 ,source.ref_optio
                 ,source.ref_domn);
  end maj_ocurn_group_expos;

  procedure maj_tous_domn
  is
    cursor cur_domn
    is
      select seqnc
        from vd_afw_12_domn;
  begin
    for rec_domn in cur_domn
    loop
      maj_ocurn_group_expos (rec_domn.seqnc);
    end loop;
  end maj_tous_domn;
end afw_12_domn_group_utils_pkg;
/
