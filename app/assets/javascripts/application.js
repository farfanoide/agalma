// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require ckeditor/override
//= require ckeditor/init
//= require jquery.nivo.slider
//= require branches
//= require plugins/jquery.lettering
//= require plugins/jquery.textillate

$(function(){ $(document).foundation(); });

$(window).load(function() {
  if ($( document ).width() > 640 ) {
    $('#slider').nivoSlider({
      controlNav: false,
      directionNav: false,
      pauseOnHover: false
    });
  }
  // stop slider: $('#slider').data('nivoslider').stop();
});

$(document).on('change', '#edit_current_branch', function() {
  $(this).submit();
});

$(function() {
  var $navLinks = $('.item').textillate({
    autoStart: false,
      in: { effect: 'tada'
      }
  });

  $navLinks.on('mouseenter', function () { $(this).textillate('start');  });
})
