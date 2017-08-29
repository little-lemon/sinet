$(function(){

	// var pd = function(){
	// 	if ($('html, body').css('scrollTop')>500) {
	// 		$("#goback").css('display','block');
	// 	}
	// }
	// pd()
	$(window).scroll(function() {
	    if ($(document).scrollTop()>=500){
	      $("#goback").css('display','block');
	    }
	    else{
	    	$("#goback").css('display','none');
	    }
	  });	

	$("#goback").click(function(){
		$('html, body').animate({scrollTop:0}, 'slow');
	})
	var judgeCla = function(){
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
        var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
        var bIsMidp = sUserAgent.match(/midp/i) == "midp";
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
        var bIsAndroid = sUserAgent.match(/android/i) == "android";
        var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
        var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
        if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
            return "phone";
        } else {
            return "pc";
        }
    }

    if (judgeCla() == 'pc') {
		$("#goback").hover(function() {
			$(this).children('p').removeClass('none').siblings('.jt').addClass('none');
		}, function() {
			$(this).children('p').addClass('none').siblings('.jt').removeClass('none');
		});
	}
})