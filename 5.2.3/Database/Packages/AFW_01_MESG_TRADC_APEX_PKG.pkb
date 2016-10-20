SET DEFINE OFF;
create or replace package body afw_01_mesg_tradc_apex_pkg
as
  function verif_exist_mesg (pnu_numr_aplic_apex   in number
                            ,pva_nom_mesg          in varchar2
                            ,pva_code_lang         in varchar2)
    return number
  is
    vnu_id   number;
  begin
    select id
      into vnu_id
      from apex_text_mesg atm
     where     atm.name = pva_nom_mesg
           and atm.message_language = pva_code_lang
           and atm.flow_id = pnu_numr_aplic_apex;

    return vnu_id;
  exception
    when others
    then
      return null;
  end verif_exist_mesg;

  procedure creer_mesg (pnu_numr_aplic_apex   in number
                       ,pva_nom               in varchar2
                       ,pva_code_lang         in varchar2
                       ,pva_mesg              in varchar2
                       ,pnu_scrt_id           in number)
  is
  begin
    insert into apex_text_mesg atm (flow_id
                                   ,name
                                   ,message_language
                                   ,message_text
                                   ,security_group_id)
         values (pnu_numr_aplic_apex
                ,pva_nom
                ,pva_code_lang
                ,pva_mesg
                ,pnu_scrt_id);
  end creer_mesg;

  procedure suprm_mesg (pnu_numr_aplic_apex   in number
                       ,pnu_id                in number)
  is
  begin
    delete apex_text_mesg
     where     id = pnu_id
           and flow_id = pnu_numr_aplic_apex;
  end suprm_mesg;

  procedure pousr_mesg_dans_aplic_apex (pnu_prodt in number)
  is
    cursor cur_app_mesg
    is
      select ta.nom
            ,ta.ref_lang
            ,ta.text
            ,a.numr_aplic_apex
            ,aa.security_group_id
        from vd_i_afw_01_mesg_tradc_apex ta
            ,vd_i_afw_11_aplic           a
            ,vd_i_afw_11_prodt           p
            ,apex_aplic                  aa
       where     p.seqnc = pnu_prodt
             and ta.ref_prodt = p.seqnc
             and a.ref_prodt = p.seqnc
             and a.numr_aplic_apex = aa.id;

    vnu_id_mesg     number;
    vnu_scrt_id     number default wwv_flow_api.get_security_group_id ();
    vva_code_lang   varchar2 (10);
  begin
    for rec_app_mesg in cur_app_mesg
    loop
      select lower (code)
        into vva_code_lang
        from vd_i_afw_01_lang
       where seqnc = rec_app_mesg.ref_lang;

      vnu_id_mesg      :=
        verif_exist_mesg (rec_app_mesg.numr_aplic_apex
                         ,rec_app_mesg.nom
                         ,vva_code_lang);

      if vnu_id_mesg is not null
      then
        suprm_mesg (rec_app_mesg.numr_aplic_apex
                   ,vnu_id_mesg);
      end if;

      creer_mesg (rec_app_mesg.numr_aplic_apex
                 ,rec_app_mesg.nom
                 ,vva_code_lang
                 ,rec_app_mesg.text
                 ,rec_app_mesg.security_group_id);
    end loop;
  end pousr_mesg_dans_aplic_apex;

  procedure pousr_mesg (pnu_mesg_tradc_apex in number)
  is
    vnu_scrt_id     number default wwv_flow_api.get_security_group_id ();
    vva_code_lang   varchar2 (23);
    vva_nom         varchar2 (255);
    vva_text_mesg   varchar2 (4000);
    vnu_id_mesg     number;
    vnu_prodt       number;

    cursor cur_aplic (pnu_prodt in number)
    is
      select numr_aplic_apex
            , (select security_group_id
                 from apex_aplic aa
                where aa.id = ap.numr_aplic_apex)
               mesg_group_id
        from vd_afw_11_aplic ap
       where ref_prodt = pnu_prodt;
  begin
    select lang
          ,nom
          ,text
          ,ref_prodt
      into vva_code_lang
          ,vva_nom
          ,vva_text_mesg
          ,vnu_prodt
      from vd_afw_01_mesg_tradc_apex ta
     where seqnc = pnu_mesg_tradc_apex;

    for rec_aplic in cur_aplic (vnu_prodt)
    loop
      vnu_id_mesg      :=
        verif_exist_mesg (rec_aplic.numr_aplic_apex
                         ,vva_nom
                         ,vva_code_lang);

      if vnu_id_mesg is not null
      then
        suprm_mesg (rec_aplic.numr_aplic_apex
                   ,vnu_id_mesg);
      end if;

      wwv_flow_api.set_security_group_id (p_security_group_id => rec_aplic.mesg_group_id);

      wwv_flow_api.create_message (null
                                  ,rec_aplic.numr_aplic_apex
                                  ,vva_nom
                                  ,vva_code_lang
                                  ,vva_text_mesg);

      wwv_flow_api.set_security_group_id (p_security_group_id => vnu_scrt_id);
    end loop;
  end pousr_mesg;
end afw_01_mesg_tradc_apex_pkg;
/
