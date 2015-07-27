$(window).scroll(function () {
  if ( $(this).scrollTop() > 550 && !$('.custom2').hasClass('open')) {
    $('.custom2').addClass('open');
    $('.custom2').slideDown();
   } else if ( $(this).scrollTop() <= 550 ) {
    $('.custom2').removeClass('open');
    $('.custom2').slideUp();
  } 
});

