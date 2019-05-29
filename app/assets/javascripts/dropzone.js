Dropzone.options.itemDropzone = {

  // Prevents Dropzone from uploading dropped files immediately
  // paramName: "images",
  // paramName: "file[]",
  autoProcessQueue: false,
  // autoQueue: false,  このボタン送信だと発火しなくなる
  addRemoveLinks: true,
  uploadMultiple: true,
  maxFiles: 10,
  parallelUploads: 10,
  // forceFallback: true,  ドラッグ&ドロップができなくなる？ボタン発火もしなくなる
  // capture: モバイルのカメラ利用設定？？きになるけど謎
  // 10個同時にアップロードできるが、並んだ順に処理するわけでない、従ってレコードの並びは概ね並び順にできるが後のファイルほど順番が変わることがある。

  init: function() {
    var submitButton = document.querySelector("#submit-btn")
        itemDropzone = this; // closure

    submitButton.addEventListener("click", function() {
      itemDropzone.processQueue(); // Tell Dropzone to process all queued files.
      itemDropzone.processFile(file);
    });

    // You might want to show the submit button only when
    // files are dropped here:
    this.on("addedfile", function() {
      // Show submit button here and/or inform user to click it.
    });

  }
};
