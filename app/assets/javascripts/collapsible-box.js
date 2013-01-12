/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 1/5/13
 * Time: 11:26 PM
 * To change this template use File | Settings | File Templates.
 */
(function ($) {
    $.fn.collapsibleBox = function (options) {

        // Create some defaults, extending them with any options that were provided
        /*var settings = $.extend({
         'background-color':'blue'
         }, options);   */

        return this.each(function () {
            var icons = {
                header:"ui-icon-circle-arrow-e",
                activeHeader:"ui-icon-circle-arrow-s"
            };

            var $this = $(this);

            $this.accordion({
                collapsible:true,
                icons:icons
            });
        });
    }
})(jQuery);