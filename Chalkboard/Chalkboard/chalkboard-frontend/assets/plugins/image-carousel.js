$(document).ready(function() {
  $("#CBSlider .owl-carousel").owlCarousel({
    stagePadding: 50,
    loop: false,
    margin: 20,
    dots: false,
    slideBy:5,
    nav: true,
    navText: [
      '<i class="fa fa-angle-left" aria-hidden="true"></i>',
      '<i class="fa fa-angle-right" aria-hidden="true"></i>'
    ],

    responsive: {
      0: {
        items: 2,
        nav: false
      },
      641: {
        items: 4,
        nav: false
      },
      800: {
        items: 5 
      },
      1000: {
        items: 6
      },
      1300: {
        items: 8
      }
    }
  });
});

