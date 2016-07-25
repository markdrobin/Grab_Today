// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require twitter/bootstrap
//= require_tree .

$( document ).ready(function() {
	if($(".splash").is(":visible"))
	{
		$(".wrapper").css({"opacity":"0"});
	}
	$(".splash-arrow").click(function()
	{
		$(".splash").slideUp("800", function() {
			  $(".wrapper").delay(100).animate({"opacity":"1.0"},800);
		 });
	});
});

$(".closebtn").ready(function() {
	var close = document.getElementsByClassName("closebtn");
  var i;

  // Loop through all close buttons
  for (i = 0; i < close.length; i++) {
      // When someone clicks on a close button
      close[i].onclick = function(){

          // Get the parent of <span class="closebtn"> (<div class="alert">)
          var div = this.parentElement;

          // Set the opacity of div to 0 (transparent)
          div.style.opacity = "0";

          // Hide the div after 600ms (the same amount of milliseconds it takes to fade out)
          setTimeout(function(){ div.style.display = "none"; }, 600);
      }

      $(".notifiers").alert();
        window.setTimeout(function() { $(".notifiers").alert('.closebtn'); }, 2000);
      }
});