$(document).ready(function() {

  $('#notification-list__root').on("mouseover", function(){
    $(this).css({
      "dysplay":"block"
    });

    $('#notification-list').on("mouseout", function(){
      $(this).empty();
    }); //mouseout時のアクション end
  }); //mouseover時のアクション end
});
