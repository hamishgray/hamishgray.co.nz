
/*=========================
 *	Banner
 *========================*/

function fullscreen(){
	var wh = $(window).height();
	if(wh > 700){
		$('body').find('.fs').css('height', wh + "px");
	}else{
		$('body').find('.fs').css('height', "700px");
	}
}


function bannerfade(){

	var st = $(document).scrollTop();
	var wh = $(window).height();
	var opac = ((wh - st) / wh) ;
	
	$('#banner img').css({
		"opacity": opac
	});
	
}


function bannersize(){
	
	var docH = $(window).height();
	var docW = $(document).width();
	
	var imgH = $('#banner img').height();
	var imgW = $('#banner img').width();
	
	if(docW > imgW){
	
		$('#banner img').css({
			"height": "auto",
			"width": docW 
		});
	
	}
	
	if(docH > imgH){
	
		$('#banner img').css({
			"width": "auto",
			"height": docH 
		});
		
	}
	
}



$(document).imagesLoaded(function() { 
	fullscreen(); 
	bannersize(); 
});

$(document).ready(function() { 
	fullscreen(); 
	bannersize(); 
});

$(window).resize(function() { 
	fullscreen(); 
	bannersize(); 
});

$(document).scroll(function() { 
	bannerfade(); 
});


/*=========================
 *	Accordian
 *========================*/


$('.accordian').find('.slide .details').hide();
$('.accordian .slide').click(function(){
	if($(this).hasClass('active')){
		$(this).removeClass('active');
		$(this).find('.details').slideUp();
	}else{
		$(this).parent().find('.slide.active .details').slideUp();
		$(this).parent().find('.slide.active').removeClass('active');
		$(this).addClass('active');
		$(this).find('.details').slideDown();
	}
});


/*=========================
 *	Popups
 *========================*/


$('.popup_link').click(function(){
	var target = $(this).attr('data-popup-id');
	$('#' + target).addClass('open').fadeIn();
	$('body').addClass('noscroll');
});
	

hidePopup = function(){
	$('.popup_wrapper.open').removeClass('open').fadeOut();
	$('body').removeClass('noscroll');
}

$('.popup_wrapper').click(function(e) {
	if ($(e.target).closest('.popup_wrapper .container').length === 0) {
		hidePopup();
	}
});
	
$('.popup_close').click(function(e) {
	hidePopup();
});


/*=========================
 *	Boxes
 *========================*/

function boxGrid(){

	$('.masonry .box').each(function(){
		
		var width = $(this).width();
		
		if($(this).hasClass('height2')){
			$(this).css('height', width);
		}else{
			$(this).css('height', width / 2);
		}
		
	});
	
}

$(document).ready(function() { boxGrid(); });
$(window).resize(function() { boxGrid(); });



