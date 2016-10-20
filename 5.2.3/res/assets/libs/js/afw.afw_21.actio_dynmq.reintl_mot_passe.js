/**
 * @namespace afw.afw_21.actio_dynmq.reint_mot_passe
 */
afw.afw_21.actio_dynmq.reint_mot_passe = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.actio_dynmq.reint_mot_passe.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.reint_mot_passe.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.actio_dynmq.reint_mot_passe.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.actio_dynmq.reint_mot_passe.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.reint_mot_passe.insta[i].id == pnu_id) {
                afw.afw_21.actio_dynmq.reint_mot_passe.insta.splice(i, 1);
            }
        }
    },
    afich: function () {
        afw.jQuery(document).trigger('afw_21_actio_dynmq_reint_mp_afich');
    },
    /**
     * @constructor
     */
    reint_mot_passe: function (pjs_optio, pjs_calbc) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.initl = initl;

        this.optio = {
            vnu_id_actio_dynmq: "",
            vva_nom_plugn: "",
            vva_plugn_ajax: "",
            vjs_dialg: {
                vva_titre: "Aide",
                vbo_ouvri_autom: true,
                vbo_modal: true,
                vbo_redmn: false,
                vbo_fermr_echap: true,
                vva_clas_css: "ui-afw",
                vbo_deplc: false
            }
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

            that.id = that.optio.vva_html_id_actio_dynmq;

            that.jQuery(document).bind("afw_21_actio_dynmq_reint_mp_afich", function (event, ui) {
                apex.event.trigger(afw.jQuery(document), "afw_21_actio_dynmq_reint_mp_afich." + that.optio.vva_nom_plugn);

            });
        } //END initl

        return that;
    } //END reint_mot_passe
};