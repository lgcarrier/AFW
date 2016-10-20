/**
 * @namespace afw.afw_21.actio_dynmq.favr
 */
afw.afw_21.actio_dynmq.favr = {
    vva_plugn_ajax: "",
    _bascl_icone: function (pva_icone, pva_data) {
        pva_icone.toggleClass('afw_12_suprm_favr');
        pva_icone.toggleClass('afw_12_ajout_favr');
        pva_icone.attr("title", pva_data.title);
        pva_icone.removeClass(pva_data.class_delt);
        pva_icone.addClass(pva_data.class_ajout);
    },
    _ajout: function (p_icone, pnu_struc_aplic, pnu_seqnc_struc_aplic) {
        afw.jQuery.exec_aplic_procs({
            plugn_ajax: afw.afw_21.actio_dynmq.favr.vva_plugn_ajax,
            widget_action: "AJOUT_FAVR",
            x01: pnu_struc_aplic,
            x02: pnu_seqnc_struc_aplic,
            sucs_procs: function (pva_data) {
                afw.afw_21.actio_dynmq.favr._bascl_icone(p_icone, pva_data);
            }
        });
    },
    _suprm: function (p_icone, pnu_struc_aplic, pnu_seqnc_struc_aplic) {
        afw.jQuery.exec_aplic_procs({
            plugn_ajax: afw.afw_21.actio_dynmq.favr.vva_plugn_ajax,
            widget_action: "SUPRM_FAVR",
            x01: pnu_struc_aplic,
            x02: pnu_seqnc_struc_aplic,
            sucs_procs: function (pva_data) {
                afw.afw_21.actio_dynmq.favr._bascl_icone(p_icone, pva_data);
            }
        });
    },
    ajout_suprm: function (pva_selct_icone, pnu_struc_aplic, pnu_seqnc_struc_aplic) {
        vva_icone = afw.jQuery(pva_selct_icone);
        if (vva_icone.hasClass('afw_12_suprm_favr')) {
            afw.afw_21.actio_dynmq.favr._suprm(vva_icone, pnu_struc_aplic, pnu_seqnc_struc_aplic);
        } else if (vva_icone.hasClass('afw_12_ajout_favr')) {
            afw.afw_21.actio_dynmq.favr._ajout(vva_icone, pnu_struc_aplic, pnu_seqnc_struc_aplic);
        }
    }
};