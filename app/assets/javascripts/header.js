/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 1/4/13
 * Time: 7:43 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {
    $(".main-body-inner").css({ backgroundImage:"url(" + backgroundImageBlur + ")", backgroundRepeat:"no-repeat"});
    $(".main-body").css({ backgroundImage:"url(" + backgroundImage + ")", backgroundRepeat:"no-repeat"});
    setTimeout(function(){slowHideBlurImage();}, 1500);
});

function slowHideBlurImage() {
    $(".main-body-inner" ).hide( "fade", { direction: "down" }, 2000, function() {
        // Complete
        $(this).remove();
    });
}
