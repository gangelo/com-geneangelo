/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 1/5/13
 * Time: 11:26 PM
 * To change this template use File | Settings | File Templates.
 */
(function(e){e.fn.collapsibleBox=function(){return this.each(function(){var t={header:"ui-icon-circle-arrow-e",activeHeader:"ui-icon-circle-arrow-s"},n=e(this);n.accordion({active:!1,collapsible:!0,icons:t,heightStyle:"content"})})}})(jQuery);