SET DEFINE OFF;
create or replace package body afw_29_asurn_qualt_pkg
as
  procedure exect_reqt (pva_liste_contrl   in varchar2
                       ,pnu_page           in number default null)
  is
    cursor cur_contr
    is
      select c.seqnc
            ,c.nom_struc_acces
            ,c.niv_gravt
        from vd_afw_29_contr c
       where instr (   ':'
                    || pva_liste_contrl
                    || ':'
                   ,   ':'
                    || to_char (c.seqnc)
                    || ':') > 0;

    vva_where   varchar2 (1000);
  begin
    vva_where   := 'where flow_id not between 4000 and 4999';

    if pnu_page is not null
    then
      vva_where      :=
           vva_where
        || ' and page_id = '
        || pnu_page;

      delete vd_i_afw_29_reslt_requt_aq
       where     page_id = pnu_page
             and instr (   ':'
                        || pva_liste_contrl
                        || ':'
                       ,   ':'
                        || to_char (ref_contr)
                        || ':') > 0;
    else
      delete vd_i_afw_29_reslt_requt_aq
       where instr (   ':'
                    || pva_liste_contrl
                    || ':'
                   ,   ':'
                    || to_char (ref_contr)
                    || ':') > 0;
    end if;

    for rec_contr in cur_contr
    loop
      execute immediate
           'insert into vd_i_afw_29_reslt_requt_aq(ref_contr,id,flow_id,page_id,nom_comps,natr,niv_gravt)
        select :ref_contr, sa.id, sa.flow_id, sa.page_id, sa.nom_comps, sa.natr, :niv_gravt
          from '
        || rec_contr.nom_struc_acces
        || ' sa '
        || vva_where
        using rec_contr.seqnc
             ,rec_contr.niv_gravt;
    end loop;
  exception
    when others
    then
      raise;
  end exect_reqt;
end afw_29_asurn_qualt_pkg;
/
