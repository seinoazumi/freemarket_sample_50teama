$(document).ready(function() {
 
  $("#top-slider").owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    responsive:{
      0:{
          items:1
      },
      768:{
        items:1
      },
      1068:{
        items:1
      }
    } //responsive end
  }); //owlCarousel end
  });
