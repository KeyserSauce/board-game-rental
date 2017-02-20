//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(function() {
$("#getstarted").click(function() {
    $('index.html,body').animate({
        scrollTop: $("#signup").offset().top},
        'slow');
});
})


