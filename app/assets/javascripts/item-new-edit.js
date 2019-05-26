$(document).on('turbolinks:load', function() {
  var size = $(".upload-item").length;
  if (size >= 5){
    $("#drop_zone1").remove();
  }
  if (size == 10){
    $("#drop_zone2").remove();
  }


});
