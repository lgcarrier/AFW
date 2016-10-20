/*
 Limitations du plugin:
 L'utilisation DOIT enregistrer toute modification avant de naviguer vers le suivant ou le précédent. (Pas de confirm, simple redirection)
 Gère seulement les IR et les pages qui ont la navigation active dans le framework
 */

/**
 * @namespace afw.afw_21.actio_dynmq.navgt_enreg
 */
afw.afw_21.actio_dynmq.navgt_enreg = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.actio_dynmq.navgt_enreg.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.navgt_enreg.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.actio_dynmq.navgt_enreg.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.actio_dynmq.navgt_enreg.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.navgt_enreg.insta[i].id == pnu_id) {
                afw.afw_21.actio_dynmq.navgt_enreg.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    navgt_enreg: function (pjs_optio, pjs_calbc) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.initl = initl;
        this._navgt_enreg = _navgt_enreg;
        this._ajout_regn_navgt_precd = _ajout_regn_navgt_precd;
        this._ajout_regn_navgt_suivn = _ajout_regn_navgt_suivn;
        this._ajout_actio_boutn = _ajout_actio_boutn;

        //TODO::CONAL, mettre string regn_gauch et regn_droit en constant dans sie_21_plugn_navgt_enreg_pkg
        this.optio = {
            vnu_id_actio_dynmq: "",
            vva_html_id_actio_dynmq: "",
            vva_nom_plugn: "",
            vva_regn_navgt_precd: "",
            vva_regn_navgt_suivn: "",
            vva_postn_regn_navgt: "empla_specf",
            vva_selct_jquer_postn_boutn_navgt_precd: ".page-footer",
            vva_selct_jquer_postn_boutn_navgt_suivn: ".page-footer",
            vbo_dernr_enreg: false,
            vbo_premr_enreg: false,
            vva_url_premr: "",
            vva_url_dernr: "",
            vva_url_precd: "",
            vva_url_suivn: ""
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètres et leurs valeurs par défaut
            that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

            that.id = that.optio.vva_html_id_actio_dynmq;

            //Trouver selecteur du formulaire
            that._ajout_regn_navgt_precd();
            that._ajout_regn_navgt_suivn();

            //Binder action sur les boutons
            that._ajout_actio_boutn();
        } //END initl

        function _ajout_regn_navgt_precd() {
            if (that.optio.vva_postn_regn_navgt == "html_form") {
                that.jQuery("form#wwvFlowForm").append(that.optio.vva_regn_navgt_precd);
            }
            else if (that.optio.vva_postn_regn_navgt == "html_region") {
                that.jQuery("#content").append(that.optio.vva_regn_navgt_precd);
            }
            else if (that.optio.vva_postn_regn_navgt == "empla_specf") {
                that.jQuery(that.optio.vva_selct_jquer_postn_boutn_navgt_precd).prepend(that.optio.vva_regn_navgt_precd);
                //console.log(that.jQuery(that.optio.vva_selct_jquer_postn_boutn_navgt_precd));
            }
        } //END _ajout_regn_navgt_precd

        function _ajout_regn_navgt_suivn() {
            if (that.optio.vva_postn_regn_navgt == "html_form") {
                that.jQuery("form#wwvFlowForm").append(that.optio.vva_regn_navgt_suivn);
            }
            else if (that.optio.vva_postn_regn_navgt == "html_region") {
                that.jQuery("#content").append(that.optio.vva_regn_navgt_suivn);
            }
            else if (that.optio.vva_postn_regn_navgt == "empla_specf") {
                that.jQuery(that.optio.vva_selct_jquer_postn_boutn_navgt_suivn).append(that.optio.vva_regn_navgt_suivn);
                //console.log(that.jQuery(that.optio.vva_selct_jquer_postn_boutn_navgt_suivn));
            }
        } //END _ajout_regn_navgt_suivn

        function _navgt_enreg(pva_url) {
            window.location = pva_url;
        } //END navgt_enreg

        function _ajout_actio_boutn() {
            that.jQuery("div.navgt_enreg.precd i.navgt_enreg_precd").click(function () {
                that._navgt_enreg(that.optio.vva_url_precd);
            });

            that.jQuery("div.navgt_enreg.suivn i.navgt_enreg_suivn").click(function () {
                that._navgt_enreg(that.optio.vva_url_suivn);
            });
        } //END _ajout_actio_boutn

        return that;
    } //END navgt_enreg
};