//= require jquery
//= require jquery_ujs
//= require jquery.slick
//= require bootstrap-sprockets
//= require_tree .

//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

$(function() {

  $("#getstarted").click(function() {
    $('index.html,body').animate({
      scrollTop: $("#game_display").offset().top},
      'slow');
  });


  $('.your-class').slick({
    infinite: true,
    slidesToShow: 2,
    slidesToScroll: 1,
    centerMode: true,
    centerPadding: '0px',
    dots: true,
    arrows: true
  });

  $('#rental').datepicker();

});


