//= require jquery
//= require jquery_ujs
//= require jquery.slick
//= require bootstrap-sprockets
//= require_tree .

//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require moment
//= require bootstrap-datetimepicker

$(function() {

  $("#getstarted").click(function() {
    $('index.html,body').animate({
      scrollTop: $("#game_display").offset().top},
      'slow');
  });


  $('.your-class').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3,
    centerPadding: '0px',
    dots: true,
    arrows: true
  });

  $('.slick-arrow').addClass('.fa').addClass('fa-arrow-right')

});


