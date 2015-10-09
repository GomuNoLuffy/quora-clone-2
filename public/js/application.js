$(document).ready(function(){

	$('#header-navbar li').hover(
		function(){ $(this).addClass("active"); },
		function(){ $(this).removeClass("active"); }
		);

	$('.nav-tabs li').hover(
		function(){ $(this).addClass("active"); },
		function(){ $(this).removeClass("active"); }
		);

	$('#myquestions').on('click hover', function () {
		var link      = window.location.href + "/questions";
      	$.ajax({
		    url: link,
		    method: "GET",
		    success: function(response){
		    	$html = $.parseHTML( response )
		    	$('.profile-content').html($html)
		    }
		});
		return false;
	});

	$('#myanswers').on('click hover', function () {
		var link      = window.location.href + "/answers";
      	$.ajax({
		    url: link,
		    method: "GET",
		    success: function(response){
		    	console.log(response)
		    	$html = $.parseHTML( response )
		    	console.log($html)
		    	$('.profile-content').html($html)
		    }
		});
		return false;
	});

	$('#logout').click(function(){
      	$.ajax({
		    url: "/session/destroy",
		    method: "DELETE",
		    cache: false,
		    success: function(){
		    	window.location.href = '/';
		    }
		});
	});


});