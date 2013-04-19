/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 4/18/13
 * Time: 6:19 AM
 * To change this template use File | Settings | File Templates.
 */
function doFlash(e){flashHide(),$("html, body").animate({scrollTop:0},100),setTimeout(function(){$(".flash-notice-container").slideDown({complete:function(){e.notice&&flashSlideUp($(this))}})},250)}function flashSlideUp(e){setTimeout(function(){e.slideUp()},3e4)}function flashHide(){$(".flash-notice-container").hide()};