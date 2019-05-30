$(document).on('turbolinks:load', $(function(){
  window.onload = function() {
    $("#modal-open").on('click', function(){

      $(".modal-overlay").fadeIn("slow");
        $("#close-modal").click(function(){
            $(".modal-overlay").fadeOut("fast",function(){
          }); //[キャンセル]ボタンをクリックしたらモーダルを閉じる
        }); //end モーダルウィンドウが開いている時の操作
      return false;
    });
  }
  })
);
