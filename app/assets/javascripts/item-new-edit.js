$(document).on('turbolinks:load', function() {
  // もし、画像の数が５個以上か10個なら、ドラッグ&ドロップエリアを消す
  var size = $(".upload-item").length;
  if (size == 4){
    $("#drop_zone").css("width","18%");
  }
  if (size == 10){
    $("#drop_zone").remove();
  }
  // 「削除」ボタンがクリックされ、見えないチェックボックスにチェックが入った時に、アイテムを削除する（見た目上）
  // データベースには、「送信」ボタンを押した時に反映される
  $(".delete-check-box").on("click", function(){
    if($(this).prop('checked') == true){
      $(this).parents(".upload-item").remove();
    };
  });

});
