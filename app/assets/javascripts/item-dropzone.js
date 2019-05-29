Dropzone.options.itemDropzone = {

  // Prevents Dropzone from uploading dropped files immediately
  // paramName: "images",
  // paramName: "file[]",
  autoProcessQueue: false,
  // autoQueue: false,  このボタン送信だと発火しなくなる
  addRemoveLinks: true,
  uploadMultiple: true,
  chunking: false,
  maxFiles: 10,
  parallelUploads: 10,
  acceptedFiles: 'image/*',
  // forceFallback: true,  ドラッグ&ドロップができなくなる？ボタン発火もしなくなる
  // capture: モバイルのカメラ利用設定？？きになるけど謎
  // 10個同時にアップロードできるが、並んだ順に処理するわけでない、従ってレコードの並びは概ね並び順にできるが後のファイルほど順番が変わることがある。

  init: function() {
    var submitButton = document.querySelector("#submit-button")
        itemDropzone = this; // closure

    submitButton.addEventListener("click", function() {
      itemDropzone.processQueue(); // Tell Dropzone to process all queued files.
    });

    // You might want to show the submit button only when
    // files are dropped here:
    this.on("addedfile", function() {
      // Show submit button here and/or inform user to click it.
    });
  }
};

// Dropzone.autoDiscover = false;

// new Dropzone(".input-part__dropbox", {
//   autoProcessQueue: false,
// });

// $('#imgsubbutt').click(function(){
//   myDropzone.processQueue();
// });

$(function(){
  $("#form-item-name").change(function() {
    const itemName = $(this).val();
    $('input:hidden[id="hidden-item-name"]').val(itemName);
    console.log(itemName)
  });
  $("#form-item-detail").change(function() {
    const itemDetail = $(this).val();
    $('textarea[id="hidden-item-detail"]').val(itemDetail);
    console.log(itemDetail)
  });
  $("#form-item-category").change(function() {
    const itemCategory = $(this).val();
    $('input:hidden[id="hidden-item-category"]').val(itemCategory);
    console.log(itemCategory)
  });
  $("#form-item-condition").change(function() {
    const itemCondition = $(this).val();
    $('input:hidden[id="hidden-item-condition"]').val(itemCondition);
    console.log(itemCondition)
  });
  $("#form-item-delivery_cost").change(function() {
    const itemDeliveryCost = $(this).val();
    $('input:hidden[id="hidden-item-delivery_cost"]').val(itemDeliveryCost);
    console.log(itemDeliveryCost)
  });
  $("#form-item-delivery_method").change(function() {
    const itemDeliveryMethod = $(this).val();
    $('input:hidden[id="hidden-item-delivery_method"]').val(itemDeliveryMethod);
    console.log(itemDeliveryMethod)
  });
  $("#form-item-delivery_prefecture").change(function() {
    const itemDeliveryPrefecture = $(this).val();
    $('input:hidden[id="hidden-item-delivery_prefecture"]').val(itemDeliveryPrefecture);
    console.log(itemDeliveryPrefecture)
  });
  $("#form-item-delivery_day").change(function() {
    const itemDeliveryDay = $(this).val();
    $('input:hidden[id="hidden-item-delivery_day"]').val(itemDeliveryDay);
    console.log(itemDeliveryDay)
  });
  $("#form-item-price").change(function() {
    const itemPrice = $(this).val();
    $('input:hidden[id="hidden-item-price"]').val(itemPrice);
    console.log(itemPrice)
  });
})