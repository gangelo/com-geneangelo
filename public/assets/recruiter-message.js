/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 1/18/13
 * Time: 7:18 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {
    var e = $("#blurb-box");
    e.length > 0 && e.collapsibleBox();
    var t = $("#rate");
    t.length > 0 && t.tooltip()
});