/**
 * @namespace afw.afw_21.actio_dynmq.redrc_url
 */
afw.afw_21.actio_dynmq.redrc_url = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.actio_dynmq.redrc_url.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.redrc_url.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.actio_dynmq.redrc_url.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.actio_dynmq.redrc_url.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.redrc_url.insta[i].id == pnu_id) {
                afw.afw_21.actio_dynmq.redrc_url.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    redrc_url: function (pjs_optio) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.id = false;
        this.initl = initl;

        this._redrc_url = _redrc_url;

        this.optio = {
            vnu_id_actio_dynmq: "",
            vva_html_id_actio_dynmq: "",
            vva_nom_plugn: "",
            vva_url: ""
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par d�faut
            that.optio = that.jQuery.extend(that.optio, pjs_optio);

            that.id = that.optio.vva_html_id_actio_dynmq;

            that._redrc_url();
        } //END initl

        function _redrc_url() {
            location.href = that.optio.vva_url;
        } //END _redrc_url

        return that;
    } //END redrc_url
};