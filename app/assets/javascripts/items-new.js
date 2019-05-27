$(document).on('turbolinks:load', function() {
  $('.input-part__input').on("keyup", function(){
    if($(this).val() >= 300 && $(this).val() <= 9999999) {
      var fee_output = Math.floor($(this).val() * 0.1);
      $('.input-part__price--fee--output').text(fee_output);
      $('.input-part__price--total--output').text($(this).val() - fee_output);
    }else {
      $('.input-part__price--fee--output').text('-');
      $('.input-part__price--total--output').text('-');
    }
  });
});
