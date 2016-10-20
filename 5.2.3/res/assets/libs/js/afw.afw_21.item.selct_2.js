/**
 * @namespace afw.afw_21.item.selct_2
 */
afw.afw_21.item.selct_2 = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.item.selct_2.insta.length; i++) {
            if (afw.afw_21.item.selct_2.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.item.selct_2.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.item.selct_2.insta.length; i++) {
            if (afw.afw_21.item.selct_2.insta[i].id == pnu_id) {
                afw.afw_21.item.selct_2.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    selct_2: function (pjs_optio) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.initl = initl;
        this._rafrc_cascd_lov = _rafrc_cascd_lov;
        this._obten_formt_selct_fonct = _obten_formt_selct_fonct;
        this._obten_formt_reslt_fonct = _obten_formt_reslt_fonct;
        this._obten_markp_fonct = _obten_markp_fonct;
        this._defnr_deflt_markp_fonct = _defnr_deflt_markp_fonct;

        this.optio = {
            vva_id_item: "",
            vva_plugn_ajax: "",
            vbo_load_remt_data: false,
            vbo_multp: false,
            vva_place_holdr: "&nbsp;",
            vbo_allow_clear: true,
            vnu_minm_reslt_for_searc: 10,
            vnu_minm_input_length: null,
            vnu_maxm_input_length: null,
            vnu_maxm_selct_size: null,
            vva_seprt: ':',
            vva_largr: '300px',
            vva_liste_item_parnt: "",
            vva_liste_item_submt: "",
            vbo_rafrc_optim: false,
            vbo_allow_inser: false,
            vbo_lectr_seule: false,
            vfo_deflt_markp_fonct: "",
            vva_html_debut_contn_reslt: '<div class="afw-selct-2-contn-reslt">',
            vva_html_fin_contn_reslt: '</div>',
            vva_html_debut_contn_selct: '<div class="afw-selct-2-contn-selct">',
            vva_html_fin_contn_selct: '</div>',
            vva_clas_contn_reslt: ""
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = jQuery.extend(true, that.optio, pjs_optio);

            that.node = document.getElementById(that.optio.vva_id_item);

            if (!!that.node) {
                that.id = that.node.id;

                that._defnr_deflt_markp_fonct();

                if (!that.optio.vbo_load_remt_data) {
                    that.jQuery("#" + that.optio.vva_id_item)
                        .select2({
                                placeholder: (that.optio.vbo_multp && that.optio.vva_place_holdr =="&nbsp;") ? "": that.optio.vva_place_holdr,
                                allowClear: that.optio.vbo_allow_clear,
                                minimumResultsForSearch: that.optio.vnu_minm_reslt_for_searc,
                                minimumInputLength: that.optio.vnu_minm_input_length,
                                maximumInputLength: that.optio.vnu_maxm_input_length,
                                maximumSelectionSize: that.optio.vnu_maxm_selct_size,
                                separator: that.optio.vva_seprt,
                                closeOnSelect: true,
                                width: that.optio.vva_largr,
                                dropdownCssClass: that.optio.vva_clas_contn_reslt
                            }
                        );
                } //end if (! that.optio.vbo_load_remt_data)
                else if (that.optio.vbo_load_remt_data) {
                    that.jQuery("#" + that.optio.vva_id_item)
                        .select2({
                                multiple: that.optio.vbo_multp,
                                placeholder: (that.optio.vbo_multp && that.optio.vva_place_holdr =="&nbsp;") ? "": that.optio.vva_place_holdr,
                                allowClear: that.optio.vbo_allow_clear,
                                minimumInputLength: that.optio.vnu_minm_input_length,
                                maximumInputLength: that.optio.vnu_maxm_input_length,
                                maximumSelectionSize: that.optio.vnu_maxm_selct_size,
                                formatResult: that._obten_formt_reslt_fonct,
                                formatSelection: that._obten_formt_selct_fonct,
                                escapeMarkup: that._obten_markp_fonct,
                                separator: that.optio.vva_seprt,
                                closeOnSelect: true,
                                width: that.optio.vva_largr,
                                dropdownCssClass: that.optio.vva_clas_contn_reslt,
                                data: null,
                                ajax: {
                                    url: "wwv_flow.show",
                                    dataType: 'json',
                                    quietMillis: 100,
                                    params: {
                                        type: "POST"
                                    },
                                    data: function (term, page) {

                                        var var_arg_names = [];
                                        var var_arg_values = [];

                                        $(that.optio.vva_liste_item_parnt).each(function () {
                                            var lIdx = var_arg_names.length;
                                            var_arg_names [lIdx] = this.id;
                                            var_arg_values[lIdx] = $v(this);
                                        });

                                        return {
                                            p_flow_id: afw.afw_11.prodt.obten_numr_apex(),
                                            p_flow_step_id: afw.afw_13.page.obten_numr_apex(),
                                            p_instance: afw.afw_07.sesn.obten_numr_apex(),
                                            p_request: "PLUGIN=" + that.optio.vva_plugn_ajax,
                                            "p_arg_names": var_arg_names,
                                            "p_arg_values": var_arg_values,
                                            p_widget_action: "RECHR_LOV",
                                            x01: term
                                        };
                                    },
                                    results: function (data, page) {
                                        return {results: data.liste_valr};
                                    }
                                },
                                createSearchChoice: function (term, data) {
                                    if ($(data).filter(function () {
                                            return this.text.localeCompare(term) === 0;
                                        }).length === 0) {
                                        if (that.optio.vbo_allow_inser) {
                                            return {id: term, text: term};
                                        }
                                        else {
                                            return {};
                                        }
                                    }
                                },
                                initSelection: function (element, callback) {
                                    var id = that.jQuery(element).val();

                                    if (id !== "") {
                                        that.jQuery.exec_aplic_procs({
                                            plugn_ajax: that.optio.vva_plugn_ajax,
                                            widget_action: "VALR_SELCT_INITL",
                                            x01: id,
                                            procs_retrn_data_type: "json",
                                            sucs_procs: function (data) {
                                                callback(data);
                                            }
                                        });

                                    }
                                }
                            }
                        );

                    that.jQuery("#" + that.optio.vva_id_item)
                        .on("change", function (e) {
                            //console.log("change "+JSON.stringify({val:e.val, added:e.added, removed:e.removed}));

                            //that.jQuery("#" + that.optio.vva_id_item).trigger("change");
                            that.jQuery(that).trigger("apexbeforerefresh");
                        });

                } //end if (that.optio.vbo_load_remt_data)

                that.jQuery("#" + that.optio.vva_id_item).select2("readonly", that.optio.vbo_lectr_seule);

                // if it's a cascading select list we have to register apexbeforerefresh and change events for our masters
                if (that.optio.vva_liste_item_parnt) {
                    that.jQuery(that.optio.vva_liste_item_parnt)
                        .bind("apexbeforerefresh", function () {
                            //console.log('apexbeforerefresh');
                        })
                        .change(that._rafrc_cascd_lov);
                }
                // register the refresh event which is triggered by a manual refresh
                that.jQuery("#" + that.optio.vva_id_item).bind("apexrefresh", that._rafrc_cascd_lov);

                that.jQuery("#" + that.optio.vva_id_item).bind("onchange", function () {
                        if (that.jQuery("#" + that.optio.vva_id_item).val() == "") {
                            that.jQuery("#" + that.optio.vva_id_item).select2("val", "");
                            that.jQuery("#" + that.optio.vva_id_item).val("");
                        }
                    }
                );

            } //end if (that.node)
        } //END initl

        function _defnr_deflt_markp_fonct() {
            that.optio.vfo_deflt_markp_fonct = that.jQuery.fn.select2.defaults.escapeMarkup;
        } //END _defnr_deflt_markp_fonct

        function _obten_formt_selct_fonct(pva_elemn) {
            return (pva_elemn.html_selct && pva_elemn.id) ? that.optio.vva_html_debut_contn_selct + pva_elemn.html_selct + that.optio.vva_html_fin_contn_selct : pva_elemn.text;
        } //END _obten_formt_selct_fonct

        function _obten_formt_reslt_fonct(pva_elemn) {
            return (pva_elemn.html_reslt && pva_elemn.id) ? that.optio.vva_html_debut_contn_reslt + pva_elemn.html_reslt + that.optio.vva_html_fin_contn_reslt : pva_elemn.text;
        } //END _obten_formt_reslt_fonct

        function _obten_markp_fonct(pva_elemn) {
            return pva_elemn;
        } //END _obten_markp_fonct

        // Clears the existing options and executes an AJAX call to get new values based
        // on the depending on fields
        function _rafrc_cascd_lov() {

            //console.log("that.optio.vbo_rafrc_optim " + that.optio.vbo_rafrc_optim);

            apex.widget.util.cascadingLov(
                that.optio.vva_id_item,
                that.optio.vva_plugn_ajax,
                {
                    p_widget_action: "RAFRC_CASCD_LOV"
                },
                {
                    loadingIndicator: false,
                    optimizeRefresh: that.optio.vbo_rafrc_optim,
                    dependingOn: that.optio.vva_liste_item_parnt,
                    pageItemsToSubmit: that.optio.vva_liste_item_submt,
                    clear: function () {
                        that.jQuery("#" + that.optio.vva_id_item).select2("val", "");
                        that.jQuery("#" + that.optio.vva_id_item).val("");
                    },
                    success: function (data) {
                        that.jQuery("#" + that.optio.vva_id_item).trigger("change").trigger("apexafterrefresh");
                    }
                });
        } // END _rafrc_cascd_lov

        return that;
    } //END selct_2
};