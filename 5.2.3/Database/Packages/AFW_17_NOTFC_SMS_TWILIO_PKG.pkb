SET DEFINE OFF;
create or replace package body afw_17_notfc_sms_twilio_pkg
as
  gxm_repns_servr      xmltype;
  gva_acoun_id         varchar2 (100);
  gva_authn_token      varchar2 (100);
  gva_empla_walt       varchar2 (100);
  gva_mot_passe_walt   varchar2 (100);

  function encod_sms (pva_mesg in varchar2)
    return varchar2
  is
    vva_text   varchar2 (500) default pva_mesg;
  begin
    vva_text      :=
      replace (vva_text
              ,' '
              ,'+');
    vva_text      :=
      replace (vva_text
              ,'é'
              ,'e');
    vva_text      :=
      replace (vva_text
              ,'è'
              ,'e');
    vva_text      :=
      replace (vva_text
              ,'ê'
              ,'e');
    vva_text      :=
      replace (vva_text
              ,'à'
              ,'a');
    vva_text      :=
      replace (vva_text
              ,'â'
              ,'a');
    vva_text      :=
      replace (vva_text
              ,'ô'
              ,'o');
    vva_text      :=
      replace (vva_text
              ,'û'
              ,'u');
    vva_text      :=
      replace (vva_text
              ,'ä'
              ,'a');
    vva_text      :=
      replace (vva_text
              ,'ë'
              ,'e');
    vva_text      :=
      replace (vva_text
              ,'ï'
              ,'i');
    vva_text      :=
      replace (vva_text
              ,'ö'
              ,'o');
    return vva_text;
  end encod_sms;

  procedure defnr_varbl_compt (pnu_compt_twili in number)
  is
  begin
    select acoun_id
          ,authe_token
          ,reprt_walt
          ,mot_passe_walt
      into gva_acoun_id
          ,gva_authn_token
          ,gva_empla_walt
          ,gva_mot_passe_walt
      from vd_i_afw_17_compt_twili ct
     where ct.seqnc = pnu_compt_twili;

    utl_http.set_wallet (   'file:'
                         || gva_empla_walt
                        ,gva_mot_passe_walt);
  end defnr_varbl_compt;

  function obten_valr_iden (pva_iden in varchar2)
    return varchar2
  is
    vva_valr   varchar2 (300);
  begin
    if gxm_repns_servr is not null
    then
      vva_valr      :=
        gxm_repns_servr.extract (   '/TwilioResponse/SMSMessage/'
                                 || pva_iden
                                 || '/text()').getstringval ();
    end if;

    return vva_valr;
  exception
    when others
    then
      if sqlcode = -30625
      then --Valeur nulle dans le xml
        return null;
      else
        raise;
      end if;
  end obten_valr_iden;

  function obten_prix (pva_prix in varchar2)
    return number
  is
  begin
    begin
      return to_number (replace (pva_prix
                                ,'-'
                                ,null)
                       ,'990D00000');
    exception
      when others
      then
        return to_number (replace (replace (pva_prix
                                           ,'.'
                                           ,',')
                                  ,'-'
                                  ,null)
                         ,'990D00000');
    end;
  end obten_prix;

  procedure envoy_sms (pva_code_compt_twili   in varchar2
                      ,pnu_de                 in number
                      ,pnu_a                  in number
                      ,pva_mesg               in varchar2
                      ,pda_date_envo_difr     in date default null)
  is
    vnu_sms   number (10);
  begin
    vnu_sms      :=
      envoy_sms (pva_code_compt_twili
                ,pnu_de
                ,pnu_a
                ,pva_mesg
                ,pda_date_envo_difr);
  end envoy_sms;

  function envoy_sms (pva_code_compt_twili   in varchar2
                     ,pnu_de                 in number
                     ,pnu_a                  in number
                     ,pva_mesg               in varchar2
                     ,pda_date_envo_difr     in date default null)
    return number
  is
    pragma autonomous_transaction;
    knu_long_max_sms   constant pls_integer default 150;
    vva_contn                   varchar2 (32767);
    vva_ocurn_mesg              varchar2 (300);
    vnu_compt_twili             number (10);
    vnu_sms                     number (10);
    vnu_empla_espac             pls_integer;
    vnu_numr_mesg               number (3) default 0;
    vnu_group_sms               number (10);
    vnu_id_sesn                 number
                                  default nvl (v ('SESSION')
                                              ,to_number (to_char (sysdate
                                                                  ,'yyyymmddhh24misssss')));
  begin
    vva_contn   := pva_mesg;

    select ct.seqnc
      into vnu_compt_twili
      from vd_i_afw_17_compt_twili ct
     where ct.code = pva_code_compt_twili;

    while vva_contn is not null
    loop
      vnu_numr_mesg   := vnu_numr_mesg + 1;

      --Déterminer la rangée à envoyer
      if length (vva_contn) <= knu_long_max_sms + 10
      then
        vva_ocurn_mesg   := vva_contn;
        vva_contn        := null;
      else
        vva_ocurn_mesg      :=
          substr (vva_contn
                 ,1
                 ,knu_long_max_sms);
        --ne pas couper de mot donc revenir en arrière
        --trouver le dernier espace
        vnu_empla_espac      :=
          instr (vva_ocurn_mesg
                ,' '
                ,-1);

        --ne prendre que jusqu'à cet espace
        vva_ocurn_mesg      :=
          substr (vva_ocurn_mesg
                 ,1
                 ,vnu_empla_espac - 1);

        --Supprimer du contenu global à envoyer les mots envoyés par ce sms
        vva_contn      :=
          substr (vva_contn
                 ,vnu_empla_espac + 1);
      end if;

      insert into vd_i_afw_17_sms_twili (numr_de
                                        ,numr_a
                                        ,mesg
                                        ,stat_soums
                                        ,date_envoi_difr
                                        ,ref_compt_twili
                                        ,numr_mesg
                                        ,nombr_mesg_totl
                                        ,ref_mesg_precd
                                        ,id_sesn
                                        ,group_sms)
           values (pnu_de
                  ,to_number (   '1'
                              || pnu_a)
                  ,vva_ocurn_mesg
                  ,'A_ENVOY'
                  ,pda_date_envo_difr
                  ,vnu_compt_twili
                  ,vnu_numr_mesg
                  ,1
                  ,vnu_sms
                  ,vnu_id_sesn
                  ,vnu_group_sms)
        returning seqnc
             into vnu_sms;

      --le groupe de sms est la première sequence insérée, mise à jour par le trg et les autres, par le insert
      if vnu_group_sms is null
      then
        vnu_group_sms   := vnu_sms;
      end if;
    end loop;

    if vnu_numr_mesg > 1
    then
      update vd_i_afw_17_sms_twili
         set nombr_mesg_totl   = vnu_numr_mesg
            ,id_sesn           = null
       where id_sesn = vnu_id_sesn;
    end if;

    commit;
    return vnu_sms;
  exception
    when others
    then
      rollback;
      return null;
  end envoy_sms;

  procedure vider_file_atent (pva_code_compt_twili in varchar2)
  is
    pragma autonomous_transaction;
    vva_url                varchar2 (500) default 'https://api.twilio.com/2010-04-01/Accounts/%ACC_ID%/SMS/Messages';
    vva_contn              varchar2 (32767);
    vre_reqt               utl_http.req;
    vre_repns              utl_http.resp;
    vva_repns              varchar2 (32767);
    vnu_compt_twili        number (10);
    vnu_compt_twil_courn   number (10);
    vva_stat               varchar2 (30);

    cursor cur_sms
    is
        select seqnc
              ,numr_de
              ,numr_a
              ,case
                 when nombr_mesg_totl = 1
                 then
                   mesg
                 else
                      '('
                   || numr_mesg
                   || '/'
                   || nombr_mesg_totl
                   || ')'
                   || mesg
               end
                 mesg
              ,ref_compt_twili
              ,numr_mesg
              ,nombr_mesg_totl
          from vd_i_afw_17_sms_twili s
         where     s.stat_soums in ('A_ENVOY'
                                   ,'REPRS')
               and (   ref_compt_twili = vnu_compt_twili
                    or vnu_compt_twili is null)
               and (   date_envoi_difr is null
                    or date_envoi_difr <= sysdate)
      order by ref_compt_twili
              ,group_sms
              ,numr_mesg;
  begin
    for rec_sms in cur_sms
    loop
      if    vnu_compt_twil_courn is null
         or vnu_compt_twil_courn != rec_sms.ref_compt_twili
      then
        vnu_compt_twil_courn   := rec_sms.ref_compt_twili;
        defnr_varbl_compt (vnu_compt_twil_courn);
        vva_url                :=
          replace (vva_url
                  ,'%ACC_ID%'
                  ,gva_acoun_id);
      end if;

      begin
        --TODO::LGCARRIER
        --définir URL
        vva_contn         :=
             'From=+'
          || rec_sms.numr_de
          || '&To=+'
          || rec_sms.numr_a
          || '&Body='
          || encod_sms (rec_sms.mesg)
          || '&http://URL/pls/twilio/!afw_17_notfc_sms_twilio_pkg.confr_stat_envoi';

        vre_reqt          :=
          utl_http.begin_request (vva_url
                                 ,'POST');
        utl_http.set_header (vre_reqt
                            ,'content-length'
                            ,length (vva_contn));

        utl_http.set_header (vre_reqt
                            ,'content-type'
                            ,'application/x-www-form-urlencoded;charset="UTF-8"');

        utl_http.set_authentication (vre_reqt
                                    ,gva_acoun_id
                                    ,gva_authn_token);
        utl_http.write_text (vre_reqt
                            ,vva_contn);
        vre_repns         := utl_http.get_response (vre_reqt);
        utl_http.read_text (vre_repns
                           ,vva_repns
                           ,32767);

        utl_http.end_response (vre_repns);
        gxm_repns_servr   := xmltype (vva_repns);
        vva_stat          := obten_valr_iden ('Status');

        update vd_i_afw_17_sms_twili
           set repns_servr   = gxm_repns_servr
              ,stat_soums    = decode (vva_stat,  'queued', 'FILE_ATENT_TWILI',  'sent', 'ENVOY',  'failed', 'ECHEC_TWILI',  vva_stat)
              ,tw_sid        = obten_valr_iden ('Sid')
              ,tw_status     = vva_stat
              ,tw_uri        = obten_valr_iden ('Uri')
              ,tw_price      = obten_prix (obten_valr_iden ('Price'))
         where seqnc = rec_sms.seqnc;
      exception
        when others
        then
          update vd_i_afw_17_sms_twili
             set repns_servr   = xmltype (vva_repns)
                ,stat_soums    = 'ERREUR_VIDER_FILE'
           where seqnc = rec_sms.seqnc;
      end;
    end loop;

    commit;
  exception
    when others
    then
      null;
      rollback;
  end vider_file_atent;

  procedure maj_file_atent (pva_code_compt_twili in varchar2)
  is
    pragma autonomous_transaction;
    vre_reqt               utl_http.req;
    vre_repns              utl_http.resp;
    vva_repns              varchar2 (32767);
    vnu_compt_twili        number (10);
    vnu_compt_twil_courn   number (10);
    vva_stat               varchar2 (30);
    vva_url                varchar2 (100) default 'https://api.twilio.com';

    cursor cur_sms
    is
        select seqnc
              ,tw_uri
              ,ref_compt_twili
          from vd_i_afw_17_sms_twili s
         where     s.stat_soums = 'FILE_ATENT_TWILI'
               and (   ref_compt_twili = vnu_compt_twili
                    or vnu_compt_twili is null)
      order by ref_compt_twili;
  begin
    for rec_sms in cur_sms
    loop
      if    vnu_compt_twil_courn is null
         or vnu_compt_twil_courn != rec_sms.ref_compt_twili
      then
        vnu_compt_twil_courn   := rec_sms.ref_compt_twili;
        defnr_varbl_compt (vnu_compt_twil_courn);
      end if;

      begin
        vre_reqt          :=
          utl_http.begin_request (   vva_url
                                  || rec_sms.tw_uri
                                 ,'GET');

        utl_http.set_authentication (vre_reqt
                                    ,gva_acoun_id
                                    ,gva_authn_token);

        vre_repns         := utl_http.get_response (vre_reqt);
        utl_http.read_text (vre_repns
                           ,vva_repns
                           ,32767);

        utl_http.end_response (vre_repns);
        gxm_repns_servr   := xmltype (vva_repns);

        vva_stat          := obten_valr_iden ('Status');

        update vd_i_afw_17_sms_twili
           set repns_servr   = gxm_repns_servr
              ,stat_soums    = decode (vva_stat,  'queued', 'FILE_ATENT_TWILI',  'sent', 'ENVOY',  'failed', 'ECHEC_TWILI',  vva_stat)
              ,tw_sid        = obten_valr_iden ('Sid')
              ,tw_status     = vva_stat
              ,tw_price      = obten_prix (obten_valr_iden ('Price'))
         where seqnc = rec_sms.seqnc;
      exception
        when others
        then
          update vd_i_afw_17_sms_twili
             set repns_servr   = xmltype (vva_repns)
                ,stat_soums    = 'ERREUR_MAJ_FILE'
           where seqnc = rec_sms.seqnc;
      end;
    end loop;

    commit;
  exception
    when others
    then
      null;
      rollback;
  end maj_file_atent;


  procedure confr_stat_envoi (name_array    in typ_arr_parmt
                             ,value_array   in typ_arr_valr)
  is
  begin
    if name_array.count () != 0
    then
      for i in name_array.first () .. name_array.last ()
      loop
        ete (name_array (i)
            ,value_array (i));
      end loop;
    end if;
  end confr_stat_envoi;

  procedure recvr_sms (name_array    in typ_arr_parmt
                      ,value_array   in typ_arr_valr)
  is
    pragma autonomous_transaction;
    rec_sms   afw_17_sms_twili_entra%rowtype;
  begin
    if name_array.count () != 0
    then
      for i in name_array.first () .. name_array.last ()
      loop
        case    'TW_RECPT_'
             || upper (name_array (i))
          when 'TW_RECPT_ACCOUNTSID'
          then
            rec_sms.tw_recpt_accountsid   := value_array (i);
          when 'TW_RECPT_TOZIP'
          then
            rec_sms.tw_recpt_tozip   := value_array (i);
          when 'TW_RECPT_TOSTATE'
          then
            rec_sms.tw_recpt_tostate   := value_array (i);
          when 'TW_RECPT_TOCOUNTRY'
          then
            rec_sms.tw_recpt_tocountry   := value_array (i);
          when 'TW_RECPT_TOCITY'
          then
            rec_sms.tw_recpt_tocity   := value_array (i);
          when 'TW_RECPT_TOCITY'
          then
            rec_sms.tw_recpt_tocity   := value_array (i);
          when 'TW_RECPT_TO'
          then
            rec_sms.tw_recpt_to   := value_array (i);
          when 'TW_RECPT_SMSSTATUS'
          then
            rec_sms.tw_recpt_smsstatus   := value_array (i);
          when 'TW_RECPT_SMSSID'
          then
            rec_sms.tw_recpt_smssid   := value_array (i);
          when 'TW_RECPT_SMSMESSAGESID'
          then
            rec_sms.tw_recpt_smsmessagesid   := value_array (i);
          when 'TW_RECPT_FROMZIP'
          then
            rec_sms.tw_recpt_fromzip   := value_array (i);
          when 'TW_RECPT_FROMSTATE'
          then
            rec_sms.tw_recpt_fromstate   := value_array (i);
          when 'TW_RECPT_FROMCOUNTRY'
          then
            rec_sms.tw_recpt_fromcountry   := value_array (i);
          when 'TW_RECPT_FROMCITY'
          then
            rec_sms.tw_recpt_fromcity   := value_array (i);
          when 'TW_RECPT_FROM'
          then
            rec_sms.tw_recpt_from   := value_array (i);
          when 'TW_RECPT_BODY'
          then
            rec_sms.tw_recpt_body   := value_array (i);
          when 'TW_RECPT_APIVERSION'
          then
            rec_sms.tw_recpt_apiversion   := value_array (i);
          when 'TW_RECPT_ACCOUNTSID'
          then
            rec_sms.tw_recpt_accountsid   := value_array (i);
          else
            null;
        end case;
      end loop;
    end if;

    insert into vd_i_afw_17_sms_twili_entra
         values rec_sms;

    commit;
  end recvr_sms;
end afw_17_notfc_sms_twilio_pkg;
/
