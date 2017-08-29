$(function(){

    var dhl = function(){
        $(".navbar-default .navbar-nav > li").hover(function() {
            
            if (!$(this).children('ul').is(":animated")) {
            	$(".navbar-default .navbar-nav > li").children('ul').hide();
                $(this).children('ul').slideDown('500');
    			// $(this).children('ul').show();
            }
        }, function() {
            $(this).children('ul').slideUp('500');
        });
    }

    var pd = function(){
        if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){
            $(".navbar-default .navbar-nav > li > ul.safProduct").addClass('cush');
        }
    }
    pd();


    function fotterPosition() {
        // console.log($(".fotter").offset().top)
        if ($(".fotter").offset().top<document.documentElement.clientHeight) {
            $(".fotter").css({
                position: 'fixed',
                bottom: 0
            })
            $('.fr_link').css({
                position: 'fixed',
                bottom: '50px',
                left: 0,
                width: '100%'
            });
        }
    }

    setTimeout(fotterPosition,500);

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
        if (bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
            return "phone";
        }else if(bIsIpad){
            return "ipad";
        } else {
            return "pc";
        }
    }

    var navHide = function(){
        $("#introduction,#contentDetail,#newList,#safeProduct,#newDetails,#culture").children(".title").hide();
    }
    var setImg = function(){
        var img = $("#contentDetail .main").find('p').not('.publicp').children('img');
        img.css({
            display: 'block',
            width: '100%'
        });
    }

    var yqlj = function(){
        if (judgeCla() == 'phone') {
            navHide();
            setImg();
        }else{
            dhl();
        }
    }
    yqlj();

    var screenSidth = function(){
        if (screen.width<568) {
            $(".pathone").children(".imgs").hide();
            $(".fr_link").addClass('none');
            $(".banner .bannerPagination").hide();
        }else{
            $(".productName").children("img").eq(1).hide();
        }
    }
    screenSidth();

})