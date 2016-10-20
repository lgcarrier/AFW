SET DEFINE OFF;
create or replace trigger afw_04_fil_arian_bi_trg
  before insert
  on afw_04_fil_arian
  for each row
declare
  vva_utils_bidon   varchar2 (30);
  vda_date_bidon    date;
  vnu_seqnc         number (10);
begin
  if     inserting
     and :new.seqnc is null
  then
    :new.seqnc   := afw_04_fil_arian_seq.nextval;
  end if;

  if :new.timst is null
  then
    :new.timst   := systimestamp;
  end if;

  if :new.app_id is null
  then
    :new.app_id   := afw_07_util_pkg.nv ('APP_ID');
  end if;

  if :new.libl is null
  then
    begin
      select seqnc
        into vnu_seqnc
        from vd_afw_13_page p
       where     p.ref_aplic = afw_11_aplic_pkg.obten_aplic_numr_apex (:new.app_id)
             and numr_apex = :new.page;

      select nom
        into :new.libl
        from vd_afw_13_page_lang pl
       where     pl.ref_page = vnu_seqnc
             and pl.ref_lang = afw_01_lang_pkg.obten_lang_sesn ()
             and (   pl.ref_dv_type_expre is null
                  or pl.ref_dv_type_expre_formt = 'FIXE');
    exception
      when others
      then
        /*
        ete ('Page non definie dans le systeme de pilotage');
        ete ('page'
            ,:new.page);
        ete ('app_id'
            ,:new.app_id);
        ete ('aplic'
            ,afw_11_aplic_pkg.obten_numr_apex_aplic);
        */
        :new.libl   := afw_13_page_lang_cu_pkg.kva_mesg_par_deft;
    end;
  end if;


  afw_07_util_pkg.genr_valr_audit (inserting
                                  ,updating
                                  ,:new.utils_creat
                                  ,:new.date_creat
                                  ,vva_utils_bidon
                                  ,vda_date_bidon);
end afw_04_fil_arian_bi_trg;
/
