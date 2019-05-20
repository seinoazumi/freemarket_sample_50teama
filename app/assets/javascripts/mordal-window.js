$(document).on('turebolinks:load', $(function(){
  $("#modal-open").on('mouseover', function(){

    $(".modal-ovelay").fadeIn("slow");
      $("#close-modal").click(function(){
          $(".modal-ovelay").fadeOut("fast",function(){
        }); //[キャンセル]ボタンをクリックしたらモーダルを閉じる
      }); //end モーダルウィンドウが開いている時の操作
    });
  })
);
