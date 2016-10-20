/**
 * @namespace afw.afw_21.actio_dynmq.tutrl
 */
afw.afw_21.actio_dynmq.tutrl = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.actio_dynmq.tutrl.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.tutrl.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.actio_dynmq.tutrl.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.actio_dynmq.tutrl.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.tutrl.insta[i].id == pnu_id) {
                afw.afw_21.actio_dynmq.tutrl.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    tutrl: function (pjs_optio) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.initl = initl;
        this.tour = false;

        this.optio = {
            vva_nom: "",
            vva_plugn_ajax: "",
            vva_nom_plugn: "",
            var_etape: [],
            var_etape_suivn: [],
            vnu_seqnc_tutrl: "",
            vnu_etape_actue: 0
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(that.optio, pjs_optio);

            that.id = that.optio.id;

            // Get steps
            that.jQuery.exec_aplic_procs({
              "async": true,
              "plugn_ajax": that.optio.vva_plugn_ajax,
              "widget_action": "OBTEN_LISTE_ETAPE",
              "x01": that.optio.vnu_seqnc_tutrl,
              "sucs_procs": function (pjs_data) {
                that.optio.var_etape = pjs_data.liste_etape;
                
                // Instance the tour
                that.tour = new Tour({
                    name: that.optio.vva_nom,
                    steps: that.optio.var_etape,
                    storage: false,
                    debug: false,
                    template: "<div class='popover tour'>" +
                        "<div class='arrow'></div>" +
                        "<h3 class='popover-title'></h3>" +
                        " <div class='popover-content'></div>" +
                        "<div class='popover-navigation'>" +
                        "<div class='btn-group'>" +
                        "<button class='btn btn-default' data-role='prev'>« Prev</button>" +
                        "<button class='btn btn-primary' data-role='next'>Next »</button>" +
                        "</div>" +
                        "<button class='btn btn-link' data-role='end'>End tour</button>" +
                        "</div>" +
                        "</div>",
                    onStart: function () {
                        apex.event.trigger(that.jQuery("body"), "tutrlstart_actio_dynmq." + that.optio.vva_nom_plugn);

                        that.jQuery.exec_aplic_procs({
                            "async": true,
                            "plugn_ajax": that.optio.vva_plugn_ajax,
                            "widget_action": "OUVER_TOUR",
                            "x01": that.optio.vnu_seqnc_tutrl, //SEQNC TUTRL
                            "x02": that.tour.getCurrentStep(), //ETAPE COURANTE
                            "sucs_procs": function (pjs_data) {
                               console.log("start success");
                            }
                        });
                    },
                    onShow: function () {
                        apex.event.trigger(that.jQuery("body"), "tutrlshowstep_actio_dynmq." + that.optio.vva_nom_plugn);

                        that.jQuery.exec_aplic_procs({
                            "async": true,
                            "plugn_ajax": that.optio.vva_plugn_ajax,
                            "widget_action": "AFICH_ETAPE",
                            "x01": that.optio.vnu_seqnc_tutrl, //SEQNC TUTRL
                            "x02": that.tour.getCurrentStep(), //ETAPE COURANTE
                            "sucs_procs": function (pjs_data) {
                                console.log("show step "+that.tour.getCurrentStep());
                            }
                        });
                    },
                    onShown: function () {
                        apex.event.trigger(that.jQuery("body"), "tutrlshowstepend_actio_dynmq." + that.optio.vva_nom_plugn);

                        that.jQuery.exec_aplic_procs({
                            "async": true,
                            "plugn_ajax": that.optio.vva_plugn_ajax,
                            "widget_action": "FIN_AFICH_ETAPE",
                            "x01": that.optio.vnu_seqnc_tutrl, //SEQNC TUTRL
                            "x02": that.tour.getCurrentStep(), //ETAPE COURANTE
                            "sucs_procs": function (pjs_data) {
                                console.log("shown step " + that.tour.getCurrentStep());
                            }
                        });
                    },
                    onEnd: function () {
                        apex.event.trigger(that.jQuery("body"), "tutrlend_actio_dynmq." + that.optio.vva_nom_plugn);

                        that.jQuery.exec_aplic_procs({
                            "async": true,
                            "plugn_ajax": that.optio.vva_plugn_ajax,
                            "widget_action": "FERMR_TOUR",
                            "x01": that.optio.vnu_seqnc_tutrl, //SEQNC TUTRL
                            "sucs_procs": function (pjs_data) {
                                console.log("end success");
                            }
                        });
                    }
                });

                // Initialize the tour
                that.tour.init();

                // Set the tour to actual asked step
                if (that.optio.vnu_etape_actue!=0)
                    that.tour.goTo(that.optio.vnu_etape_actue);

                // Start the tour
                that.tour.start();
              },
              "error_procs": function (pjs_data) {
                console.log("error obten_liste_etape");
              }
            });



        } //END initl

        return that;
    } //END tour
};
