$(document).on('turbolinks:load', function() {
  // もし、画像の数が５個以上か10個なら、ドラッグ&ドロップエリアを消す
  var size = $(".upload-item").length;
  if (size == 5){
    $("#drop_zone").css("width","18%");
  }
  if (size == 10){
    $("#drop_zone").remove();
  }
  // 「削除」ボタンがクリックされ、見えないチェックボックスにチェックが入った時に、アイテムを見えなくする
  // データベースには、「送信」ボタンを押した時に反映される
    $(".delete-check-box").on("click", function(){

      if($(this).prop('checked') == true){
        // 自分の親要素が選択されるようにする
        $(this).closest(".upload-item").css({
          "visibility": "hidden",
          "width": "0",
          "height": "0"
        });
      };
    });

  // function readURL(input) {
  //   if (input.files && input.files[0]) {
  //     var reader = new FileReader();
  //     reader.onload = function (e) {
  //       $('#img_prev').attr('src', e.target.result);
  //     }
  //     reader.readAsDataURL(input.files[0]);
  //   }
  // }
  // $("#book_img").change(function(){
  //   readURL(this);
  // });

});
