/**
 * @namespace afw.afw_21.item.check
 */
afw.afw_21.item.check = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.item.check.insta.length; i++) {
            if (afw.afw_21.item.check.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.item.check.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.item.check.insta.length; i++) {
            if (afw.afw_21.item.check.insta[i].id == pnu_id) {
                afw.afw_21.item.check.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    check: function (pjs_optio) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.initl = initl;

        this.optio = {
            vva_id_item: "",
            vva_seprt: ':'
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = jQuery.extend(true, that.optio, pjs_optio);

            that.node = document.getElementById(that.optio.vva_id_item);

            if (!!that.node) {
                that.id = that.node.id;

                that.jQuery("#" + that.optio.vva_id_item)
                    .on("change", function (e) {

                        var liste_valr = that.jQuery("#" + that.optio.vva_id_item).val().split(that.optio.vva_seprt);
                        that.jQuery("#" + that.optio.vva_id_item + "_CONTAINER input[type=checkbox]").each(function (i, obj) {
                            (that.jQuery.inArray(obj.value, liste_valr) == -1) ? obj.checked = "" : obj.checked = "checked";
                        });

                    });

            } //end if (that.node)
        } //END initl

        return that;
    } //END check
};