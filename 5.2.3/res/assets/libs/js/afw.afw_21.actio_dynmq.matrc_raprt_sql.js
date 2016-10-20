/**
 * @namespace afw.afw_21.actio_dynmq.matrc_raprt_sql
 */
afw.afw_21.actio_dynmq.matrc_raprt_sql = {
    insta: [],
    obten: function (pva_id_regn) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.actio_dynmq.matrc_raprt_sql.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.matrc_raprt_sql.insta[i].optio.vva_id_regn == pva_id_regn) {
                vjs_insta = afw.afw_21.actio_dynmq.matrc_raprt_sql.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pva_id_regn) {
        for (var i = 0; i < afw.afw_21.actio_dynmq.matrc_raprt_sql.insta.length; i++) {
            if (afw.afw_21.actio_dynmq.matrc_raprt_sql.insta[i].optio.vva_id_regn == pva_id_regn) {
                afw.afw_21.actio_dynmq.matrc_raprt_sql.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    matrc_raprt_sql: function (pjs_optio, pjs_calbc) {
        var that = this;
        this.node = false;
        this.id = false;
        this.table = false;
        this.jQuery = afw.jQuery;
        this.initl = initl;
        this.trans_raprt_sql = trans_raprt_sql;
        this.surlg_ligne = surlg_ligne;

        this.optio = {
            vva_id_regn_reprt_catch: "",
            vva_id_regn_reprt: "",
            vva_id_regn: "",
            vnu_nombr_coln_gauch: 1,
            vva_coln_clas_css: "enreg",
            var_surlg_ligne: [],
            vjs_ajax: {
                vva_async: false,
                vva_type_reqst: "POST",
                vva_reqst_url: "wwv_flow.show",
                vva_flow_id: afw.afw_11.prodt.obten_numr_apex(),
                vva_flow_step_id: afw.afw_13.page.obten_numr_apex(),
                vva_insta: afw.afw_07.sesn.obten_numr_apex(),
                vva_plugn_ajax: ""
            }
        };

        this.initl(pjs_optio, pjs_calbc);

        return that;

        function initl(pjs_optio, pjs_calbc) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(that.optio, pjs_optio);

            if (that.jQuery("#" + that.optio.vva_id_regn_reprt_catch + " table:eq(1)").length > 0) {
                that.node = document.getElementById(that.optio.vva_id_regn_reprt_catch);
                that.table = that.jQuery("#" + that.optio.vva_id_regn_reprt_catch + " table:eq(1)");
            }
            else {
                that.node = document.getElementById(that.optio.vva_id_regn_reprt);
                that.table = that.jQuery("#" + that.optio.vva_id_regn_reprt + " table:eq(0)");
            }

            if (that.node) {
                that.id = that.node.id;
                that.trans_raprt_sql(pjs_calbc);
            }
        } //END initl

        function trans_raprt_sql(pjs_calbc) {
            // Cacher la région le temps de faire sa transformation
            that.jQuery(that.table).hide();

            if (that.table.length > 0 && that.jQuery("." + that.optio.vva_coln_clas_css + ".sectn_gauch", that.table).length == 0) {
                that.table.addClass('raprt_sql_matrc');
                // Ajouter un style css aux colonnes de la section de gauche
                for (i = 1; i <= that.optio.vnu_nombr_coln_gauch; i++) {
                    that.jQuery("." + that.optio.vva_coln_clas_css + ":nth-child(" + i + ")", that.table).addClass("sectn_gauch");
                }
            }

            // Surligner les lignes
            for (i = 0; i < that.optio.var_surlg_ligne.length; i++) {
                that.surlg_ligne(that.optio.var_surlg_ligne[i]);
            }

            // Afficher la région le temps après sa transformation
            that.jQuery(that.table).show();

            eval(pjs_calbc);
        } //END trans_raprt_sql

        function surlg_ligne(pva_ident_ligne) {
            that.jQuery("." + that.optio.vva_coln_clas_css + ":contains('" + pva_ident_ligne + "')", that.table)
                .closest("tr", that.table)
                .addClass("surlg_ligne");

            //.parents("tr", that.table)
        } //END surlg_ligne

        return that;
    } //END matrc_raprt_sql
};

afw.afw_21.actio_dynmq.matrc_raprt_sql.trans_raprt_sql_orign = afw.afw_21.actio_dynmq.trans_raprt_sql;

afw.afw_21.actio_dynmq.trans_raprt_sql = function (pId) {
    afw.afw_21.actio_dynmq.matrc_raprt_sql.trans_raprt_sql_orign(pId);

    // Transformer le rapport en matrice
    if (!afw.jQuery.isEmptyObject(vjs_insta = afw.afw_21.actio_dynmq.matrc_raprt_sql.obten(pId))) {
        vjs_optio = vjs_insta.optio;
        afw.afw_21.actio_dynmq.matrc_raprt_sql.suprm(pId);
        afw.afw_21.actio_dynmq.matrc_raprt_sql.insta.push(new afw.afw_21.actio_dynmq.matrc_raprt_sql.matrc_raprt_sql(vjs_optio));
    }
};