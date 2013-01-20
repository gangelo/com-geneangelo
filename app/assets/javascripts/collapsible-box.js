/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 1/5/13
 * Time: 11:26 PM
 * To change this template use File | Settings | File Templates.
 */
(function ($) {
    $.fn.collapsibleBox = function () {
        return this.each(function () {
            var icons = {
                header:"ui-icon-circle-arrow-e",
                activeHeader:"ui-icon-circle-arrow-s"
            };

            var $this = $(this);

            $this.accordion({
                active:false,
                collapsible:true,
                icons:icons,
                heightStyle:"content"
            });
        });
    }
})(jQuery);