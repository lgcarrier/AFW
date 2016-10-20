/**
 * @namespace afw.afw_21.item.bascl_favr
 */
afw.afw_21.item.bascl_favr = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.item.bascl_favr.insta.length; i++) {
            if (afw.afw_21.item.bascl_favr.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.item.bascl_favr.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.item.bascl_favr.insta.length; i++) {
            if (afw.afw_21.item.bascl_favr.insta[i].id == pnu_id) {
                afw.afw_21.item.bascl_favr.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    bascl_favr: function (pjs_optio) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.initl = initl;

        this.optio = {
            vva_nom_plugn: "",
            vva_plugn_ajax: "",
            vva_id_item: ""
        };

        this.initl(pjs_optio);

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

            that.node = document.getElementById(that.optio.vva_id_item);

            if (!!that.node) {
                that.id = that.node.id;

                that.jQuery("#" + that.optio.vva_id_item).bind("click", function () {
                        that.jQuery.exec_aplic_procs({
                            plugn_ajax: that.optio.vva_plugn_ajax,
                            widget_action: "BASCL_FAVR",
                            procs_retrn_data_type: "json",
                            sucs_procs: function (pva_data) {
                                //Mettre à jour item class item + clsas a mettre à off
                                that.jQuery("#" + that.optio.vva_id_item + ".afw-21-togl-favr")
                                    .attr("title", pva_data.title)
                                    .removeClass(pva_data.class_delt)
                                    .addClass(pva_data.class_ajout);
                                //that.jQuery("#" + that.optio.vva_id_item).trigger("favr_togl2");
                                apex.event.trigger(that.jQuery("#" + that.optio.vva_id_item), "favr_togl." + that.optio.vva_nom_plugn);
                            }
                        });
                    }
                );

                //BIND event
                //that.jQuery("#" + that.optio.vva_id_item).bind("favr_togl2", function (event, ui) {
                //});
            }
        } //END initl

        return that;
    } //END dialg
};