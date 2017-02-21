//= require jquery
//= require jquery_ujs
//= require jquery.slick
//= require bootstrap-sprockets
//= require_tree .

$(function() {

  $("#getstarted").click(function() {
    $('index.html,body').animate({
      scrollTop: $("#signup").offset().top},
      'slow');
  });


  $('.your-class').slick({
    infinite: true,
    slidesToShow: 2,
    slidesToScroll: 1,
    centerMode: true,
    centerPadding: '60px',
    dots: true,
    arrows: true
  });

});


