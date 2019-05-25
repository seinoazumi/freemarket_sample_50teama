$(document).on('turbolinks:load', function(){
  $(function() {
    $("#div1").draggable();
    $("#drop_zone").droppaple({
      drop: function( event, ui ) {
      $( this )
      .addClass( "ui-state-highlight" )
      .find( "p" )
      .html( "ドロップできました" );
      }
    });
  }); // end drag-dropのアクション
});
