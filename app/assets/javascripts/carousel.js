//----------------------------------------top page
$(document).on('turbolinks:load', function(){
  $('.slick').slick({
    autoplay:true,
    dots:true,
  });


//----------------------------------------商品詳細ページ

  $('.slider').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    asNavFor: '.thumb'
  });
  $('.thumb').slick({
    slidesToShow: 5,
    slidesToScroll: 1,
    asNavFor: '.slider',
    dots: false,
    centerMode: true,
    focusOnSelect: true
  });

  var size = $(".slider__list").length;
  if (size >= 6){
    $(".slider, .slider__list__image").css("height","240px");
    $(".slider__list__image").css({
      "width":"240px",
      "margin":"0 auto",
    });
  }
  $(".thumb__list").on('click', function(){
    $(".thumb__list").css("opacity","0.7");
    $(this).css("opacity","1");
  });
});
