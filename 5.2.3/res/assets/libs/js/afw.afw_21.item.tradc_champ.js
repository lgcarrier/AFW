/**
 * @namespace afw.afw_21.item.tradc_champ
 */
afw.afw_21.item.tradc_champ = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.item.tradc_champ.insta.length; i++) {
            if (afw.afw_21.item.tradc_champ.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.item.tradc_champ.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.item.tradc_champ.insta.length; i++) {
            if (afw.afw_21.item.tradc_champ.insta[i].id == pnu_id) {
                afw.afw_21.item.tradc_champ.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    tradc_champ: function (pjs_optio) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.initl = initl;
        this.sauvg_tradc = sauvg_tradc;

        this.optio = {
            vva_id_item: "",
            vva_plugn_ajax: "",
            vva_clas_tradc_champ: "tradc_champ",
            vva_champ_lang: "data-afw-lang",
            vva_champ_atrib_struc_aplic: "data-afw-atrib-struc-aplic"
        };

        this.initl(pjs_optio);

        return that;



        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = jQuery.extend(true, that.optio, pjs_optio);

            that.node = document.getElementById(that.optio.vva_id_item);
            if (!!that.node) {
                that.id = that.node.id;
                that.jQuery("." + that.optio.vva_clas_tradc_champ,that.node)
                    .on("change", function (e) {
                        afw.afw_21.item.tradc_champ.obten(that.id).sauvg_tradc(this);
                        //afw.afw_21.item.tradc_champ.sauvg_tradc(this);
                    });


            } //end if (that.node)
        } //END initl

        function sauvg_tradc(element) {
            var lang = that.jQuery(element).attr(that.optio.vva_champ_lang);
            var atribStrucAplic = that.jQuery(element).attr(that.optio.vva_champ_atrib_struc_aplic);
            var valr = that.jQuery(element).val();

            that.jQuery.exec_aplic_procs({
                plugn_ajax: that.optio.vva_plugn_ajax,
                widget_action: "SAUVG_TRADC",
                x01: lang,
                x02: atribStrucAplic,
                x03: valr,
                procs_retrn_data_type: "json",
                sucs_procs: function (data) {
                }
            });

        } //END sauvg_tradc


        return that;
    } //END tradc_champ
};