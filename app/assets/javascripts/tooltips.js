/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 1/11/13
 * Time: 11:08 PM
 * To change this template use File | Settings | File Templates.
 */

$(function () {
    $(document).tooltip({
        track: true,
        position:{
            my:"center bottom-20",
            at:"center top",
            using:function (position, feedback) {
                $(this).css(position);
                $("<div>")
                    .addClass("arrow")
                    .addClass(feedback.vertical)
                    .addClass(feedback.horizontal)
                    .appendTo(this);
            }
        }
    });
});