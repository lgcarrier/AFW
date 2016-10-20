/**
 * @namespace afw.afw_21.item.choix_aprob
 */
afw.afw_21.item.choix_aprob = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.item.choix_aprob.insta.length; i++) {
            if (afw.afw_21.item.choix_aprob.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.item.choix_aprob.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.item.choix_aprob.insta.length; i++) {
            if (afw.afw_21.item.choix_aprob.insta[i].id == pnu_id) {
                afw.afw_21.item.choix_aprob.insta.splice(i, 1);

                if (afw.jQuery.browser.msie != undefined && afw.jQuery.browser.msie && afw.jQuery.browser.version == "9.0") {
                    //Bug avec IE9: SCRIPT5009: « Object » est indéfini
                    //afw.jQuery("#" + pnu_id).dialog('destroy');

                    myObj = document.getElementById(pnu_id).parentNode;
                    myObj.parentNode.removeChild(myObj);
                } else {
                    afw.jQuery("#" + pnu_id).empty().dialog('destroy').remove();
                }
            }
        }
    },

    /**
     * @constructor
     */
    choix_aprob: function (pjs_optio) {
        var that = this;
        this.jQuery = afw.jQuery;
        this.node = false;
        this.id = false;
        this.initl = initl;

        this.optio = {
            vva_id: "",
            vva_titre: "",
            vnu_evolt_stat: "",
            vnu_procs_aprob: "",
            vva_mesg_confr: "",
            vva_plugn_ajax: "",
            vva_id_div_mesg: "afw_mesg_apex",
            vva_clas_custm: "",
            vnu_largr: 640,
            vnu_hautr: 320,
            vva_clas_dialg: "afw-21-contn-choix-aprob",
            vva_clas_body: "",
            vva_clas_fotr: "",
            vva_role_aprob: "",
            vob_role_aprob: {}
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(that.optio, pjs_optio);
            that.id = that.optio.vva_id;

        } //END initl

        return that;
    },//END choix_aprob

    ouvri_dialg:function (pjs_choix){
        var that = afw.afw_21.item.choix_aprob.obten(pjs_choix.getAttribute("data-choix-aprob-id"));
        that.optio.vnu_evolt_stat = pjs_choix.getAttribute("data-choix-aprob-seqnc");
        that.optio.vva_titre = pjs_choix.getAttribute("data-choix-aprob-titre");
        that.optio.vnu_procs_aprob = pjs_choix.getAttribute("data-procs-aprob");
        that.optio.vva_mesg_confr = pjs_choix.getAttribute("data-choix-choix-aprob-mesg");
        that.optio.vva_role_aprob = pjs_choix.getAttribute("data-choix-role-aprob");

        var var_butn = [];
        if (that.optio.vnu_evolt_stat != ''){
          var_butn.push(
              {
                  text: that.optio.vva_titre,
                  "class": "btn btn-primary",
                  click: function() {
                      afw.afw_21.item.choix_aprob.chois_aprob(""+that.id);
                  }
              }
          );
        }
        else{
          if (that.optio.vva_role_aprob != ''){
            that.optio.vnu_hautr = 480;
          }

          var_butn.push(
              {
                  text: that.optio.vva_titre,
                  "class": "btn btn-primary",
                  click: function() {
                      afw.afw_21.item.choix_aprob.insta_procs_aprob(""+that.id);
                  }
              }
          );
        }

        that.jQuery('<div id="' + that.id + '" class="'+that.optio.vva_clas_dialg+' '+that.optio.vva_clas_custm+'"></div>').dialog({
            autoOpen: false,
            title: that.optio.vva_titre,
            modal: true,
            resizable: false,
            closeOnEscape: false,
            dialogClass: "",
            draggable: false,
            width: that.optio.vnu_largr,
            height: that.optio.vnu_hautr,
            buttons: var_butn,
            beforeClose: function (event, ui) {
            },
            close: function (event, ui) {
                $("#"+that.id).empty().remove();
            },
            create: function (event, ui) {
                that.node = document.getElementById(that.id);
            },
            open: function (event, ui) {
              if (that.optio.vnu_evolt_stat != ''){
                that.jQuery("#" + that.id).append(
                '<div class="modal-body '+that.optio.vva_clas_body+'">'+
                    '<textarea class="textarea" name="COMNT_CHOIX_APROB" rows="6" cols="60" maxlength="4000" wrap="virtual" id="CHOIX_APROB_COMNT" class="textarea"></textarea>' +
                '</div>'
                );
              }
              else{
                if (that.optio.vva_role_aprob != ''){
                  that.optio.vob_role_aprob = JSON.parse(that.optio.vva_role_aprob);
                  var html = "";
                  html = '<div class="modal-body '+that.optio.vva_clas_body+'">';

                  for (i = 0;i < that.optio.vob_role_aprob.role.length;i ++){
                    html += that.optio.vob_role_aprob.role[i].nom +
                              '<br/><select id="' + that.optio.vob_role_aprob.role[i].seqnc + '" name="' + that.optio.vob_role_aprob.role[i].seqnc + '" class="selectlist role_aprob">';

                    for (j = 0;j < that.optio.vob_role_aprob.role[i].aprob.length;j ++){
                      html += '<option value="'+that.optio.vob_role_aprob.role[i].aprob[j].seqnc+'">'
                                + that.optio.vob_role_aprob.role[i].aprob[j].nom
                                + '</option>';
                    }

                    html += '</select><br/>';
                  }
                  html += '</div>';
                  that.jQuery("#" + that.id).append(html);
                }
                else if (that.optio.vva_mesg_confr != '') {
                  that.jQuery("#" + that.id).append(
                    '<p>'+that.optio.vva_mesg_confr+'</p>');
                }
              }
            }
        });

        that.jQuery("#" + that.id).dialog("open");
    },//END ouvri_dialg

    fermr_dialg:function (pnu_id){
        var that = afw.afw_21.item.choix_aprob.obten(pnu_id);
        that.jQuery("#" + that.id).dialog("close");
    },//END fermr_dialg

    chois_aprob:function (pnu_id){
        var that = afw.afw_21.item.choix_aprob.obten(pnu_id);

        that.jQuery.exec_aplic_procs({
            plugn_ajax: that.optio.vva_plugn_ajax,
            widget_action: "CHOIS_APROB",
            x01: that.optio.vnu_evolt_stat,
            x02: $("#CHOIX_APROB_COMNT").val(),
            procs_retrn_data_type: "json",
            sucs_procs: function () {
                console.log("success");
                that.jQuery("#" + that.id).dialog("close");
                apex.submit({
                    request:"APPLY_CHANGES",
                    showWait: true});
            },
            error_procs: function () {
                console.log("failure");
                that.jQuery("#" + that.id).dialog("close");
                apex.submit({
                    request:"APPLY_CHANGES",
                    showWait: true});
            }
        });
    },//END chois_aprob

    insta_procs_aprob:function (pnu_id){
        var that = afw.afw_21.item.choix_aprob.obten(pnu_id);
        var vva_role_aprob_selct = "";

        // Obtenir les roles
        if (that.optio.vva_role_aprob != ""){
          for (i = 0;i < that.optio.vob_role_aprob.role.length;i ++){
            vva_role_aprob_selct += that.optio.vob_role_aprob.role[i].seqnc + ",";
            vva_role_aprob_selct += $('select#'+that.optio.vob_role_aprob.role[i].seqnc).val() + ":";
          }
        }

        that.jQuery.exec_aplic_procs({
            plugn_ajax: that.optio.vva_plugn_ajax,
            widget_action: "INSTA_PROCS_APROB",
            x01: that.optio.vnu_procs_aprob,
            x02: vva_role_aprob_selct,
            procs_retrn_data_type: "json",
            sucs_procs: function () {
                console.log("success");
                that.jQuery("#" + that.id).dialog("close");
                apex.submit({
                    request:"APPLY_CHANGES",
                    showWait: true});
            },
            error_procs: function () {
                console.log("failure");
                that.jQuery("#" + that.id).dialog("close");
                apex.submit({
                    request:"APPLY_CHANGES",
                    showWait: true});
            }
        });
    }//END insta_procs_aprob
};
