/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 1/18/13
 * Time: 7:18 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {
    var $blurb = $("#blurb-box");
    if ($blurb.length > 0) {
        $blurb.collapsibleBox();
    }

    var $rate = $("#rate");
    if ($rate.length > 0) {
        $rate.tooltip();
    }
});