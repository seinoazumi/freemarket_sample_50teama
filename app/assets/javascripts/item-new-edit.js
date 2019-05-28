$(document).on('turbolinks:load', function() {
  // もし、画像の数が５個か9個なら、ドラッグ&ドロップエリアを小さくする
  var size = $(".upload-item").length;
  if (size == 5 || size == 9){
    $("#drop_zone").css("width","18%");
  }
  if (size == 10){
    $("#drop_zone").remove();
  }
  // 「削除」ボタンがクリックされると、見えないチェックボックスにチェックが入り、アイテムを見えなくする
  // データベースには、「送信」ボタンを押した時に反映される
  // 参考URL: https://note.mu/hajime38/n/ne2650fdf4559
  $(".delete-check-box").on("click", function(){
    if($(this).prop('checked') == true){
      $(this).parents(".upload-item").css({
        "visibility": "hidden",
        "width": "0",
        "height": "0",
        "margin": "0",
      });
    };
  });
});
