import $ from "jquery";

function moveForm() {

    $(function() {
      var offset = $("#sideform").offset();
      var topPadding = 75;
        if($(window).width()>768){
          $( window ).on("scroll", function() {
            if ($(window).scrollTop() > offset.top) {
                $("#sideform").stop().animate({
                  marginTop: $(window).scrollTop() - offset.top + topPadding
                });
            } else {
                $("#sideform").stop().animate({
                  marginTop: 0
                });
            }   
        });
        }
    });
}
export { moveForm }