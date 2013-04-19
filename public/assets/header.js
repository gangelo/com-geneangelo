/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 1/4/13
 * Time: 7:43 PM
 * To change this template use File | Settings | File Templates.
 */
function slowHideBlurImage(){$(".main-body-inner").fadeTo(1500,0),$(".main-body-inner-bottom").fadeTo(1500,0)}$(document).ready(function(){$(".main-body-inner").css({backgroundImage:"url("+backgroundImageBlur+")",backgroundRepeat:"no-repeat"}),$(".main-body").css({backgroundImage:"url("+backgroundImage+")",backgroundRepeat:"no-repeat"}),$(".main-body-inner-bottom").css({backgroundImage:"url("+backgroundImageBlurBottom+")",backgroundRepeat:"no-repeat"}),$(".main-body-bottom").css({backgroundImage:"url("+backgroundImageBottom+")",backgroundRepeat:"no-repeat"}),setTimeout(function(){slowHideBlurImage()},1500)});