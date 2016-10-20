SET DEFINE OFF;
create or replace package body afw_03_journ_unitr_pkg
as
  type rec_ocurn_hisrc_struc_aplic is record
  (
    seqnc_ocurn_struc_aplic   number (10)
   ,code_struc_aplic          varchar2 (30)
  );

  type tab_hierc_struc_aplic is table of rec_ocurn_hisrc_struc_aplic
    index by pls_integer;

  gta_hierc_struc_aplic   tab_hierc_struc_aplic;

  type rec_journ_unitr is record
  (
    date_time     date
   ,actio_journ   varchar2 (200)
   ,don_nomnl     varchar2 (200)
   ,reslt         varchar2 (500)
   ,numr_err      varchar2 (10)
  );

  type tab_journ_unitr is table of rec_journ_unitr
    index by pls_integer;

  type rec_ocurn_seqnc_struc_aplic is record
  (
    domn                number (10)
   ,code_struc_aplic    varchar2 (30)
   ,seqnc_struc_aplic   number (10)
   ,journ               tab_journ_unitr
  );

  type tab_journ is table of rec_ocurn_seqnc_struc_aplic
    index by varchar2 (30);

  gta_journ               tab_journ;
  gnu_i                   pls_integer;

  procedure ajout_journ (actio_journ    varchar2
                        ,don_nomnl      varchar2 default null
                        ,reslt          varchar2 default null
                        ,numr_err       varchar2 default null)
  is
    vnu_j   pls_integer;
  begin
    vnu_j                                         := gta_journ (gnu_i).journ.count () + 1;
    gta_journ (gnu_i).code_struc_aplic            := gta_hierc_struc_aplic (gnu_i).code_struc_aplic;
    gta_journ (gnu_i).seqnc_struc_aplic           := gta_hierc_struc_aplic (gnu_i).seqnc_ocurn_struc_aplic;
    gta_journ (gnu_i).journ (vnu_j).date_time     := sysdate;
    gta_journ (gnu_i).journ (vnu_j).actio_journ   := actio_journ;
    gta_journ (gnu_i).journ (vnu_j).don_nomnl     := don_nomnl;
    gta_journ (gnu_i).journ (vnu_j).reslt         := reslt;
    gta_journ (gnu_i).journ (vnu_j).numr_err      := numr_err;
  end ajout_journ;

  procedure ecrir_journ
  is
    pragma autonomous_transaction;
    vnu_struc_aplic   number (10);
  begin
    if gta_journ.count () != 0
    then
      for i in gta_journ.first () .. gta_journ.last ()
      loop
        if gta_journ (i).journ.count () != 0
        then
          vnu_struc_aplic   := afw_12_struc_aplic_pkg.obten_seqnc (gta_journ (i).code_struc_aplic);

          if vnu_struc_aplic is null
          then
            select seqnc
              into vnu_struc_aplic
              from vd_afw_12_struc_aplic
             where     code = gta_journ (i).code_struc_aplic
                   and ref_prodt = afw_11_prodt_pkg.obten_prodt_sesn;
          end if;

          for j in gta_journ (i).journ.first () .. gta_journ (i).journ.last ()
          loop
            insert into vd_i_afw_03_journ_struc_aplic (ref_domn
                                                      ,struc_aplic
                                                      ,seqnc_struc_aplic
                                                      ,date_time
                                                      ,numr_err
                                                      ,actio_journ
                                                      ,don_nomnl
                                                      ,reslt)
                 values (gta_journ (i).domn
                        ,vnu_struc_aplic
                        ,gta_journ (i).seqnc_struc_aplic
                        ,gta_journ (i).journ (j).date_time
                        ,gta_journ (i).journ (j).numr_err
                        ,gta_journ (i).journ (j).actio_journ
                        ,gta_journ (i).journ (j).don_nomnl
                        ,gta_journ (i).journ (j).reslt);
          end loop;
        end if;
      end loop;
    end if;

    commit;
  end ecrir_journ;

  procedure defnr_struc_aplic_hierc (pva_code_struc_aplic    in varchar2
                                    ,pnu_seqnc_struc_aplic   in number)
  is
  begin
    if gnu_i is null
    then
      gnu_i   := 0;
    end if;

    if     gnu_i != 0
       and gta_hierc_struc_aplic (gnu_i).seqnc_ocurn_struc_aplic = pnu_seqnc_struc_aplic
       and gta_hierc_struc_aplic (gnu_i).code_struc_aplic = pva_code_struc_aplic
    then
      null;
    else
      gnu_i                                                   := nvl (gnu_i, 0) + 1;
      gta_hierc_struc_aplic (gnu_i).seqnc_ocurn_struc_aplic   := pnu_seqnc_struc_aplic;
      gta_hierc_struc_aplic (gnu_i).code_struc_aplic          := pva_code_struc_aplic;
      --POUR TESTER
      gta_journ (gnu_i).domn                                  := nvl (afw_12_domn_pkg.obten_domn_sesn (), afw_12_domn_pkg.obten_seqnc_domn ('AFW'));
    end if;
  end defnr_struc_aplic_hierc;

  procedure suprm_struc_aplic_hierc (pva_code_struc_aplic    in varchar2
                                    ,pnu_seqnc_struc_aplic   in number)
  is
  begin
    if gnu_i is not null
    then
      for i in reverse 0 .. gnu_i
      loop
        if     gta_hierc_struc_aplic (i).seqnc_ocurn_struc_aplic = pnu_seqnc_struc_aplic
           and gta_hierc_struc_aplic (i).code_struc_aplic = pva_code_struc_aplic
        then
          gta_hierc_struc_aplic.delete (1
                                       ,gta_hierc_struc_aplic.last ());

          case
            when i = 1
            then
              gnu_i   := null;
            else
              gnu_i   := i - 1;
          end case;
        end if;
      end loop;
    end if;
  end suprm_struc_aplic_hierc;

  procedure reint
  is
  begin
    gta_hierc_struc_aplic.delete ();
    gta_journ.delete ();
    gnu_i   := null;
  end reint;
end afw_03_journ_unitr_pkg;
/
