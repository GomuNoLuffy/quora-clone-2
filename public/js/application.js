$(document).ready(function(){

	$('#header-navbar li').hover(
		function(){ $(this).addClass("active"); },
		function(){ $(this).removeClass("active"); }
		);

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