/**
 * @namespace afw.afw_21.regn.telvr_fichr
 */
afw.afw_21.regn.telvr_fichr = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.regn.telvr_fichr.insta.length; i++) {
            if (afw.afw_21.regn.telvr_fichr.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.regn.telvr_fichr.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.regn.telvr_fichr.insta.length; i++) {
            if (afw.afw_21.regn.telvr_fichr.insta[i].id == pnu_id) {
                afw.afw_21.regn.telvr_fichr.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    telvr_fichr: function (pjs_optio) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.vnu_seqnc_fichr = 0;
        this.vnu_tail_maxml = 10;
        this.var_liste_fichr = {"liste_fichr": []};
        this.initl = initl;
        this._defnr_outpt = _defnr_outpt;
        this._defnr_liste_fichr_a_telvr = _defnr_liste_fichr_a_telvr;
        this._selct_termn = _selct_termn;
        this._selct = _selct;
        this._depsr = _depsr;
        this._glisr_par_des = _glisr_par_des;

        this.optio = {
            vva_id_regn: "",
            vva_plugn_ajax: "",
            vbo_telvr_multp: true,
            vva_mesg_limt_tail_fichr: "",
            vva_mesg_navgt_obsol: "",
            vva_mesg_limt_telvr: ""
        };

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

            try {
                switch (typeof(that.optio.vva_id_regn)) {
                    case 'string':
                        that.node = document.getElementById(that.optio.vva_id_regn);
                        break;
                    default:
                        that.node = false;
                        break;
                }
            } catch (e) {
                that.node = false;
            }

            // only proceed if that.node are not false
            if (that.node) {
                that.id = that.node.id;

                if (!(window.File && window.FileReader && window.FileList && window.Blob)) {
                    that.jQuery("#" + that.id).hide();
                    that.jQuery("#" + that.id).after('<div class="navgt_obsol">' + that.optio.vva_mesg_navgt_obsol + '<div>');
                }

                that.jQuery("input", "#" + that.id)
                    .change(that._selct);

                var dropZone;
                if (navigator.userAgent.match(/Trident/) || navigator.userAgent.match(/MSIE/)) {
                    dropZone = that.jQuery('body').get(0);
                }
                else {
                    dropZone = that.jQuery('.drop_zone', "#" + that.id).get(0);
                }

                dropZone.addEventListener('dragover', that._glisr_par_des, false);
                dropZone.addEventListener('drop', that._depsr, false);
                dropZone.addEventListener('click', function () {
                    $("#selct_fichr").click();
                }, false);

            } //end if (that.node)
        } //END initl

        function _defnr_outpt(p_liste_fichr) {
            var var_liste_fichr = [];

            that.jQuery(p_liste_fichr.liste_fichr).each(function (i, fichr) {
                if (fichr.indic_a_telvr) {
                    var vnu_tail_fichr = fichr.fichr.size / 1024 / 1024;

                    var_liste_fichr.push(
                        '<li><div id="fichr_' + fichr.seqnc + '"><div><strong>',
                        fichr.fichr.name,
                        '</strong> (',
                        fichr.fichr.type || 'n/d', ') - ',
                        vnu_tail_fichr.toFixed(2),
                        ' Mo, dernière modification: ',
                        fichr.fichr.lastModifiedDate ? fichr.fichr.lastModifiedDate.toLocaleDateString() : 'n/d</div>',
                        '<div><progress class="barre_progr" max="100" value="1"><span class="percent">1</span>%</progress></div>',
                        '</div>',
                        '</li>');
                }
            });

            that.jQuery('output ul', "#" + that.id).append(var_liste_fichr.join(''));
        } //END _defnr_outpt

        function _selct_termn() {
            apex.event.trigger(that.jQuery(document), "selct_termn_regn." + that.optio.vva_nom_plugn);
        } //END _selct_termn

        function _defnr_liste_fichr_a_telvr(p_liste_fichr) {
            for (var i = 0, f; f = p_liste_fichr[i]; i++) {

                var vnu_tail_fichr = f.size / 1024 / 1024;

                if (vnu_tail_fichr <= that.vnu_tail_maxml) {
                    that.vnu_seqnc_fichr++;
                    that.var_liste_fichr.liste_fichr.push({
                        "seqnc": that.vnu_seqnc_fichr,
                        "indic_a_telvr": true,
                        "fichr": f
                    })
                }
                else {
                    var vva_mesg_alert = that.optio.vva_mesg_limt_tail_fichr.replace('#NOM_FICHR#', f.name).replace('#TAIL_FICHR#', vnu_tail_fichr.toFixed(2)).replace('#TAIL_MAXM#', that.vnu_tail_maxml);
                    alert(vva_mesg_alert);
                }
            }
        } //END _defnr_liste_fichr_a_telvr

        function _selct(evenm) {
            if (!that.optio.vbo_telvr_multp && (evenm.target.files.length > 1 || that.var_liste_fichr.liste_fichr.length > 0)) {
                alert(that.optio.vva_mesg_limt_telvr);
                return false;
            }

            that._defnr_liste_fichr_a_telvr(evenm.target.files);
            that._defnr_outpt(that.var_liste_fichr);
            that._selct_termn();
        } //END _selct

        function _depsr(evenm) {
            evenm.stopPropagation();
            evenm.preventDefault();

            console.log("fichr dans la liste= " + that.var_liste_fichr.liste_fichr.length);

            if (!that.optio.vbo_telvr_multp && (evenm.dataTransfer.files.length > 1 || that.var_liste_fichr.liste_fichr.length > 0)) {
                alert(that.optio.vva_mesg_limt_telvr);
                return false;
            }

            that._defnr_liste_fichr_a_telvr(evenm.dataTransfer.files);
            that._defnr_outpt(that.var_liste_fichr);
            that._selct_termn();
        } //END _depsr

        function _glisr_par_des(evenm) {
            evenm.stopPropagation();
            evenm.preventDefault();

            evenm.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
        } //END _glisr_par_des

        return that;
    } //END telvr_fichr
};