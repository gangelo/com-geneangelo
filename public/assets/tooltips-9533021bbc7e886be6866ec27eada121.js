/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 1/11/13
 * Time: 11:08 PM
 * To change this template use File | Settings | File Templates.
 */
$(function () {
    $(document).tooltip({track: !0, position: {my: "center bottom-20", at: "center top", using: function (e, t) {
        $(this).css(e), $("<div>").addClass("arrow").addClass(t.vertical).addClass(t.horizontal).appendTo(this)
    }}})
});