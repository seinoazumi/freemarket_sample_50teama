$(document).on('turbolinks:load', function() {

  $('#notification-list__root').on("mouseover", function(){
    $('#notification-list').css('display','block');
    });
  }); //「お知らせ」ボタンに触るとリストが表示される

  $(document).on('turbolinks:load', function() {
    $('#notification-list').on("mouseover", function(){
      $(this).css('display','block');
      }); //表示されたリストを触り続けている間はリストが表示され続ける

    $('#notification-list').delay(500).on("mouseout", function(){
      $(this).css('display','none');
      }); //リストからマウスを離すと、0.5秒後にリストは見えなくなる
});
