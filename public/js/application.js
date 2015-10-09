$(document).ready(function(){

	$('#header-navbar li').hover(
		function(){ $(this).addClass("active"); },
		function(){ $(this).removeClass("active"); }
		);

	$('.nav-tabs li:nth-child(1)').hover(
		function(){ 
			$(this).addClass("active"); 
			$('.nav-tabs li:nth-child(2)').removeClass("active");
		});

	$('.nav-tabs li:nth-child(2)').hover(
		function(){ 
			$(this).addClass("active"); 
			$('.nav-tabs li:nth-child(1)').removeClass("active");
		});

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
	var showChar = 255;
	    var ellipsestext = "...";
	    var moretext = "more";
	    var lesstext = "less";
	    $('.more').each(function() {
	        var content = $(this).html();
	 
	        if(content.length > showChar) {
	 
	            var c = content.substr(0, showChar);
	            var h = content.substr(showChar-1, content.length - showChar);
	 
	            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
	 
	            $(this).html(html);
	        }
	 
	    });
	 
	    $(".morelink").click(function(){
	        if($(this).hasClass("less")) {
	            $(this).removeClass("less");
	            $(this).html(moretext);
	        } else {
	            $(this).addClass("less");
	            $(this).html(lesstext);
	        }
	        $(this).parent().prev().toggle();
	        $(this).prev().toggle();
	        return false;
	    });
});

