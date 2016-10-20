/**
 * @author lgcarrierbedard
 * @namespace afw.afw_21.regn.time_line
 */

afw.afw_21.regn.time_line = {
    insta: [],
    obten: function (pnu_id) {
        var vjs_insta;

        for (var i = 0; i < afw.afw_21.regn.time_line.insta.length; i++) {
            if (afw.afw_21.regn.time_line.insta[i].id == pnu_id) {
                vjs_insta = afw.afw_21.regn.time_line.insta[i];
                break;
            }
        }

        return vjs_insta;
    },
    suprm: function (pnu_id) {
        for (var i = 0; i < afw.afw_21.regn.time_line.insta.length; i++) {
            if (afw.afw_21.regn.time_line.insta[i].id == pnu_id) {
                afw.afw_21.regn.time_line.insta.splice(i, 1);
            }
        }
    },
    /**
     * @constructor
     */
    time_line: function (pjs_optio) {
        this.jQuery = afw.jQuery;
        var that = this;
        this.node = false;
        this.id = false;
        this.timeline = null;
        this.initl = initl;

        this._drawVisualization = _drawVisualization;

        this.optio = {};

        this.initl(pjs_optio);

        return that;

        function initl(pjs_optio) {
            //fusionner les options passées en paramètre et leurs valeurs par défaut
            that.optio = that.jQuery.extend(true, that.optio, pjs_optio);

            try {
                that.node = document.getElementById(that.optio.vva_id_regn);
            } catch (e) {
                that.node = false;
            }

            if (that.node) {
                that.id = that.node.id;

                // google.load("visualization", "1");

                // Set callback to run when API is loaded
                google.setOnLoadCallback(that._drawVisualization);
                //google.load("visualization", "1", that._drawVisualization);
            }
        } //END initl


        // Called when the Visualization API is loaded.
        function _drawVisualization() {
            // Create and populate a data table.
            var data = new google.visualization.DataTable();
            data.addColumn('datetime', 'start');
            data.addColumn('datetime', 'end');
            data.addColumn('string', 'content');
            data.addColumn('string', 'group');

            var date = new Date(2014, 04, 25, 8, 0, 0);

            var loader_text = '<img src="/res/qsl/img/loader33x16.png" width="33px" height="16px"> L-105';
            var inspe_text =
                '<div title="Inspection" class="order">' +
                    '<i class="fa fa-lg fa-wrench"></i> ' +
                    'Inspection' +
                    '</div>';
            var inspe_start = new Date(date);
            var inspe_end = new Date(date.setHours(date.getHours() + 6));

            data.addRow([inspe_start, inspe_end, inspe_text, loader_text]);

            var vessl_text =
                '<div title="Snoekgracht" class="order">' +
                    '<i class="fa fa-lg fa-anchor"></i> ' +
                    'Snoekgracht' +
                    '</div>';
            var inspe_start = new Date(date.setHours(date.getHours() + 6));
            var inspe_end = new Date(date.setHours(date.getHours() + 48));

            data.addRow([inspe_start, inspe_end, vessl_text, loader_text]);

            // specify options
            var options = {
                width: "100%",
                //height: "300px",
                height: "auto",
                layout: "box",
                editable: true,
                eventMargin: 5,  // minimal margin between events
                eventMarginAxis: 0, // minimal margin beteen events and the axis
                showMajorLabels: false,
                axisOnTop: true,
                // groupsWidth : "200px",
                groupsChangeable: true,
                groupsOnRight: false,
                stackEvents: false
            };

            // Instantiate our timeline object.
            that.timeline = new links.Timeline(document.getElementById(that.optio.vva_id_regn));

            // Draw our timeline with the created data and options
            that.timeline.draw(data, options);
        } //END _drawVisualization
    } //END time_line
};