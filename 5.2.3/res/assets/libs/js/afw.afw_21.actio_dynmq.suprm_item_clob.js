/**
 * @namespace afw.afw_21.actio_dynmq.suprm_item_clob
 */
afw.afw_21.actio_dynmq.suprm_item_clob = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.actio_dynmq.suprm_item_clob.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.suprm_item_clob.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.actio_dynmq.suprm_item_clob.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.actio_dynmq.suprm_item_clob.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.suprm_item_clob.insta[i].id == pnu_id) {
                afw.afw_21.actio_dynmq.suprm_item_clob.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    suprm_item_clob: function (pjs_optio) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.id = false;
        this.initl = initl;

        this._suprm_item_clob = _suprm_item_clob;

        this.optio = {
            vnu_id_actio_dynmq: "",
            vva_html_id_actio_dynmq: "",
            vva_nom_plugn: "",
            vva_reqt_soums_page: "",
            var_liste_items: [],
            vbo_ckedt: true,
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par d�faut
            that.optio = that.jQuery.extend(that.optio, pjs_optio);

            that.id = that.optio.vva_html_id_actio_dynmq;

            var vva_evenm_termn = "suprm_item_clob_" + that.optio.vva_reqt_soums_page + ((that.optio.vva_reqt_soums_page != "") ? "_" : "") + "termn";

            that.jQuery(document).bind(vva_evenm_termn, function (event, ui) {
                console.log(event.type + that.optio.vva_nom_plugn);
                console.log(event.type + "." + that.optio.vva_nom_plugn);
                //apex.event.trigger(that.jQuery(document), event.type + that.optio.vva_nom_plugn);
            });

            if (that.optio.var_liste_items.length > 0) {
                that._suprm_item_clob();
                that.jQuery(document).trigger(vva_evenm_termn);
            }


        } //END initl

        function _suprm_item_clob() {
            for (i = 0, vnu_nombr_items = that.optio.var_liste_items.length; i < vnu_nombr_items; i++) {
                if (that.optio.vbo_ckedt) {
                    CKEDITOR.instances[that.optio.var_liste_items[i]].setData("");
                } else {
                    that.jQuery('#' + that.optio.var_liste_items[i]).html("");
                }
            }

        } //END _suprm_item_clob

        return that;
    } //END suprm_item_clob
};