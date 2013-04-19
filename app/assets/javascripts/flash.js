/**
 * Created with JetBrains RubyMine.
 * User: gangelo
 * Date: 4/18/13
 * Time: 6:19 AM
 * To change this template use File | Settings | File Templates.
 */
function doFlash(flash) {
    flashHide();

    $('html, body').animate({scrollTop: 0}, 100);

    setTimeout(function () {
        $('.flash-notice-container').slideDown({
            complete: function () {
                if (flash.notice) {
                    flashSlideUp($(this));
                }
            }
        });
    }, 250);
}

function flashSlideUp($this) {
    setTimeout(function () {
        $this.slideUp();
    }, 30 * 1000);
}

function flashHide() {
    $('.flash-notice-container').hide();
}

